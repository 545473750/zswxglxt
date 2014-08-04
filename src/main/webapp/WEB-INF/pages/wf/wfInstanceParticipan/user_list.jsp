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
        <form id="queryForm" name="queryForm" method="post" action="${ctx}/wf/WfInstanceParticipan!userlist.do">
        	<input type="hidden" name="activityId" value="${activityId }" />
			<input type="hidden" name="proId" value="${proId }"/>
        	<label>
        		名称：
        		<input value="${username}" id="username" name="username" maxlength="100"  class=""/> 
        	</label>  
        	<label>
        		<input type="submit" value="查询"   class="but_cz" />
        	</label>  
        </form>
        <div class="clear"></div>
      </div>


<div class="shop" id="shop">
        <p class="left">
          
        </p>
        <div class="clear"></div>
</div>

<div class="table01">
<form id="listForm" name="listForm" method="post" action="${ctx}/wf/WfInstanceParticipan!userlist.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<input type="hidden" name="objId" value="${objId }" />
<input type="hidden" name="groupFlag" value="${groupFlag }"/>
<input type="hidden" name="reftype" value="1" />
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
	    <th width="30">
	    </th>
	  	<th width="50">序号</th>
	  	<th >名称</th>
	</tr>
<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" onMouseOver=this.className="highlight" onMouseOut=this.className="${vs.count % 2 == 0 ? 'jg' : ''}">
		<td align="center">
			<input type="radio" name="items" value="id=${obj.userId}&">
			<input type="hidden" name="objId" value="${obj.userId }"/>
			<input type="hidden" name="username" value="${obj.user.username}"/>
		</td>
		<td align="center">
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td align="center">
					${obj.user.username}
		</td>
	</tr>
</c:forEach>
	<tr>
		<td colspan="3" align="center">
			<input type="button" class="but_cz"  onclick="adduser('${ctx}/wf/WfInstanceParticipan!addparticipant.do','items',document.listForm);" value="添加" />
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
					<jsp:param name="target" value="/wf/WfInstanceParticipan!userlist.do" />
		        </jsp:include>
		    </div>
		   </td>
		  </tr>
	</table>
   </div>
  </div>
</div>
<script type="text/javascript">
function adduser(action,checkboxName,form){
    if (!hasOneChecked(checkboxName)){
            alert('请选择要操作的对象!');
            return;
    }
    var items = document.getElementsByName(checkboxName);
    var usernames = document.getElementsByName("username");
    var username = null;
    for(var i = 0; i < items.length; i++){
    	if(items[i].checked == true){
    		username = usernames[i];
    	}
    }
    form.action = action;
    parent.mainFrame.window.setheadTeacher(username);
    form.submit();
}
function goBack(){
	location.href="${ctx }/wf/WfInstanceParticipan!list.do?query.insId=${insId}&query.wfInstanceNode.actFlag=${actFlag}";
}
	//$("#shop").smartFloat();  
</script>
</div>
</body>
</html>
