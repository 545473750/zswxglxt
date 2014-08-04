<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>用户列表</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
  </head>
<body>

  <div class="llistbox">
    <div class="tablelist">
    	 <div class="title">用户列表</div>
    <div class="centent">
      <div class="search">
        <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassTimeTable!stuList.do">
			<input type="hidden" name="query.occurTime" value="${query.occurTime }"/>
			<input type="hidden" name="query.classId" value="${query.classId }"/>
			<input type="hidden" name="id" value="${id }"/>
        	<label>
        		名称：
        		<input value="${username}" id="username" name="username" maxlength="100"  class=""/> 
        	</label>  
        	<label>
        		<input type="submit" value="查询"  id="button2" name="button2"/>
        	</label>  
        </form>
        <div class="clear"></div>
      </div>

<div class="table01">
<form id="listForm" name="listForm" method="post" action="${ctx}/jjf/JjfItem!saveOrUpdate.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<!-- 任务type -->
<input type="hidden" name="refType" value="3"/>
<input type="hidden" name="bjId" value="${ query.classId}"/>
<input type="hidden" name="query.classCourseId" value="${query.classCourseId }"/><!-- 未使用 -->
<input type="hidden" name="kebiaoId" value="${id }"/>
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="text-align: center;">
	<tr>
	  	<th width="50">序号</th>
	  	<th>继教号</th>
	  	<th >名称</th>
	  	<th>课程总学时</th>
	  	<th>出勤总学时</th>
	</tr>
<c:forEach var="obj" items="${bjUser}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" onMouseOver=this.className="highlight" onMouseOut=this.className="${vs.count % 2 == 0 ? 'jg' : ''}">
		<input type="hidden" name="jjfItems[${vs.index }].refId" value="${timeTable.id }"/>
		<input type="hidden" name="jjfItems[${vs.index }].refName" value="${timeTable.occurTime } ${timeTable.startHour}-${timeTable.endHour}考勤"/>
		<td>
			${page.thisPageFirstElementNumber + vs.index+1}
		</td>
		<td>
			${obj.user.userNum }
			<input type="hidden" name="jjfItems[${vs.index }].userId" value="${obj.user.id }" />
			<input type="hidden" name="jjfItems[${vs.index }].bjUserId" value="${obj.id }" />
		</td>
		<td>
			${obj.user.username}
			<input type="hidden" name="jjfItems[${vs.index }].userName" value="${obj.user.username }"/>
			<input type="hidden" name="jjfItems[${vs.index }].userNum" value="${obj.user.userNum }"/>
		</td>
		<td>
			${hour }
		</td>
		<td>
			<select name="jjfItems[${vs.index }].score" nullmsg="请选择" datatype="*" style="width: 50px;">
				<c:forEach var="vs" begin="0" end="${hour}">
					<c:if test="${obj.timeCount != -1}">
						<option <c:if test="${obj.timeCount == vs }">selected="selected"</c:if> value="${vs }">${vs }</option>
					</c:if>
					<c:if test="${obj.timeCount == -1}">
						<option <c:if test="${hour == vs }">selected="selected"</c:if>  value="${vs }">${vs }</option>
					</c:if>
				</c:forEach>
			</select>
		</td>
	</tr>
	
</c:forEach>
	<tr>
		<td colspan="5" align="center">
			<input type="button" class="but_cz"  onclick="save(document.listForm);" value="保存" />
			<input type="button" class="but_cz"	 onclick="cancel();" value="取消"/>
		</td>
	</tr>
</table>
</form>
</div>
   <div class="page">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	 <tr>
           <td width="70%">
            <div class="pages">
				<jsp:include flush="true" page="/commons/pagebar.jsp">
					<jsp:param name="target" value="/bj/ClassBjUser!userList.do" />
		        </jsp:include>
		    </div>
		   </td>
		  </tr>
	</table>
   </div>
  </div>
<script type="text/javascript">
function save(form){
	form.submit();
	//window.parent.closeDialog();
}
function cancel(){
	window.parent.closeDialog();
}
	//$("#shop").smartFloat();  
</script>
</div>
</body>
</html>
