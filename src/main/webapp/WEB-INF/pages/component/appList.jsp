<%@page import="com.opendata.application.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>

		<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css"
			rel="stylesheet" />
		<script src="${ctx}/scripts/application.js"
			type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js"
			type="text/javascript"></script>
		<script type="text/javascript"
			src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet"
			type="text/css" />
		<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/stmartFloat/smartFloat.js"
			type="text/javascript"></script>

		<title>应用设置</title>
		<script type="text/javascript">
		// 添加功能
		function addToList(id, name){
			if(window.parent.document.getElementById("ids").value == ""){
				// 设置ID
				window.parent.document.getElementById("ids").value = id;
				// 设置NAME
				window.parent.document.getElementById("names").value = name;
			} else {
				// 重复的要去掉
				var temp = window.parent.document.getElementById("ids").value;
				if(temp.indexOf(id) != -1) {
					
					// 提示
					$(function() {
						$( "#flash_message" ).dialog({width:70, height:50, draggable: false, resizable: false, show: "Bounce", hide: "puff" });
						// remove title bar
						//$(".ui-dialog-titlebar").hide();
						setTimeout(function() {
							$( "#flash_message" ).dialog( "close" );
						}, 2000 );
					});
					
					return;
				}
				// 设置ID
				window.parent.document.getElementById("ids").value = window.parent.document.getElementById("ids").value + "," + id;
				// 设置NAME
				window.parent.document.getElementById("names").value = window.parent.document.getElementById("names").value + "," + name;
			}
			// 显示
			window.parent.document.getElementById("appList").innerHTML = 
				window.parent.document.getElementById("appList").innerHTML + "<div class='iframe_name_box' id='" + id + "'><p class='iframe_name_text'>" + name + "</p><p class='iframe_name_close'><a onclick=\"delItem('" + id + "', '" + name + "')\"><img src='${ctx}/images/component/open_textboxclose.gif' width='11' height='11' /></a></p></div>";
		}
	</script>
	</head>
	<body>
		<div class="main">
			<input type="hidden" value="0" id="state" />

			<div class="maintit">
				<h2>
					<img src="${ctx}/${pattern}/images/tabicon.gif" width="16"
						height="16" align="absmiddle" />
					应用设置
				</h2>
			</div>

			<div class="centent">

				<!-- 查询块 -->
				<div class="search">

					<form id="queryForm" name="queryForm"
						action="<c:url value="/application/Application!loadAppList.do"/>"
						method="post" style="display: inline;">

						<label>
							应用名称：

							<input value="${query.name}" id="name" name="name" maxlength="20"
								style="width: 100px;" />
						</label>
						<label>
							应用编号：

							<input value="${query.code}" id="code" name="code" maxlength="20"
								style="width: 100px;" />
						</label>
						<label>
							<input type="submit" value="检 索" class="btn_search"
								onMouseOver="this.className='btn_search_over'"
								onMouseOut="this.className='btn_search'" />
						</label>
					</form>
				</div>
				
				<div class="shop" id="shop">
					
					<p class="right">
						<select name="sortColumns" id="sortColumns" class="font12"
							onchange="sortColumns(this.value,document._pageForm_)">
							<option value="ts">
								--默认排序--
							</option>
							
							<option value="code"
								<c:if test="${query.sortColumns == 'code' }">selected="selected"</c:if>>
								应用编号
							</option>
							<option value="name"
								<c:if test="${query.sortColumns == 'name' }">selected="selected"</c:if>>
								应用名称
							</option>
							<option value="version"
								<c:if test="${query.sortColumns == 'version' }">selected="selected"</c:if>>
								版本
							</option>
						</select>
						&nbsp;&nbsp;&nbsp;
						<jsp:include flush="true" page="/commons/toppagebar.jsp">
							<jsp:param name="target" value="/application/Application!loadAppList.do" />
						</jsp:include>
					</p>
					
				</div>
				<span> <repeatsubmit:uniqueKey /> <c:forEach var="obj"
						items="${_pageBar_.parameter }" varStatus="vs">
						<input type="hidden" name="${obj.key}" value="${obj.value}" />
					</c:forEach> </span>
					

				<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
					<tr height="20px;">
						<th width="50">
							序号
						</th>
						<th>
							应用编号
						</th>
						<th>
							应用名称
						</th>
						<th>
							版本
						</th>

						<th>
							操作
						</th>
					</tr>
					<c:forEach items="${page.result}" var="item" varStatus="status">
						<tr class="${status.count % 2 == 0 ? 'jg' : ''}">
							<td>
								${page.thisPageFirstElementNumber + status.index}
							</td>
							<td>
								<c:out value='${item.code}' />
								&nbsp;
							</td>
							<td>
								<c:out value='${item.name}' />
								&nbsp;
							</td>
							<td>
								<c:out value='${item.version}' />
								&nbsp;
							</td>
							<td>
								<a href="javascript:void(0);"
									onclick="addToList('${item.id}', '${item.name }');"> 添加</a>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="page">
					<jsp:include flush="true" page="/commons/pagebar.jsp">
						<jsp:param name="target" value="/application/Application!loadAppList.do" />
					</jsp:include>
				</div>
			</div>
			<div id="flash_message" align="center" title="提示信息"
				style="display: none; padding-top: 4px; background-color: #EEFFFF;">
				当前记录已选中！
			</div>
		</div>
	</body>

</html>