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
          <p class="dqwz">当前位置：<a href="#">首 页</a> &gt; <a href="#">我的考勤</a> &gt; 班级列表</p>
      </div>
      <div class="tablelist">
    	 <div class="title">班级列表</div>
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassBjUser!classList.do">
       		<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="32" >培训班名称：</td>		
					<td>
						<input value="${query.bigClassName}" id="bigClassName" name="query.bigClassName" maxlength="100"  class=""/>
					</td>
					<td height="32" >期数名称：</td>		
					<td>
						<input value="${query.termName}" id="termName" name="query.termName" maxlength="100"  class=""/>
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
				<c:if test="${fn:length(obj.classTermBj.name)>10}">
					<span title="${obj.classTermBj.name }">${fn:substring(obj.classTermBj.name,0,10) }...</span>
				</c:if>
				<c:if test="${fn:length(obj.classTermBj.name)<=10}">
					${obj.classTermBj.name}
				</c:if>
		</td>
		<td>
				<c:if test="${fn:length(obj.classTermBj.classTerm.name)>10}">
					<span title="${obj.classTermBj.classTerm.name }">${fn:substring(obj.classTermBj.classTerm.name,0,10) }...</span>
				</c:if>
				<c:if test="${fn:length(obj.classTermBj.classTerm.name)<=10}">
					${obj.classTermBj.classTerm.name}
				</c:if>
		</td>
		<td>
				<c:if test="${fn:length(obj.classTermBj.classTerm.classBigclass.name)>10}">
					<span title="${obj.classTermBj.classTerm.classBigclass.name }">${fn:substring(obj.classTermBj.classTerm.classBigclass.name,0,10) }...</span>
				</c:if>
				<c:if test="${fn:length(obj.classTermBj.classTerm.classBigclass.name)<=10}">
					${obj.classTermBj.classTerm.classBigclass.name}
				</c:if>
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
					<a href="${ctx }/bj/ClassCheckAttend!myCheckAttendList.do?query.classId=${obj.classTermBj.id}">查看</a>
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
					<jsp:param name="target" value="/bj/ClassBjUser!classList.do" />
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
