<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>班级课程管理</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>
<body>
<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">首 页</a> &gt; <a href="#">继教分管理</a> &gt; 继教分审核</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" />
          </p>
      </div>
      <div class="tablelist">
    	 <div class="title">继教分审核列表</div>
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassTerm!termList.do">
       		<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="32" >课程名称：</td>		
							<td colspan="2">
								<input value="${query.name}" id="name" name="query.name" maxlength="100"  class=""/>
							</td>
						</tr>
						<tr>
							<td>课程起止时间：</td>
							<td>
								<input readonly="true" value="<fmt:formatDate value="${query.startTime}" pattern="yyyy-MM-dd"/>" id="startTime" name="query.startTime" maxlength="100"  class="" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\')}',isShowClear:true,readOnly:true})" />
								-
								<input readonly="true" value="<fmt:formatDate value="${query.endTime}" pattern="yyyy-MM-dd"/>" id="endTime" name="query.endTime" maxlength="100"  class="" onclick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\')}',isShowClear:true,readOnly:true})" />
							</td>
							<td>
								<input type="submit" name="button2" id="button2" value="查 询" />
							</td>
						</tr>
        	</table>
        </form>
        <div class="clear"></div>
      </div>
<div class="page">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>
        </td>
      </tr>
    </table>
</div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassCourse!list.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="text-align: center;">
	<tr>
	  	<th width="50">序号</th>
	  	<th >课程名称</th><!-- 即培训班名称加上期数 -->
	  	<th >培训班名称</th>
	  	<th >课程起止时间</th>
	  	<th >预修继教分</th>
	  	<th >操作</th>
	</tr>
	<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
					<a href="${ctx}/bj/ClassTerm!view.do?id=${obj.id}">${obj.name}</a>
		</td>
		<td>
					${obj.classBigclass.name}
		</td>
		<td>
					<fmt:formatDate value="${obj.startTime}" pattern="yyyy-MM-dd"/>
					 - 
					<fmt:formatDate value="${obj.endTime}" pattern="yyyy-MM-dd"/>
		</td>
		<td>
					${obj.classBigclass.prepareScore}
		</td>
		<td>
					<a href="${ctx }/jjf/JjfItem!audit.do?query.term=${obj.id}">审核</a>
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
					<jsp:param name="target" value="/bj/ClassCourse!list.do" />
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
