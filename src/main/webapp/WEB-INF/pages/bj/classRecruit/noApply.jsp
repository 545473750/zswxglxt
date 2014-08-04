<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>招生管理</title>
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
          <p class="dqwz">当前位置：<a href="#">教学教务</a> &gt; <a href="#">培训班报名</a> &gt; 报名列表</p>
      </div>
      <div class="tablelist">
    	 <div class="title">
    	 	 <c:if test="${type == 2}">个人报名管理</c:if>
    	 	 <c:if test="${type == 3}">集体报名管理</c:if>
    	 </div>
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassRecruit!applyList.do">
       		<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="32" >招生标题：</td>		
							<td>
								<input value="${query.title}" id="title" name="query.title" maxlength="100"  class=""/>
							</td>
							<td height="32" >是否已报名：</td>		
							<td>
								<select id="bmState" name="bmState" >
									<option value="0" <c:if test="${bmState==0 }"> selected="selected" </c:if>>未报名</option>
									<option value="1" <c:if test="${bmState==1 }"> selected="selected" </c:if>>已报名</option>
								</select>
							</td>
							<td>
								<c:if test="${type == 2}">
								<input type="button" name="button2" id="button2" class="but_cz" value="查 询" onclick="seach('${ctx}/bj/ClassRecruit!applyList.do',document.queryForm)" />
								</c:if>
								<c:if test="${type == 3}">
								<input type="button" name="button2" id="button2" class="but_cz"	 value="查 询" onclick="seach('${ctx}/bj/ClassRecruit!applySet.do',document.queryForm)" />
								</c:if>
							</td>
						</tr>
						<tr>
							<td height="32" >报名时间：</td>		
							<td colspan="4">
								<input value="<fmt:formatDate value="${query.startTime}" pattern="yyyy-MM-dd"/>" id="startTime" name="query.startTime" onclick='WdatePicker({isShowClear:true,readOnly:true})' maxlength="100"  class=""/>
							至
								<input value="<fmt:formatDate value="${query.endTime}" pattern="yyyy-MM-dd"/>" id="endTime" name="query.endTime" onclick='WdatePicker({isShowClear:true,readOnly:true})' maxlength="100"  class=""/>
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
          <c:if test="${type == 2}">
          	<input type="button" class="but_cz"  onclick="apply('${ctx}/bj/ClassRecruit!toBj.do','items',document.listForm);" value="个人报名" />
          </c:if>
          <c:if test="${type == 3}">
          	<input type="button" class="but_cz"  onclick="jtbm('${ctx}/bj/ClassRecruit!toBj.do','items',document.listForm)" value="集体报名"/>
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
<input type="hidden" name="type" value="${type }"/>
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="text-align: center;">
	<tr>
	    <th width="30">
	  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
	    </th>
	  	<th width="50">序号</th>
	  	<th >招生标题</th>
	  	<th >开始时间</th>
	  	<th >结束时间</th>
	  	<th >招生对象</th>
	</tr>
	<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td>
			<input type="checkbox" name="items" value="id=${obj.id}&">
			<input type="hidden" name="ids" value="${obj.id }"/>
			<input type="hidden" name="startTimes" value="${obj.startTime }"/>
			<input type="hidden" name="endTimes" value="${obj.endTime }"/>
		</td>
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
			<c:if test="${type == 2}">
				<c:if test="${fn:length(obj.title)>10}">
					<a href="${ctx}/bj/ClassRecruit!detailed.do?id=${obj.id}&type=2&bmState=${bmState}" title="${obj.title }">
						${fn:substring(obj.title,0,10)}...
					</a>
				</c:if>
				<c:if test="${fn:length(obj.title)<=10}">
					<a href="${ctx}/bj/ClassRecruit!detailed.do?id=${obj.id}&type=2&bmState=${bmState}">
						${obj.title}
					</a>
				</c:if>
			</c:if>
			<c:if test="${type ==3}">
				<c:if test="${fn:length(obj.title)>10}">
					<a href="${ctx}/bj/ClassRecruit!detailed.do?id=${obj.id}&type=3&bmState=${bmState}">
						${fn:substring(obj.title,0,10)}...
					</a>
				</c:if>
				<c:if test="${fn:length(obj.title)<=10}">
					<a href="${ctx}/bj/ClassRecruit!detailed.do?id=${obj.id}&type=3&bmState=${bmState}">
						${obj.title}
					</a>
				</c:if>
			</c:if>
		</td>
		<td>
					<fmt:formatDate value="${obj.startTime}" pattern="yyyy-MM-dd"/>
		</td>
		<td>
					<fmt:formatDate value="${obj.endTime}" pattern="yyyy-MM-dd"/>
		</td>
		<td>
					${obj.recruitObj }
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
function getCurrentDate(){
	var myDate = new Date();
	var year = myDate.getFullYear();    //获取完整的年份(4位,1970-????)
	var month = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var day = myDate.getDate();        //获取当前日(1-31)
	var currentDate = year + '-';
	if(month < 10){
		month = '0' + month;
	}
	currentDate += month + '-';
	if(day < 10){
		day = '0' + day;
	}
	currentDate += day;
	return currentDate;
}
function seach(action,form){
	form.action = action;
	form.submit();
}
function apply(action,checkboxName,form){
	if (!hasOneChecked(checkboxName)){
        alert('请选择要操作的对象!');
        return;
	} else {
		var items = document.getElementsByName(checkboxName);
		var startTimes = document.getElementsByName("startTimes");
		var endTimes = document.getElementsByName("endTimes");
		var ids = document.getElementsByName("ids");
		var itemId = null;
		var statrTime = null;
		var endTime = null;
		var count = 0;
		for(var i = 0 ;i < items.length; i++){
			if(items[i].checked == true){
				count++;
				if(itemId == null){
					itemId = ids[i].value;
				}else{
					itemId = itemId + ',' +ids[i].value;
				}
				startTime = startTimes[i].value;
				endTime = endTimes[i].value;
				if(startTime>getCurrentDate()){
					alert("报名时间未到!");
					return;
				}
				if(endTime<getCurrentDate()){
					alert("报名时间已过!");
					return;
				}
			}
		}
		if(count!=1){
			alert('请选择一项!');
	        return;
		}
		$.ajax({
			type:"post",
			url:"${ctx}/bj/ClassRecruit!check.do",
			data:"itemId="+itemId,
			success:function(data){
				if(data == "1"){
					alert("已被成为班级成员，不用再报名");
					return;
				}else{
				    	form.action = action +"?id="+itemId;
				        form.submit();
				}
			}
		});
	   	
	}
}
function jtbm(action,checkboxName,form){
	if(!hasOneChecked(checkboxName)){
		alert('请选择要操作的对象!');
        return;
	} else {
		var items = document.getElementsByName(checkboxName);
		var ids = document.getElementsByName("ids");
		var startTimes = document.getElementsByName("startTimes");
		var endTimes = document.getElementsByName("endTimes");
		var statrTime = null;
		var endTime = null;
		var itemId = null;
		var count = 0;
		for(var i = 0 ;i < items.length; i++){
			if(items[i].checked == true){
				count++;
				itemId = ids[i].value;
				startTime = startTimes[i].value;
				endTime = endTimes[i].value;
				if(startTime>getCurrentDate()){
					alert("报名时间未到!");
					return;
				}
				if(endTime<getCurrentDate()){
					alert("报名时间已过!");
					return;
				}
			}
		}
		if(count != 1){
			alert("请选择一项");
			return;
		}
    	form.action = action + "?id=" +itemId;
        form.submit();
	}
}
</script>
</body>
</html>
