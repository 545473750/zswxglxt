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
	    //tree.enableThreeStateCheckboxes(1);
		tree.setXMLAutoLoading("${ctx}/organiz/Organization!getOrganizationTreeXml.do?selectedIds=${selectedIds}");
		tree.loadXML("${ctx}/organiz/Organization!getOrganizationTreeXml.do?selectedIds=${selectedIds}");
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
</script>
</rapid:override>

<rapid:override name="content">
<body class="mainbody">
	<form name="form" method="post" action="">
		<input type="hidden" name="id" value="${id}">
		
		<%-- 
		<div clsss="formControls" style="padding-top: 5px;">
			<input type="button" value="确定" id="submitButton" name="submitButton" onclick="choiceOrg();"/>
			<input type="button" value="取消" onclick="window.parent.closeDialog();"/>
		</div>
		<div id="jsTree" align="left" style="width:60%;height:300px;overflow-x:hidden;" ></div>
		--%>
	
	<div class="wbkbox">
	<!-- TAB标签结束 -->
	<div class="main-wbkcon" style="height: 310px;">
		<div align="left" style="padding-top: 5px;">
			<input type="button" value="确定" id="submitButton" name="submitButton" onclick="choiceOrg();"/>
			<input type="button" value="取消" onclick="window.parent.closeDialog();"/>
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
			return disableSubmit(finalResult, 'submitButton');
		}});
	</script>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="/base.jsp" %>