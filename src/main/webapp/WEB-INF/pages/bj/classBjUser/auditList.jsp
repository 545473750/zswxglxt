<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>报名管理(个人报名)</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>
<body>
<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">教学教务</a> &gt; <a href="#">报名管理</a> &gt; 审核列表</p>
      </div>
      <div class="tablelist">
    	 <div class="title">审核列表</div>
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassBjUser!auditList.do">
       		<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="32" >招生标题：</td>		
							<td>
								<input value="${query.title}" id="title" name="query.title" maxlength="100"  class=""/>
							</td>
							<td height="32" >审核状态：</td>		
							<td>
								<select id="query.admitState" name="query.admitState" >
									<option value="0" <c:if test="${query.admitState==0 }"> selected="selected" </c:if>>审核中</option>
									<option value="1" <c:if test="${query.admitState!=0 }"> selected="selected" </c:if>>已审核</option>
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
         <c:if test="${query.admitState == 0}">
          <input type="button" class="but_cz"  onclick="audit('${ctx}/bj/ClassBjUser!audit.do','items',document.listForm);" value="报名审核" />
          <!--
          <input type="button" class="but_cz"  onclick="" value="审核通过"/>
          <input type="button" class="but_cz"  onclick="" value="审核不通过"/>
         -->
         </c:if>
        </td>
      </tr>
    </table>
</div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassRecruit!list.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<c:if test="${query.admitState == 0}">
	    <th width="30">
	  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
	    </th>
	    </c:if>
	  	<th width="50">序号</th>
	  	<th >招生标题</th>
	  	<th >报名时间</th>
	  	<th >招生对象</th>
	  	<th>申报人</th>
	  	<th>报名时间</th>
	</tr>
	<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<c:if test="${query.admitState == 0}">
		<td>
			<input type="checkbox" name="items" value="id=${obj.id}&">
			<input type="hidden" name="objId" value="${obj.classTermRecruit.classRecruit.id }"/>
		</td>
		</c:if>
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
				<c:if test="${query.admitState == 1}">
					<a href="${ctx}/bj/ClassBjUser!audit.do?id=${obj.id}">${obj.classTermRecruit.classRecruit.title}</a>
				</c:if>
				<c:if test="${query.admitState == 0}">
					${obj.classTermRecruit.classRecruit.title}
				</c:if>
		</td>
		<td>
					<fmt:formatDate value="${obj.classTermRecruit.classRecruit.startTime}" pattern="yyyy-MM-dd"/>
					至
					<fmt:formatDate value="${obj.classTermRecruit.classRecruit.endTime}" pattern="yyyy-MM-dd"/>
		</td>
		<td>
					${obj.classTermRecruit.classBigclass.recruitObj }
		</td>
		<td>
					${obj.user.username }
		</td>
		<td>
					<fmt:formatDate value="${obj.ts}" pattern="yyyy-MM-dd"/>
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
					<jsp:param name="target" value="/bj/ClassRecruit!list.do" />
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
	
function audit(action,checkboxName,form){
	if (!hasOneChecked(checkboxName)){
        alert('请选择要操作的对象!');
        return;
	} else {
		var items = document.getElementsByName(checkboxName);
		var itemId = null;
		var count = 0;
		for (var i = 0; i < items.length; i++){
	        if (items[i].checked == true){
	       		itemId = items[i].value;
				count++;
	        }
	    }
		if (count != 1) {
	    	alert('请选择一项!');
	        return;
	    }else {
	    	form.action = action + "?" + itemId;
	        form.submit();
	    }
	}
}
</script>
</body>
</html>
