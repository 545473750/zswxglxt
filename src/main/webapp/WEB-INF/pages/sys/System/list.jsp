<%@ page import="com.opendata.sys.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>系统同步</title>
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
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet"
			type="text/css" />
		<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/stmartFloat/smartFloat.js"
			type="text/javascript"></script>
		
		
		<script type="text/javascript">
		$(function() {
			$("#dialog")
					.dialog(
							{
								title : '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 同步设置',
								autoOpen : false,
								width : 600,
								resizable : false,
								modal : true,
								autoResize : true,
								overlay : {
									opacity : 0.5,
									background : "black"
								}
							});
		});
		function toggleContent() {
			var state = document.getElementById("state");
			if (state.value == 0) {
				state.value = 1;
				document.getElementById("search").style.display = "none";
			} else {
				state.value = 0;
				document.getElementById("search").style.display = "block";
			}
		}
		function configSynchronous(itemid) {
			openDialog('${ctx}/sys/System!toConfigSynchronousPage.do?systemId=' + itemid + "&v=<%=java.lang.System.currentTimeMillis()%>");
		}
	</script>
	</head>
	<body>
		<div class="main">
			<div class="maintit">
				<h2>
					<img src="${ctx}/${pattern}/images/tabicon.gif" width="16"
						height="16" align="absmiddle" />
					系统同步
				</h2>
				<h3>
					<a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a>
				</h3>
			</div>
			<input type="hidden" value="0" id="state" />

			<div class="centent">

				<div class="search">
					<form id="queryForm" name="queryForm" method="post"
						action="${ctx}/sys/System!list.do">
						<label>
							编号：
							<input value="${query.code}" id="code" name="query.code"
								maxlength="100" class="" />
						</label>
						<label>
							 	名称：
							<input value="${query.name}" id="name" name="query.name"
								maxlength="100" class="" />
						</label>
						<label>
							 	系统负责人：
							<input value="${query.manager}" id="query.manager" name="query.manager"
								maxlength="100" class="" />
						</label>
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
						<a href="javascript:add('${ctx}/sys/System!create.do',document.forms.listForm);"><input type="button" class="but_shop"
							
							value="添加" /></a>
						<input type="button" class="but_shop"
							onclick="javascript:edit('${ctx}/sys/System!edit.do','items',document.forms.listForm);"
							value="修改" />
						<input type="button" class="but_shop"
							onclick="javascript:batchDelete('${ctx}/sys/System!delete.do','items',document.forms.listForm);"
							value="删除" />
					</p>
					<p class="right">
						<select name="sortColumns" id="sortColumns" class="font12"
							onchange="sortColumns(this.value,document._pageForm_)">
							<option value="ts">
								--默认排序--
							</option>
							<option value="code"
								<c:if test="${query.sortColumns == 'code' }">selected="selected"</c:if>>
								编号
							</option>
							<option value="name"
								<c:if test="${query.sortColumns == 'name' }">selected="selected"</c:if>>
								名称
							</option>
							<option value="username"
								<c:if test="${query.sortColumns == 'username' }">selected="selected"</c:if>>
								用户名
							</option>
							<option value="manager"
								<c:if test="${query.sortColumns == 'manager' }">selected="selected"</c:if>>
								系统负责人 
							</option>
							<option value="phone"
								<c:if test="${query.sortColumns == 'phone' }">selected="selected"</c:if>>
								联系方式 
							</option>
						</select>
						&nbsp;&nbsp;&nbsp;
						<jsp:include flush="true" page="/commons/toppagebar.jsp">
							<jsp:param name="target" value="/sys/System!list.do" />
						</jsp:include>
					</p>
					<div class="clear"></div>
				</div>
				
				
				<form id="listForm" name="listForm" method="post"
					action="${ctx}/sys/System!list.do">
					
					<span> <repeatsubmit:uniqueKey /> <c:forEach var="obj"
							items="${_pageBar_.parameter }" varStatus="vs">
							<input type="hidden" name="${obj.key}" value="${obj.value}" />
						</c:forEach> </span>
					<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
							<tr>
							<th width="30">
								<input type="checkbox"
									onclick="setAllCheckboxState('items',this.checked)"/>
							</th>
							<th width="50">
								序号
							</th>
							<th>
								编号
							</th>
							<th>
								名称
							</th>
							<th>
								用户名
							</th>
							<th>
								系统负责人
							</th>
							<th>
								联系方式
							</th>
							<th>
								操作
							</th>
						</tr>
						<c:forEach items="${page.result}" var="item" varStatus="status">
								<tr class="${status.count % 2 == 0 ? 'jg' : ''}">
									<td>
										<input type="checkbox" name="items" value="id=${item.id}&" />
									</td>
									<td>
										${page.thisPageFirstElementNumber + status.index}
									</td>
									<td>
										<c:out value='${item.code}' />
										&nbsp;
									</td>
									<td>
										<a href="${ctx}/sys/System!show.do?id=${item.id}&"><c:out
												value='${item.name}' />&nbsp;</a>
									</td>
									<td>
										<c:out value='${item.username}' />
										&nbsp;
									</td>
									<td>
										<c:out value='${item.manager}' />
										&nbsp;
									</td>
									<td>
										<c:out value='${item.phone}' />
										&nbsp;
									</td>
									<td>
										<a href="javascript:void(0);"
											onclick="configSynchronous('${item.id}');">同步设置</a> |
										<a href="${ctx}/sys/System!edit.do?id=${item.id}&"> 修改</a>
									</td>
								</tr>
							</c:forEach>
						
					</table>
				</form>
				<div class="page">
					<jsp:include flush="true" page="/commons/pagebar.jsp">
						<jsp:param name="target" value="/sys/System!list.do" />
					</jsp:include>
				</div>
			</div>
			<div id="dialog" style="overflow: visible;">
				<iframe id="addSit" frameborder="0" marginwidth="0" marginheight="0"
					scrolling="auto" width="600" height="344"></iframe>
			</div>
		</div>
	</body>
</html>
