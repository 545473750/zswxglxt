<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>班级课表管理</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
</head>
<body>
<div class="right" style="width:680px;height: 380px;background:#FFF;">
  <div class="llistbox">
      
      <div class="page" style="margin-top:10px;">
    	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td>
		        <input type="button" class="but_cz"  onclick="add('${ctx}/bj/ClassTimeTable!add.do',document.listForm);" value="添加" />
	          <input type="button" class="but_cz"  onclick="edit('${ctx}/bj/ClassTimeTable!edit.do','items',document.listForm);" value="修改" />
	          <input type="button" class="but_cz"  onclick="batchDelete('${ctx}/bj/ClassTimeTable!remove.do','items',document.listForm);" value="删除" />
	        </td>
	      </tr>
	    </table>
        <div class="clear"></div>
      </div>

<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassTimeTable!list.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
	    <th width="30">
	  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
	    </th>
	  	<th width="50">序号</th>
	  	<th >课程名称</th>
	  	<th >上课开始时间</th>
	  	<th >上课结束时间</th>
	  	<th >授课方式</th>
	  	<th >授课场地</th>
	  	<!-- 
	  	<th >本院教师</th>
	  	<th >外请教师</th>
	  	 -->
	</tr>
	<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td>
			<input type="checkbox" name="items" value="id=${obj.id}&">
		</td>
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
					<a href="${ctx}/bj/ClassTimeTable!view.do?id=${obj.id}">
						<c:if test="${fn:length(obj.classCourse.courseName)>10 }">
							${fn:substring(obj.classCourse.courseName,0,10) }...
						</c:if>
						<c:if test="${fn:length(obj.classCourse.courseName)<=10 }">
							${obj.classCourse.courseName}
						</c:if>
						
					</a>
		</td>
		<td>
					${obj.startTime}
		</td>
		<td>
					${obj.endTime}
		</td>
		<td>
			${teachWayMap[obj.teachWay]}
				<!-- 
					${obj.classCourse.localTeacherName}
					 -->
		</td>
		
		<td>
			
					${obj.place.name}
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
					<jsp:param name="target" value="/bj/ClassTimeTable!list.do" />
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
