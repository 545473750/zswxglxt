<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>专家组管理</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
</head>
<body>
<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">首 页</a> &gt; <a href="#">专家组管理</a> &gt; 专家组列表</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" onclick="goBack()" />
          </p>
      </div>
      <div class="tablelist">
    	 <div class="title">专家组管理</div>
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx}/wf/WfActivityParticipan!zjzlist.do">
			<input type="hidden" name="reftype" value="4" />
			<input type="hidden" name="query.wfActivity.id" value="${query.wfActivity.id }"/>
			<input type="hidden" name="query.proId" value="${query.proId }"/>
			<input type="hidden" name="query.actType" value="${query.actType }"/>
			<input type="hidden" name="query.groupFlag" value="${query.groupFlag }"/>
       		<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="32" >专家组名称：</td>		
							<td>
								<input value="${zjzname}" id="zjzname" name="zjzname" maxlength="100"  class=""/>
							</td>
							<td height="32" >专家组分类：</td>		
							<td>
								<select id="zjzflag" name="zjzflag">
				              		<option value="" >---请选择---</option>
									<option value="1" <c:if test="${1 == zjzflag }">selected="selected" </c:if>>申报课程专家</option>
									<option value="2" <c:if test="${2 == zjzflag }">selected="selected" </c:if>>选单课程专家</option>
									<option value="3" <c:if test="${3 == zjzflag }">selected="selected" </c:if>>组班专家</option>
								</select>
							</td>
							<td>
								<input type="submit" name="button2" id="button2" value="查 询" />
							</td>
						</tr>
        	</table>
        </form>
        <div class="clear"></div>
      </div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/common/Experts!list.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<input type="hidden" name="activityId" value="${activityId }" />
<input type="hidden" name="reftype" value="4" />
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
	    <th width="30">
	    </th>
	  	<th width="50">序号</th>
	  	<th >专家组名称</th>
	  	<th >专家组分类</th>
	  	<th >创建时间</th>
	</tr>
	<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td>
			<input type="radio" name="items" value="id=${obj.id}&">
		</td>
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
				<c:if test="${fn:length(obj.name)>10}">
					<a href="${ctx}/common/Experts!view.do?id=${obj.id}" title="${obj.name }">
						${fn:substring(obj.name,0,10)}...
					</a>
				</c:if>
				<c:if test="${fn:length(obj.name)<=10}">
					<a href="${ctx}/common/Experts!view.do?id=${obj.id}">${obj.name}</a>
				</c:if>
		</td>
		<td>
					<c:if test="${1 == obj.userFlag }">申报课程专家</c:if>
					<c:if test="${2 == obj.userFlag }">选单课程专家 </c:if>
					<c:if test="${3 == obj.userFlag }">组班专家 </c:if>
		</td>
		<td>
					<fmt:formatDate value="${obj.ts }" pattern="yyyy-MM-dd HH:mm:ss"/>
		</td>
	</tr>
</c:forEach>
</table>
</form>
</div>
 <div class="page" style="text-align: center;">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	 <tr>
           <td>
            <input type="button" class="but_cz"  onclick="addzjz('${ctx}/wf/WfActivityParticipan!addparticipant.do','items',document.listForm);" value="提交" />
            <input type="button" class="but_cz"  onclick="history.back(-1)" value="取消"/>
           </td>
        </tr>
       </table>
   </div>
    <div class="page">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	 <tr>
           <td width="70%">
            <div class="pages">
				<jsp:include flush="true" page="/commons/pagebar.jsp">
					<jsp:param name="target" value="/wf/WfActivityParticipan!zjzlist.do "/>
		        </jsp:include>
        	</div>
           </td>
        </tr>
       </table>
   </div>
  </div>
  </div>
<script type="text/javascript">
function addzjz(action,checkboxName,form){
    if (!hasOneChecked(checkboxName)){
            alert('请选择要操作的对象!');
            return;
    }
    form.action = action ;
    form.submit();
}

function goBack(){
	location.href="${ctx }/wf/WfActivityParticipan!list.do?activityId=${activityId}&query.proId=${query.proId}&orgId=${orgId}&query.actType=${query.actType}&query.groupFlag=${query.groupFlag}";
}
</script>
</div>
</body>
</html>
