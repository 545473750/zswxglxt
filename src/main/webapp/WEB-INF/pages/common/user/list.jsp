<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>用户列表</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
  </head>
  
<body style="width: 550px;">

  <div class="right">
  <div class="llistbox" style="border: 0px solid red;">
    <div class="tablelist">
    <div class="centent">
      <div class="search">
        <form id="queryForm" name="queryForm" method="post" action="${ctx}/common/CommonUser!list.do">
			<input type="hidden" name="teacher" value="${teacher }"/>
        	<label>
        		名称：
        		<input value="${username}" id="username" name="username" maxlength="100"  class=""/> 
        	</label>  
        	<label>
        		所在单位：
        		<input type="text" value="${deptName }" id="deptName" name="deptName" maxlength="100" size="30"/>
        	</label>
        	<label>
        		<input type="submit" value="查询"  id="button2" name="button2"   />
        	</label>  
        </form>
        <div class="clear"></div>
      </div>

<div class="table01">
<form id="listForm" name="listForm" method="post" action="${ctx}/common/CommonUser!list.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<input type="hidden" name="teacher" value="${teacher }"/>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
	    <th width="30">
	    </th>
	  	<th width="50">序号</th>
	  	<th>继教号</th>
	  	<th>姓名</th>
	  	<th>单位</th>
	</tr>
<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td align="center">
			<input type="radio" name="items" value="${obj.id}"/>
			<input type="hidden" id="${obj.id }_name"  value="${obj.username}"/>
		</td>
		<td align="center">
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td align="center">
			${obj.userNum}
		</td>
		<td align="center">
			${obj.username }
		</td>
		<td align="center">
			${obj.unitName}
		</td>
	</tr>
</c:forEach>
	<tr>
		<td colspan="5" align="center">
			<input type="button" class="but_cz" onclick="adduser('items',document.listForm);" value="添加" />
		</td>
	</tr>
</table>
</form>
</div>
	   <div class="page">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
	    	 <tr>
	           <td width="70%">
	            <div class="pages">
					<jsp:include flush="true" page="/commons/pagebar.jsp">
						<jsp:param name="target" value="${ctx}/common/CommonUser!list.do" />
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
function adduser(checkboxName,form){
	
    if (!hasOneChecked(checkboxName)){
            alert('请选择要操作的对象!');
            return;
    }
    var userid = $(":checked[name=items]").val();
    var userName=$("#"+userid+"_name").val();
    window.parent.selectItems(userName,userid);
    window.parent.closeDialogNoRefresh();
}
</script>
</div>
</body>
</html>
