<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.opendata.application.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>新增应用</title>

		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet"
			type="text/css" />
		<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css"
			rel="stylesheet" />
		<script src="${ctx}/scripts/application.js"
			type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js"
			type="text/javascript"></script>
		<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js"
			type="text/javascript"></script>
		<script type="text/javascript"
			src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
		<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/stmartFloat/smartFloat.js"
			type="text/javascript"></script>
		<script type="text/javascript"
			src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
			<script type="text/javascript">
	$(function(){
		$("#dataform").Validform();
	});
</script>
		<style type="text/css">
.hid {
	display: none;
	margin: 0 auto;
	vertical-align: middle;
}
</style>
		<script>
	
	    function install(){
	        var localZipFile = document.getElementById("localZipFile").value;
	        if(localZipFile.substr(localZipFile.length-4,4)=='.zip'||localZipFile.substr(localZipFile.length-4,4)=='.ZIP'){
				document.getElementById("bod").className="";
				document.getElementById("maind").className="hid";
				document.getElementById("loading").className="show";
				return true;
			}else{
			  document.getElementById("submitButton").disabled=false;
			  alert('只能安装zip文件！');
			  return false;
			}
		//	document.queryForm.submit();
		
		}
		
		 
		
	</script>
	</head>
	<body>

		<form id="dataform" name="dataform" action="${ctx}/application/Application!localInstall.do"
			onsubmit="return install()" enctype="multipart/form-data"
			method="post">

			<!-- 无外边框内容区开始 -->
			<div id="loading" class="hid">
				<table width="100%" height="340px" style="border: 1px">
					<tr>
						<td align="center" valign="middle">
							<img src="<c:url value="images/load.gif"/>" />
							应用安装中，请稍后...
						</td>
					</tr>
				</table>

			</div>
			<div class="main">
				<div class="maintit">

					<h2>
						<img src="${ctx}/${pattern}/images/tabicon.gif" width="16" src="<c:url value="images/main_ico14.gif"/>"
							height="16" align="absmiddle" />
						本地安装
					</h2>
					<h2>
						<a href="${ctx}/application/Application!toRemoteInstall.do"><img src="${ctx}/${pattern}/images/tabicon.gif" width="16"
							height="16" align="absmiddle" />
						远程安装</a>
					</h2>
					<h3>
						<a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a>
					</h3>
				</div>
				<!-- TAB标签结束 -->
				<div class="centent" style="padding-top: 10px;">
						<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
							<tr>
								<td class="tdLabel">
									<label for="localZipFile" class="label">
										应用安装文件
										<span class="required">*</span>:
									</label>
								</td>
								<td>
									<input type="file" size="50" name="localZipFile"
										id="localZipFile" class="required " />
								</td>
							</tr>


						</table>
						<div class="page">
							<input type="submit" value="提 交" class="but_shop" />
						<input type="button" value="取 消" class="but_shop"
							onclick="history.back(-1)" />
						</div>


				</div>
			</div>
		</form>
	</body>
</html>