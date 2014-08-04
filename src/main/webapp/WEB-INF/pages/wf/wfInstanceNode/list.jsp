<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>流程实例节点表管理</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
</head>
<body>
<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">首 页</a> &gt; <a href="#">流程实例节点表管理</a> &gt; 流程实例节点表列表</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" />
          </p>
      </div>
      <div class="tablelist">
    	 <div class="title">流程实例节点表管理</div>
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx}/wf/WfInstanceNode!list.do">
       		<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="32" >名称：</td>		
							<td>
								<input value="${query.name}" id="name" name="query.name" maxlength="100"  class=""/>
							</td>
							<td height="32" >节点顺序：</td>		
							<td>
								<input value="${query.orderNum}" id="orderNum" name="query.orderNum" maxlength="100"  class=""/>
							</td>
							<td>
								<input type="submit" name="button2" id="button2" value="查 询" />
							</td>
						</tr>
						<tr>
							<td height="32" >节点类型：</td>		
							<td>
								<input value="${query.actType}" id="actType" name="query.actType" maxlength="100"  class=""/>
							</td>
							<td height="32" >节点状态：</td>		
							<td>
								<input value="${query.actFlag}" id="actFlag" name="query.actFlag" maxlength="100"  class=""/>
							</td>
						</tr>
						<tr>
							<td height="32" >功能描述：</td>		
							<td>
								<input value="${query.description}" id="description" name="query.description" maxlength="100"  class=""/>
							</td>
							<td height="32" >扩展字段1：</td>		
							<td>
								<input value="${query.extFiled1}" id="extFiled1" name="query.extFiled1" maxlength="100"  class=""/>
							</td>
						</tr>
						<tr>
							<td height="32" >扩展字段2：</td>		
							<td>
								<input value="${query.extFiled2}" id="extFiled2" name="query.extFiled2" maxlength="100"  class=""/>
							</td>
							<td height="32" >扩展字段3：</td>		
							<td>
								<input value="${query.extFiled3}" id="extFiled3" name="query.extFiled3" maxlength="100"  class=""/>
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
	        <input type="button" class="but_shop"  onclick="add('${ctx}/wf/WfInstanceNode!add.do',document.listForm);" value="添加" />
          <input type="button" class="but_shop"  onclick="edit('${ctx}/wf/WfInstanceNode!edit.do','items',document.listForm);" value="修改" />
          <input type="button" class="but_shop"  onclick="batchDelete('${ctx}/wf/WfInstanceNode!remove.do','items',document.listForm);" value="删除" />
        </td>
      </tr>
    </table>
</div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/wf/WfInstanceNode!list.do">
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
	  	<th >名称</th>
	  	<th >节点顺序</th>
	  	<th >节点类型</th>
	  	<th >节点状态</th>
	  	<th >功能描述</th>
	  	<th >扩展字段1</th>
	  	<th >扩展字段2</th>
	  	<th >扩展字段3</th>
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
					<a href="${ctx}/wf/WfInstanceNode!view.do?id=${obj.id}">${obj.name}</a>
		</td>
		<td>
					${obj.orderNum}
		</td>
		<td>
					${obj.actType}
		</td>
		<td>
					${obj.actFlag}
		</td>
		<td>
					${obj.description}
		</td>
		<td>
					${obj.extFiled1}
		</td>
		<td>
					${obj.extFiled2}
		</td>
		<td>
					${obj.extFiled3}
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
					<jsp:param name="target" value="/wf/WfInstanceNode!list.do" />
		        </jsp:include>
        	</div>
           </td>
        </tr>
       </table>
   </div>
  </div>
  </div>
</div>
</body>
</html>
