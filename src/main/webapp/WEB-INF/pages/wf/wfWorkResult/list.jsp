<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>流程工作结果管理</title>
	<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
</head>
<body>
<div class="main">
  <div class="maintit">
      <h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" /> 流程工作结果列表</h2>
      <h3><a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a></h3>
  </div>
    <div class="centent">
      <div class="search">
        <form id="queryForm" name="queryForm" method="post" action="${ctx}/wf/WfWorkResult!list.do">
        	<label>
        		操作结果：
        		<input value="${query.proResult}" id="proResult" name="query.proResult" maxlength="100"  class=""/> 
        	</label>  
        	<label>
        		操作人：
        		<input value="${query.addUserId}" id="addUserId" name="query.addUserId" maxlength="100"  class=""/> 
        	</label>  
        	<label>
        		创建人姓名：
        		<input value="${query.addUserName}" id="addUserName" name="query.addUserName" maxlength="100"  class=""/> 
        	</label>  
        	<label>
        		操作备注：
        		<input value="${query.remark}" id="remark" name="query.remark" maxlength="100"  class=""/> 
        	</label>  
        	<label>
        		<input type="submit" value="检 索"   class="btn_search" onMouseOver="this.className='btn_search_over'" onMouseOut="this.className='btn_search'" />
        	</label>  
        </form>
        <div class="clear"></div>
      </div>
<div class="shop" id="shop">
        <p class="left">
          <input type="button" class="but_shop"  onclick="add('${ctx}/wf/WfWorkResult!add.do',document.listForm);" value="添加" />
          <input type="button" class="but_shop"  onclick="edit('${ctx}/wf/WfWorkResult!edit.do','items',document.listForm);" value="修改" />
          <input type="button" class="but_shop"  onclick="batchDelete('${ctx}/wf/WfWorkResult!remove.do','items',document.listForm);" value="删除" />
        </p>
        <p class="right">
	          <select name="sortColumns" id="sortColumns" class="font12" onchange="sortColumns(this.value,document._pageForm_)" >
	          	<option value="ts">--默认排序--</option>
		        <option value="proResult" <c:if test="${query.sortColumns == 'proResult' }">selected="selected"</c:if>  >操作结果</option>
		        <option value="addUserId" <c:if test="${query.sortColumns == 'addUserId' }">selected="selected"</c:if>  >操作人</option>
		        <option value="addUserName" <c:if test="${query.sortColumns == 'addUserName' }">selected="selected"</c:if>  >创建人姓名</option>
		        <option value="remark" <c:if test="${query.sortColumns == 'remark' }">selected="selected"</c:if>  >操作备注</option>
	          </select>&nbsp;&nbsp;&nbsp;
      		  <jsp:include flush="true" page="/commons/toppagebar.jsp">
				<jsp:param name="target" value="/wf/WfWorkResult!list.do" />
	           </jsp:include>
      		      	</p>
        <div class="clear"></div>
</div>
<form id="listForm" name="listForm" method="post" action="${ctx}/wf/WfWorkResult!list.do">
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
	  	<th >操作结果</th>
	  	<th >操作人</th>
	  	<th >创建人姓名</th>
	  	<th >操作备注</th>
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
					<a href="${ctx}/wf/WfWorkResult!view.do?id=${obj.id}">${obj.proResult}</a>
		</td>
		<td>
					${obj.addUserId}
		</td>
		<td>
					${obj.addUserName}
		</td>
		<td>
					${obj.remark}
		</td>
	</tr>
</c:forEach>
</table>
</form>
   <div class="page">
		<jsp:include flush="true" page="/commons/pagebar.jsp">
			<jsp:param name="target" value="/wf/WfWorkResult!list.do" />
        </jsp:include>
   </div>
  </div>
</div>
<script type="text/javascript">
	$("#shop").smartFloat();  
</script>
</body>
</html>
