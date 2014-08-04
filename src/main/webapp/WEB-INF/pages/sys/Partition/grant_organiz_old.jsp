<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title>权限授予</title>
	<c:set var="ctx" value="${pageContext.request.contextPath}" />
		<script language="javascript" src="${ctx}/scripts/jquery.js"></script>
		<script src="${ctx}/scripts/dhtmlxcommon.js"></script>
		<script src="${ctx}/scripts/dhtmlxtree.js"></script>
        <script src="<c:url value="/scripts/jquery.js"/>" type="text/javascript"></script>
		<link href="${ctx}/styles/global.css" id="global" rel="stylesheet" type="text/css" />
		<link href="${ctx}/styles/tree.css" rel="stylesheet" type="text/css" />
		<script src="${ctx}/scripts/hf.js" type="text/javascript"></script>
			<script language="javascript">
	$(function() {
		tree = new dhtmlXTreeObject("jsTree", "50%", "50%", 0);
		tree.setSkin('dhx_skyblue');
		tree.setImagePath("${ctx}/images/tree/");
		tree.setOnClickHandler(function(id) {
			openPathDocs(id);
		});
		//设置树的编码  
		tree.setEscapingMode("utf8");
		tree.enableCheckBoxes("1");
		tree.setOnCheckHandler(function(id) {
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
		})
	    //tree.enableThreeStateCheckboxes(1);
		tree.setXMLAutoLoading("${ctx}/sys/Partition!grantOrgnizPage.do?id=${id}");
		tree.loadXML("${ctx}/sys/Partition!grantOrgnizPage.do?id=${id}");
	});
	
	

	function openPathDocs(id) {
		tree.setItemColor(tree.getSelectedItemId(), "#696969", "#B8860B");
	
	}

	function autoselectNode() {
		tree.selectItem(node, true);
		tree.openItem(node);
	}
	
	function perFormSub(){
	   document.getElementById("organizIds").value = tree.getAllCheckedBranches();
	   document.getElementById("id").value = '${id}';
	   document.getElementById("orgForm").submit();
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
<form action="${ctx}/sys/Partition!grantOrganiz.do" id="orgForm" name="orgForm" method="post" >
<input type="hidden" name="id" id="id" value="${id}">
<input type="hidden" name="organizIds" id="organizIds" value="">
<!-- 无外边框内容区开始 -->
<div class="wbkbox">
<!-- TAB标签结束 -->
	<div class="main-wbkcon" style="height: 310px;">
		<div align="left" style="padding-top: 5px;">
			<input id="submitButton" name="submitButton" type="button" value="提交" onclick="perFormSub();"/>
			<input type="button" value="关闭" onclick="window.parent.closeDialog();"/>
		</div>
		<div id="jsTree" align="left" style="height:285px;width:100%;"></div>
	</div>
</div>
</form>
</body>
	<script>
		new Validation(document.forms[0],{onSubmit:true,onFormValidate : function(result,form) {
			var finalResult = result;
			//在这里添加自定义验证
			return disableSubmit(finalResult,'submitButton');
		}});
	</script>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>