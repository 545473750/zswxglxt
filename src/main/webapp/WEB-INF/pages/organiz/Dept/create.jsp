<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ page import="com.opendata.organiz.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
	<title>组织机构</title>
	<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/scripts/validform/checkform.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/validform/Validform_zg_v5.1.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
	
	<script type="text/javascript">
	//部门下可以建立部门和业务组，业务组下只能建立业务组
	function checkType() {
		//alert("部门下可以建立部门和业务组，业务组下只能建立业务组");
		var type = document.getElementById('type').value;
		var org_type = '${org_type}';
		//alert(org_type == "");
		if(org_type == "type_group") {
			if(type != "type_group") {
				alert("业务组下只能创建业务组！");
				document.getElementById("type").selectedIndex = 0;
			}
		}
	}
	
	function gobacklist(pid) {
		window.location = "${ctx}/organiz/Dept!toRightPage.do?id=" + pid;
	}
	
	</script>
	<script type="text/javascript">
	$(function(){
		$("#dataform").Validform();
	});
	</script>
	</head>
	
	<body>
		<div class="main">
			<form id="dataform" name="dataform" action="<c:url value="/organiz/Dept!save.do"/>" method="post">
				<div class="maintit">
					<h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" />组织机构</h2>
					<h3><a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a></h3>
				</div>
				
				<div class="centent">
					<span>
					<c:forEach var="obj" items="${params }"	varStatus="vs">
						<input type="hidden" name="${obj.key}" value="${obj.value}" />
					</c:forEach>
					</span>
					<%@ include file="form_include.jsp"%>
					
					<div class="page">
						<input type="submit" value="提 交" class="but_shop" />
						<input type="button" value="取 消" class="but_shop" onclick="history.back(-1)" />
					</div>
					
				</div>
				
				
			</form>
		</div>
	</body>
</html>