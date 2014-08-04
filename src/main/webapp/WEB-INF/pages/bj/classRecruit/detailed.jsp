<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>培训班详细信息</title>
<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
</head>
<body>
<div class="right">
<div class="llistbox">
<div class="listmap">
      <p class="dqwz">当前位置：<a href="#">教学教务</a> &gt; <a href="#">培训班报名</a> &gt; 培训班详细信息</p>
      <p class="fhbut">
        <input type="button" name="button" id="button" value="返 回" onclick="history.go(-1)" />
      </p>
</div>
<div class="tablelist">
<div class="title">培训班详细信息</div>
<div class="table01">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<th colspan="4">招生基本信息</th>
		</tr>
		<tr class="jg">
			<td width="12%" align="right" height="36" class="leftbor">招生标题:</td>
			<td>${model.title }</td>
			<td width="12%" align="right" height="36" class="leftbor">报名起止时间:</td>
			<td>
				<fmt:formatDate value="${model.startTime}" pattern="yyyy-MM-dd"/>
				至
				<fmt:formatDate value="${model.endTime}" pattern="yyyy-MM-dd"/>
			</td>
		</tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<th colspan="6">培训班基本信息</th>
		</tr>
		<tr class="jg" >
		<td width="10%" align="right" height="36" class="leftbor" >培训类别：</td>
		<td>
			${pxlb[bigclass.trainType]}
		</td>
		<td width="10%" align="right">申请人：</td>
		<td>${bigclass.applyUserName }</td>
		<td align="right">培训单位：</td>
		<td>北京教育学院朝阳分院</td>
	</tr>
	<tr>
		<td width="10%" align="right" height="36" class="leftbor" >班级名称：</td>
		<td>
			${bigclass.name}
		</td>
		<td width="10%" align="right" height="36" class="leftbor" >预设班主任：</td>
		<td >
			${bigclass.headTeacherName}
		</td>
		<td width="10%" align="right" height="36" class="leftbor" >学科：</td>
		<td>
			${xk[bigclass.subject]}
		</td>
	</tr>
	<tr class="jg">
		<td width="10%" align="right" height="36" class="leftbor" rowspan="3" >总学时：</td>
		<td rowspan="3">
			${bigclass.totalHour}
		</td>
		<td width="10%" align="right" height="36" class="leftbor" >面授学时：</td>
		<td>
			${bigclass.faceHour}
		</td>
		<td rowspan="3" width="12%" align="right" height="36" class="leftbor" >预设总学分：</td>
		<td rowspan="3">
			${bigclass.prepareScore}
		</td>
	</tr>
	<tr >
		<td width="10%" align="right" height="36" class="leftbor" >网授学时：</td>
		<td>
			${bigclass.netHour}
		</td>
	</tr>
	<tr class="jg">
		<td width="10%" align="right" height="36" class="leftbor" >实践学时：</td>
		<td>
			${bigclass.practiceHour}
		</td>
	</tr>
	<tr>
		<td width="12%" align="right" height="36" class="leftbor" >招生对象：</td>
		<td colspan="3">
				${bigclass.recruitObj}
		</td>
		<td width="10%" align="right" height="36" class="leftbor" >招生人数：</td>
		<td>
			${bigclass.recruitCount}
		</td>
	</tr>
	<tr class="jg" >
		<td width="10%" align="right" height="36" class="leftbor" >资料费用：</td>
		<td>
			${bigclass.materialsFee }元
		</td>
		<td width="12%" align="right" height="36" class="leftbor" >用途：</td>
		<td colspan="3">
				${bigclass.purpose}
		</td>
	</tr>
	<tr>
		<td width="10%" align="right" height="36" class="leftbor" >课程说明：</td>
		<td colspan="5">
				${bigclass.description}
		</td>
	</tr>
	<tr class="jg" >
		<td width="10%" align="right" height="36" class="leftbor" >培训目标：</td>
		<td colspan="5">
				${bigclass.trainTarget}
		</td>
	</tr>
	<tr>
		<td width="12%" align="right" height="36" class="leftbor" >考核方式：</td>
		<td colspan="5">
				${bigclass.checkWays}
		</td>
	</tr>
	</table>     
	<table  id="cc" style="text-align: center;" cellpadding="0" cellspacing="0" border="0" width="100%">
	  <tr class="jg" >
	    <th colspan="5">本班每门课程教师任课情况</th>
	  </tr>
	  <tr>
	  	<td  height="25"><h4>课程名称</h4></td>
	  	<td  height="25"><h4>本院教师</h4></td>
	  	<td  height="25"><h4>外请教师</h4></td>
	  	<td  height="25"><h4>学时</h4></td>
	  	<td  height="25"><h4>考核方式</h4></td>
	  </tr>
	  <c:forEach items="${classCourses }" var="classCourse" varStatus="stat">
	  	<tr class="${stat.count % 2 == 0 ? 'jg' : ''}">
			<td width="35%">
		    	${ classCourse.courseName}
		    </td>
		    <td width="12%">
		    	${classCourse.localTeacherName}
		    </td>
		    <td width="12%">
		    	${classCourse.outTeacherName }
		    </td>
		    <td width="12%">
		    	${classCourse.courseDate }
		    </td>
		    <td width="24%">
		    	<c:forTokens items="${classCourse.checkWay}" delims="," var = "way">${khfs[way]}&nbsp;&nbsp;</c:forTokens>
		    </td>
	  	</tr>
	  </c:forEach>
	</table>
	<c:if test="${type == 2}">
	<table  id="cc" style="text-align: center;" cellpadding="0" cellspacing="0" border="0" width="100%">
		<tr>
			<th colspan="8">教师个人基本信息</th>
		</tr>
		<tr class="jg">
			<td>报名老师：</td>
			<td>${user.username }</td>
			<td>继教号：</td>
			<td>${user.userNum }</td>
			<td>所在单位：</td>
			<td colspan="3">&nbsp;</td>
		</tr>
		<tr>
			<td>性别：</td>
			<td>${SEX[user.teacher.sex] }</td>
			<td>出生日期：</td>
			<td>${user.teacher.birthMonth}</td>
			<td>学历：</td>
			<td>${xl[user.teacher.education]}</td>
			<td>专业：</td>
			<td>${user.teacher.specialty }</td>
		</tr>
		<tr class="jg">
			<td>学科：</td>
			<td>&nbsp;</td>
			<td>学段：</td>
			<td>${xd[user.teacher.teachSemester]}</td>
			<td>职称：</td>
			<td colspan="3">${zc[user.teacher.title]}</td>
		</tr>
	</table>
	</c:if>
	<table  id="cc" style="text-align: center;" cellpadding="0" cellspacing="0" border="0" width="100%">
	<c:if test="${type == 1 || type == 3}">
		<tr>
			<th colspan="7">集体报名人员</th>
		</tr>
		<tr class="jg">
			<td>序号</td>
			<td>继教号</td>
			<td>教师姓名</td>
			<td>所在单位</td>
			<td>学科</td>
			<td>学段</td>
			<td>职称</td>
		</tr>
		<c:forEach items="${users}" var="user" varStatus="vs">
			<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
				<td>${vs.index+1}</td>
				<td>${user.userNum }</td>
				<td>${user.username }</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>${xd[user.teacher.teachSemester] }</td>
				<td>${zc[user.teacher.title] }</td>
			</tr>
		</c:forEach>
	</c:if>
	</table>
	<input type="hidden" id="items" name="items" value="id=${model.id }"/>
	<div class="page">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center">
	          <input type="button" class="but_cz"  value="返 回" onclick="history.back(-1)"  />
          </td>
        </tr>
      </table>
    </div>
  <script type="text/javascript">
  	function toBj(action){
  		var itemId = $("#items").val();
  		location.href = action + "?" + itemId+"&type=${type}";
  	}
  </script>
</div>
</div>
</div>
</div>
</body>
</html>