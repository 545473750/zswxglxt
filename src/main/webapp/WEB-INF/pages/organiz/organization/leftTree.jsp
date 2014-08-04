<%@ page import="com.opendata.organiz.model.*"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/commons/taglibs.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link href="${ctx }/styles/global.css" type="text/css" rel="stylesheet" />
	
	<script src="${ctx}/scripts/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/dhtmlxcommon.js"></script>
	<script src="${ctx}/scripts/dhtmlxtree.js"></script>

	<script language="javascript">
	$(function() {
		tree = new dhtmlXTreeObject("divForTree", "100%", "100%", 0);
		//tree.setSkin('dhx_skyblue');
		tree.setImagePath("${ctx}/images/tree/");
		// 监听单击
		tree.setOnClickHandler(function(id) {
			openPathDocs(id);
		});
		
		tree.setEscapingMode("utf8");
		tree.setXMLAutoLoading("${ctx}/organiz/Organization!deptXML.do");
		tree.loadXML("${ctx}/organiz/Organization!deptXML.do");
		
		tree.attachEvent("onXLE", function(tree, id){
			//tree.openAllItems("402880e436f289fc0136f28b8ca50003");
			var pid = '${query.parentId}';
			if(pid == null || pid == "") {
				pid = '0';
			}
			tree.openItem(pid);
			tree.setItemColor(pid, "#B8860B", "");
			
			//window.parent.rightFrame.location.href = "${ctx}/organiz/Organization!toRightPage.do?id=" + pid;
		});
	});

	function openPathDocs(id) {
		tree.setItemColor("root", "#696969");		
		tree.setItemColor(id, "#696969", "#B8860B");
	//	alert(id);
		var url = "${ctx}/organiz/Organization!toRightPage.do"; 
		if(id!='root'){
			url+="?query.parentId="+id;
		}
		window.parent.rightFrame.location.href = url;
	}
	</script>
</head>
<body>
<!--  
<a href="javascript:void(0);" onclick="tree.openAllItems(0);">Expand all</a>
<a href="javascript:void(0);" onclick="tree.openItem('402880e436f289fc0136f28b8ca50003');">Open selected item</a>
-->
<div id="divForTree" style="height: 500px;"></div>
</body>
</html>
