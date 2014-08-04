<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ page import="com.opendata.organiz.model.*" %>
<%@ taglib uri="/WEB-INF/tags/attachment.tld" prefix="attach" %>

<rapid:override name="head">
	<title><%=User.TABLE_ALIAS%>编辑</title>
	
	<!-- my97日历控件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		
	$(function() {
		$("#dialog")
				.dialog(
						{
							title : '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 组织机构',
							autoOpen : false,
							width : 400,
							resizable : false,
							modal : true,
							autoResize : true,
							overlay : {
								opacity : 0.5,
								background : "black"
							}
						});
	});
		
	
		function frmSubmit(){
			
			var p0 = document.getElementById("password").value;
			var p1 = document.getElementById("password1").value;
			
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
<form id="editFrm"  action="<c:url value="/organiz/User!editPerson.do"/>" method="post">

<!-- 无外边框内容区开始 -->
<div class="wbkbox">
  <div class="main-wbktab">
    <ul>
      <li><a href="#"><img src="<c:url value="images/main_ico14.gif"/>" width="16" height="16" border="0" align="absmiddle" /> 个人信息</a></li>
    </ul>
  </div>
  <!-- TAB标签结束 -->
  <div class="main-wbkcon">
    <!-- 黄条提示框结束 -->
    <div class="wbk-tit">
      <span></span><img src="<c:url value="images/main_ico15.gif"/>" width="16" height="16" align="absmiddle" /> 
      <strong class="blue01">个人信息修改</strong>
    </div>
    <div class="wbk-con">
		<table class="table02">
			<tr>
				<td style="text-align: right;">姓名:</td>
				<td>${model.username}</td>
			</tr>
			<s:textfield label="%{@com.opendata.organiz.model.User@ALIAS_PHONE}" cssStyle="width:155px;" key="phone" value="%{model.phone}" cssClass="" required="false" />
			<!-- 电子邮箱 -->
			<s:textfield key="mail" value="%{model.mail}" cssStyle="width:155px;" label="%{@com.opendata.organiz.model.User@ALIAS_MAIL}" required="false"></s:textfield>
			<!-- QQ -->
			<s:textfield key="qq" value="%{model.qq}" cssStyle="width:155px;" label="%{@com.opendata.organiz.model.User@ALIAS_QQ}" required="false"></s:textfield>
			<!-- MSN -->
			<s:textfield key="msn" value="%{model.msn}" cssStyle="width:155px;" label="%{@com.opendata.organiz.model.User@ALIAS_MSN}" required="false"></s:textfield>
			<!-- MSN -->
			<s:textfield key="wblog" value="%{model.wblog}" cssStyle="width:155px;" label="%{@com.opendata.organiz.model.User@ALIAS_WBLOG}" required="false"></s:textfield>
		<tr>
		
		</tr>
		<!-- 备注 -->
		<tr>
				<td style="text-align: right;">登录名:</td>
				<td>${model.loginname}</td>
		</tr>
		<tr>
		<td align="right" >
		</td><td><div clsss="formControls">
		<input id="submitButton" name="submitButton" type="submit" value="提交"/>
		<!--  
		<script type="text/javascript">
			(function() {
				var loginname = document.getElementById("loginname").value;
				if(loginname == 'admin') {
					document.getElementById("submitButton").disabled = "disabled";
				}
			})();
		</script>
		-->
		</div></td>
		</tr>
		</table>
		
	</div>
  </div>
</div>
</form>

<div id="dialog" style="overflow: hidden;">
<iframe id="addSit" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" width="400" height="344"></iframe>
</div>

</body>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>