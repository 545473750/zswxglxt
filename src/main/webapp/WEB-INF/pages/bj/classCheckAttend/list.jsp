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
	<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>
<body>
<div class="right">
  <div class="llistbox">
      <div class="tablelist">
    	 <div class="title">考勤列表</div>
      <!--<div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx }/bj/ClassCheckAttend!list.do">
          	<input type="hidden" name="query.classId" value="${query.classId }"/>
       		<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="32" >出勤时间：</td>		
					<td>
						<input readonly="true" size="15" value="<fmt:formatDate value="${query.startTime}" pattern="yyyy-MM-dd"/>" id="startTime" name="query.startTime" maxlength="100"  class="" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\')}',isShowClear:true,readOnly:true})" />
						至
						<input readonly="true" size="15" value="<fmt:formatDate value="${query.endTime}" pattern="yyyy-MM-dd"/>" id="endTime" name="query.endTime" maxlength="100"  class="" onclick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\')}',isShowClear:true,readOnly:true})" />
					</td>
					<td>
						<input type="submit" name="button2" id="button2" value="查 询" />
					</td>
				</tr>
        	</table>
        </form>
        <div class="clear"></div>
      </div>
--><div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassCheckAttend!list.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
	  	<th width="50">序号</th>
	  	<th >日期</th>
	  	<th >时间</th>
	  	<th >总课时</th>
	  	<th >出勤课时</th>
	</tr>
	<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
					${obj.classTimeTable.occurTime}
		</td>
		<td>
					${obj.classTimeTable.startHour}-${obj.classTimeTable.endHour}
		</td>
		<td>
					${obj.countTime }
		</td>
		<td>
					${obj.timeCount }
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
					<jsp:param name="target" value="/bj/ClassCheckAttend!list.do" />
		        </jsp:include>
        	</div>
           </td>
        </tr>
       </table>
   </div>
  </div>
  </div>
</div>
</body>
</html>
