<%@ page import="com.opendata.sys.model.*"%>
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
<script src="<c:url value="/scripts/jquery.js"/>" type="text/javascript"></script>
<script src="${ctx}/scripts/dhtmlxcommon.js"></script>
<script src="${ctx}/scripts/dhtmlxtree.js"></script>

	<script language="javascript">
	$(function() {
		tree = new dhtmlXTreeObject("divForTree", "100%", "100%", 0);
		//tree.setSkin('dhx_skyblue');
		tree.setImagePath("${ctx}/images/tree/");
		tree.setOnClickHandler(function(id) {
			openPathDocs(id);
		});
		
		tree.setEscapingMode("utf8");
		tree.setXMLAutoLoading("${ctx}/sys/Dictvalue!dictValueXML.do?dictitemId=${dictitemId}");
		tree.loadXML("${ctx}/sys/Dictvalue!dictValueXML.do?dictitemId=${dictitemId}");
		
		tree.attachEvent("onXLE", function(tree, id){
			var pid = '${dictitemId}';
			if(pid == null || pid == "") {
				return ;
			}
			tree.openItem(pid);
			tree.setItemColor(pid, "#B8860B", "");
			
			// 节点类型
			var nodetype = tree.getUserData(pid, "type");
			// 是否可编辑
			var edit = tree.getUserData(pid, "edit");
			window.parent.rightFrame.location.href = "${ctx}/sys/Dictvalue!list.do?dictitemId=" + pid + "&nodetype=" + nodetype + "&editable=" + edit;
			//openPathDocs(pid);
		});
	});

		function openPathDocs(id) {
			
			tree.setItemColor(id, "#696969", "#B8860B");
			
			// 节点类型
			var nodetype = tree.getUserData(id, "type");
			// 是否可编辑
			var edit = tree.getUserData(id, "edit");

			window.parent.rightFrame.location.href = "${ctx}/sys/Dictvalue!list.do?dictitemId=" + id + "&nodetype=" + nodetype + "&editable=" + edit;
		}
	</script>
</head>
<body>
<div id="divForTree" style="height: 470px;"></div>
</body>
</html>
