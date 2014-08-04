<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>新增用户信息</title>
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
		<h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" />新增用户信息</h2>
		<h3><a href="${ctx}/core/customer!list.do">返回 &gt;&gt;</a></h3>
	</div>
	<div class="centent" style="padding-top: 10px;">
	<form id="dataform" action="${ctx}/core/customer!save.do" method="post">
		<span>
		<input type="hidden" value="${entity.id}" name="id"/>
		<c:forEach var="obj" items="${params }" varStatus="vs">
			<input type="hidden" name="${obj.key}" value="${obj.value}" />
		</c:forEach> 
		</span>
		<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
			<tr class="jg" >
				<td width="14%" height="36" align="right" class="leftbor">客户代码：</td>
				<td>
					<input type="text" value="${entity.cucustnr}" name="cucustnr" datatype='string' max='100' tip='长度不能超过100'/>
				</td>
				<td width="14%" height="36" align="right" class="leftbor">姓名：</td>
				<td>
					<input type="text" value="${entity.addrcareOfName}" name="addrcareOfName" datatype='string' max='100' tip='长度不能超过100'/>
				</td>
			</tr>
			<tr class="jg" >
				<td width="14%" height="36" align="right" class="leftbor">身份证号码：</td>
				<td>
					<input type="text" value="${entity.curefnumber}" name="curefnumber" datatype='string' max='100' tip='长度不能超过100'/>
				</td>
				<td width="14%" height="36" align="right" class="leftbor">客户类型：</td>
				<td>
					<input type="text" value="${entity.cutype}" name="cutype" datatype='string' max='100' tip='长度不能超过100'/>
				</td>
			</tr>
			<tr class="jg" >
				<td width="14%" height="36" align="right" class="leftbor">客户状态：</td>
				<td>
					<input type="text" value="${entity.custatus}" name="custatus"/>
				</td>
				<td width="14%" height="36" align="right" class="leftbor">客户星级：</td>
				<td>
					<input type="text" value="${entity.culanguage}" name="culanguage"/>
				</td>
			</tr>
			<tr class="jg" >
				<td width="14%" height="36" align="right" class="leftbor">生日：</td>
				<td>
					<input type="text" value="${entity.cubirthdate}" name="cubirthdate"/>
				</td>
				<td width="14%" height="36" align="right" class="leftbor">地址：</td>
				<td>
					<input type="text" value="${entity.addrstreet}" name="addrstreet"/>
				</td>
			</tr>
			<tr class="jg" >
				<td width="14%" height="36" align="right" class="leftbor">邮编：</td>
				<td>
					<input type="text" value="${entity.addrPostcode}" name="addrPostcode"/>
				</td>
				<td width="14%" height="36" align="right" class="leftbor">国家代码：</td>
				<td>
					<input type="text" value="${entity.addrCountry}" name="addrCountry"/>
				</td>
			</tr>
			<tr class="jg" >
				<td width="14%" height="36" align="right" class="leftbor">事件号：</td>
				<td>
					<input type="text" value="${entity.addreVentnr}" name="addreVentnr"/>
				</td>
				<td width="14%" height="36" align="right" class="leftbor">电话号码：</td>
				<td>
					<input type="text" value="${entity.addrphoneh}" name="addrphoneh"/>
				</td>
			</tr>
			<tr class="jg" >
				<td width="14%" height="36" align="right" class="leftbor">传真号码：</td>
				<td>
					<input type="text" value="${entity.addrfax1}" name="addrfax1"/>
				</td>
				<td width="14%" height="36" align="right" class="leftbor">省代号：</td>
				<td>
					<input type="text" value="${entity.addrProvinceNumber}" name="addrProvinceNumber"/>
				</td>
			</tr>
			<tr class="jg" >
				<td width="14%" height="36" align="right" class="leftbor">省名称：</td>
				<td>
					<input type="text" value="${entity.addrProvinceuserke}" name="addrProvinceuserke"/>
				</td>
			</tr>
			</table>
		<div class="page">
			<input type="submit" value="提 交" class="but_shop" />
			<input type="button" value="取 消" class="but_shop" onclick="history.back(-1)" />
		</div>
	</form>
	</div>
</div>
</body>
</html>