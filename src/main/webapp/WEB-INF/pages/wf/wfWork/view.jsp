<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看流程工作表</title>
<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!-- 内容开始 -->
<div class="main">
  <div class="maintit">
      <h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" /> 查看流程工作表</h2>
     <h3><a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a></h3>
  </div>
    <div class="centent" style="padding-top:10px;">
    <table cellpadding="0" cellspacing="0" border="0" class="uiTable">
		<tr class="jg" >
					<td width="10%" height="36" class="leftbor" > 
				工程id：
			</td>
			<td>
					${model.projectId}
			</td>
		</tr>
		<tr  >
					<td width="10%" height="36" class="leftbor" > 
				当前业务名称：
			</td>
			<td>
					${model.name}
			</td>
		</tr>
		<tr class="jg" >
					<td width="10%" height="36" class="leftbor" > 
				开始时间：
			</td>
			<td>
					<fmt:formatDate value="${model.startTime}" pattern="yyyy-MM-dd"/>
			</td>
		</tr>
		<tr  >
					<td width="10%" height="36" class="leftbor" > 
				结束时间：
			</td>
			<td>
					<fmt:formatDate value="${model.endTime}" pattern="yyyy-MM-dd"/>
			</td>
		</tr>
		<tr class="jg" >
					<td width="10%" height="36" class="leftbor" > 
				状态：
			</td>
			<td>
					${model.workState}
			</td>
		</tr>
		<tr  >
					<td width="10%" height="36" class="leftbor" > 
				启动人：
			</td>
			<td>
					${model.userId}
			</td>
		</tr>
		<tr class="jg" >
					<td width="10%" height="36" class="leftbor" > 
				启动人姓名：
			</td>
			<td>
					${model.userName}
			</td>
		</tr>
    </table>
	<div class="page">
	    <input type="button" value="返回" class="but_shop" onclick="history.back(-1)" />
	</div>
  </div>
  </div>
</body>
</html>
