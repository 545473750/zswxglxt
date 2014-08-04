<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>培训班管理</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
</head>
<body>
<div class="right">
  <div class="llistbox">
      <div class="tablelist">
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassTerm!classlist.do">
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
							
							<td>
								<input type="submit" name="button2" id="button2" value="查 询" />
							</td>
						</tr>
        	</table>
        </form>
        <div class="clear"></div>
      </div>
   <div class="clear"></div>
<div class="table01" align="center">
<form id="dataform" name="dataform" method="post" action="">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
	    <!--
	    <th width="30">
	  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
	    </th>
	  	-->
	  	<th></th>
	  	<th width="50">序号</th>
	  	<th>培训班名称</th>
	  	<th>期数</th>
	  	<th>学科</th>
	  	<th>培训类别</th>
	  	<th>课程学时</th>
	  	<th>学分</th>
	  	<th>培训期间</th>
	</tr>
	<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td>
			<c:if test="${obj.checked==1}">
					<input type="radio" name="items" id="items" value="${obj.id}" checked="checked"/>
			</c:if>
			<c:if test="${obj.checked!=1}">
					<input type="radio" name="items" id="items" value="${obj.id}"/>
			</c:if>
			<input type="hidden" name="ids" value="${obj.id }"/>
		</td>
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
					<a href="${ctx}/bj/ClassBigclass!view.do?id=${obj.classBigclass.id}">${obj.classBigclass.name}</a>
					<input type="hidden" name="username2" value="${obj.classBigclass.name}"/>
		</td>
		<td>
					${obj.name }
		</td>
		<td>
					${xk[obj.classBigclass.subject] }
		</td>
		<td>
					${pxlb[obj.classBigclass.trainType]}
		</td>
		<td>
					${obj.classBigclass.totalHour}
		</td>
		<td>
					${obj.classBigclass.prepareScore }
		</td>
		<td>
					<input type="hidden" name="maxDate" value="${obj.startTime }" />
					<fmt:formatDate value="${obj.startTime}" pattern="yyyy-MM-dd"/>
					至
					<fmt:formatDate value="${obj.endTime}" pattern="yyyy-MM-dd"/>
		</td>
	</tr>
</c:forEach>
	<tr>
		<td colspan="9" bgcolor="#DDDDDD">
			<input type="button" value="提 交" class="but_cz" id="btn" onclick="addUnitId('items',document.listForm);"/>
			<input type="button" value="取 消" class="but_cz" onclick="cancle()" />
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
					<jsp:param name="target" value="/bj/Bigclass!unitlist.do" />
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
function addUnitId(checkboxName,form){
    if (!hasOneChecked(checkboxName)){
            alert('请选择要操作的对象!');
            return;
    }
    var items = document.getElementsByName(checkboxName);
    var username2 = document.getElementsByName("username2");
    var maxDates = document.getElementsByName("maxDate");
    var id = null;
    var name = null;
    var maxDate = null;
    //var count = null;
    for(var i = 0; i < items.length; i++){
    	if(items[i].checked == true){
    		//count++;
        	if(id == null){
        		id = items[i].value;
            }else{
				id +=","+items[i].value;
            }
        	if(name == null){
        		name = username2[i].value;
            }else{
            	name +=","+username2[i].value;
            }
           // if(maxDate == null){
            	maxDate = maxDates[i].value;
           // }else{
           // 	maxDate += ","maxDates[i].value;
           // }
    	}
    }
    //if(count > 1){
    	//alert("只能选一项");
    	//return;
    //}
    parent.mainFrame.window.setIdByUnit(id,name,maxDate);
    window.parent.closeDialog();
}

function cancle(){
	window.parent.closeDialog();
}
	
</script>

</body>
</html>
