<%@ page import="com.opendata.organiz.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title><%=Role.TABLE_ALIAS%> 维护</title>

		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css" rel="stylesheet" />
		
		<script src="${ctx}/scripts/application.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
		<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
		<script src="${ctx}/scripts/app.js" type="text/javascript"></script>

		<script type="text/javascript">
		$(function() {
			$("#resourcesDialog").dialog({
		        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 权限设置',
		        autoOpen: false,
		        width: 420,
		        //height: 276,
		        resizable: true,
		        modal: true,
		        autoResize: true,
		        overlay: {
	               opacity: 0.5,
	               background: "black"
	            }
		    });
		    
		    $("#grantUserDialog").dialog({
		        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 用户设置',
		        width: 600,
		        //height: 276,
		        autoOpen: false,
		        resizable: false,
		        modal: true,
		        autoResize: true,
		        overlay: {
	               opacity: 0.5,
	               background: "black"
	            }
		    });
		});
	
		function toggleContent(){
			var state=document.getElementById("state");
			if(state.value==0){
				state.value=1;
				document.getElementById("search").style.display="none";
			} else {
			    state.value=0;
			    document.getElementById("search").style.display="block";
			}
		}
		
		function add(){
			location.href ='${ctx}/organiz/Role!create.do?partitionId=${partitionId}';
		}
	</script>
	</head>
	<body>
			<div class="main">
				<div class="maintit">
					<h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" />角色维护</h2>
					<h3><a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a></h3>
				</div>
				<div class="centent">
					<!-- search div -->
					<form id="queryForm" name="queryForm" method="post" action="${ctx}/organiz/Role!list.do">
						<input type="hidden" name="partitionId" value="${partitionId}" />
						<div class="search">
							<label>编号：<input value="${query.code}" name="query.code" style="width: 100px;"/></label>
							<label>角色名称：<input value="${query.name}" name="query.name" style="width: 100px;"/></label>
							<label><input type="submit" value="检 索" class="btn_search" onMouseOver="this.className='btn_search_over'" onMouseOut="this.className='btn_search'" /></label>
							<div class="clear"></div>
						</div>
					</form>
					<div class="shop" id="shop">
						<p class="left">
							<input onclick="add()" type="button" class="but_shop" value="添加" />
							<input type="button" class="but_shop" onclick="javascript:batchEdit('${ctx}/organiz/Role!edit.do','items',document.forms.listForm);" value="修改" />
							<input type="button" class="but_shop" onclick="javascript:batchDelete('${ctx}/organiz/Role!delete.do','items',document.forms.listForm);" value="删除" />
						</p>
						<p class="right">
							<jsp:include flush="true" page="/commons/toppagebar.jsp">
								<jsp:param name="target" value="/organiz/Role!list.do" />
							</jsp:include>
						</p>
						<div class="clear"></div>
					</div>
				</div>
				<form id="listForm" name="listForm" method="post" action="${ctx}/organiz/Role!list.do">
				<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
							<tr>
							<th style="width: 30px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)" /></th>
							<th style="width: 35px;">序号</th>
							<th>编号</th>
							<th>角色名称</th>
							<th>所属分区</th>
							<th>操作</th>
							</tr>
							<c:forEach items="${page.result}" var="item" varStatus="status">
							<tr class="${status.count % 2 == 0 ? 'jg' : ''}">
								<td><input type="checkbox" name="items" value="id=${item.id}&partitionId=${partitionId}&" /></td>
								<td>${page.thisPageFirstElementNumber + status.index}</td>
								<td><a href="${ctx}/organiz/Role!show.do?id=${item.id}&partitionId=${partitionId}&"><c:out value='${item.code}' /> </a>&nbsp;</td>
								<td><c:out value='${item.name}' />&nbsp;</td>
								<td>${item.partition==null?'平台':item.partition.name}&nbsp;</td>
								<td>
									<a href="${ctx}/organiz/Role!edit.do?id=${item.id}&partitionId=${partitionId}&">修改</a>
									|
									<c:if test="${item.code ne 'admin' }"></c:if>
									<a href="javascript:openDialogById('${ctx}/organiz/Role!grantPage.do?id=${item.id}&partitionId=${partitionId}','resourcesDialog','grantResources');">权限授予</a> | 
									
									<a href="javascript:openDialogById('${ctx}/organiz/Role!grantUserPage.do?id=${item.id}&partitionId=${partitionId}' + '&r=' + Math.random(),'grantUserDialog','grantUser');">用户设置</a>
								</td>
							</tr>
							</c:forEach>
				</table>
				</form>
				<!-- page div -->
				<div class="page">
					<jsp:include flush="true" page="/commons/pagebar.jsp">
						<jsp:param name="target" value="/organiz/Role!list.do" />
					</jsp:include>
				</div>
			</div>
			
		<!-- 权限授予dialog -->	
		<div id="resourcesDialog" style="overflow: hidden;">
			<iframe id="grantResources" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" width="420" height="344"></iframe>
		</div>
		<!-- 用户设置dialog -->
		<div id="grantUserDialog" style="overflow: hidden;">
			<iframe id="grantUser" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" width="600" height="334"></iframe>
		</div>
	</body>
</html>