<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>招生管理</title>
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
          <p class="dqwz">当前位置：<a href="#">教学教务</a> &gt; <a href="#">培训班报名</a> &gt; 班级列表</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回"  onclick="back()"/>
          </p>
      </div>
      <div class="tablelist">
    	 <div class="title">
    	 	 <c:if test="${type == 2}">个人报名</c:if>
    	 	 <c:if test="${type == 3}">集体报名</c:if>
    	 </div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassRecruit!list.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<input type="hidden" name="recruitId" value="${recruitId }" />
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="text-align: center;">
	<c:forEach items="${terms}" var="item" varStatus="i">
		<tr>
			<th colspan="6">${recruitName } -- ${item.classBigclass.name } -- ${item.name }</th>
			<input type="hidden" name="count"/>
		</tr>
		<tr class="jg">
			<td></td>
			<td width="10%"><h3>序号</h3></td>
			<td><h4>班级名称</h4></td>
			<td width="15%"><h4>班主任</h4></td>
			<td><h4>班辅导老师</h4></td>
			<td><h4>任课教师</h4></td>
		</tr>
		<c:forEach items="${item.termBjs}" var="bj" varStatus="vs">
			<tr class="${vs.count % 2 == 0 ? 'jg' :'' }">
				<td><input type="radio" name="bjId${i.index }" value="${bj.id }"/></td>
				<td>${vs.index+1 }</td>
				<td>${bj.name }</td>
				<td>${bj.classTeacher1 }</td>
				<td>${bj.classTeacher0 }</td>
				<td>${bj.classTeacher2 }</td>
			</tr>
		</c:forEach>
	</c:forEach>
	
</table>
</form>
</div>
    <div class="page">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	<tr>
		<td align="center">
			<!-- 个人报名 -->
			<c:if test="${type == 2}">
				<input type="button" value="提交" class="but_cz" onclick="saveBm('${ctx}/bj/ClassBjUser!saveBm.do')"/>
			</c:if>
			<!-- 集体报名 -->
			<c:if test="${type == 3}">
				<input type="button" value="提交" class="but_cz" onclick="saveBm('${ctx}/bj/ClassBjUser!saveBmlist.do')"/>
			</c:if>
			<input type="button" value="取消" onclick="back()" class="but_cz"/>
		</td>
	</tr>
       </table>
   </div>
  </div>
  </div>
</div>
<script type="text/javascript">
	function saveBm(action){
		var length = $("input[name=count]").length;
		var bjIds = null;
		for(var i = 0; i<length;i++){
			if(bjIds == null){
				bjIds = $("input[name=bjId"+i+"]:checked").val();
			}else{
				bjIds += ","+$("input[name=bjId"+i+"]:checked").val();
			}
		}
		if(bjIds == null || bjIds == ''){
			alert("请选择班级");
			return;
		}
		$("#listForm").attr("action", action + "?bjIds=" + bjIds).submit();
	}
	
	function back(){
		location.href="${ctx}/bj/ClassRecruit!applyList.do";
	}

</script>
</body>
</html>
