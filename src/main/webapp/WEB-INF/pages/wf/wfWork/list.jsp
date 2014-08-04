<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>流程工作表管理</title>
	<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
</head>
<body>
<div class="main">
  <div class="maintit">
      <h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" /> 流程工作表列表</h2>
      <h3><a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a></h3>
  </div>
    <div class="centent">
      <div class="search">
        <form id="queryForm" name="queryForm" method="post" action="${ctx}/wf/WfWork!list.do">
        	<label>
        		工程id：
        		<input value="${query.projectId}" id="projectId" name="query.projectId" maxlength="100"  class=""/> 
        	</label>  
        	<label>
        		当前业务名称：
        		<input value="${query.name}" id="name" name="query.name" maxlength="100"  class=""/> 
        	</label>  
        	<label>
        		开始时间：
        		<input value="${query.startTime}" id="startTime" name="query.startTime" maxlength="100"  class=""/> 
        	</label>  
        	<label>
        		结束时间：
        		<input value="${query.endTime}" id="endTime" name="query.endTime" maxlength="100"  class=""/> 
        	</label>  
        	<label>
        		状态：
        		<input value="${query.workState}" id="workState" name="query.workState" maxlength="100"  class=""/> 
        	</label>  
        	<label>
        		启动人：
        		<input value="${query.userId}" id="userId" name="query.userId" maxlength="100"  class=""/> 
        	</label>  
        	<label>
        		启动人姓名：
        		<input value="${query.userName}" id="userName" name="query.userName" maxlength="100"  class=""/> 
        	</label>  
        	<label>
        		<input type="submit" value="检 索"   class="btn_search" onMouseOver="this.className='btn_search_over'" onMouseOut="this.className='btn_search'" />
        	</label>  
        </form>
        <div class="clear"></div>
      </div>
<div class="shop" id="shop">
        <p class="left">
          <input type="button" class="but_shop"  onclick="add('${ctx}/wf/WfWork!add.do',document.listForm);" value="添加" />
          <input type="button" class="but_shop"  onclick="edit('${ctx}/wf/WfWork!edit.do','items',document.listForm);" value="修改" />
          <input type="button" class="but_shop"  onclick="batchDelete('${ctx}/wf/WfWork!remove.do','items',document.listForm);" value="删除" />
        </p>
        <p class="right">
	          <select name="sortColumns" id="sortColumns" class="font12" onchange="sortColumns(this.value,document._pageForm_)" >
	          	<option value="ts">--默认排序--</option>
		        <option value="projectId" <c:if test="${query.sortColumns == 'projectId' }">selected="selected"</c:if>  >工程id</option>
		        <option value="name" <c:if test="${query.sortColumns == 'name' }">selected="selected"</c:if>  >当前业务名称</option>
		        <option value="startTime" <c:if test="${query.sortColumns == 'startTime' }">selected="selected"</c:if>  >开始时间</option>
		        <option value="endTime" <c:if test="${query.sortColumns == 'endTime' }">selected="selected"</c:if>  >结束时间</option>
		        <option value="workState" <c:if test="${query.sortColumns == 'workState' }">selected="selected"</c:if>  >状态</option>
		        <option value="userId" <c:if test="${query.sortColumns == 'userId' }">selected="selected"</c:if>  >启动人</option>
		        <option value="userName" <c:if test="${query.sortColumns == 'userName' }">selected="selected"</c:if>  >启动人姓名</option>
	          </select>&nbsp;&nbsp;&nbsp;
      		  <jsp:include flush="true" page="/commons/toppagebar.jsp">
				<jsp:param name="target" value="/wf/WfWork!list.do" />
	           </jsp:include>
      		      	</p>
        <div class="clear"></div>
</div>
<form id="listForm" name="listForm" method="post" action="${ctx}/wf/WfWork!list.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
	<tr>
	    <th width="30">
	  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
	    </th>
	  	<th width="50">序号</th>
	  	<th >工程id</th>
	  	<th >当前业务名称</th>
	  	<th >开始时间</th>
	  	<th >结束时间</th>
	  	<th >状态</th>
	  	<th >启动人</th>
	  	<th >启动人姓名</th>
	</tr>
<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" onMouseOver=this.className="highlight" onMouseOut=this.className="${vs.count % 2 == 0 ? 'jg' : ''}">
		<td>
			<input type="checkbox" name="items" value="id=${obj.id}&">
		</td>
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
					<a href="${ctx}/wf/WfWork!view.do?id=${obj.id}">${obj.projectId}</a>
		</td>
		<td>
					${obj.name}
		</td>
		<td>
					<fmt:formatDate value="${obj.startTime}" pattern="yyyy-MM-dd"/>
		</td>
		<td>
					<fmt:formatDate value="${obj.endTime}" pattern="yyyy-MM-dd"/>
		</td>
		<td>
					${obj.workState}
		</td>
		<td>
					${obj.userId}
		</td>
		<td>
					${obj.userName}
		</td>
	</tr>
</c:forEach>
</table>
</form>
   <div class="page">
		<jsp:include flush="true" page="/commons/pagebar.jsp">
			<jsp:param name="target" value="/wf/WfWork!list.do" />
        </jsp:include>
   </div>
  </div>
</div>
<script type="text/javascript">
	$("#shop").smartFloat();  
</script>
</body>
</html>
