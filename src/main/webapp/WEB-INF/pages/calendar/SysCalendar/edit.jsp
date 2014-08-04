<%@page import="com.opendata.calendar.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=SysCalendar.TABLE_ALIAS%>编辑</title>
</rapid:override>

<rapid:override name="content">
<body class="mainbody" style="">
<form action="<c:url value="/calendar/SysCalendar!update.do"/>" method="post">
<div style="height:8px;"></div>
<!-- 无外边框内容区开始 -->
<div class="wbkbox">
  
<!-- TAB标签结束 -->
  <div class="main-wbkcon" >
    <!-- 黄条提示框结束 -->
    <div class="wbk-tit">
      <span></span><img src="<c:url value="images/main_ico15.gif"/>" width="16" height="16" align="absmiddle" /> <strong class="blue01"><%=SysCalendar.TABLE_ALIAS%></strong></div>
    <div class="wbk-con">
	
		
		
		<table class="table02">
		<%@ include file="form_include.jsp" %>
		</table>
		<div class="formControls">
		<input id="submitButton" name="submitButton" type="submit" value="提交" />
		<input type="button" value="返回" onclick="window.location='${ctx}/calendar/SysCalendar!showMonthCanendars.do'"/>
		</div>
	
	</div>
  </div>
</div>
</form>
</body>
	<script>
		new Validation(document.forms[0],{onSubmit:true,onFormValidate : function(result,form) {
			var finalResult = result;
			//在这里添加自定义验证
			return disableSubmit(finalResult,'submitButton');
		}});
	</script>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>