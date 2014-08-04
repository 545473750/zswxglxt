<%@ page import="com.opendata.sys.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title><%=Dictitem.TABLE_ALIAS%> 维护</title>
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
		<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
		<script type="text/javascript">
			function add(){
				location.href ='${ctx}/sys/Dictitem!create.do';
			}
		</script>
	</head>
	<body>
		<div class="main">
			<div class="maintit">
				<h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" 	height="16" align="absmiddle" /> 数据字典</h2>
				<h3><a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a></h3>
			</div>
			<input type="hidden" value="0" id="state" />
			<div class="centent">
				<div class="search">
					<form id="queryForm" name="queryForm" action="${ctx}/sys/Dictitem!list.do" method="post" style="display: inline;">
						<label>
							字典名称：<input value="${query.name}" id="code" name="query.name" maxlength="100" class="" />
						</label>
						<label>
							字典编号：<input value="${query.code}" id="chinese" name="query.code" maxlength="100" class="" />
						</label>
						<label>
							所属应用：
							<s:select theme="simple" name="query.applicationId" label="所属应用"
											list="%{#request.applicationList}" listKey="id"
											listValue="name" headerKey="" headerValue="--请选择--" />
						</label>
						<label>
							<input type="submit" value="检 索" class="btn_search" onMouseOver="this.className='btn_search_over'" onMouseOut="this.className='btn_search'" />
						</label>
					</form>
					<div class="clear"></div>
				</div>
				<div class="shop" id="shop">
					
					<p class="left">
						<input type="button" class="but_shop"
							onclick="add('${ctx}/sys/Dictitem!create.do',document.listForm);"
							value="添加" />
						<input type="button" class="but_shop"
							onclick="batchEdit('${ctx}/sys/Dictitem!edit.do','items',document.forms.queryForm);"
							value="修改" />
						<input type="button" class="but_shop"
							onclick="batchDelete('${ctx}/sys/Dictitem!delete.do','items',document.listForm);"
							value="删除" />
					</p>
					<p class="right">
						<%-- 
						<select name="sortColumns" id="sortColumns" class="font12"
							onchange="sortColumns(this.value,document._pageForm_)">
							<option value="ts">--默认排序--</option>
							<option value="name" <c:if test="${query.sortColumns == 'name' }">selected="selected"</c:if>>
								字典名称
							</option>
							<option value="code" <c:if test="${query.sortColumns == 'code' }">selected="selected"</c:if>>
								字典编号
							</option>
							<option value="editf" <c:if test="${query.sortColumns == 'editf' }">selected="selected"</c:if>>
								可编辑标识
							</option>
							<option value="application.name" <c:if test="${query.sortColumns == 'application.name' }">selected="selected"</c:if>>
								所属应用
							</option>
						</select>
						--%>
						&nbsp;&nbsp;&nbsp;
						<jsp:include flush="true" page="/commons/toppagebar.jsp">
							<jsp:param name="target" value="/sys/Dictitem!list.do" />
						</jsp:include>
					</p>
					<div class="clear"></div>
				</div>
				<form id="listForm" name="listForm" method="post" action="${ctx}/sys/Dictitem!list.do">
					<span> 
					<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
						<input type="hidden" name="${obj.key}" value="${obj.value}" />
					</c:forEach> 
					</span>
					<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
						<tr>
							<th width="30">
								<input type="checkbox"
									onclick="setAllCheckboxState('items',this.checked)" />
							</th>
							<th width="50">
								序号
							</th>
							<th sortColumn="name"><%=Dictitem.ALIAS_NAME%></th>
							<th sortColumn="code"><%=Dictitem.ALIAS_CODE%></th>
							<th sortColumn="editf"><%=Dictitem.ALIAS_EDITF%></th>
							<th sortColumn="application_id"><%=Dictitem.ALIAS_APPLICATION_ID%></th>

							<th>
								操作
							</th>
						</tr>
						<c:forEach items="${page.result}" var="item" varStatus="status">
							<tr class="${status.count % 2 == 0 ? 'jg' : ''}">
								<td>
									<c:if test="${item.editf=='0'}">
										<input type="checkbox" name="items" value="id=${item.id}&">
									</c:if>
									<c:if test="${item.editf=='1'}">
										<img alt="" src="${ctx }/images/tree/iconUncheckDis.gif">
									</c:if>
								</td>
								<td>
									${page.thisPageFirstElementNumber + status.index}
								</td>
								<td>
									<a href="${ctx}/sys/Dictitem!show.do?id=${item.id}&"><c:out
											value='${item.name}' /> </a>&nbsp;
								</td>
								<td>
									<c:out value='${item.code}' />
									&nbsp;
								</td>
								<td>
									${item.editf=='0'?'可编辑':'不可编辑'}&nbsp;
								</td>
								<td>
									<c:out value='${item.application.name}' />
									&nbsp;
								</td>

								<td>
									<%-- <a href="${ctx}/sys/Dictvalue!list.do?dictitemId=${item.id}&">字典值维护</a> --%>
									<a
										href="${ctx}/sys/Dictvalue!toMainPage.do?dictitemId=${item.id}">字典值维护</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</form>
				<div class="page">
					<jsp:include flush="true" page="/commons/pagebar.jsp">
						<jsp:param name="target" value="/sys/Dictitem!list.do" />
					</jsp:include>
				</div>
			</div>
		</div>
		
	</body>
</html>


