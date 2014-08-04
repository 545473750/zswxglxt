<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ page import="com.opendata.organiz.model.*" %>
<%@ page import="com.opendata.application.model.*" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<rapid:override name="head">
	<link href="${ctx}/styles/global.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/styles/tree.css" rel="stylesheet" type="text/css" />

	<script src="${ctx}/scripts/dhtmlxcommon.js"></script>
	<script src="${ctx}/scripts/dhtmlxtree.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/jquery.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/hf.js"></script>

<script type="text/javascript">
	var organizationIdsByPartition = "${organizationIdsByPartition}";
	$(function() {
		tree = new dhtmlXTreeObject("jsTree", "50%", "50%", 0);
		tree.setSkin('dhx_skyblue');
		tree.setImagePath("${ctx}/images/tree/");
		tree.setOnClickHandler(function(id) {
			openPathDocs(id);
		});
		
		tree.setOnCheckHandler(function(id) {
			/*
			var flag = tree.isItemChecked(id);// 1代表选中,0代表未选中
			for(var index = 0; index < tree.hasChildren(id); index++) {
				var childrenNodeId = tree.getItemIdByIndex(id, index);
				// 禁用子节点
				//tree.setCheck(childrenNodeId, 0); // 勾选未勾选
				if(flag == '0') {
					tree.disableCheckbox(childrenNodeId, 0);
				} else {
					tree.setCheck(childrenNodeId, 0);
					tree.disableCheckbox(childrenNodeId, 1);
				}
				
				// 如果子节点还有子节点，则递归处理
				if(tree.hasChildren(childrenNodeId) > 0) {
					//递归处理
					setTreeNodeCheckBox(childrenNodeId, flag);
				}
			}
			*/
			var flag = tree.isItemChecked(id); // 当前节点的状态
			var parentNodeId = tree.getParentId(id); // 当前节点的父节点
			if(parentNodeId != '0') {
				// 递归处理父节点
				if(flag == "1") {
					tree.setCheck(parentNodeId, 0);
				}
				// 如果父节点还有父节点
				if(tree.getParentId(parentNodeId) != "0") {
					setParentNodeCheckBox(parentNodeId, flag);
				}
			}
			
			// 递归处理子节点
			var flag = tree.isItemChecked(id);// 1代表选中,0代表未选中
			for(var index = 0; index < tree.hasChildren(id); index++) {
				var childrenNodeId = tree.getItemIdByIndex(id, index);
				// 禁用子节点
				if(flag == '0') {
					tree.disableCheckbox(childrenNodeId, 0);
				} else {
					tree.setCheck(childrenNodeId, 0);
					tree.disableCheckbox(childrenNodeId, 0);
				}
				// 如果子节点还有子节点，则递归处理
				if(tree.hasChildren(childrenNodeId) > 0) {
					//递归处理
					setTreeNodeCheckBox(childrenNodeId, flag);
				}
			}
		}); 
		
		//设置树的编码  
		tree.setEscapingMode("utf8");
		tree.enableCheckBoxes("1");
	    //tree.enableThreeStateCheckboxes(1);
		tree.setXMLAutoLoading("${ctx}/organiz/Organization!getOrganizationTreeXml.do?selectedIds=${selectedIds}&partitionId=${partitionId}");
		tree.loadXML("${ctx}/organiz/Organization!getOrganizationTreeXml.do?selectedIds=${selectedIds}&partitionId=${partitionId}");
		tree.attachEvent("onXLE", function(tree, id){
			if(organizationIdsByPartition!=null&&organizationIdsByPartition!=''){
				setTreeDisCheckBox('0',organizationIdsByPartition,'1');
			}
		});
	});

	function openPathDocs(id) {
		tree.setItemColor(tree.getSelectedItemId(), "#696969", "#B8860B");
	}

	function autoselectNode() {
		tree.selectItem(node, true);
		tree.openItem(node);
	}
	
	function choiceOrg(){
	   //var item = tree.getAllCheckedBranches();
	   //alert(item);
	   
		if(organizationIdsByPartition!=null&&organizationIdsByPartition!=''){
			setTreeDisCheckBox('0',organizationIdsByPartition,'0');
		}
	   var texts = new Array();
	   
	   var items = tree.getAllChecked();
	   if(items != "") {
		   var ids = items.split(",");
		   for(var i=0; i<ids.length; i++) {
			   //alert( ids[i] + "\t" + tree.getItemText(ids[i]) );
			   texts.push(tree.getItemText(ids[i]));
		   }
	   }
	   
	   // 关闭当前dialog
	   // 父级页面赋值
	   window.parent.document.getElementById("organizationTexts").value = texts.join();
	   window.parent.document.getElementById("organizationIds").value = items;
	   window.parent.closeDialogNoRefresh();
	}
	// 递归处理
	function setTreeNodeCheckBox(cid, flag) {
		for(var index = 0; index < tree.hasChildren(cid); index++) {
			var childrenNodeId = tree.getItemIdByIndex(cid, index);
			// 禁用子节点
			if(flag == '0') {
				tree.disableCheckbox(childrenNodeId, 0);
			} else {
				tree.setCheck(childrenNodeId, 0);
				//tree.disableCheckbox(childrenNodeId, 1);
				tree.disableCheckbox(childrenNodeId, 0);
			}
			// 如果子节点还有子节点，则递归处理
			if(tree.hasChildren(childrenNodeId) > 0) {
				setTreeNodeCheckBox(childrenNodeId, flag);
			}						
		}
	}
	
	// 如果不是分区所管的组织机构就禁用
	function setTreeDisCheckBox(cid,organizationIdsByPartition,flag) {
		for(var index = 0; index < tree.hasChildren(cid); index++) {
			var childrenNodeId = tree.getItemIdByIndex(cid, index);//得到子节点
			
			// 禁用子节点
			if(organizationIdsByPartition.indexOf(childrenNodeId)==-1) {
				tree.disableCheckbox(childrenNodeId, flag);//第二参数1是禁用 0是启用
			} 
			// 如果子节点还有子节点，则递归处理
			if(tree.hasChildren(childrenNodeId) > 0) {
				setTreeDisCheckBox(childrenNodeId, organizationIdsByPartition,flag);
			}						
		}
	}
	// 递归处理
	function setParentNodeCheckBox(id, flag) {
		var parentNodeId = tree.getParentId(id); // 当前节点的父节点
		if(flag == '1') {
			tree.setCheck(parentNodeId, 0);
		}
		// 递归处理
		if(tree.getParentId(parentNodeId) != "0") {
			setParentNodeCheckBox(parentNodeId, flag);
		}
	}
</script>
</rapid:override>

<rapid:override name="content">
<body class="mainbody">
	<form action="${ctx}/organiz/Role!grantPermission.do" name="perForm" method="post" >
		<input type="hidden" name="id" value="${id}">
		<input type="hidden" name="partitionId" value="${partitionId}">
		<span>
		<c:forEach var="obj" items="${params }"	varStatus="vs">
			<input type="hidden" name="${obj.key}" value="${obj.value}" />
		</c:forEach>
		</span>
		<div clsss="formControls" style="padding-top: 5px;">
			<input id="submitButton" name="submitButton" type="button" value="确定" onclick="choiceOrg();"/>
			<!--  
			<input type="button" value="取消" onclick="window.parent.closeDialog();"/>
			-->
			<input type="button" value="取消" onclick="window.parent.closeDialogNoRefresh();"/>
		</div>
		<div id="jsTree" align="left" style="width:100%;height:300px;overflow-x:hidden;" ></div>
	</form>
	
</body>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>