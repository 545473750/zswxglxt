<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看系统分级管理员</title>
<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!-- 内容开始 -->
<div class="main">
  <div class="maintit">
      <h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" /> 查看系统分级管理员</h2>
     <h3><a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a></h3>
  </div>
    <div class="centent" style="padding-top:10px;">
    <table cellpadding="0" cellspacing="0" border="0" class="uiTable">
		<tr class="jg" >
					<td width="10%" height="36" class="leftbor" > 
				用户id：
			</td>
			<td>
					${model.userId}
			</td>
		</tr>
		<tr  >
					<td width="10%" height="36" class="leftbor" > 
				用户姓名：
			</td>
			<td>
					${model.name}
			</td>
		</tr>
		<tr class="jg" >
					<td width="10%" height="36" class="leftbor" > 
				数据范围：
			</td>
			<td>
					<c:if test="${model.dataScope =='1'}">
					个人
					</c:if>
					<c:if test="${model.dataScope =='2'}">
					部门
					</c:if>
					<c:if test="${model.dataScope =='3'}">
					指定
					</c:if>
					<c:if test="${model.dataScope =='9'}">
					全部
					</c:if>
			</td>
		</tr>
		<tr  >
					<td width="10%" height="36" class="leftbor" > 
				用户授权：
			</td>
			<td>
					<c:forEach items="${userSe}" var="us">
						${us.username}
					</c:forEach>
			</td>
		</tr>
		<tr class="jg" >
					<td width="10%" height="36" class="leftbor" > 
				授权菜单：
			</td>
			<td>
					<c:forEach items="${resources}" var="re">
							${re.name}
					</c:forEach>
			</td>
		</tr>
		<tr  >
					<td width="10%" height="36" class="leftbor" > 
				管理状态：
			</td>
			<td>
					<c:if test="${model.userState == '1'}">
					正常
					</c:if>
					<c:if test="${model.userState == '2'}">
					启用
					</c:if>
			</td>
		</tr>
		<tr class="jg" >
					<td width="10%" height="36" class="leftbor" > 
				添加人ID：
			</td>
			<td>
					${model.addUserId}
			</td>
		</tr>
		<tr  >
					<td width="10%" height="36" class="leftbor" > 
				添加人姓名：
			</td>
			<td>
					${model.addName}
			</td>
		</tr>
		<tr class="jg" >
					<td width="10%" height="36" class="leftbor" > 
				添加时间：
			</td>
			<td>
					<fmt:formatDate value="${model.addTime}" pattern="yyyy-MM-dd"/>
			</td>
		</tr>
    </table>
	<div class="page">
	    <input type="button" value="返回" class="but_shop" onclick="history.back(-1)" />
	</div>
  </div>
  </div>
</body>
</html>
