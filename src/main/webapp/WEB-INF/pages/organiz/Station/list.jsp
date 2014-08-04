<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title> 岗位管理</title>
		<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css" rel="stylesheet" />
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
		
		<script src="${ctx}/scripts/application.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
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
		
			$("#dialog").dialog({
		        title: '<img src="${ctx}/images/main_ico14.gif" width="16" height="16" align="absmiddle" /> 人员设置',
		        width: 600,
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
		</script>
	</head>

	<body>
		<div class="main">
			<div class="maintit">
				<h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" /> 岗位管理</h2>
				<h3><a href="#" onclick="javascript:history.back(-1)">返回 &gt;&gt;</a></h3>
			</div>

			<div class="centent">
				<div class="search">
					<form id="queryForm" name="queryForm" method="post" action="${ctx}/organiz/Station!list.do">
						<label>岗位名称:<input value="${query.name}" name="query.name" style="width: 100px;" /></label>
						
						<label>
							<input type="submit" value="检 索" class="btn_search"
								onMouseOver="this.className='btn_search_over'"
								onMouseOut="this.className='btn_search'" />
						</label>
					</form>
					<div class="clear"></div>
				</div>

				<div class="shop" id="shop">
					<p class="left">
						<input type="button" class="but_shop"  onclick="add('${ctx}/organiz/Station!create.do',document.listForm);" value="添加" />
				        <input type="button" class="but_shop"  onclick="edit('${ctx}/organiz/Station!edit.do','items',document.listForm);" value="修改" />
				        <input type="button" class="but_shop"  onclick="batchDelete('${ctx}/organiz/Station!delete.do','items',document.listForm);" value="删除" />
					</p>
					<p class="right">
					&nbsp;&nbsp;&nbsp;
					<jsp:include flush="true" page="/commons/toppagebar.jsp">
						<jsp:param name="target" value="${ctx}/organiz/Station!list.do" />
					</jsp:include>
					</p>
					<div class="clear"></div>
				</div>
				<form id="listForm" name="listForm" method="post" action="${ctx}/organiz/Station!list.do">
					<span>
					<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
						<input type="hidden" name="${obj.key}" value="${obj.value}" />
					</c:forEach>
					</span>
					<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
						<tr>
							<th><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)" /></th>
							<th>序号</th>
							<th>岗位名称</th>
							<th>岗位编号</th>
							<th>级别</th>
							<th>所属组织机构</th>
							<th>排序号</th>
							<th>创建时间</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${page.result}" var="item" varStatus="status">
							<tr class="${status.count % 2 == 0 ? 'jg' : ''}">
								<td><input type="checkbox" name="items" value="id=${item.id}&" /></td>
								<td>${page.thisPageFirstElementNumber + status.index}</td>
								<td><a href="${ctx}/organiz/Station!show.do?id=${item.id}&"><c:out value='${item.name}' /> </a>&nbsp;</td>
								<td><c:out value='${item.code}' />&nbsp;</td>
								<td><c:out value='${item.levelString}' />&nbsp;</td>
								<td><c:out value='${item.orgString}' />&nbsp;</td>
								<td><c:out value='${item.sequence}' />&nbsp;</td>
								<td><c:out value='${item.ts}' />&nbsp;</td>
								<td>
<a href="${ctx}/organiz/Station!edit.do?id=${item.id}&"> 修改</a> |
<a href="javascript:openDialogById('${ctx}/organiz/Station!grantPage.do?id=${item.id}&partitionId=${partitionId}','resourcesDialog','grantResources');">权限授予</a> |
<a href="javascript:openDialog('${ctx}/organiz/User!setUserForStation.do?stationId=${item.id }' + '&r=' + Math.random());">人员设置</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</form>
				<div class="page">
				<jsp:include flush="true" page="/commons/pagebar.jsp">
					<jsp:param name="target" value="${ctx}/organiz/Station!list.do" />
				</jsp:include>
				</div>
			</div>
			
			<!-- 权限授予dialog -->	
			<div id="resourcesDialog" style="overflow: hidden;">
				<iframe id="grantResources" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" width="420" height="344"></iframe>
			</div>
			<!-- 人员设置 -->
			<div id="dialog" style="overflow: visible;">
			<iframe id="addSit" frameborder="0" marginwidth="0" marginheight="0" scrolling="auto" width="600" height="334"></iframe>
		</div>
		</div>
	</body>
</html>

