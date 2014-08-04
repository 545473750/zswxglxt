<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@page import="com.opendata.sys.model.*" %>

<rapid:override name="head">
	<title>移动</title>
	
</rapid:override>

<rapid:override name="content">
<body class="mainbody">
<form action="<c:url value="/sys/Log!handDelete.do"/>" method="post" >
<!-- 无外边框内容区开始 -->
<div class="wbkbox">
<!-- TAB标签结束 -->
  <div class="main-wbkcon" style="height: 185px;overflow:hidden;">
      <div style="height:40px;width:100%;">
		<td class="tdLabel">清除日志的时间段</td>		
			<td>
				<input value="" size="10" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="tsBegin" name="tsBegin" class="required " />
				<input value="" size="10" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="tsEnd" name="tsEnd"  class="required "/>
			</td>
        </div>
         <div align="left" style="padding-top: 5px;">
			<input id="submitButton" name="submitButton"  type="submit" value="提交" />
			<input type="button" value="关闭" onclick="window.parent.closeDialogNoRefresh();"/>
		</div>

	
  </div>
</div>
</form>
<script>
		
		new Validation(document.forms[0],{onSubmit:true,onFormValidate : function(result,form) {
			var finalResult = result;
			
			//在这里添加自定义验证
			
			return disableSubmit(finalResult,'submitButton');
		}});
	</script>
</body>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="/base.jsp" %>