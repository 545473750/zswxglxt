<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>流程节点功能点表管理</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
</head>
<body>
<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">首 页</a> &gt; <a href="#">流程节点功能点表管理</a> &gt; 流程节点功能点表列表</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" />
          </p>
      </div>
      <div class="tablelist">
    	 <div class="title">流程节点功能点表管理</div>
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx}/wf/WfInstanceFunction!list.do">
       		<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="32" >名称：</td>		
							<td>
								<input value="${query.name}" id="name" name="query.name" maxlength="100"  class=""/>
							</td>
							<td height="32" >页面url：</td>		
							<td>
								<input value="${query.url}" id="url" name="query.url" maxlength="100"  class=""/>
							</td>
							<td>
								<input type="submit" name="button2" id="button2" value="查 询" />
							</td>
						</tr>
						<tr>
							<td height="32" >参数名称：</td>		
							<td>
								<input value="${query.parName}" id="parName" name="query.parName" maxlength="100"  class=""/>
							</td>
							<td height="32" >功能描述：</td>		
							<td>
								<input value="${query.description}" id="description" name="query.description" maxlength="100"  class=""/>
							</td>
						</tr>
						<tr>
							<td height="32" >功能分类：</td>		
							<td>
								<input value="${query.funType}" id="funType" name="query.funType" maxlength="100"  class=""/>
							</td>
							<td height="32" >节点类型：</td>		
							<td>
								<input value="${query.insType}" id="insType" name="query.insType" maxlength="100"  class=""/>
							</td>
						</tr>
						<tr>
							<td height="32" >分组：</td>		
							<td>
								<input value="${query.groupFlag}" id="groupFlag" name="query.groupFlag" maxlength="100"  class=""/>
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
	        <input type="button" class="but_shop"  onclick="add('${ctx}/wf/WfInstanceFunction!add.do',document.listForm);" value="添加" />
          <input type="button" class="but_shop"  onclick="edit('${ctx}/wf/WfInstanceFunction!edit.do','items',document.listForm);" value="修改" />
          <input type="button" class="but_shop"  onclick="batchDelete('${ctx}/wf/WfInstanceFunction!remove.do','items',document.listForm);" value="删除" />
        </td>
      </tr>
    </table>
</div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/wf/WfInstanceFunction!list.do">
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
	  	<th >页面url</th>
	  	<th >参数名称</th>
	  	<th >功能描述</th>
	  	<th >功能分类</th>
	  	<th >节点类型</th>
	  	<th >分组</th>
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
					<a href="${ctx}/wf/WfInstanceFunction!view.do?id=${obj.id}">${obj.name}</a>
		</td>
		<td>
					${obj.url}
		</td>
		<td>
					${obj.parName}
		</td>
		<td>
					${obj.description}
		</td>
		<td>
					${obj.funType}
		</td>
		<td>
					${obj.insType}
		</td>
		<td>
					${obj.groupFlag}
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
					<jsp:param name="target" value="/wf/WfInstanceFunction!list.do" />
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
