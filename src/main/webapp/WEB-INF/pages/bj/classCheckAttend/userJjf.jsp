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
<div class="right">
  <div class="llistbox">
  	  <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">首 页</a> &gt; <a href="#">考勤管理</a> &gt; 学员考勤列表</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" onclick="history.go(-1)" />
          </p>
      </div>
    <div class="tablelist">
    	 <div class="title">学员考勤列表</div>
    <div class="centent">
      <div class="search">
        <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassTimeTable!userJjf.do">
        	<input type="hidden" name="query.classBjId" value="${query.classBjId}"/>
        	<input type="hidden" name="query.classCourseId" value="${query.classCourseId}"/>
        	<label>
        		姓名：
        		<input value="${query.username}" id="username" name="query.username" maxlength="100"  class=""/> 
        	</label>  
        	<label>
        		<input type="submit" value="查询"  name="button2" id="button2" />
        	</label>  
        </form>
        <div class="clear"></div>
      </div>
<div class="page">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>
        <c:if test="${isHidden==1}">
	       <input type="button" class="but_cz" onclick="exportExcel(document.listForm)" value="导出"/>
	       </c:if>
        </td>
      </tr>
    </table>
</div>
<div class="table01">
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassTimeTable!exportExcel.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<input type="hidden" name="query.classBjId" value="${query.classBjId}"/>
<input type="hidden" name="query.classCourseId" value="${query.classCourseId}"/>
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="text-align: center;">
	<tr>
	  	<th width="50">序号</th>
	  	<th>继教号</th>
	  	<th >名称</th>
	  	<th>课程总学时</th>
	  	<th>出勤总学时</th>
	  	<th>出勤率</th>
	</tr>
<c:forEach var="obj" items="${checkAttends}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" onMouseOver=this.className="highlight" onMouseOut=this.className="${vs.count % 2 == 0 ? 'jg' : ''}">
		<td>
			${page.thisPageFirstElementNumber + vs.index+1}
		</td>
		<td>
			${obj.classBjUser.user.userNum }
		</td>
		<td>
			${obj.classBjUser.user.username}
		</td>
		<td>
			${countTime }
		</td>
		<td>
			${obj.countTime }
		</td>
		<td>
			${obj.countTime/countTime }%
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
	window.parent.closeDialog();
}
function exportExcel(form){
	form.submit();
}
	//$("#shop").smartFloat();  
</script>
</div>
</div>
</div>
</body>
</html>
