<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@page import="com.opendata.sys.model.*" %>

<rapid:override name="head">
	<title>移动</title>

</rapid:override>

<rapid:override name="content">
<body class="mainbody">
<form action="<c:url value="/sys/Resources!move.do"/>" method="post" >
<input type="hidden" name="id" value='<s:property value="id"/>'>
<!-- 无外边框内容区开始 -->
<div class="wbkbox">
<!-- TAB标签结束 -->
  <div class="main-wbkcon" style="height: 85px;overflow:hidden;">
      <div style="height:40px;width:100%;">
		<s:hidden id="queryParentId" name="queryParentId" />
		<s:select label="%{@com.opendata.sys.model.Resources@ALIAS_PARENT_ID}" cssStyle="width:155px;" name="parentId" list="%{#request.resources}" listKey="id" listValue="name"  headerKey=""  headerValue="--请选择--"/>
        </div>
         <div align="left" style="padding-top: 5px;">
			<input id="submitButton" name="submitButton"  type="submit" value="提交" />
			<input type="button" value="关闭" onclick="window.parent.closeDialogNoRefreshById('moveDialog');"/>
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