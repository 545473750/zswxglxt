<%@ page import="com.opendata.sys.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>数据字典项</title>
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet"
			type="text/css" />
	</head>
	<body>


		<div class="main">
			<div class="maintit">
				<h2>
					<img src="${ctx}/${pattern}/images/tabicon.gif" width="16"
						height="16" align="absmiddle" />
					日志
				</h2>
				<h3>
					<a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a>
				</h3>
			</div>
			<div class="centent" style="padding-top: 10px;">
				<s:hidden name="id" id="id" value="%{model.id}" />
				<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
					<tr class="jg">
						<td width="10%" height="36" class="leftbor">
							字典名称：
						</td>
						<td>
							${model.name }
						</td>
					<tr>
					<tr>
						<td width="10%" height="36" class="leftbor">
							字典编号：
						</td>
						<td>
							${model.code}
						</td>
					<tr>
					<tr class="jg">
						<td width="10%" height="36" class="leftbor">
							所属应用：
						</td>
						<td>
							${model.application.name }
						</td>
					<tr>
					<tr>
						<td width="10%" height="36" class="leftbor">
							可编辑标识：
						</td>
						<td>
							<s:if test="%{model.editf == \"0\"}">可编辑</s:if>
							<s:if test="%{model.editf == \"1\"}">不可编辑</s:if>
						</td>
					<tr>
					<tr class="jg">
						<td width="10%" height="36" class="leftbor">
							创建时间：
						</td>
						<td>
							${model.ts }
						</td>
					<tr>
					<tr>
						<td width="10%" height="36" class="leftbor">
							描述：
						</td>
						<td>
							${model.description }
						</td>
					<tr>
				</table>
				<div class="page">
					<input type="button" value="返回" class="but_shop"
						onclick="history.back(-1)" />
				</div>
			</div>
	</body>
</html>
