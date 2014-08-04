<%@ page import="com.opendata.organiz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ctx }/scripts/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$("#dialog").dialog({
	        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 选择用户/组织机构/岗位/...',
	        autoOpen: false,
	        width: 650,
	        //height: 400,
	        resizable: false,
	        modal: true,
	        autoResize: true,
	        overlay: {
	               opacity: 0.5,
	               background: "black"
	           }
	    });
	});
	
	function choiceOrganization() {
		var selectedIds = document.getElementById('organizationIds').value;
		openDialog('${ctx }/comp/Component!choiceOrganizationPage.do?selectedIds=' + selectedIds + '&version=<%=System.currentTimeMillis()%>');
	}
	
	function choiceUser() {
		var selectedIds = document.getElementById('userIds').value;
		openDialog('${ctx }/comp/Component!choiceUserPage.do?selectedIds=' + selectedIds);
	}
</script>

<title>DEMO</title>
</head>
<body>

	<table>
		<tr><td>
		<input type="text" name="userIds" id="userIds"/>
		<textarea rows="3" cols="" style="width: 400px;" id="userTexts"></textarea>
		<a href="javascript:void(0);" onclick="choiceUser();"> 选择用户</a>
		</td></tr>
		
		<tr>
		<td>
		<input type="text" name="organizationIds" id="organizationIds"/>
		<textarea rows="3" cols="" style="width: 400px;" id="organizationTexts"></textarea>
		<a href="javascript:void(0);" onclick="choiceOrganization();"> 选择组织机构</a>
		</td>
		</tr>
		
		<tr>
		<td>
		<a href="javascript:openDialog('${ctx }/comp/Component!choiceUserPage.do');"> 选择岗位</a>
		</td>
		</tr>
	</table>
	
	<div id="dialog" style="overflow: visible;">
		<iframe id="addSit" frameborder="0" marginwidth="0" marginheight="0" scrolling="yes" width="100%" height="400"></iframe>
	</div>
</body>
</html>

<%@ include file="/base.jsp"  %>