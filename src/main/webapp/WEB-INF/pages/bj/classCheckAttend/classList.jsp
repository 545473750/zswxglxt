<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>考勤管理</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
</head>
<body>
<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">首 页</a> &gt; <a href="#">考勤管理</a> &gt; 班级列表</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" onclick="goBack()" />
          </p>
      </div>
      <div class="tablelist">
    	 <div class="title">班级列表</div>
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassTimeTable!classList.do">
          	<c:if test="${state == 1}">
          		<input type="hidden" name="state" value="${state }"/>
          	</c:if>
       		<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="32" >班级名称：</td>		
							<td>
								<input value="${query.classTermBj.name}" id="name" name="query.classTermBj.name" maxlength="100"  class=""/>
							</td>
							<td>
								<input type="submit" name="button2" id="button2" value="查 询" />
							</td>
						</tr>
        	</table>
        </form>
        <div class="clear"></div>
      </div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassTermBj!list.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
	  	<th width="50">序号</th>
	  	<th>课程名称</th>
	  	<th>班级名称</th>
	  	<th>期数</th>
	  	<th>所在培训班</th>
	  	<th>班主任</th>
	  	<th>开始时间</th>
	  	<th>结束时间</th>
	  	<th>操作</th>
	</tr>
	<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
				<c:if test="${fn:length(obj.classCourse.courseName)>10}">
					${fn:substring(obj.classCourse.courseName,0,10) }...
				</c:if>
				<c:if test="${fn:length(obj.classCourse.courseName)<=10}">
					${obj.classCourse.courseName }
				</c:if>
		</td>
		<td>
					${obj.classTermBj.name}
		</td>
		<td>
					第${obj.classTermBj.classTerm.seq}期
		</td>
		<td>
					${obj.classTermBj.classTerm.classBigclass.name}
		</td>
		<td>
					${obj.classTermBj.classTeacher1}
		</td>
		<td>
					<fmt:formatDate value="${obj.classTermBj.classTerm.startTime}" pattern="yyyy-MM-dd"/> 
		</td>
		<td>
					<fmt:formatDate value="${obj.classTermBj.classTerm.endTime}" pattern="yyyy-MM-dd"/>
		</td>
		<td>
					<!-- 班主任/任课教师进入 -->
					<c:if test="${state!=1}">
						<a href="${ctx}/bj/ClassTimeTable!kaoqin.do?query.classBjId=${obj.classTermBj.id}&query.classCourseId=${obj.classCourse.id}">进入</a>
					</c:if>
					<!-- 管理员进入 -->
					<c:if test="${state==1}">
						<a href="${ctx}/bj/ClassTimeTable!userJjf.do?query.classBjId=${obj.classTermBj.id}&query.classCourseId=${obj.classCourse.id}">进入2</a>
					</c:if>
		</td>
	</tr>
</c:forEach>
</table>
</form>
</div>
    <div class="page">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	 <tr>
           <td width="70%">
            <div class="pages">
				<jsp:include flush="true" page="/commons/pagebar.jsp">
					<jsp:param name="target" value="/bj/ClassTermBj!list.do" />
		        </jsp:include>
        	</div>
           </td>
        </tr>
       </table>
   </div>
  </div>
  </div>
</div>
<script type="text/javascript">
	function goBack(){
		location.href="${ctx}/bj/ClassTerm!list.do?query.bigclassId=${query.bigclassId}";
	}
</script>
</body>
</html>
