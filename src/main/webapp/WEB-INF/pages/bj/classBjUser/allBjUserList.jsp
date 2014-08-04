<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>班级成员管理</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
</head>
<body>
 <div class="llistbox">
<div class="table01" align="center">
<p><h3>${termBj.classTerm.classBigclass.name } ${termBj.name } ${termBj.classTerm.name }</h3></p>
<p style="color: red;text-align: left;" >
	<span style="font-size:15px; color: #008888;">点击姓名查看该学员的学习情况</span>&nbsp;&nbsp;
	<!--
	<a href="${ctx }/course/myCourse!teacherIndex.do?role=4&termId=${termBj.classTermId}&classId=${termBj.id}" target="_blank" style="color: red;">查看教师备课情况</a>&nbsp;&nbsp;
	-->
	<a href="${ctx}/bj/ClassTermBj!showBj.do?classId=${classId}" style="color: red;">返回班级列表</a>
</p>
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassBjUser!list.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="text-align: center;">
	<tr>
	  	<th width="50">序号</th>
	  	<th >继教号</th>
	  	<th >姓名</th>
	  	<th >单位</th>
	  	<th >性别</th>
	  	<th >出生日期</th>
	  	<th >联系方式</th>
	</tr>
	<c:if test="${fn:length(bjUsers)<=0}">
		<tr>
			<td colspan="7">暂无数据</td>
		</tr>
	</c:if>
	<c:forEach var="obj" items="${bjUsers}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
					${obj.user.userNum }
		</td>			
		<td>
					<a href="${ctx}/course/myCourse!stuIndex.do?role=5&termId=${termBj.classTermId}&classId=${termBj.id}&userId=${obj.user.id}" target="_blank">${obj.user.username}</a>
		</td>
		<td>
					<c:if test="${fn:length(obj.user.unitName)>10}">
						<span title="${obj.user.unitName }">${fn:substring(obj.user.unitName,0,10) }...</span>
					</c:if>
					<c:if test="${fn:length(obj.user.unitName)<=10}">${obj.user.unitName }</c:if>
		</td>
		<td>
					${SEX[obj.user.teacher.sex] }
		</td>
		<td>
					${obj.user.teacher.birthMonth}
		</td>
		<td>
					${obj.user.teacher.mobile}
		</td>
	</tr>
</c:forEach>
</table>
</form>
</div>
</div>
<script type="text/javascript">
	function goBack(){
		location.href="${ctx}/bj/ClassTermBj!list.do?query.classTermId=${query.classTermId}&query.bigclassId=${query.bigclassId}";
	}
	function addBaoM(action,form){
		form.action = action;
    	form.submit();
	}
</script>
</body>
</html>
