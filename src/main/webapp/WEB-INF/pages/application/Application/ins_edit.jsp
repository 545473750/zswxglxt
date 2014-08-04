<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@page import="com.opendata.application.model.*" %>
<rapid:override name="head">
	<title><%=Application.TABLE_ALIAS%>新增</title>
</rapid:override>

<rapid:override name="content">
<body class="mainbody">
<form action="<c:url value="/application/Application!intUpdate.do"/>" method="post">
<!-- 无外边框内容区开始 -->
<div class="wbkbox">
  <div class="main-wbktab">
    <ul>
      <li><<span><img src="<c:url value="images/main_ico14.gif"/>" width="16" height="16" border="0" align="absmiddle" /> 新增<%=Application.TABLE_ALIAS%></span></li>
    </ul>
  </div>
<!-- TAB标签结束 -->
  <div class="main-wbkcon">
    
    <div class="wbk-tit">
      <span></span><img src="<c:url value="images/main_ico15.gif"/>" width="16" height="16" align="absmiddle" /> <strong class="blue01"><%=Application.TABLE_ALIAS%></strong>
    </div>
    <div class="wbk-con">
	
		<table class="table02">
			
	<tr>
    <td class="tdLabel"><label for="appCode" class="label">应用编号<span class="required">*</span>:</label></td>
    <td><input type="hidden" name="appCode" value="${model.code}" id="appCode" class="required " style="width:155px;"/>${model.code}</td>
   </tr>
   
   <tr>
    <td class="tdLabel"><label for="ftpDic" class="label">应用FTP目录<span class="required">*</span>:</label></td>
    <td><input type="text" name="ftpDic" value="" id="ftpDic" class="required " style="width:155px;"/></td>
   </tr>
   
   <tr>
    <td class="tdLabel"><label for="ftpFile" class="label">应用FTP文件<span class="required">*</span>:</label></td>
    <td><input type="text" name="ftpFile" value="" id="ftpFile" class="required " style="width:155px;"/></td>
   </tr>

		</table>
		<div clsss="formControls">
			<input id="submitButton" name="submitButton" type="submit" value="提交" />
			<input type="button" value="返回列表" onclick="window.location='${ctx}/application/Application!list.do'"/>
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