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
          <p class="dqwz">当前位置：<a href="#">教学教务</a> &gt; <a href="#">培训业务</a> &gt; 班级查询</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" onclick="goBack()" />
          </p>
      </div>
      <div class="tablelist">
    	 <div class="title">班级查询</div>
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx }/bj/ClassTermBj!tjList.do">
       		<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="32" >时间范围：</td>		
					<td>
						<input readonly="true" value="<fmt:formatDate value="${start}" pattern="yyyy-MM"/>" id="start" name="start" maxlength="100"  class="" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'end\')}',isShowClear:true,readOnly:true,dateFmt:'yyyy-MM'})" />
						至
						<input readonly="true" value="<fmt:formatDate value="${end}" pattern="yyyy-MM"/>" id="end" name="end" maxlength="100"  class="" onclick="WdatePicker({minDate:'#F{$dp.$D(\'start\')}',isShowClear:true,readOnly:true,dateFmt:'yyyy-MM'})" />
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
<p style="color: red;text-align: left;" >点击课程名称，查看课程设置的班级及授课情况</p>
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassTermBj!list.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="text-align: center;">
	  	<th>课程名称</th>
	  	<th>班成员人数</th>
	  	<th>通过人数</th>
	  	<th>在学习人数</th>
	  	<th>日期</th>
	  	<th>开课单位</th>
	</tr>
	<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td>
				<c:if test="${fn:length(obj.strName )>10}">
					<a href="#" onclick="getChangeTeacher('${ctx}/bj/ClassTermBj!showBj.do?classId=${obj.id}')" title="${obj.strName }">
						${fn:substring(obj.strName,0,10) }...
					</a>
				</c:if>
				<c:if test="${fn:length(obj.strName)<=10}">
					<a href="#" onclick="getChangeTeacher('${ctx}/bj/ClassTermBj!showBj.do?classId=${obj.id}')">
						${obj.strName}
					</a>
				</c:if>
		</td>
		<td>
					${fn:length(obj.classBjUsers)}
		</td>
		<td>
					${obj.passNumber}
		</td>
		<td>
					${obj.studyNumber }
		</td>
		<td>
				<c:if test="${obj.classTerm.startTime!=null}">
					<fmt:formatDate value="${obj.classTerm.startTime}" pattern="yyyy-MM-dd"/>
				</c:if>
				<c:if test="${obj.classTerm.startTime==null}">
					<fmt:formatDate value="${obj.detail.startTime}" pattern="yyyy-MM-dd"/>
				</c:if>
					-
				<c:if test="${obj.classTerm.endTime!=null}">
					<fmt:formatDate value="${obj.classTerm.endTime}" pattern="yyyy-MM-dd"/>
				</c:if>
				<c:if test="${obj.classTerm.endTime==null}">
					<fmt:formatDate value="${obj.detail.endTime}" pattern="yyyy-MM-dd"/>
				</c:if>
		</td>
		<td>
				<c:if test="${fn:length(obj.orgName)>10}">
					<span title="${obj.orgName }">${fn:substring(obj.orgName,0,10) }...</span>
				</c:if>
				<c:if test="${fn:length(obj.orgName)<=10}">${obj.orgName }</c:if>
					
		</td>
	</tr>
</c:forEach>
</table>
</form>
</div>
    <div class="page">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	 <tr>
           <td width="70%">-
            <div class="pages">
				<jsp:include flush="true" page="/commons/pagebar.jsp">
					<jsp:param name="target" value="/bj/ClassTermBj!tjList.do?start=${query.s}&end=${query.e }" />
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
	function getChangeTeacher(url){
		parent.dialog({
			title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 班级信息',
			autoOpen: true,
			width: 720,
			height: 450,
			modal: true,
			overlay: {
				opacity: 0.5,
				background: "black"
			},
			useIframe: true,
			url:url
		});
	}
	function goBack(){
		location.href="${ctx }/bj/ClassTermBj!totalClassBj.do";
	}
</script>
</body>
</html>
