<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<rapid:override name="head">
</rapid:override>

<rapid:override name="content">
<body class="mainbody">
	<form method="post" action="${ctx }/sys/Dictvalue!saveRelationItem.do?id=${id }">
	<!-- 无外边框内容区开始 -->
	<div class="wbkbox">
	  <div class="main-wbkcon" style="height: 120px;">
			<table class="table02">
				<tr>
					<td class="tdLabel">字典项：</td>
					<td>
						<!-- 这里列出应用列表 -->
						<s:select theme="simple" name="relationItem" cssStyle="width:160px;" list="%{#request.dictItemList}" listKey="id" listValue="name" headerKey="" headerValue="--请选择--"/>
					</td>
				</tr>
			</table>
			<div>
				<br/>
				<input type="submit" value="提交" id="submitButton" name="submitButton"/>
				<input type="button" value="取消" onclick="window.parent.closeDialog();"/>
			</div>
	  </div>
	</div>
	</form>
</body>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>