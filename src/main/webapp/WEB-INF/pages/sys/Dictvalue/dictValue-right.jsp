<%@ page import="com.opendata.sys.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>数据字典值维护</title>

	<link href="${ctx }/styles/jquery.ui.theme.css" type="text/css" rel="stylesheet" />
	<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />

	<script src="${ctx }/scripts/application.js" type="text/javascript"></script>
	<script src="${ctx }/scripts/jquery.js" type="text/javascript"></script>
	<script src="<c:url value="/scripts/jquery-ui-1.8.9.custom.min.js"/>" type="text/javascript"></script>
	<script src="${ctx }/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
	<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script type="text/javascript">
		
	$(function() {
		$("#dialog").dialog({
	        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 关联字典',
	        autoOpen: false,
	        width: 350,
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
	
		$(document).ready(
				function() {
					// 分页需要依赖的初始化动作
					window.simpleTable = new SimpleTable('queryForm',
							'${page.thisPageNumber}', '${page.pageSize}',
							'${pageRequest.sortColumns}');
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

		function add() {
			location.href = "${ctx}/sys/Dictvalue!create.do?dictitemId=${dictitemId}&nodetype=${nodetype}&editable=${editable}";
		}
	</script>
	</head>
	<body>
		<input type="hidden" value="0" id="state" />
				<div class="main">
				<div class="maintit">
					<h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" />数据字典值维护</h2>
					<h3><a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a></h3>
				</div>
				<div class="centent">
				<div class="search">
					<form id="queryForm" name="queryForm" action="${ctx}/sys/Dictvalue!list.do?dictitemId=${dictitemId}&nodetype=${nodetype}" method="post">
						<label>
							字典值编号：
							<input value="${query.code}" id="code" name="query.code" />
						</label>
						<label>
							字典值：
							<input value="${query.value}" id="value" name="query.value" />
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
					<c:if test="${editable=='0'}">
						<input onclick="add()" type="button" class="but_shop" value="添加" />
						<input type="button" class="but_shop" value="删除" onclick="batchDelete('${ctx}/sys/Dictvalue!delete.do?dictitemId=${dictitemId}&nodetype=${nodetype}&editable=${editable}','items',document.listForm)" />
					</c:if>
					</p>
					<p class="right">
						<%-- 
						<select name="sortColumns" id="sortColumns" class="font12" onchange="sortColumns(this.value,document._pageForm_)">
							<option value="ts">
								--默认排序--
							</option>
							<option value="code"
								<c:if test="${query.sortColumns == 'code' }">selected="selected"</c:if>>
								字典值编号
							</option>
							<option value="value"
								<c:if test="${query.sortColumns == 'value' }">selected="selected"</c:if>>
								字典值
							</option>
							<option value="dictitem.name"
								<c:if test="${query.sortColumns == 'dictitem.name' }">selected="selected"</c:if>>
								字典项
							</option>
						</select>
						--%>
						&nbsp;&nbsp;&nbsp;
						<jsp:include flush="true" page="/commons/toppagebar.jsp">
							<jsp:param name="target" value="/sys/Dictvalue!list.do?dictitemId=${dictitemId}&nodetype=${nodetype}" />
						</jsp:include>
					</p>
					<div class="clear"></div>
				</div>
				<form id="listForm" name="listForm" action="${ctx}/sys/Dictvalue!list.do?dictitemId=${dictitemId}&nodetype=${nodetype}" method="post">
					<span> 
					<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
						<input type="hidden" name="${obj.key}" value="${obj.value}" />
					</c:forEach> 
					</span>
					<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
							<tr>
								<th><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)" /></th>
								<th width="50">序号</th>
								<th>字典值编号</th>
								<th>字典值</th>
								<th>字典项</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${page.result}" var="item" varStatus="status">
								<tr class="${status.count % 2 == 0 ? 'jg' : ''}">
									<td>
										<c:if test="${item.dictitem.editf=='0'}">
											<input type="checkbox" name="items" value="id=${item.id}&dictitemId=${item.dictitemId}&" />
										</c:if>
										<c:if test="${item.dictitem.editf=='1'}">
											<img alt="" src="${ctx }/images/tree/iconUncheckDis.gif" />
										</c:if>
									</td>
									<td>${page.thisPageFirstElementNumber + status.index}</td>
									<td><a href="${ctx}/sys/Dictvalue!show.do?id=${item.id}&nodetype=${nodetype}"><c:out value='${item.code}' /></a>&nbsp;</td>
									<td><c:out value='${item.value}' />&nbsp;</td>
									<td><c:out value='${item.dictitem.name}' />&nbsp;</td>
									<td>
										<c:if test="${item.dictitem.editf=='0'}">
							<a href="${ctx}/sys/Dictvalue!edit.do?id=${item.id}&nodetype=${nodetype}&editable=${editable}">修改</a>
										</c:if>
							<a href="javascript:void(0);" onclick="openDialog('${ctx}/sys/Dictvalue!relationItem.do?id=${item.id}');">关联字典</a>
									</td>
								</tr>
							</c:forEach>
					</table>
					</form>
					<div class="page">
					<jsp:include flush="true" page="/commons/pagebar.jsp">
						<jsp:param name="target" value="/sys/Dictvalue!list.do?dictitemId=${dictitemId}&nodetype=${nodetype}" />
					</jsp:include>
				</div>
				</div>
			</div>

		<div id="dialog" style="overflow: hidden;">
			<iframe id="addSit" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" width="350"></iframe>
		</div>

		<c:if test="${dictvalueRefresh eq 'refresh' }">
			<script type="text/javascript">
				(function() {
					window.parent.leftFrame.location.href = "${ctx}/sys/Dictvalue!refreshTree.do?dictitemId=${dictitemId}&nodetype=${nodetype}&editable=${editable}";
				})();
			</script>
		</c:if>
	</body>
</html>
