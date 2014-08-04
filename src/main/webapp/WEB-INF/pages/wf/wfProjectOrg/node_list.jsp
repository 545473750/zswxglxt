<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>流程节点表管理</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
</head>
<body>

<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">首 页</a> &gt; <a href="#">单位流程设置</a> &gt; 节点管理</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" onclick="goBack()" />
          </p>
      </div>
  
    <div class="tablelist">
    	 <div class="title">流程节点管理</div>
      <div class="search">
        <form id="queryForm" name="queryForm" method="post" action="${ctx}/wf/WfActivity!list.do">
        <div class="clear"></div>
      </div>
<div class="shop" id="shop">
        <div class="clear"></div>
</div>
<div class="table01">
<form id="listForm" name="listForm" method="post" action="${ctx}/wf/WfActivity!list.do">
<input type="hidden" name="proId" value="${proId }" />
<input type="hidden" name="orgId" value="${orgId }"/>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
	    <th width="30">
	  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
	    </th>
	  	<th width="50">序号</th>
	  	<th >名称</th>
	  	<th >节点顺序</th>
	  	<th >节点类型</th>
	  	<th >节点状态</th>
	  	<th >功能描述</th>
	  	<th >操作</th>
	</tr>
<c:forEach var="obj" items="${acts}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" onMouseOver=this.className="highlight" onMouseOut=this.className="${vs.count % 2 == 0 ? 'jg' : ''}">
		<td align="center">
			<input type="checkbox" name="items" value="id=${obj.id}&">
			<input type="hidden" name="objId" value="${obj.id }"/>
		</td>
		<td align="center">
			${ vs.index+1}
		</td>
		<td align="center">
					<a href="${ctx}/wf/WfActivity!view.do?id=${obj.id}">${obj.name}</a>
		</td>
		<td align="center">
					${obj.orderNum}
		</td>
		<td align="center">
					<c:if test="${obj.actType == 1}">开始</c:if>
					<c:if test="${obj.actType == 2}">普通</c:if>
					<c:if test="${obj.actType == 9}">结束</c:if>
		</td>
		<td align="center">
					<input type="hidden" id="${obj.id }_flag" value="${obj.actFlag }"/>
					<c:if test="${obj.actFlag == 0}">未完成</c:if>
					<c:if test="${obj.actFlag == 1}">已完成</c:if>
		</td>
		<td align="center">
					${obj.description}
		</td>
		<td align="center">
					<c:if test="${obj.actType == 2}">
						<a href="${ctx }/wf/WfActivityParticipan!list.do?activityId=${obj.id}&proId=${proId}&orgId=${orgId}">设置参与者</a>
					</c:if>
		</td>
	</tr>
</c:forEach>
</table>
</form> 
</div>
  </div>
</div>
<script type="text/javascript">

function goBack(){
	location.href="${ctx }/wf/WfProjectOrg!list.do";
}
	//$("#shop").smartFloat();  
</script>
</div>
</body>
</html>
