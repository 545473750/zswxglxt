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
          <p class="dqwz">当前位置：<a href="#">教师培训</a> &gt; <a href="#">专家组管理</a> &gt; 专家组列表</p>
      </div>
      <div class="tablelist">
    	 <div class="title">专家组管理</div>
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx}/common/Experts!list.do">
       		<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="32" >名称：</td>		
							<td>
								<input value="${query.name}" id="name" name="query.name" maxlength="100"  class=""/>
							</td>
							<td height="32" >分类：</td>		
							<td>
								<select id="userFlag" name="query.userFlag">
				              		<option value="" >---请选择---</option>
									<option value="1" <c:if test="${1 == query.userFlag }">selected="selected" </c:if>>申报课程专家</option>
									<option value="2" <c:if test="${2 == query.userFlag }">selected="selected" </c:if>>选单课程专家</option>
									<option value="3" <c:if test="${3 == query.userFlag }">selected="selected" </c:if>>组班专家</option>
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
<div class="page">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>
	        <input type="button" class="but_cz"  onclick="add('${ctx}/common/Experts!add.do',document.listForm);" value="添加专家组" />
          <input type="button" class="but_cz"  onclick="edit('${ctx}/common/Experts!edit.do','items',document.listForm);" value="修改专家组" />
          <input type="button" class="but_cz"  onclick="batchDelete('${ctx}/common/Experts!remove.do','items',document.listForm);" value="删除专家组" />
        </td>
      </tr>
    </table>
</div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/common/Experts!list.do">
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
	  	<th >分类</th>
	  	<th >专家组人数</th>
	  	<th >创建时间</th>
	  	<th >操作</th>
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
				<c:if test="${fn:length(obj.name)>10}">
					<a href="${ctx}/common/Experts!view.do?id=${obj.id}" title="${obj.name }">
						${fn:substring(obj.name,0,10) }...
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
					${fn:length(obj.expertsUsers) }
		</td>
		<td>
					${obj.ts }
		</td>
		<td>
					<a href="${ctx}/common/ExpertsUser!list.do?query.experts.id=${obj.id}">专家组管理</a>
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
					<jsp:param name="target" value="/common/Experts!list.do" />
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
