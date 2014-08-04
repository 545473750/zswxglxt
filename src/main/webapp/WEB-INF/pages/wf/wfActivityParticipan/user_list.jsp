<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>用户列表</title>
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
		<h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" /> 用户列表</h2>
		<h3><a href="${ctx}/wf/WfActivity!list.do?1=1<c:forEach var="obj" items="${_pageBar_.parameter }">&${obj.key}=${obj.value}</c:forEach>">返回 &gt;&gt;</a></h3>
	</div>
	<div class="centent">
		<div class="search">
			<form id="queryForm" name="queryForm" method="post" action="${ctx}/wf/WfActivityParticipan!userlist.do">
				<input type="hidden" name="activityId" value="${activityId }" />
        		<input type="hidden" name="query.wfActivity.id" value="${query.wfActivity.id }"/>
				<input type="hidden" name="query.reftype" value="1" />
				<input type="hidden" name="query.proId" value="${query.proId }"/>
				<input type="hidden" name="query.actType" value="${query.actType }"/>
				<input type="hidden" name="query.groupFlag" value="${query.groupFlag }"/>
				<label>
					姓名：
      					<input value="${username}" id="username" name="username" maxlength="100" size="30" class=""/>
				</label>
				<label>
					继教号：
      					<input value="${userNum}" id="userNum" name="userNum" maxlength="100" class=""/>
				</label>
				<label>
					所在单位：
      					<input type="text" value="${orgName }" id="orgName" name="orgName" maxlength="100" size="30"/>
				</label>
				<label>
					<input type="submit" value="检 索" class="btn_search" onMouseOver="this.className='btn_search_over'" onMouseOut="this.className='btn_search'" />
				</label>
			</form>
			<div class="clear"></div>
		</div>
		<div class="shop" id="shop">
			<p class="right">
				&nbsp;&nbsp;&nbsp;
				<jsp:include flush="true" page="/commons/toppagebar.jsp">
					<jsp:param name="target" value="/wf/WfActivityParticipan!userlist.do" />
				</jsp:include>
			</p>
			<div class="clear"></div>
		</div>
		<form id="listForm" name="listForm" method="post" action="${ctx}/wf/WfActivityParticipan!userlist.do">
			<span>
				<input type="hidden" name="reftype" value="1" />
				<input type="hidden" name="activityId" value="${activityId }" />
				<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
					<input type="hidden" name="${obj.key}" value="${obj.value}" />
				</c:forEach>
			</span>
			<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
				<tr>
					<th width="30">&nbsp;</th>
				  	<th width="50">序号</th>
				  	<th>姓名</th>
				  	<th>登录名</th>
				  	<th>单位</th>
				</tr>
				<c:forEach items="${page.result}" var="obj" varStatus="status">
					<tr class="${status.count % 2 == 0 ? 'jg' : ''}">
						<td align="center">
							<input type="radio" name="items" value="id=${obj.userId}&"/>
							<input type="hidden" name="objId" value="${obj.userId }"/>
						</td>
						<td align="center">
							${page.thisPageFirstElementNumber + vs.index}
						</td>
						<td align="center">
							${obj.user.username}
						</td>
						<td align="center">
							${obj.user.loginname }
						</td>
						<td align="center">
							${obj.organization.name }
						</td>
					</tr>
				</c:forEach>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="text-align: center;">
		    	 <tr>
				<td colspan="4">
					<input type="button" class="but_cz"  onclick="adduser('${ctx}/wf/WfActivityParticipan!addparticipant.do','items',document.listForm);" value="提交" />
					<input type="button" class="but_cz"  onclick="history.back(-1)" value="取消"/>
				</td>
			</tr>
			</table>
		</form>
		<div class="page">
			<jsp:include flush="true" page="/commons/pagebar.jsp">
				<jsp:param name="target" value="/wf/WfActivityParticipan!userlist.do"/>
			</jsp:include>
		</div>
	</div>
</div>
<script type="text/javascript">
function adduser(action,checkboxName,form){
    if (!hasOneChecked(checkboxName)){
            alert('请选择要操作的对象!');
            return;
    }
    
    form.action = action ;
    form.submit();
}
function goBack(){
	location.href="${ctx }/wf/WfActivityParticipan!list.do?query.wfActivity.id=${query.wfActivity.id}&query.proId=${query.proId}&orgId=${orgId}&query.actType=${query.actType}&query.groupFlag=${query.groupFlag}";
}
	//$("#shop").smartFloat();  
</script>
</div>
</body>
</html>
