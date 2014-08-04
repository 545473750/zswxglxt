<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>角色列表</title>
  	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
  </head>
  
  <body>

    <div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">首 页</a> &gt; <a href="#">教师培训</a> &gt; 工作流管理</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" onclick="goBack()" />
          </p>
      </div>
  
    <div class="tablelist">
    	 <div class="title">角色列表</div>
    	 <div class="search">
        <form id="queryForm" name="queryForm" method="post" action="${ctx}/wf/WfInstanceParticipan!rolelist.do">
        	<input type="hidden" name="activityId" value="${activityId }" />
        	<input type="hidden" name="proId" value="${proId }"/>
          <table border="0" cellspacing="0" cellpadding="0">
        	<tr>
        	<td height="32">
        		名称：
        		<input value="${rolname}" id="rolname" name="rolname" maxlength="100"  class=""/> 
        	</td> 
        	<td>
        		<input type="submit" name="button2" id="button2" value="查 询" />
        	</td>  
        	</tr>
        	</table>
        </form>
        <div class="clear"></div>
      </div>
<div class="shop" id="shop">
        <p class="left">
          <input type="button" class="but_cz"  onclick="add('${ctx}/wf/WfInstanceParticipan!addparticipant.do',document.listForm);" value="添加" />
        </p>
        <div class="clear"></div>
</div>
<div class="table01">
<form id="listForm" name="listForm" method="post" action="${ctx}/wf/WfInstanceParticipan!rolelist.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<input type="hidden" name="objId" value="${objId }" />
<input type="hidden" name="groupFlag" value="${groupFlag }"/>
<input type="hidden" name="reftype" value="3" />
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
	    <th width="30">
	  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
	    </th>
	  	<th width="50">序号</th>
	  	<th >名称</th>
	</tr>
<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" onMouseOver=this.className="highlight" onMouseOut=this.className="${vs.count % 2 == 0 ? 'jg' : ''}">
		<td align="center">
			<input type="checkbox" name="items" value="id=${obj.id}&">
			<input type="hidden" name="objId" value="${obj.id }"/>
		</td>
		<td align="center">
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td align="center">
					${obj.name}
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
					<jsp:param name="target" value="/wf/WfInstanceParticipan!rolelist.do?proId=${proId}" />
		        </jsp:include>
		     </div>
		    </td>
		 </tr>
	</table>
	</div>
   </div>
  </div>
</div>
<script type="text/javascript">
function goBack(){
	location.href="${ctx }/wf/WfInstanceParticipan!list.do?query.insId=${insId}&query.wfInstanceNode.actFlag=${actFlag}";
}
	//$("#shop").smartFloat();  
</script>
</body>
</html>
