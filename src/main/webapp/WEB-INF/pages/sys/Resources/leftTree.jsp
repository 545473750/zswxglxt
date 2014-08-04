<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/commons/taglibs.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link href="<c:url value="/styles/global.css"/>" type="text/css" rel="stylesheet" />
	<script language="javascript" src="${ctx}/scripts/jquery.js"></script>
	<script src="${ctx}/scripts/dhtmlxcommon.js"></script>
	<script src="${ctx}/scripts/dhtmlxtree.js"></script>

	<script language="javascript">
	$(function() {
		tree = new dhtmlXTreeObject("divForTree", "100%", "100%", 0);
		tree.setSkin('dhx_skyblue');
		tree.setImagePath("${ctx}/images/tree/");
		tree.setOnClickHandler(function(id) {
			openPathDocs(id);
		});
		
		tree.setEscapingMode("utf8");
		tree.setXMLAutoLoading("${ctx}/sys/Resources!resourcesXML.do");
		tree.loadXML("${ctx}/sys/Resources!resourcesXML.do");
		tree.attachEvent("onXLE", function(tree, id){
		    //取得先被操作的节点ID，刷新后重新打开此节点
			var pid = '${queryParentId}';
			if(pid == null || pid == ""|| pid == "-1") {
				pid = 'root';
			}
			tree.openItem(pid);
			tree.setItemColor(pid, "#B8860B", "");
		});
	});
	//点击子节点调用的方法
	function openPathDocs(id) {
		window.parent.mainFrame.location.href = "${ctx}/sys/Resources!list.do?queryParentId=" + id;
	}
	</script>
</head>
<body >
  <div id="divForTree" style="height: 470px;"></div>
</body>
</html>
