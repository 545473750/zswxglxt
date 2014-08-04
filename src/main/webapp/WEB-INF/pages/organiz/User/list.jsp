<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>用户管理</title>
		<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css" rel="stylesheet" />
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
		
		<script src="${ctx}/scripts/application.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
		<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
		<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
		<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
		
		<script type="text/javascript">
		$(function() {
			$("#dialog").dialog({
		        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 角色授予',
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
			
			$("#stationDialog").dialog({
		        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 岗位设置',
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

		/**
		重置密码
		 **/
		function resetPassword(id) {
			if (confirm("确认要重置密码吗?")) {
				document.getElementById('_userid').value = id;
				document.getElementById('_abledFlag').name = "";
				document.getElementById('resetPasswordForm').submit();
			}
		}

		/** 启用/停用用户 enabled/disabled **/
		function abledUser(id, abledFlag) {
			if (confirm("确认要启用/停用用户吗?")) {
				document.getElementById('_userid').value = id;
				document.getElementById('_abledFlag').value = abledFlag;
				document.getElementById('resetPasswordForm').action = '${ctx}/organiz/User!update.do';
				document.getElementById('resetPasswordForm').submit();
			}
		}

		/** 删除 **/
		function _batchDelete(action, checkboxName, form) {
			if (!hasOneChecked(checkboxName)) {
				alert('请选择要操作的对象!');
				return;
			}
			if (confirm('确定执行[删除]操作?')) {

				var items = document.getElementsByName(checkboxName);
				if (items.length > 0) {
					for ( var i = 0; i < items.length; i++) {
						if (items[i].checked == true
								&& items[i].value == "id=4028928c3594ab22013594ab95b70001&") {
							alert("管理员账号不可删除！");
							return;
						}
					}
				}

				form.action = action;
				form.submit();
			}
		}
		
		// 岗位设置
		function openDialogStation(url) {
			var horizontalPadding = 30;
		    var verticalPadding = 30;
		    document.getElementById("stationFrame").src=url;
		    
		   	$("#stationDialog").dialog( "open" );
		}
		
		// 教师类型设置
		function openDialogtype(url,checkboxName,form) {
			if (!hasOneChecked(checkboxName)) {
				alert('请选择要操作的对象!');
				return;
			}
			var items = document.getElementsByName(checkboxName);
			var itemId = [];
			for (var i = 0; i < items.length; i++){
		        if (items[i].checked == true){
		        	itemId.push(items[i].value);
		        }
		    }
			//alert(items);
			openDialog('${ctx}/organiz/User!updateUserType.do?'+itemId.join(""));
		}
		
	</script>
	</head>

	<body>
		<div class="main">
			<form action="${pageContext.request.contextPath}/organiz/User!resetPassword.do"	method="post" id="resetPasswordForm">
				<input id="_userid" name="id" type="hidden" />
				<input id="_abledFlag" name="abledFlag" type="hidden" />
				<input id="_partitionId" name="partitionId" type="hidden" value="${partitionId}" />
			</form>
			
			<div class="maintit">
				<h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" /> 用户管理</h2>
				<h3><a href="#" onclick="javascript:history.back(-1)">返回 &gt;&gt;</a></h3>
			</div>

			<div class="centent">
				<div class="search">
					<form id="queryForm" name="queryForm" method="post" action="${ctx}/organiz/User!list.do">
						<label>
							登录名：
							<input value="${query.loginname}" id="loginname" name="query.loginname" style="width: 100px;"/>
						</label>
						<label>
							姓名：
							<input value="${query.username}" id="username" name="query.username" style="width: 100px;"/>
						</label>
						<label>
							所属单位：
							<input value="${query.deptName}" id="deptName" name="query.deptName" style="width: 100px;" />
						</label>
						<label>
							来源分类：
							<select name="query.source">
								<option value="">--请选择--</option>
		        				<option value="0" <c:if test="${query.source == 0}">selected="selected"</c:if>  >在编教师</option>
		        				<option value="1" <c:if test="${query.source == 1}">selected="selected"</c:if>  >非在编教师</option>
		        				<option value="2" <c:if test="${query.source == 2}">selected="selected"</c:if>  >外请教师</option>
		        				<option value="3" <c:if test="${query.source == 3}">selected="selected"</c:if>  >外请专家</option>
		        				<option value="4" <c:if test="${query.source == 4}">selected="selected"</c:if>  >外籍教师</option>
		        				<option value="5" <c:if test="${query.source == 5}">selected="selected"</c:if>  >外籍专家</option>
							</select>
						</label>
						<label>
							<input type="submit" value="检 索" class="btn_search" onMouseOver="this.className='btn_search_over'" onMouseOut="this.className='btn_search'" />
						</label>
					</form>
					<div class="clear"></div>
				</div>

				<div class="shop" id="shop">
					<p class="left">
						
						<input type="button" class="but_shop" onclick="openDialogtype('${ctx}/organiz/User!type.do','items',document.forms.listForm)" value="类别设定" />
						<input onclick="add('${ctx}/organiz/User!saveUserRole.do',document.forms.queryForm);"  type="button" class="but_shop" value="用户角色" />
						<input type="button" class="but_shop" onclick="javascript:batchEdit('${ctx}/organiz/User!edit.do','items',document.forms.queryForm)" value="修改" />
						<!-- 
						<input onclick="add('${ctx}/organiz/User!create.do',document.forms.queryForm);"  type="button" class="but_shop" value="添加" />
						<input type="button" class="but_shop" onclick="javascript:batchEdit('${ctx}/organiz/User!edit.do','items',document.forms.queryForm)" value="修改" />
						<input type="button" class="but_shop" onclick="javascript:_batchDelete('${ctx}/organiz/User!delete.do','items',document.forms.listForm)" value="删除" />
						
						<input onclick="add('${ctx}/organiz/User!changeUserNum.do',document.forms.queryForm);"  type="button" class="but_shop" value="同步继教号" />
							
						 -->
						<!-- 
						<input type="button" class="but_shop"
							onclick="javascript:batchEnabled('${ctx}/organiz/User!batchAble.do','items',document.forms.listForm)"
							value="启用" />
						<input type="button" class="but_shop"
							onclick="javascript:batchDisabled('${ctx}/organiz/User!batchAble.do','items',document.forms.listForm)"
							value="停用" />
							 -->
					</p>
					<p class="right">
						&nbsp;&nbsp;&nbsp;
						<jsp:include flush="true" page="/commons/toppagebar.jsp">
							<jsp:param name="target" value="/organiz/User!list.do" />
						</jsp:include>
					</p>
					<div class="clear"></div>
				</div>
				<form id="listForm" name="listForm" method="post" action="${ctx}/organiz/User!list.do">
					<span>
						
						<input type="hidden" value="0" id="state" />
						<input type="hidden" name="ableFlag" id="ableFlag" />
					
						<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
							<input type="hidden" name="${obj.key}" value="${obj.value}" />
						</c:forEach>
					</span>
					<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
						<tr>
							<th style="width: 35px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)" /></th>
							<th style="width: 40px;">序号</th>
							<th>登录名</th>
							<th>继教号</th>
							<th>姓名</th>
							<th>身份证号</th>
							<th style="width: 300px;">所属单位</th>
						
							<th style="width: 150px;">操作</th>
						</tr>
						<c:forEach items="${page.result}" var="item" varStatus="status">
							<tr class="${status.count % 2 == 0 ? 'jg' : ''}">
								<td>
									<input type="checkbox" name="items"
										value="id=${item.id}&partitionId=${partitionId}&" />
								</td>
								<td>
									${page.thisPageFirstElementNumber + status.index}
								</td>
								<td>
									<a href="${ctx}/organiz/User!show.do?id=${item.id}&"><c:out
											value='${item.loginname}' /> </a>&nbsp;
								</td>
								<td>
									<c:out value='${item.userNum}' />
									&nbsp;
								</td>
								<td>
									<c:out value='${item.username}' />
									&nbsp;
								</td>
								<td>
									<c:out value='${item.IDNum}' />
									&nbsp;
								</td>
								
								<td>
									<c:choose>
										<c:when test="${fn:length(item.deptsString) > 20}">
											<c:out value="${fn:substring(item.deptsString, 0, 20)}..." />
										</c:when>
										<c:otherwise>
											<c:out value='${item.deptsString}' />&nbsp;
				    </c:otherwise>
									</c:choose>
								</td>
								
								<td>
									<c:if test="${item.loginname ne 'admin' }"></c:if>
										<a
											href="javascript:openDialog('${ctx}/organiz/User!grantPage.do?id=${item.id}&partitionId=${partitionId}&state=${item.abledFlag == '0' ? '1' : '0'}');">
											角色授予</a>
									
									<!--  | 
									<a href="javascript:void(0);"
										onclick="javascript:resetPassword('${item.id}');"> 密码重置</a>
									 -->
								</td>
							</tr>
						</c:forEach>
					</table>
				</form>
				<div class="page">
					<jsp:include flush="true" page="/commons/pagebar.jsp">
						<jsp:param name="target" value="/organiz/User!list.do" />
					</jsp:include>
				</div>
			</div>
			
			<!-- 角色授予 -->
			<div id="dialog" style="overflow: hidden;">
				<iframe id="addSit" frameborder="0" marginwidth="0" marginheight="0"
					scrolling="auto" width="600" height="244"></iframe>
			</div>
			<!-- 岗位设置 -->
			<div id="stationDialog" style="overflow: hidden;">
				<iframe id="stationFrame" frameborder="0" marginwidth="0"
					marginheight="0" scrolling="auto" width="600" height="334"></iframe>
			</div>
		</div>
	
	<c:if test="${flash.success != null}">
		<div id="flash_message" align="center" title="提示信息"
			style="display: none; padding-top: 25px; background-color: #EEFFFF;">
			${flash.success}
		</div>
		<script type="text/javascript">
		$(function() {
			$( "#flash_message" ).dialog({width:200,height:100,draggable: false,show: "Bounce",hide: "puff" });
			setTimeout(function() {
				$( "#flash_message" ).dialog( "close" );
			}, 3000 );
		});
	</script>
	</c:if>

	<%-- Info Messages --%>
	<c:if test="${flash.error != null}">
		<div id="flash_error" align="center" title="错误信息"
			style="display: none; padding-top: 25px; background-color: #EEFFFF;">
			${flash.error}
		</div>
		<script type="text/javascript">
		$(function() {
		//	$( "#flash_error" ).dialog({width:200,height:100,draggable: false,show: "Bounce",hide: "puff" });
			//setTimeout(function() {
				//$( "#flash_error" ).dialog( "close" );
			//}, 4000 );
		});
		</script>
	</c:if>
	</body>
</html>

