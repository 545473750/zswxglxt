<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Partition.TABLE_ALIAS%>编辑</title>
</rapid:override>

<rapid:override name="content">
<body class="mainbody">
<form action="<c:url value="/sys/Partition!update.do"/>" method="post">
<!-- 无外边框内容区开始 -->
<div class="wbkbox">
  <div class="main-wbktab">
    <ul>
      <li><<span><img src="<c:url value="images/main_ico14.gif"/>" width="16" height="16" border="0" align="absmiddle" /> 编辑<%=Partition.TABLE_ALIAS%></span></li>
    </ul>
  </div>
<!-- TAB标签结束 -->
  <div class="main-wbkcon">
    <div id="main-tsk" class="main-tsk">
      <div class="main-tskcol"><img src="<c:url value="images/cueDIV_clo.gif"/>" width="15" height="15" onclick="javascript:document.getElementById('main-tsk').style.display='none';"/></div>
      <div class="main-tsktex"><strong>友情提示：</strong>本页面信息采集要存入本系统。注意仔细填写各项信息，按要求进行填写，确保信息的真实性。谢谢合作！</div>
    </div>
    <!-- 黄条提示框结束 -->
    <div class="wbk-tit">
      <span></span><img src="<c:url value="images/main_ico15.gif"/>" width="16" height="16" align="absmiddle" /> <strong class="blue01"><%=Partition.TABLE_ALIAS%></strong></div>
    <div class="wbk-con">
	
		
		
		<table class="table02">
		<%@ include file="form_include.jsp" %>
		</table>
		<div clsss="formControls">
		<input id="submitButton" name="submitButton" type="submit" value="提交" />
		<input type="button" value="返回列表" onclick="window.location='${ctx}/sys/Partition!list.do'"/>
		<input type="button" value="后退" onclick="history.back();"/>
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