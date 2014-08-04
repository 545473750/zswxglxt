<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>流程表管理</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
</head>
<body>
<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">首 页</a> &gt; <a href="#">流程管理</a> &gt; 流程列表</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" />
          </p>
      </div>
      <div class="tablelist">
    	 <div class="title">流程添加</div>
      <div class="search">
        <form id="queryForm" name="queryForm" method="post" action="${ctx}/wf/WfProjectOrg!add.do">
        <table border="0" cellspacing="0" cellpadding="0">
        	<tr>
        		<td>
        		名称：
        		<input value="${query.name}" id="name" name="query.name" maxlength="100"  class=""/> 
        		</td>  
        		<td>
        		所在组：
        		<select id="groupFlag" name="query.groupFlag" >
					<option value="">--请选择--</option>
					<option value="1" <c:if test="${query.groupFlag == 1 }">selected="selected"</c:if> >课程</option>
					<option value="2" <c:if test="${query.groupFlag == 2 }">selected="selected"</c:if> >组班</option>
					<option value="3" <c:if test="${query.groupFlag == 3 }">selected="selected"</c:if> >协作组</option>
					<option value="4" <c:if test="${query.groupFlag == 4 }">selected="selected"</c:if> >公文</option>
				</select>
        		</td> 
        		<td>
        		<input type="submit" name="button2" id="button2" value="查询" />
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
          <input type="button" class="but_cz"  onclick="add('${ctx}/wf/WfProjectOrg!saveAdd.do',document.listForm);" value="添加" />
        </td>
      </tr>
    </table>
</div>
<div class="clear"></div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/wf/WfProject!list.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
	    <th width="30">
	  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
	    </th>
	  	<th width="50">序号</th>
	  	<th >名称</th>
	  	<th >所在组</th>
	  	<th >添加人姓名</th>
	  	<th >最后更新时间</th>
	  	<th >描述</th>
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
					<a href="${ctx}/wf/WfProject!view.do?id=${obj.id}">${obj.name}</a>
		</td>
		<td>
					<c:forEach items="${szz}" var="s">
						<c:if test = "${s.key == obj.groupFlag}">${s.value}</c:if>
					</c:forEach>
		</td>
		<td>
					${obj.addUserName}
		</td>
		<td>
					<fmt:formatDate value="${obj.updateTime}" pattern="yyyy-MM-dd"/>
		</td>
		<td>
					${obj.description}
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
					<jsp:param name="target" value="/wf/WfProject!list.do" />
		        </jsp:include>
   			</div>
           </td>
        </tr>
       </table>
   </div>
  </div>
</div>
<script type="text/javascript">
	//$("#shop").smartFloat();  
</script>
</body>
</html>
