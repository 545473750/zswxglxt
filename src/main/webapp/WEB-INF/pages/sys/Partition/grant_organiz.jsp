<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>单位列表</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
  </head>
  
<body style="width: 550px;">

  <div class="right" style="width: 550px; height: 480px;overflow-y: auto;overflow-x: hidden;">
  <div class="llistbox" style="border: 0px solid red;">
    <div class="tablelist">
    <div class="centent">
      <div class="search">
        <form id="queryForm" name="queryForm" method="post" action="${ctx}/sys/Partition!toGrantOrganizPage.do">
			<input type="hidden" name="id" value="${id }"/>
        	<label>
        		名称：
        		<input value="${query.name}" id="name" name="query.name" maxlength="100"  class=""/> 
        	</label>  
        	<label>
        		<input type="submit" value="查询"   class="but_cz" />
        	</label>  
        </form>
        <div class="clear"></div>
      </div>

<div class="table01">
<form id="listForm" name="listForm" method="post" action="${ctx}/sys/Partition!grantOrganiz.do">
<input type="hidden" name="oldOrgIds" value="${model.orgIds }" />
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
<input type="hidden" name="id" value="${id }"/>
</span>
<input type="hidden" name="teacher" value="${teacher }"/>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
	    <th width="30">
	    </th>
	  	<th width="50">序号</th>
	  	<th >名称</th>
	</tr>
<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td align="center">
			<input type="checkbox" <c:if test="${obj.checked=='checked' }">checked="checked"</c:if> name="orgIds"  value="${obj.id}" />
		</td>
		<td align="center">
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td align="center">
					${obj.name}
		</td>
	</tr>
</c:forEach>
	<tr>
		<td colspan="3" align="center">
			<input type="submit" class="but_cz"   value="保存" />
		</td>
	</tr>
</table>
</form>

</div>
<!-- 
	   <div class="page">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
	    	 <tr>
	           <td width="70%">
	            <div class="pages">
					<jsp:include flush="true" page="/commons/pagebar.jsp">
						<jsp:param name="target" value="${ctx}/sys/Partition!toGrantOrganizPage.do?id=${id }" />
			        </jsp:include>
			    </div>
			   </td>
			  </tr>
		</table>
	   </div>
	   -->
  </div>
   
</div>
</div>
<script type="text/javascript">
function save(){
	document.listForm.submit();
 //   window.parent.closeDialogById("grantOrganizDialog");
}
</script>
</div>
</body>
</html>
