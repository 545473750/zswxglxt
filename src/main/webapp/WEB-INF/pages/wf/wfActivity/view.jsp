<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看流程节点表</title>
<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="main">
	<div class="maintit">
		<h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle"/>查看流程节点</h2>
		<h3><a href="${ctx}/wf/WfActivity!list.do?1=1<c:forEach var="p" items="${params}"><c:if test="${p.key!='query.name'}">&${p.key}=${p.value}</c:if></c:forEach>">返回 &gt;&gt;</a></h3>
	</div>
	<div class="centent" style="padding-top: 10px;">
		<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
			<tr class="jg" >
				<td width="14%" align="right" height="36" class="leftbor" > 
					名称：
				</td>
				<td>
					${model.name}
				</td>
				<td width="14%" align="right" height="36" class="leftbor" > 
					节点顺序：
				</td>
				<td>
					${model.orderNum}
				</td>
			</tr>
			<tr class="jg" >
				<td width="14%" align="right" height="36" class="leftbor" > 
					功能描述：
				</td>
				<td colspan="3">
					${model.description}
				</td>
			</tr>
	    </table>
	</div>
</div>
</body>
</html>
