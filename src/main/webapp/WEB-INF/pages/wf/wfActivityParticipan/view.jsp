<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看流程节点参与者</title>
<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="main">
  <div class="maintit">
      <h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" />查看节点参与者</h2>
      <h3><a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a></h3>
  </div>
    <div class="centent" style="padding-top:10px;">
    	<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
			<tr class="jg" >
				<td width="11%" height="36" align="right" class="leftbor"> 
					关联名称：
				</td>
				 <td width="37%">
						${model.refName}
				</td>
			</tr>
			<tr>
				<td width="11%" height="36" align="right" class="leftbor"> 
					关联类型：
				</td>
				<td width="39%">
					<c:if test="${model.refType == 1}">用户</c:if>
					<c:if test="${model.refType == 2}">部门</c:if>
					<c:if test="${model.refType == 3}">角色</c:if>
					<c:if test="${model.refType == 4}">专家组</c:if>
				</td>
			</tr>
			<c:if test="${model.refType == 3}">
				<tr class="jg">
					<td width="11%" height="36" align="right" class="leftbor"> 用户名称：</td>
					<td>${username}</td>
				</tr>
			</c:if>
	    </table>
    </div>
</div>
</body>
</html>
