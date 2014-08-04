<%@ page import="com.opendata.sys.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/commons/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>日志 维护</title>

		<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css" rel="stylesheet" />
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />

		<script src="${ctx}/scripts/application.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
		<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
		<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
		<script type="text/javascript">
		$(function() {
			$("#handDeleteDialog").dialog({
		        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 手动清理日志',
		        autoOpen: false,
		        width: 330,
		        height: 100,
		        resizable: false,
		        modal: true,
		        autoResize: true,
		        overlay: {
	               opacity: 0.5,
	               background: "black"
		        }
		    });
		});
        function openDialogById(dialogId){
			var horizontalPadding = 30;
		    var verticalPadding = 30;
		   	$("#"+dialogId).dialog( "open" );
		}
	 	</script>
	</head>
	
	<body>
		<div class="main">
			<input type="hidden" value="0" id="state" />
			<div class="maintit">
				<h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" />日志查询</h2>
				<h3><a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a></h3>
			</div>

			<div class="centent">
				<div class="search">
					<form id="queryForm" name="queryForm" action="${ctx}/sys/Log!list.do" method="post">
						<label>
							操作人姓名：
							<input value="${query.username}" id="username" name="query.username" />
						</label>
						<label>
							类型：
							<s:select id="type" name="query.type" list="logTypeMap" listKey="key" listValue="value" headerKey="" headerValue="--请选择--" />
						</label>
						<label>
							<input value="${query.tsBegin}" size="10" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" id="tsBegin" name="query.tsBegin" />
						</label>
						<label>
							<input value="${query.tsEnd}" size="10" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" id="tsEnd" name="query.tsEnd" />
						</label>
						<label>
							<input type="submit" value="检 索" class="btn_search" onMouseOver="this.className='btn_search_over'" onMouseOut="this.className='btn_search'" />
						</label>
					</form>
					<div class="clear"></div>
				</div>

				<div class="shop" id="shop">
					<p class="left">
						<input onclick="javascript:openDialogById('handDeleteDialog');" type="button" class="but_shop" value="手动清理日志" />
					</p>
					<p class="right">
						<%-- 
						<select name="sortColumns" id="sortColumns" class="font12" onchange="sortColumns(this.value,document._pageForm_)">
							<option value="ts">--默认排序--</option>
							<option value="username" <c:if test="${query.sortColumns == 'username' }">selected="selected"</c:if>>
								操作人姓名
							</option>
							<option value="type" <c:if test="${query.sortColumns == 'type' }">selected="selected"</c:if>>
								类型
							</option>
							<option value="ip" <c:if test="${query.sortColumns == 'ip' }">selected="selected"</c:if>>
								IP地址
							</option>
							<option value="permission" <c:if test="${query.sortColumns == 'permission' }">selected="selected"</c:if>>
								功能入口
							</option>
							<option value="ts" <c:if test="${query.sortColumns == 'ts' }">selected="selected"</c:if>>
								操作时间
							</option>
						</select>
						--%>
						&nbsp;&nbsp;&nbsp;
						<jsp:include flush="true" page="/commons/toppagebar.jsp">
						<jsp:param name="target" value="/sys/Log!list.do" />
						</jsp:include>
					</p>
					<div class="clear"></div>
				</div>
				<form id="queryForm" name="queryForm" action="${ctx}/sys/Log!list.do" method="post">
					<span> 
					<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
					<input type="hidden" name="${obj.key}" value="${obj.value}" />
					</c:forEach> 
					</span>
					<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
						<tr>
							<th style="width: 35px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)" /></th>
							<th width="35">序号</th>
							<th>操作人姓名</th>
							<th>类型</th>
							<th>IP地址</th>
							<th>功能入口</th>
							<th style="width: 150px;">操作时间</th>
							<th style="width: 80px;">操作</th>
						</tr>
						<c:forEach items="${page.result}" var="item" varStatus="status">
						<tr class="${status.count % 2 == 0 ? 'jg' : ''}">
							<td><input type="checkbox" name="items" value="id=${item.id}&" /></td>
							<td>${page.thisPageFirstElementNumber + status.index}</td>
							<td><c:out value='${item.username}' />&nbsp;</td>
							<td><c:out value='${logTypeMap[item.type]}' />&nbsp;</td>
							<td><c:out value='${item.ip}' />&nbsp;</td>
							<td><c:out value='${item.permission}' />&nbsp;</td>
							<td><c:out value='${item.ts}' />&nbsp;</td>
							<td><a href="${ctx}/sys/Log!show.do?id=${item.id}&">详情</a>&nbsp;&nbsp;&nbsp;</td>
						</tr>
						</c:forEach>
					</table>
				</form>
				<div class="page">
					<jsp:include flush="true" page="/commons/pagebar.jsp">
						<jsp:param name="target" value="/sys/Log!list.do" />
					</jsp:include>
				</div>
			</div>
			
			<!-- 手动清除日志dialog -->
			<div id="handDeleteDialog" style="overflow: hidden;">
				<form action="<c:url value="/sys/Log!handDelete.do"/>" method="post" onsubmit="return handDeleteForm();">
					<!-- 无外边框内容区开始 -->
					<div>
						<!-- TAB标签结束 -->
						<div style=" overflow: hidden;">
							<div style="width: 100%;">
								<table>
									<tr class="jg" style="">
										<td>清除日志的时间段：</td>
										<td>
											<input value="" size="10"
												onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
												id="tsBegin" name="tsBegin" class="required "
												readonly="readonly" />
											-
											<input value="" size="10"
												onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
												id="tsEnd" name="tsEnd" class="required "
												readonly="readonly" />
										</td>
									</tr>
									<tr>
										<td>
											<input id="submitButton" name="submitButton" type="submit" value="提交" />
											<input type="button" value="关闭" onclick="window.closeDialogNoRefreshById('handDeleteDialog');" />
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<script type="text/javascript">
		function handDeleteForm(){
			var tsBegin = document.getElementById("tsBegin").value;
			var tsEnd = document.getElementById("tsEnd").value;
			var message ='' ;
			if(tsBegin==''&&tsEnd==''){
				message = '确定要清理所有日志？';
			}else{
				message = '确定清理所选时段的日志？';
			}
			if (confirm(message)){
				return true;
			}else{
				return false;
			}
		}
		</script>
		<script type="text/javascript">
		$("#shop").smartFloat();  
		</script>
	</body>
</html>

