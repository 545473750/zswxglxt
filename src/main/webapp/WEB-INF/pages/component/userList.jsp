<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>用户列表</title>
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css" rel="stylesheet" />
		<script src="${ctx}/scripts/application.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
		<script src="<c:url value="/widgets/simpletable/simpletable.js"/>" type="text/javascript"></script>
		<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
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
			//window.parent.document.getElementById("userList").innerHTML = window.parent.document.getElementById("userList").innerHTML + "<span id='"+id+"'>" + name + "&nbsp;<a onclick=\"delItem('"+id+"', '" + name + "')\" href='#'>X</a>&nbsp;&nbsp;</span>";
			window.parent.document.getElementById("userList").innerHTML = 
				window.parent.document.getElementById("userList").innerHTML + "<div class='iframe_name_box' id='" + id + "'><p class='iframe_name_text'>" + name + "</p><p class='iframe_name_close'><a onclick=\"delItem('" + id + "', '" + name + "')\"><img src='${ctx}/images/component/open_textboxclose.gif' width='11' height='11' /></a></p></div>";
		}
	</script>
	</head>
	<body>
		<div class="main">
			<input type="hidden" value="0" id="state" />
			<div class="maintit">
				<h2>
					<img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" />
					用户列表
				</h2>
			</div>
			<div class="centent">
				<form id="queryForm" name="queryForm" action="${ctx }/organiz/User!loadUserList.do" method="post" style="display: inline;">
					<div class="search">
						<label>
							姓名： 
						<td>
							<input value="${query.username}" id="query.username" name="query.username" maxlength="20" style="width: 100px;" />
						</td>
						</label>
						<label>
							<input type="submit" value="检 索" class="btn_search" onMouseOver="this.className='btn_search_over'" onMouseOut="this.className='btn_search'" />
						</label>
					</div>
					<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
						<tr>
							<th width="50">
								序号
							</th>
							<th>
								姓名
							</th>
							<th>
								所属部门
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
											<c:out value='${item.username}' />
											&nbsp;
										</td>
										<td>
											<c:out value='${item.deptsString}' />
											&nbsp;
										</td>
										<td>
											<a href="javascript:void(0);"
												onclick="addToList('${item.id}', '${item.username }');">
												添加</a>
										</td>
									</tr>
								</c:forEach>
						</table>
					</div>
				</form>
				<div class="page">
					<jsp:include flush="true" page="/commons/pagebar.jsp">
						<jsp:param name="target" value="/organiz/User!loadUserList.do" />
					</jsp:include>
				</div>
				<div id="flash_message" align="center" title="提示信息" style="display: none; padding-top: 4px; background-color: #EEFFFF;">
					当前记录已选中！
				</div>
			</div>
	</body>
</html>