<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>应用访问入口</title>
	<style >
		html,body{height:100%;}
	</style>
</head>
<body class="mainbody">
<!-- 内容区开始 -->
<div class="mainbox-top"><img src="${ctx }/images/mainbox01.gif" width="7" height="7" /></div>
<!-- 上圆角边线 -->
<div class="mainbox" style="height: 95%;">

<!-- 左边菜单 -->
<div class="main-lef" style="height: 100%;">
<div class="main-leftit"><img src="${ctx }/images/main_ico18.gif" width="15" height="15" align="absmiddle" /> 应用访问入口</div>
<div  style="background:#FFF;border:1px solid #bcbcbc; border-top:none;padding-left:12px;padding-bottom:20px;min-height:84%;height:84%;">
 <iframe name="leftFrame" width="100%" height="100%" src="${ctx}/application/Permission!leftTree.do?applicationId=${applicationId}" frameborder="0" scrolling="no" ></iframe>
</div>
</div>

<!-- 右边详情 -->
<div class="main-rig" style="height: 100%;">
<div class="main-rigtit" style="height : 0px;"></div>
<div class="main-rigtex" style="height : 99%; padding: 0px; padding-top: 0px;">
	<iframe style="padding-left: 0px;" name="mainFrame" width="100%" height="100%" src="${ctx}/application/Permission!list.do?query.parentId=${queryParentId}&query.applicationId=${applicationId}" frameborder="0" scrolling="auto"></iframe>
</div>
</div>

</div>
<div class="mainbox-bot"><img src="${ctx }/images/mainbox03.gif" width="7" height="7" /></div>
<!-- 下圆角边线 -->
</body>
</html>
<%@ include file="../base.jsp"%>