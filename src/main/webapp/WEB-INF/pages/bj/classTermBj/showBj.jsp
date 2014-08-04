<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>期数班级管理</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
</head>
<body>
<div class="llistbox">
<div class="table01" align="center">
<p><h3>${termBj.classTerm.classBigclass.name } ${termBj.name } ${termBj.classTerm.name }</h3></p>
<p style="color: red; text-align: left;"><span style="font-size:15px; color: #008888;">点击相应班级名称查看班级成员及备课信息</span></p>
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassTermBj!list.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<table style="width: 700px;" cellpadding="0" cellspacing="0" border="0" style="text-align: center;">
	<tr>
	  	<th>班级名称</th>
	  	<th>任课教师</th>
	  	<th>此班人数</th>
	  	<th>计划人数</th>
	</tr>
	<tr class="jg" >
		<td width="35%">
					<a href="${ctx}/bj/ClassBjUser!bjUserList.do?classId=${termBj.id}">${termBj.classTerm.classBigclass.name } ${termBj.name }</a>
		</td>
		<td width="25%">
					${termBj.classTeacher2 }
		</td>
		<td>
					${termBj.actualCount}
		</td>
		<td>
					${termBj.planCount}
		</td>
		
	</tr>
</table>
</form>
  </div>
  </div>

</body>
</html>
