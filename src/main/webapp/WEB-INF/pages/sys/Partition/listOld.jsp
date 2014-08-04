<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>分区管理</title>
		<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css" rel="stylesheet" />
		<script src="${ctx}/scripts/application.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
		<script type="text/javascript"
			src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
		<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/stmartFloat/smartFloat.js"
			type="text/javascript"></script>
		<script type="text/javascript">
		$(function() {
				$("#grantApplicationDialog").dialog({
			        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 应用设置',
			        autoOpen: false,
			        width: 700,
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
				$("#grantAdministratorDialog").dialog({
			        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 管理员设置',
			        autoOpen: false,
			        width: 600,
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
				$("#grantOrganizDialog").dialog({
			        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 组织机构设置',
			        autoOpen: false,
			        width: 420,
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
			<input type="hidden" value="0" id="state" />

			<div class="maintit">
				<h2>
					<img src="${ctx}/${pattern}/images/tabicon.gif" width="16"
						height="16" align="absmiddle" />
					分区管理
				</h2>
				<h3>
					<a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a>
				</h3>
			</div>
			<div class="centent">
				<div class="search">
					<form id="queryForm" name="queryForm" method="post"
						action="${ctx}/sys/Partition!list.do">
						<label>
							分区名称：
							<input value="${query.name}" id="name" name="name"
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
						<input onclick="add('${ctx}/sys/Partition!create.do',document.forms.listForm);" type="button" class="but_shop" value="添加" /> 
						<input type="button" class="but_shop" onclick="javascript:edit('${ctx}/sys/Partition!create.do','items',document.forms.listForm);"
							value="修改" />
						<input type="button" class="but_shop"
							onclick="javascript:batchDelete('${ctx}/sys/Partition!delete.do','items',document.forms.listForm);"
							value="删除" />
					</p>
					<p class="right">
						<select name="sortColumns" id="sortColumns" class="font12"
							onchange="sortColumns(this.value,document._pageForm_)">
							<option value="ts">
								--默认排序--
							</option>
							<option value="name"
								<c:if test="${query.sortColumns == 'name' }">selected="selected"</c:if>>
								分区名称
							</option>
							<!-- 
							<option value="username"
								<c:if test="${query.sortColumns == 'username' }">selected="selected"</c:if>>
								管理员
							</option>
							<option value="application.name"
								<c:if test="${query.sortColumns == 'application.name' }">selected="selected"</c:if>>
								应用
							</option>
							<option value="org.name"
								<c:if test="${query.sortColumns == 'org.name' }">selected="selected"</c:if>>
								组织机构
							</option>
							 -->
						</select>
						&nbsp;&nbsp;&nbsp;
						<jsp:include flush="true" page="/commons/toppagebar.jsp">
							<jsp:param name="target" value="/sys/Partition!list.do" />
						</jsp:include>
					</p>
					<div class="clear"></div>
				</div>

				<form id="listForm" name="listForm" method="post"
					action="${ctx}/sys/Partition!list.do">
					
					<span> <repeatsubmit:uniqueKey /> <c:forEach var="obj"
							items="${_pageBar_.parameter }" varStatus="vs">
							<input type="hidden" name="${obj.key}" value="${obj.value}" />
						</c:forEach> </span>
						
					<table cellpadding="0" cellspacing="0" border="0" class="uiTable">

							<tr>
								<th>
									<input type="checkbox"
										onclick="setAllCheckboxState('items',this.checked)" />
								</th>
								<th>
									序号
								</th>
								<th sortColumn="name">分区名称</th>
								<th>
									管理员
								</th>
								<th>
									应用
								</th>
								<th>
									组织机构
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
										<a href="${ctx}/sys/Partition!show.do?id=${item.id}&"><c:out
												value='${item.name}' />&nbsp;</a>
									</td>
									<td>

										<c:forEach items="${item.users}" var="user" varStatus="status">
											<c:out value='${user.username}' />&nbsp;
					</c:forEach>
										&nbsp;
									</td>
									<td>
										<c:forEach items="${item.applications}" var="application"
											varStatus="status">
											<c:out value='${application.name}' />&nbsp;
					</c:forEach>
										&nbsp;
									</td>
									<td>
										<c:forEach items="${item.organizations}" var="org"
											varStatus="status">
											<c:out value='${org.name}' />&nbsp;
					</c:forEach>
										&nbsp;
									</td>
									<td>
										<a
											href="javascript:openDialogById('${ctx}/sys/Partition!grantApplicationPage.do?id=${item.id}','grantApplicationDialog','grantApplication');">应用设置</a>|
										<a
											href="javascript:openDialogById('${ctx}/sys/Partition!grantAdministratorPage.do?id=${item.id}&v=<%=java.lang.System.currentTimeMillis()%>','grantAdministratorDialog','grantAdministrator');">管理员设置</a>|
										<a
											href="javascript:openDialogById('${ctx}/sys/Partition!toGrantOrganizPage.do?id=${item.id}','grantOrganizDialog','grantOrganiz');">组织机构设置</a>
									</td>
								</tr>

							</c:forEach>
					</table>
				</form>
				<div class="page">
					<jsp:include flush="true" page="/commons/pagebar.jsp">
						<jsp:param name="target" value="/sys/Partition!list.do" />
					</jsp:include>
				</div>
			</div>
			<div id="grantApplicationDialog" style="overflow: hidden;">
				<iframe id="grantApplication" frameborder="0" marginwidth="0"
					marginheight="0" scrolling="no" width="700" height="344"></iframe>
			</div>
			<!-- 管理员设置 -->
			<div id="grantAdministratorDialog" style="overflow: hidden;">
				<iframe id="grantAdministrator" frameborder="0" marginwidth="0"
					marginheight="0" scrolling="auto" width="600" height="334"></iframe>
			</div>
			<div id="grantOrganizDialog" style="overflow: hidden;">
				<iframe id="grantOrganiz" frameborder="0" marginwidth="0"
					marginheight="0" scrolling="no" width="420" height="344"></iframe>
			</div>
		</div>
	</body>
</html>
