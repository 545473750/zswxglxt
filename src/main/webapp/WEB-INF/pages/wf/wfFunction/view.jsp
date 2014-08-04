<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看流程功能点表</title>
<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div class="right">
<div class="llistbox">
	<div class="listmap">
         <p class="dqwz">当前位置：<a href="#">首 页</a> &gt; <a href="#">功能点管理</a> &gt; 查看功能点</p>
         <p class="fhbut">
           <input type="button" name="button" id="button" value="返 回" />
         </p>
     </div>
     
<div class="tablelist">
        <div class="title">查看详细</div>
        <div class="table01">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
		<tr class="jg" >
			<td width="14%" align="right" height="36" class="leftbor" > 
				名称：
			</td>
			<td>
					${model.name}
			</td>
			<td width="14%" align="right" height="36" class="leftbor" > 
				页面url：
			</td>
			<td>
					${model.url}
			</td>
		</tr>
		<tr>
			<td width="14%" align="right" height="36" class="leftbor" >所在组：</td>
			<td>
				<c:forEach items="${szz}" var="s">
					<c:if test = "${s.key == model.groupFlag}">${s.value}</c:if>
				</c:forEach>
			</td>
			<td width="14%" align="right" height="36" class="leftbor" > 
				参数名称：
			</td>
			<td>
					${model.parName}
			</td>
		</tr>
		<tr class="jg" >
			<td width="14%" align="right" height="36" class="leftbor" > 
				功能描述：
			</td>
			<td>
					${model.description}
			</td>
			<td width="14%" align="right" height="36" class="leftbor" > 
				功能分类：
			</td>
			<td>
					${model.funType}
			</td>
		</tr>
		<tr  >
			<td width="14%" align="right" height="36" class="leftbor" > 
				节点类型：
			</td>
			<td colspan="3">
					<c:if test="${model.insType==1}">开始</c:if>
					<c:if test="${model.insType==2}">普通</c:if>
					<c:if test="${model.insType==9}">结束</c:if>
			</td>
		</tr>
    </table>
	<div class="page">
	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
       <tr>
         <td align="center">
	    	<input type="button" value="返回" class="but_cz" onclick="history.back(-1)" />
	     </td>
	   </tr>
	 </table>
	</div>
  </div>
  </div>
  </div>
  </div>
</body>
</html>
