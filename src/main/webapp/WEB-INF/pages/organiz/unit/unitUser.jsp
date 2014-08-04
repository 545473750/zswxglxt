<%@page import="com.opendata.organiz.model.*"%>
<%@page import="com.opendata.organiz.model.User"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>单位用户</title>
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css" rel="stylesheet" />
		<script src="${ctx}/scripts/application.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/app.js" type="text/javascript"></script>

		<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
		<script type="text/javascript">
			$(function() {
				$("#dialog").dialog({
			        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 人员列表',
			        autoOpen: false,
			        width: 600,
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
		
			$(document).ready(function() {
				// 分页需要依赖的初始化动作
				window.simpleTable = new SimpleTable('queryForm', '${page.thisPageNumber}', '${page.pageSize}','${pageRequest.sortColumns}');
			});
			
			function toggleContent(){
				var state=document.getElementById("state");
				if(state.value==0){
					state.value=1;
					document.getElementById("search").style.display="none";
				}else{
				     state.value=0;
				     document.getElementById("search").style.display="block";
				}
			}
		</script>
	</head>
	<body>
		<div class="main">
			<div class="maintit">
				<!-- 
				<h2>
					<a href="${ctx}/organiz/Organization!toRightPage.do?id=${parentid}&partitionId=${partitionId}" style="text-decoration: none;"> 
					<img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" /> 组织机构信息
					</a>
				</h2>
				 -->
				<h2 style="background: yellow;"><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" />单位用户</h2>
				<h3><a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a></h3>
			</div>
			<div class="centent">
			
			<form id="queryForm" name="queryForm" action="${ctx }/organiz/Organization!loadUser.do" method="post" style="display: inline;">
				<input type="hidden" name="parentid" value="${parentid }" />
				<input type="hidden" name="partitionId" value="${partitionId }" />
				<input type="hidden" name="parentOrganizationType" value="${type_dept }" />
				<!-- 
				<div class="shop" id="shop">
					<p class="left">
						<input onclick="javascript:openDialog('${ctx }/organiz/Organization!loadDefaultUser.do?parentOrganizationId=${parentid }&partitionId=${partitionId}&reqTime=<%=System.currentTimeMillis()%>');" type="button" class="but_shop" value="添加" />
						<input type="button" class="but_shop" onclick="javascript:batchDelete('${ctx}/organiz/Organization!deleteUser.do?parentOrganizationId=${parentid }&partitionId=${partitionId}','items',document.forms.queryForm)" value="删除" />
					</p>
					<div class="clear"></div>
				</div>
				 -->
				<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
				<tr>
					<!-- 
					<th width="40"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)" /></th>
					 -->
					<th width="40">序号</th>
					<th>继教号</th>
					<th>用户名称</th>
					<th>性别</th>
					<th>职称</th>
					<th>身份证号</th>
					<th>学历</th>
				</tr>
				<c:forEach items="${page.result}" var="item" varStatus="status">
				<tr class="${status.count % 2 == 0 ? 'jg' : ''}">
					<!-- 
					<td><input type="checkbox" name="items" value="id=${item.id}&" /></td> -->
					<td>${page.thisPageFirstElementNumber + status.index}</td>
					<td><c:out value='${item.user.userNum}' />&nbsp;</td>
					<td><c:out value='${item.user.username}' />&nbsp;</td>
					<td><c:out value='${xbMap[item.user.teacher.sex]}' />&nbsp;</td>
					<td><c:out value='${zcMap[item.user.teacher.title]}' />&nbsp;</td>
					<td><c:out value='${item.user.teacher.IDNum}' />&nbsp;</td>
					<td><c:out value='${xlMap[item.user.teacher.education]}' />&nbsp;</td>
					
				</tr>
				</c:forEach>
				</table>
			</form>
			<div class="page">
				<jsp:include flush="true" page="/commons/pagebar.jsp">
				<jsp:param name="target" value="/organiz/Organization!loadUser.do" />
				</jsp:include>
			</div>
			</div>
			<div id="dialog" style="overflow: visible;">
			<iframe id="addSit" frameborder="0" marginwidth="0" marginheight="0" scrolling="yes" width="600" height="334"></iframe>
			</div>
		</div>
	</body>
</html>