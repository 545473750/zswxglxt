<%@page import="com.opendata.application.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>应用维护</title>

		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css" rel="stylesheet" />
		<script src="${ctx}/scripts/application.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
		<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
		<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
		<style type="text/css">
		.hid {
			display: none;
			margin: 0 auto;
			vertical-align: middle;
		}
		</style>
		<script type="text/javascript">
		function add(){
			location.href ='${ctx}/application/Application!create.do';
		}
		function localInstall(){
			location.href ='${ctx}/application/Application!toLocalInstall.do';
		}
		function remoteInstall(){
			location.href ='${ctx}/application/Application!toRemoteInstall.do';
		}
		//卸载
		function batchUnInstall(action,checkboxName,form){
		    if (!hasOneChecked(checkboxName)){
		            alert('请选择要操作的对象!');
		            return;
		    }else if (confirm('确定执行[卸载]操作?')){
		    	var items = document.getElementsByName(checkboxName);
		    	var itemId = null;
		    	var count = 0;
		    	for (var i = 0; i < items.length; i++){
		            if (items[i].checked == true){
		            	itemId = items[i].value;
		                count++;
		            }
		        }
		    	if (count != 1) {
		        	alert('请选择一项!');
		            return;
		        } else {
				    document.getElementById("bod").className="";
					document.getElementById("maind").className="hid";
					document.getElementById("loading").className="show";
		        	window.parent.frames.mainFrame.location.href = action+'?'+itemId;
		        }
		    }
		}
	</script>
	</head>

	<body>
		<!-- 提示框 -->
		<div id="loading" class="hid">
			<table width="100%" height="340px" style="border: 1px">
				<tr><td align="center" valign="middle"><img src="<c:url value="images/load.gif"/>" />应用卸载中，请稍后...</td></tr>
			</table>
		</div>
		<div class="main">
			<div class="maintit">
				<h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" />应用维护</h2>
				<h3><a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a></h3>
			</div>
			<div class="centent">
				<div class="search">
					<form id="queryForm" name="queryForm" method="post" action="${ctx}/application/Application!list.do">
						<label>应用编号：<input value="${query.code}" id="code" name="query.code" /></label>
						<label>应用名称：<input value="${query.name}" id="name" name="query.name" /></label>
						<label>
							<s:select style="width:90px;" id="state" name="state"
								list="appStateMap" listKey="key" listValue="value" headerKey=""
								value="%{model.state}" headerValue="--请选择--" />
						</label>
						<label>
							<input type="submit" value="检 索" class="btn_search"
								onMouseOver="this.className='btn_search_over'"
								onMouseOut="this.className='btn_search'" />
						</label>
					</form>
					<div class="clear"></div>
				</div>
			</div>
			<div class="shop" id="shop">
					<p class="left">
						<input onclick="javascript:add();" type="button" class="but_shop" value="注册" />
						<!-- 
						<input type="button" class="but_shop" onclick="javascript:localInstall();" value="安装" />
						 -->
						<input type="button" class="but_shop" onclick="javascript:batchEdit('${ctx}/application/Application!edit.do','items',document.forms.queryForm)" value="修改" />
						<!-- 
						<input type="button" class="but_shop" onclick="javascript:batchUnInstall('${ctx}/application/Application!unInstallRely.do','items',document.forms.queryForm)" value="卸载" />
						 -->
					</p>
					<p class="right">
						<%-- 
						<select name="sortColumns" id="sortColumns" class="font12" onchange="sortColumns(this.value,document._pageForm_)">
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
							<option value="sequence"
								<c:if test="${query.sortColumns == 'sequence' }">selected="selected"</c:if>>
								排序号
							</option>
						</select>
						--%>
						&nbsp;&nbsp;&nbsp;
						<jsp:include flush="true" page="/commons/toppagebar.jsp">
							<jsp:param name="target" value="/application/Application!list.do" />
						</jsp:include>
					</p>
					<div class="clear"></div>
				</div>
				<form id="listForm" name="listForm" method="post" action="${ctx}/application/Application!list.do">
				<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
						<tr>
							<th><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)" /></th>
							<th>序号</th>
							<th>应用编号</th>
							<th>应用名称</th>
							<th>版本</th>
							<th>应用状态</th>
							<th>排序号</th>
							<th>应用性质</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${page.result}" var="item" varStatus="status">
							<tr class="${status.count % 2 == 0 ? 'jg' : ''}">
								<td>
									<c:if test="${item.property!='0'}">
									<input type="checkbox" name="items" value="id=${item.id}&" />
									</c:if>
									<c:if test="${item.property=='0'}">
									<img src="${ctx}/images/tree/iconUncheckAll.gif" />
									</c:if>
								</td>
								<td>${page.thisPageFirstElementNumber + status.index}</td>
								<td><a href="${ctx}/application/Application!show.do?id=${item.id}&"><c:out value='${item.code}' /> </a>&nbsp;</td>
								<td><c:out value='${item.name}' />&nbsp;</td>
								<td><c:out value='${item.version}' />&nbsp;</td>
								<td><c:out value='${appStateMap[item.state]}' />&nbsp;</td>
								<td><c:out value='${item.sequence}' />&nbsp;</td>
								<td><c:out value='${appPropertyMap[item.property]}' />&nbsp;</td>
								<td>
									<c:if test="${item.property!='0'}">
										<a href="javascript:if(confirm('确认此操作?')){location.href='${ctx}/application/Application!update.do?id=${item.id}&state=${item.state=='APP_STATE001'?'APP_STATE002':'APP_STATE001'}';}">${item.state=='APP_STATE001'?'停用':'启用'}</a>|
									</c:if>
										<a href="${ctx}/application/Permission!main.do?applicationId=${item.id}&">访问入口管理</a>
													<c:if test="${item.initializePage!=null && item.initializePage!=''}">
															|
										<a href="${item.initializePage}" onclick="window.open(this.href);return false">初始化</a>
													</c:if>
													<c:if test="${item.configurationPage!=null && item.configurationPage!=''}">
															|
										<a href="${item.configurationPage}" onclick="window.open(this.href);return false">配置管理</a>
													</c:if>
								</td>
							</tr>
						</c:forEach>
				</table>
				</form>
				<div class="page">
					<jsp:include flush="true" page="/commons/pagebar.jsp">
						<jsp:param name="target" value="${ctx}/application/Application!list.do" />
					</jsp:include>
				</div>
		</div>
	</body>
</html>