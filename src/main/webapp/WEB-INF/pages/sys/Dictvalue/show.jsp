<%@page import="com.opendata.sys.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>数据字典值</title>
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet"
			type="text/css" />
	</head>
	<body>



		<div class="main">
			<div class="maintit">
				<h2>
					<img src="${ctx}/${pattern}/images/tabicon.gif" width="16"
						height="16" align="absmiddle" />
					数据字典值
				</h2>
				<h3>
					<a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a>
				</h3>
			</div>
			<div class="centent" style="padding-top: 10px;">
				<span> <c:forEach var="obj" items="${params }" varStatus="vs">
						<input type="hidden" name="${obj.key}" value="${obj.value}" />
					</c:forEach> </span>
				<s:hidden name="id" id="id" value="%{model.id}" />
				<table cellpadding="0" cellspacing="0" border="0" class="uiTable">

					<tr class="jg">
						<td width="10%" height="36" class="leftbor">
							字典值编号:
						</td>
						<td>
							${model.code}
						</td>
					</tr>
					<tr>
						<td width="10%" height="36" class="leftbor">
							字典值:
						</td>
						<td>
							${model.value}
						</td>
					</tr>
					<tr class="jg">
						<td width="10%" height="36" class="leftbor">
							字典项:
						</td>
						<td>
							${model.dictitem.name}
						</td>
					</tr>
					<tr>
						<td width="10%" height="36" class="leftbor">
							描述:
						</td>
						<td>
							${model.discription }
						</td>
					</tr>
					<tr>
						<td width="10%" height="36" class="leftbor">
							创建时间 :
						</td>
						<td>
							${model.ts }
						</td>
					</tr>

				</table>
				<div class="page">
					<input type="button" value="返回" onclick="history.back();" />
				</div>
			</div>
	</body>
</html>
