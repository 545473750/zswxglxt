<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>培训班审核</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
</head>
<body>
<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">教师培训</a> &gt; <a href="#">培训班审核</a> &gt; 培训班审核列表</p>
      </div>
      <div class="tablelist">
    	 <div class="title">培训班<c:if test="${query.auditState == 0}">未</c:if><c:if test="${query.auditState == 1}">已</c:if>审核列表</div>
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassBigclass!alreadyAudit.do">
          	<input type="hidden" name="query.state" value="${query.state }"/>
       		<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="32" >班级名称：</td>		
							<td>
								<input value="${query.name}" id="name" name="query.name" maxlength="100"  class=""/>
							</td>
							<td height="32" >培训类别：</td>		
							<td>
								<select id="trainType" name="query.trainType" >
									<option value="">--请选择--</option>
									<c:forEach items="${pxlb}" var = "px">
										<option value="${px.key }" <c:if test="${px.key == query.trainType }">selected="selected" </c:if> >${px.value }</option>
									</c:forEach>
								</select>
							</td>
							<td height="32" >审核状态：</td>
							<td>
								<select id="auditState" name="query.auditState">
									<option value="0" <c:if test="${query.auditState == 0 }">selected="selected"</c:if> >未审</option>	
              						<option value="1" <c:if test="${query.auditState == 1 }">selected="selected"</c:if> >已审</option>
								</select>
							</td>
							<td>
								<input type="button" name="button2" id="button2" value="查 询" onclick="seach()" />
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
          <c:if test="${query.auditState == 0}">
         	 <input type="button" class="but_cz"  onclick="audit('id',document.listForm)" value="审核"/>
          </c:if>
        </td>
      </tr>
    </table>
   </div>
   <div class="clear"></div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassBigclass!audit.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="text-align: center;">
	<tr>
		<c:if test="${query.auditState == 0}">
	    <th width="30">
	  		<input type="checkbox" onclick="setAllCheckboxState('id',this.checked)"/>
	    </th>
	    </c:if>
	  	<th width="50">序号</th>
	  	<th>培训名称</th>
	  	<th>培训类别</th>
	  	<th>课程学时</th>
	  	<th>组班申请时间</th>
	  	<th>申请人</th>
	</tr>
	<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<c:if test="${query.auditState == 0}">
		<td>
			<input type="checkbox" name="id" value="${obj.id}"/>
		</td>
		</c:if>
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
				<c:if test="${fn:length(obj.name)>10}">
					<a href="${ctx}/bj/ClassBigclass!view.do?id=${obj.id}&showState=1&query.state=${obj.state}" title="${obj.name }">
						${fn:substring(obj.name,0,10) }...
					</a>
				</c:if>
				<c:if test="${fn:length(obj.name)<=10}">
					<a href="${ctx}/bj/ClassBigclass!view.do?id=${obj.id}&showState=1&query.state=${obj.state}">${obj.name}</a>
				</c:if>
		</td>
		<td>
					${pxlb[obj.trainType]}
		</td>
		<td>
					${obj.totalHour}
		</td>
		<td>
					<fmt:formatDate value="${obj.ts}" pattern="yyyy-MM-dd"/>
		</td>
		<td>
					${obj.applyUserName }
		</td>
	</tr>
</c:forEach>
</table>
</form>
</div>
	<c:if test="${query.auditState == 0}">
    <div class="page">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	 <tr>
           <td width="70%">
            <div class="pages">
				<jsp:include flush="true" page="/commons/pagebar.jsp">
					<jsp:param name="target" value="${ctx}/bj/ClassBigclass!findAuditList.do" />
		        </jsp:include>
        	</div>
           </td>
        </tr>
       </table>
   </div>
   </c:if>
   <c:if test="${query.auditState == 1}">
   <div class="page">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	 <tr>
           <td width="70%">
            <div class="pages">
				<jsp:include flush="true" page="/commons/pagebar.jsp">
					<jsp:param name="target" value="${ctx}/bj/ClassBigclass!alreadyAudit.do" />
		        </jsp:include>
        	</div>
           </td>
        </tr>
       </table>
   </div>
   </c:if>
  </div>
  </div>
</div>
<script type="text/javascript">
	function audit(checkboxName,form){
		if (!hasOneChecked(checkboxName)){
        	alert('请选择要操作的对象!');
	        return;
		} else {
			var items = document.getElementsByName(checkboxName);
			var itemId = null;
			var count = 0;
			for (var i = 0; i < items.length; i++){
		        if (items[i].checked == true){
		            count++;
		        }
		    }
			if (count != 1) {
		    	alert('请选择一项!');
		        return;
		    } else {
		        form.submit();
		    }
		}
	}

	function seach(){
		var auditState = $("#auditState").val();
		if(auditState == 0){
			$("#queryForm").attr("action","${ctx}/bj/ClassBigclass!findAuditList.do").submit();
		}
		if(auditState == 1){
			$("#queryForm").submit();
		}
	}
</script>

</body>
</html>
