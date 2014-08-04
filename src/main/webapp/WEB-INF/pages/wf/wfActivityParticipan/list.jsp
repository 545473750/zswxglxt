<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>节点参与者设置</title>
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
</head>
<body>
<div class="main">
	<div class="maintit">
		<h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" /> 节点参与者设置</h2>
		<h3><a href="${ctx}/wf/WfActivity!list.do?1=1<c:forEach var="obj" items="${_pageBar_.parameter }">&${obj.key}=${obj.value}</c:forEach>">返回 &gt;&gt;</a></h3>
	</div>
	<div class="centent">
		<div class="shop" id="shop">
			<p class="left">
				<input type="button" class="but_shop" onclick="add('${ctx}/wf/WfActivityParticipan!userlist.do',document.listForm);" value="选择用户" />
				<input type="button" class="but_shop" onclick="batchDelete('${ctx}/wf/WfActivityParticipan!remove.do','items',document.listForm);" value="删除" />
          		<span id="prompt" style="color:red;"></span>
			</p>
			<p class="right">
				&nbsp;&nbsp;&nbsp;
				<jsp:include flush="true" page="/commons/toppagebar.jsp">
					<jsp:param name="target" value="/wf/WfActivity!list.do" />
				</jsp:include>
			</p>
			<div class="clear"></div>
		</div>
		<form id="listForm" name="listForm" method="post" action="${ctx}/wf/WfActivityParticipan!list.do">
			<span>
				<input type="hidden" name="activityId" value="${query.wfActivity.id }" />
				<input type="hidden" name="proId" value="${query.proId }"/>
				<input type="hidden" name="orgId" value="${orgId }"/>
				<input type="hidden" name="actType" value="${query.actType }"/>
				<input type="hidden" name="groupFlag" value="${query.groupFlag }"/>
				<input type="hidden" name="refType" value="${obj.refType }"/>
				<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
					<input type="hidden" name="${obj.key}" value="${obj.value}" />
				</c:forEach>
			</span>
			<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
				<tr>
					<th width="30">
				  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"/>
				    </th>
				  	<th width="50">序号</th>
				  	<th >关联名称</th>
				  	<th >关联类型</th>
				</tr>
				<c:forEach items="${page.result}" var="obj" varStatus="status">
					<tr class="${status.count % 2 == 0 ? 'jg' : ''}">
						<td align="center">
							<input type="checkbox" name="items" value="id=${obj.id}&"/>
						</td>
						<td align="center">
							${page.thisPageFirstElementNumber + vs.index}
						</td>
						<td align="center">
							<c:if test="${obj.refType == 4}">
								<a href="${ctx}/common/Experts!view2.do?id=${obj.refId}">${obj.refName }</a>
							</c:if>
							<c:if test="${obj.refType == 3}">
								<a href="${ctx}/wf/WfActivityParticipan!view.do?id=${obj.id}">${obj.refName}</a>
							</c:if>
							<c:if test="${obj.refType == 2}">
								<a href="${ctx}/wf/WfActivityParticipan!view.do?id=${obj.id}">${obj.refName}</a>
							</c:if>
							<c:if test="${obj.refType == 1}">
								<a href="${ctx}/wf/WfActivityParticipan!view.do?id=${obj.id}">${obj.refName}</a>
							</c:if>
						</td>
						<td align="center">
							<c:if test="${obj.refType == 1}">用户</c:if>
							<c:if test="${obj.refType == 2}">部门</c:if>
							<c:if test="${obj.refType == 3}">角色</c:if>
							<c:if test="${obj.refType == 4}">专家组</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<div class="page">
			<jsp:include flush="true" page="/commons/pagebar.jsp">
				<jsp:param name="target" value="/wf/WfActivityParticipan!list.do"/>
			</jsp:include>
		</div>
	</div>
</div>
</body>
</html>
