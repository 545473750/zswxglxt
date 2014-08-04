<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ page import="com.opendata.organiz.model.*" %>
<%@ taglib uri="/WEB-INF/tags/attachment.tld" prefix="attach" %>

<rapid:override name="head">
	<title><%=User.TABLE_ALIAS%>编辑</title>
	
	<!-- my97日历控件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		function frmSubmit(){
			var p0 = document.getElementById("password").value;
			var p1 = document.getElementById("password1").value;
			var po = document.getElementById("password_old").value;
			if(po == "" ){
				alert("请输入原始密码.");
				return;
			}
			if(p0.length<6){alert("密码长度6-12位.");return;}
			if(p0 == "" || p1 == ""){
				alert("密码与确认密码不能为空.");
				return;
			}
			if(p0 != p1){
				alert("两次密码输入不一致.");
				return;
			}
			document.getElementById("editFrm").submit();
		}
	</script>
</rapid:override>

<rapid:override name="content">
<body class="mainbody">
<form id="editFrm" action="<c:url value="/organiz/User!editPassword.do"/>" method="post">

<!-- 无外边框内容区开始 -->
<div class="wbkbox">
  <div class="main-wbktab">
    <ul>
      <li><a href="#"><img src="<c:url value="images/main_ico14.gif"/>" width="16" height="16" border="0" align="absmiddle" />修改登录密码</a></li>
    </ul>
  </div>
  <!-- TAB标签结束 -->
  <div class="main-wbkcon">
    <!-- 黄条提示框结束 -->
    <div class="wbk-tit">
      <span></span><img src="<c:url value="images/main_ico15.gif"/>" width="16" height="16" align="absmiddle" /> 
      <strong class="blue01">修改登录密码</strong>
    </div>
    <div class="wbk-con">
		<table class="table02">
			<!--
				${model.password}--
			-->
			<tr>
				<td align="right">请输入原登录密码：</td>
				<td><input type="password" id="password_old" name="password_old" value="" class="required "/></td>
			</tr>
			<tr>
				<td align="right">请输入新的登录密码：</td>
				<td><input type="password" id="password" name="password" value="" class="required "/></td>
			</tr>
			<tr>
				<td align="right">请再次输入新的登录密码：</td>
				<td><input type="password" id="password1" name="password1" value="" class="required "/></td>
			</tr>
			<tr>
				<td></td>
				<td><div clsss="formControls">
					<input id="submitButton" name="submitButton" type="button" onclick="frmSubmit();" value="提交"/>
			</div></td>
			</tr>
		</table>
		
  </div>
</div>
</form>
</body>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>