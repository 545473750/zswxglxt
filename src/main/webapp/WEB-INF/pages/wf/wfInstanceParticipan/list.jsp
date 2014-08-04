<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>流程参与者管理</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
</head>
<body>
<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">首 页</a> &gt; <a href="#">流程参与者管理</a> &gt; 流程参与者列表</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" onclick="goBack()" />
          </p>
      </div>
      <div class="tablelist">
    	 <div class="title">流程参与者管理</div>
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx}/wf/WfInstanceParticipan!list.do">
       		<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="32" >关联名称：</td>		
							<td>
								<input value="${query.refName}" id="refId" name="query.refId" maxlength="100"  class=""/>
							</td>
							<td height="32" >关联类型：</td>		
							<td>
								<input value="${query.refType}" id="refType" name="query.refType" maxlength="100"  class=""/>
							</td>
							<td>
								<input type="submit" name="button2" id="button2" value="查 询" />
							</td>
						</tr>
        	</table>
        </form>
        <div class="clear"></div>
      </div>
<div class="page">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>
	        <input type="button" class="but_cz"  onclick="add('${ctx}/wf/WfInstanceParticipan!userlist.do',document.listForm);" value="添加用户" />
	        <input type="button" class="but_cz"  onclick="add('${ctx}/wf/WfInstanceParticipan!rolelist.do',document.listForm);" value="添加角色" />
          <input type="button" class="but_cz"  onclick="batchDelete('${ctx}/wf/WfInstanceParticipan!remove.do','items',document.listForm);" value="删除" />
        </td>
      </tr>
    </table>
</div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/wf/WfInstanceParticipan!list.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
	    <th width="30">
	  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
	    </th>
	  	<th width="50">序号</th>
	  	<th >关联名称</th>
	  	<th >关联类型</th>
	  	<th >备注</th>
	  	<th >单位id</th>
	</tr>
	<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td>
			<input type="checkbox" name="items" value="id=${obj.id}&">
		</td>
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
					<a href="${ctx}/wf/WfInstanceParticipan!view.do?id=${obj.id}">${obj.refName}</a>
		</td>
		<td>
				<c:if test="${obj.refType == 1}">用户</c:if>
				<c:if test="${obj.refType == 2}">部门</c:if>
				<c:if test="${obj.refType == 3}">角色</c:if>
		</td>
		<td>
					${obj.remark}
		</td>
		<td>
					${obj.orgId}
		</td>
	</tr>
</c:forEach>
</table>
</form>
</div>
    <div class="page">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	 <tr>
           <td width="70%">
            <div class="pages">
				<jsp:include flush="true" page="/commons/pagebar.jsp">
					<jsp:param name="target" value="/wf/WfInstanceParticipan!list.do" />
		        </jsp:include>
        	</div>
           </td>
        </tr>
       </table>
   </div>
  </div>
  </div>
  <script type="text/javascript">
function goBack(){
	location.href="${ctx }/bj/Bigclass!found.do";
}
	//$("#shop").smartFloat();  
</script>
</div>
</body>
</html>
