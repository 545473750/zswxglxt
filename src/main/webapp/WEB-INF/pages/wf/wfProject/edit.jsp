<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>新增流程</title>
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/scripts/validform/checkform.css" rel="stylesheet" type="text/css" />
		<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/validform/Validform_zg_v5.1.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function(){
				$("#dataform").Validform();
			});
		</script>
</head>
<body>
<div class="main">
	<div class="maintit">
		<h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" />修改流程</h2>
		<h3><a href="${ctx}/wf/WfProject!list.do">返回 &gt;&gt;</a></h3>
	</div>
	<div class="centent" style="padding-top: 10px;">
	<form id="dataform" action="${ctx}/wf/WfProject!saveEdit.do" method="post">
		<span>
		<input type="hidden" name="id" value="${model.id}"/>
		<c:forEach var="obj" items="${params }" varStatus="vs">
			<input type="hidden" name="${obj.key}" value="${obj.value}" />
		</c:forEach> 
		</span>
		<%@ include file="form_include.jsp"%>
		<div class="page">
			<input type="submit" value="提 交" class="but_shop" />
			<input type="button" value="取 消" class="but_shop" onclick="history.back(-1)" />
		</div>
	</form>
	</div>
</div>
</body>
</html>
