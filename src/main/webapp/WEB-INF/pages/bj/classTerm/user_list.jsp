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
  
<body>

  <div class="right">
  <div class="llistbox">
    <div class="tablelist">
    	 <div class="title">用户列表</div>
    <div class="centent">
      <div class="search">
        <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassTerm!userList.do">
        	<input type="hidden" name="teacher" value="${teacher }"/>
			<input type="hidden" name="type" value="${type }"/>
        	<table>
			<tr>
				<td>名称：</td>
				<td><input value="${username}" id="username" name="username" maxlength="100" size="30" class=""/> </td>
				<td>继教号：</td>
				<td><input value="${userNum}" id="userNum" name="userNum" maxlength="100" class=""/></td>
			</tr>
			<tr>
				<td>所在单位：</td>
				<td><input type="text" value="${orgName }" id="orgName" name="orgName" maxlength="100" size="30"/></td>
				<td colspan="2" align="right"><input type="submit" value="查询" id="button2" name="button2" /></td>
			</tr>
		</table>
        </form>
        <div class="clear"></div>
      </div>

<div class="table01">
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassTerm!userList.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<input type="hidden" name="teacher" value="${teacher }"/>
<input type="hidden" name="type" value="${type }"/>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
	    <th width="30">
	    </th>
	  	<th width="50">序号</th>
	  	<th>继教号</th>
	  	<th >姓名</th>
	  	<th>单位</th>
	</tr>
<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td align="center">
			<input type="radio" name="items" value="${obj.userId}">
			<input type="hidden" id="${obj.userId }_name" value="${obj.user.username}"/>
		</td>
		<td align="center">
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td align="center">
			${obj.user.userNum }
		</td>
		<td align="center">
			${obj.user.username}
		</td>
		<td align="center">
			${obj.organization.name }
		</td>
	</tr>
</c:forEach>
</table>
</form>
</div>
<div class="page" style="text-align: center; margin-bottom: 8px;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	 <tr>
           <td>
			<input type="button" class="but_cz"  onclick="adduser('items',document.listForm);" value="提交" />
			<input type="button" class="but_cz"  onclick="closeDialog2()" value="取消"/>
			</td>
		  </tr>
	</table>
   </div>
   <div class="page">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	 <tr>
           <td width="70%">
            <div class="pages">
				<jsp:include flush="true" page="/commons/pagebar.jsp">
					<jsp:param name="target" value="/bj/ClassTerm!userList.do?teacher=${teacher}&type=${type }&teacherIds=${teacherIds }&username=${username }&orgName=${orgName }&userNum=${userNum }" />
		        </jsp:include>
		    </div>
		   </td>
		  </tr>
	</table>
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
    var username=$("#"+userid+"_name").val();
    parent.mainFrame.window.setTeacherName("${teacher}",username,userid);
    window.parent.closeDialog();
}
function closeDialog2(){
	window.parent.closeDialog();
}
	//$("#shop").smartFloat();  
</script>
</div>
</body>
</html>
