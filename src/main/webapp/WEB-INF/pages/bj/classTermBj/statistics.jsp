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
	<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>
<body>
<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">教学教务</a> &gt; <a href="#">培训业务</a> &gt; 统计列表</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" onclick="goBack()" />
          </p>
      </div>
      <div class="tablelist">
    	 <div class="title">统计列表</div>
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx }/bj/ClassTermBj!totalClassBj.do">
          	<!--<input type="hidden" name="query.classTermId" value="${query.classTermId }"/>
          	<input type="hidden" name="query.bigclassId" value="${query.bigclassId }"/>
       		-->
       		<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="32" >时间范围：</td>		
							<td>
								<input readonly="true" value="<fmt:formatDate value="${startTime}" pattern="yyyy-MM"/>" id="startTime" name="startTime" maxlength="100"  class="" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\')}',isShowClear:true,readOnly:true,dateFmt:'yyyy-MM'})" />
								至
								<input readonly="true" value="<fmt:formatDate value="${endTime}" pattern="yyyy-MM"/>" id="endTime" name="endTime" maxlength="100"  class="" onclick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\')}',isShowClear:true,readOnly:true,dateFmt:'yyyy-MM'})" />
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
<form id="listForm" name="listForm" method="post" action="${ctx }/bj/ClassTermBj!tjList.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<input type="hidden" name="start" id="s"/>
<input type="hidden" name="end" id="e"/>
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="text-align: center;">
	<tr>
		<th colspan="2">数据统计</th>
	</tr>
	<tr>
		<td width="15%" align="right" height="36">班级数：</td>
		<td style="font-weight: bold;color:red;">${bjCount }&nbsp;&nbsp;</td>
	</tr>
	<tr class="jg">
		<td width="15%" align="right" height="36">学员人数：</td>
		<td><span style="font-weight: bold;color:red;">${bjUserCount }</span>&nbsp;人</td>
	</tr>
	<tr>
		<td width="15%" align="right" height="36">通过人数：</td>
		<td><span style="font-weight: bold;color:red;">${passCount }</span>&nbsp;人</td>
	</tr>
	<tr class="jg">
		<td width="15%" align="right" height="36">不通过人数：</td>
		<td><span style="font-weight: bold;color:red;">${nopassCount }</span>&nbsp;人</td>
	</tr>
	<tr class="jg">
		<td width="15%" align="right" height="36">正在学习：</td>
		<td><span style="font-weight: bold;color:red;">${studyCount }</span>&nbsp;人</td>
	</tr>
	<tr>
		<td></td>
		<td><a href="#" onclick="tj()">查看课程信息>>></a></td>
	</tr>
</table>
</form>
</div>
  </div>
  </div>
</div>
<script type="text/javascript">
	function tj(){
		var start = $("#startTime").val();
		var end = $("#endTime").val();
		$("#s").val(start);
		$("#e").val(end);
		$("#listForm").submit();
	}
</script>
</body>
</html>
