<%@ page import="com.opendata.sys.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/commons/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>菜单管理</title>

		<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css" rel="stylesheet" />
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
		
		<script src="${ctx}/scripts/application.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
		<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
		<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
		<script type="text/javascript">
		function add(){
			location.href ='${ctx}/sys/Resources!create.do?queryParentId=${queryParentId}';
		}
		$(function() {
			$("#importAppDialog").dialog({
		        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 导入应用访问入口',
		        autoOpen: false,
		        width: 500,
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
		$(function() {
			$("#moveDialog").dialog({
		        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 移动',
		        autoOpen: false,
		        width: 320,
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
		</script>
	</head>
	<%
		if (request.getParameter("flag") != null) {
			request.setAttribute("flag", request.getParameter("flag"));
		}
	%>
	<body>
		<div class="main">
		<div class="maintit">
			<h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" />菜单管理</h2>
			<h3><a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a></h3>
		</div>
		<input type="hidden" value="${queryParentId}" id="queryParentId" name="queryParentId" />
		<div class="centent">
			<div class="search">
				<form id="queryForm" name="queryForm" method="post" action="${ctx}/sys/Resources!list.do?queryParentId=${queryParentId}">
					<label>编码：<input value="${query.code}" id="code" name="code" style="width: 100px;"/></label>
					<label>名称：<input value="${query.name}" id="name" name="name" style="width: 100px;"/></label>
					<label>
						<input type="submit" value="检 索" class="btn_search"
							onMouseOver="this.className='btn_search_over'"
							onMouseOut="this.className='btn_search'" />
					</label>
				</form>
				<div class="clear"></div>
			</div>
			<div class="shop" id="shop">
				<c:if test="${model.resources.type!='1'  }">
				<p class="left">
					<input onclick="add('${ctx}/sys/Resources!create.do?queryParentId=${queryParentId}',document.forms.queryForm)" type="button" class="but_shop" value="添加" /> 
					<input type="button" class="but_shop" onclick="batchEdit('${ctx}/sys/Resources!edit.do','items',document.forms.queryForm);" value="修改" />
					<input type="button" class="but_shop" onclick="batchDelete('${ctx}/sys/Resources!delete.do','items',document.forms.listForm);" value="删除" />
					<input type="button" class="but_shop" onclick="openDialogById('${ctx}/sys/Resources!toImportAppPage.do?queryParentId=${queryParentId}','importAppDialog','importApp');" value="导入应用访问入口" />
				</p>
				</c:if>
				<p class="right">
					<%-- 
					<select name="sortColumns" id="sortColumns" class="font12" onchange="sortColumns(this.value,document._pageForm_)">
						<option value="ts">
							--默认排序--
						</option>
						<option value="code" <c:if test="${query.sortColumns == 'code' }">selected="selected"</c:if>>
							编码
						</option>
						<option value="name" <c:if test="${query.sortColumns == 'name' }">selected="selected"</c:if>>
							名称
						</option>
						<option value="sequence" <c:if test="${query.sortColumns == 'sequence' }">selected="selected"</c:if>>
							排序号
						</option>
						<option value="type" <c:if test="${query.sortColumns == 'type' }">selected="selected"</c:if>>
							显示类型
						</option>
					</select>
					--%>
					&nbsp;&nbsp;&nbsp;
					<jsp:include flush="true" page="/commons/toppagebar.jsp">
						<jsp:param name="target" value="/sys/Resources!list.do?queryParentId=${queryParentId}" />
					</jsp:include>
				</p>
				<div class="clear"></div>
			</div>
				
			<form id="listForm" name="queryForm" method="post" action="${ctx}/sys/Resources!list.do?queryParentId=${queryParentId}">
				<span> 
				<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
				<input type="hidden" name="${obj.key}" value="${obj.value}" />
				</c:forEach> 
				</span>
				<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
						<tr>
							<th><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)" /></th>
							<th>序号</th>
							<th>编码</th>
							<th>名称</th>
							<th>排序号</th>
							<th>显示类型</th>
							<c:if test="${model.resources.type!='1'  }">
							<th>操作</th>
							</c:if>
						</tr>
						<c:forEach items="${page.result}" var="item" varStatus="status">
							<tr class="${status.count % 2 == 0 ? 'jg' : ''}">
								<td><input type="checkbox" name="items" value="id=${item.id}&queryParentId=${query.parentId}" /></td>
								<td>${page.thisPageFirstElementNumber + status.index}</td>
								<td>
								<a href="${ctx}/sys/Resources!show.do?id=${item.id}&"><c:out value='${item.code}' /> </a>&nbsp;
								</td>
								<td><c:out value='${item.name}' />&nbsp;</td>
								<td><c:out value='${item.sequence}' />&nbsp;</td>
								<td>${item.type=='1'?'菜单入口':(item.type=='2'?'功能入口':'目录')}&nbsp;</td>
								<c:if test="${model.resources.type!='1'  }">
									<td>
				<a href="${ctx}/sys/Resources!edit.do?id=${item.id}&queryParentId=${query.parentId}"> 修改</a> |
				<a href="javascript:openDialogById('${ctx}/sys/Resources!toMove.do?id=${item.id}','moveDialog','move')"> 移动</a>
									</td>
								</c:if>
							</tr>
						</c:forEach>
				</table>
			</form>
			<div class="page">
			<jsp:include flush="true" page="/commons/pagebar.jsp">
				<jsp:param name="target" value="/sys/Resources!list.do?queryParentId=${queryParentId}" />
			</jsp:include>
			</div>
		</div>
		
		<!-- dialog -->
		<div id="importAppDialog" style="overflow: hidden;">
			<iframe id="importApp" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" width="500" height="344"></iframe>
		</div>
		<!-- dialog -->
		<div id="moveDialog" style="overflow: hidden;">
			<iframe id="move" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" width="320" height="115"></iframe>
		</div>
		
		<c:if test="${flag eq 'refresh' }">
			<script type="text/javascript">
				(function() {
					window.parent.leftFrame.location.href = "${ctx}/sys/Resources!leftTree.do?queryParentId=${queryParentId}";
					
				})();
			</script>
		</c:if>
		</div>
	</body>
</html>
