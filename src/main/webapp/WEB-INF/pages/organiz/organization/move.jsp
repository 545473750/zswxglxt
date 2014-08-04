<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ page import="com.opendata.organiz.model.*" %>

<rapid:override name="head">
	<c:set var="ctx" value="${pageContext.request.contextPath}" />
	<script type="text/javascript" src="${ctx}/scripts/jquery.js"></script>
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
			
			// 不允许移动到自己
			var _self = document.getElementById("id").value;
			if(_self == id) {
				tree.setCheck(id, 0);
				return ;
			} 
			
			// 不允许移动到子部门
			var currentNode = document.getElementById("id").value;
			for(var index = 0; index < tree.hasChildren(currentNode); index++) {
				var childrenNodeId = tree.getItemIdByIndex(currentNode, index);
				if(childrenNodeId == id) {
					//alert("不允许移动到子部门！");
					tree.setCheck(id, 0);
					return ;
				}
			}
			/*
			// 部门不能移动到业务组下面
			var moveToType = tree.getUserData(id, "type");
			var nodeType = '${organizationType}';
			if(nodeType == 'type_dept' && moveToType == 'type_group') {
				alert("部门不能放在业务组下!");
				// 还原
				tree.setCheck(id, 0);
				// 退出
				return ;
			}
			*/
			var selectTreeNodes = tree.getAllChecked();
			if(selectTreeNodes != null) {
				var nodes = selectTreeNodes.split(",");
				for(var i = 0; i < nodes.length; i++) {
					tree.setCheck(nodes[i],0);
				}
				
				tree.setCheck(id, 1);
			} 
			
		}); 

		//tree.enableThreeStateCheckboxes(1);
	    //tree.enableThreeStateCheckboxes(true);
	    
		tree.setXMLAutoLoading("${ctx}/organiz/Organization!getOrganizationTreeXmlWithRoot.do?selectedIds=${query.parentId}&partitionId=${partitionId}&id=${id}");
		tree.loadXML("${ctx}/organiz/Organization!getOrganizationTreeXmlWithRoot.do?selectedIds=${query.parentId}&partitionId=${partitionId}&id=${id}");
		
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
	   
	   
	   var selectTreeNodes = tree.getAllChecked();
	   if(selectTreeNodes != "") {
		   var nodeIds = selectTreeNodes.split(",");
		   if(nodeIds.length > 1) {
			   alert("请选择一个组织机构！");
			   return ;
		   }
		   // 传到后台
		   document.getElementById("moveToNodeId").value = selectTreeNodes;
		   document.getElementById("moveForm").submit();
	   } else {
		   alert("请选择要移动到的组织机构！");
	   }	
	}
</script>
</rapid:override>

<rapid:override name="content">

<body>
<%-- 	${id} <br /> ${parentOrganizationId } <br /> --%>
	<form method="post" name="moveForm" id="moveForm" action="${ctx }/organiz/Organization!moveOperation.do">
		<input type="hidden" name="parentId" id="moveToNodeId"/>
		<input type="hidden" name="id" id="id" value="${id }" />
		<input type="button" value="确定" onclick="choiceOrg();"/>
		<input type="button" value="取消" onclick="window.parent.closeDialog();"/>
	</form>
	<div id="jsTree" align="left"></div>
</body>

	<script>
		new Validation(document.forms[0],{onSubmit:true,onFormValidate : function(result,form) {
			var finalResult = result;
			//在这里添加自定义验证
			return disableSubmit(finalResult, 'submitButton');
		}});
	</script>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="/base.jsp" %>