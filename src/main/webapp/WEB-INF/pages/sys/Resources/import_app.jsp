<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@page import="com.opendata.organiz.model.*" %>
<%@page import="com.opendata.application.model.*" %>

<rapid:override name="head">
	<title>导入功能入口</title>
	<c:set var="ctx" value="${pageContext.request.contextPath}" />
	<link href="${ctx}/styles/global.css" id="global" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${ctx}/scripts/jquery.js"></script>
		<script src="${ctx}/scripts/dhtmlxcommon.js"></script>
		<script src="${ctx}/scripts/dhtmlxtree.js"></script>
        <script src="<c:url value="/scripts/jquery.js"/>" type="text/javascript"></script>
		
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
	    tree.enableThreeStateCheckboxes(1);
		tree.setXMLAutoLoading("${ctx}/sys/Resources!toImportApp.do?queryParentId=${queryParentId}");
		tree.loadXML("${ctx}/sys/Resources!toImportApp.do?queryParentId=${queryParentId}");
	});
	
	//设置多选框选中父子联动的方法 此处是选子节点 父节点不被选中 选父节点其下的子节点全部勾选
	dhtmlXTreeObject.prototype._correctCheckStates=function(dhtmlObject){      
	   
	}  
	

	function openPathDocs(id) {
		tree.setItemColor(tree.getSelectedItemId(), "#696969", "#B8860B");
	
	}

	function autoselectNode() {
		tree.selectItem(node, true);
		tree.openItem(node);
	}
	
	function perFormSub(){
	   var item = tree.getAllCheckedBranches(); 
	   document.getElementById("permissionIds").value=item;
	   document.getElementById("perForm").submit();
	}
</script>
</rapid:override>

<rapid:override name="content">
<body class="mainbody">
<form action="${ctx}/sys/Resources!importApp.do" id="perForm" name="perForm" method="post" >
<input type="hidden" name="queryParentId" value="${queryParentId}">
<input type="hidden" name="permissionIds" id="permissionIds" value="">
<!-- 无外边框内容区开始 -->
<div class="wbkbox">
<!-- TAB标签结束 -->
<div class="main-wbkcon" style="height: 310px;overflow:hidden;">
<div align="left" style="padding-top: 5px;">
	<input id="submitButton" name="submitButton" type="button" value="提交" onclick="perFormSub();"/>
	<input type="button" value="关闭" onclick="window.parent.closeDialogNoRefreshById('importAppDialog');"/>
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