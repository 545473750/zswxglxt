<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>新增应用功能入口</title>
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css" rel="stylesheet" />
		<link href="${ctx}/scripts/validform/checkform.css" rel="stylesheet" type="text/css" />
		
		<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/application.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
		<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
		<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
		<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
		
		
		<script src="${ctx}/scripts/validform/Validform_zg_v5.1.js" type="text/javascript"></script>
		
		<script type="text/javascript">
		
		
		$(function() {
			$("#dialog").dialog({
		        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> ',
		        autoOpen: false,
		        width: 500,
		        //height: 276,
		        resizable: false,
		        modal: true,
		        autoResize: true,
		        overlay: {
		               opacity: 0.5,
		               background: "black"
		           }
		    });
		});
		
		$(function(){
			$("#dataform").Validform();
		});
		</script>
	</head>
	<body>
			<div class="main">
				<div class="maintit">
					<h2>
						<img src="${ctx}/${pattern}/images/tabicon.gif" width="16"
							height="16" align="absmiddle" />
						新增应用功能入口
					</h2>
					<h3>
						<a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a>
					</h3>
				</div>
				
				
				<div class="centent" style="padding-top: 10px;">
				
					<form id="dataform" action="${ctx}/application/Permission!save.do"
					method="post">
						<span> <c:forEach var="obj" items="${params }"
							varStatus="vs">
							<input type="hidden" name="${obj.key}" value="${obj.value}" />
						</c:forEach> </span>
						
							<%@ include file="form_include.jsp"%>
						<div class="page">
							<input type="submit" value="提 交" class="but_shop" />
						<input type="button" value="取 消" class="but_shop"
							onclick="window.history.go(-1)" />
						</div>
					
					</form>
				</div>
			</div>
		<div id="dialog" style="overflow: hidden;">
			<iframe id="addSit" frameborder="0" marginwidth="0" marginheight="0"
				scrolling="auto" width="500" height="300"></iframe>
		</div>
	</body>
</html>