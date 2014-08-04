<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>部门列表</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
  </head>
  
  <body>
    <div class="main">
  <div class="maintit">
      <h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" /> 部门列表</h2>
      <h3><a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a></h3>
  </div>
    <div class="centent">
      <div class="search">
        <form id="queryForm" name="queryForm" method="post" action="${ctx}/wf/WfInstanceParticipan!orglist.do">
        	<input type="hidden" name="activityId" value="${activityId }" />
        	<input type="hidden" name="proId" value="${proId }"/>
        	<label>
        		名称：
        		<input value="${orgname}" id="orgname" name="orgname" maxlength="100"  class=""/> 
        	</label>  
        	<label>
        		<input type="submit" value="检 索"   class="btn_search" onMouseOver="this.className='btn_search_over'" onMouseOut="this.className='btn_search'" />
        	</label>  
        </form>
        <div class="clear"></div>
      </div>
<div class="shop" id="shop">
        <p class="left">
          <input type="button" class="but_shop"  onclick="add('${ctx}/wf/WfInstanceParticipan!addparticipant.do',document.listForm);" value="添加" />
        </p>
        <p class="right">
        	<input type="button" value="返回" class="but_shop" onclick="goBack()"/>
	          <select name="sortColumns" id="sortColumns" class="font12" onchange="sortColumns(this.value,document._pageForm_)" >
	          	<option value="ts">--默认排序--</option>
		        <option value="name" <c:if test="${query.sortColumns == 'name' }">selected="selected"</c:if>  >名称</option>
	          </select>&nbsp;&nbsp;&nbsp;
      		  <jsp:include flush="true" page="/commons/toppagebar.jsp">
				<jsp:param name="target" value="/wf/WfInstanceParticipan!orglist.do" />
	           </jsp:include>
      		      	</p>
        <div class="clear"></div>
</div>
<form id="listForm" name="listForm" method="post" action="${ctx}/wf/WfInstanceParticipan!orglist.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<input type="hidden" name="objId" value="${objId }" />
<input type="hidden" name="groupFlag" value="${groupFlag }"/>
<input type="hidden" name="reftype" value="2" />
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
	<tr>
	    <th width="30">
	  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
	    </th>
	  	<th width="50">序号</th>
	  	<th >名称</th>
	</tr>
<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" onMouseOver=this.className="highlight" onMouseOut=this.className="${vs.count % 2 == 0 ? 'jg' : ''}">
		<td>
			<input type="checkbox" name="items" value="id=${obj.id}&">
			<input type="hidden" name="objId" value="${obj.id }"/>
		</td>
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
					${obj.name}
		</td>
	</tr>
</c:forEach>
</table>
</form>
   <div class="page">
		<jsp:include flush="true" page="/commons/pagebar.jsp">
			<jsp:param name="target" value="/wf/WfInstanceParticipan!orglist.do?activityId=${activityId}&proId=${proId}" />
        </jsp:include>
   </div>
  </div>
</div>
<script type="text/javascript">
function goBack(){
	location.href="${ctx }/wf/WfInstanceParticipan!list.do?query.insId=${insId}&query.wfInstanceNode.actFlag=${actFlag}";
}
	$("#shop").smartFloat();  
</script>
  </body>
</html>
