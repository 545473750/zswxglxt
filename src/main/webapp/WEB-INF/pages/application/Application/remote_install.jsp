<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.opendata.application.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>应用新增</title>

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

	<style type="text/css">
.hid {
	display: none;
	margin: 0 auto;
	vertical-align: middle;
}
</style>
	<script>
	 function install(){
			var ftpFile = document.getElementById("ftpFile").value;
	        if(ftpFile.length>4||ftpFile.substr(ftpFile.length-4,4)=='.zip'||ftpFile.substr(ftpFile.length-4,4)=='.ZIP'){
				document.getElementById("bod").className="";
				document.getElementById("maind").className="hid";
				document.getElementById("loading").className="show";
				return true;
			}else{
			  document.getElementById("submitButton").disabled=false;
			  alert('只能安装zip文件！');
			  return false;
			}
		
		}
	</script>
</head>
	<body>
		<form id="dataform" name="dataform"
			action="<c:url value="/application/Application!remoteInstall.do"/>"
			onsubmit="return install()" method="post">

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
						<a href="${ctx}/application/Application!toLocalInstall.do"><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" src="<c:url value="images/main_ico14.gif"/>"
							height="16" align="absmiddle" />
						本地安装</a>
					</h2>
					<h2>
						<img src="${ctx}/${pattern}/images/tabicon.gif" width="16"
							height="16" align="absmiddle" />
						远程安装
					</h2>
					<h3>
						<a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a>
					</h3>
				</div>
			
				<div class="centent" style="padding-top: 10px;">
							<table cellpadding="0" cellspacing="0" border="0" class="uiTable">

							<tr class="jg">
								<td class="tdLabel">
									<label for="ftpIp" class="label">
										FTP地址
										<span class="required">*</span>:
									</label>
								</td>
								<td>
									<input type="text" name="ftpIp" value="${ftpIp }" id="ftpIp"
										class="required " style="width: 155px;" />
								</td>
							</tr>

							<tr>
								<td class="tdLabel">
									<label for="ftpPort" class="label">
										FTP端口
										<span class="required">*</span>:
									</label>
								</td>
								<td>
									<input type="text" name="ftpPort" value="${ftpPort }"
										id="ftpPort" class="required " style="width: 155px;" />
								</td>
							</tr>

							<tr class="jg">
								<td class="tdLabel">
									<label for="ftpUsername" class="label">
										FTP用户名
										<span class="required">*</span>:
									</label>
								</td>
								<td>
									<input type="text" name="ftpUsername" value="${ftpUsername }"
										id="ftpUsername" class="required " style="width: 155px;" />
								</td>
							</tr>

							<tr>
								<td class="tdLabel">
									<label for="ftpPassword" class="label">
										FTP密码
										<span class="required">*</span>:
									</label>
								</td>
								<td>
									<input type="text" name="ftpPassword" value="${ftpPassword }"
										id="ftpPassword" class="required " style="width: 155px;" />
								</td>
							</tr>

							<tr class="jg">
								<td class="tdLabel">
									<label for="ftpDic" class="label">
										应用FTP目录
										<span class="required">*</span>:
									</label>
								</td>
								<td>
									<input type="text" name="ftpDic" value="${ftpDic }" id="ftpDic"
										class="required " style="width: 155px;" />
								</td>
							</tr>

							<tr>
								<td class="tdLabel">
									<label for="ftpFile" class="label">
										应用FTP文件
										<span class="required">*</span>:
									</label>
								</td>
								<td>
									<input type="text" name="ftpFile" value="${ftpFile }"
										id="ftpFile" class="required " style="width: 155px;" />
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