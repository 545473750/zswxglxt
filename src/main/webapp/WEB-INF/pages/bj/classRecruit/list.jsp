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
          <p class="dqwz">当前位置：<a href="#">教学教务</a> &gt; <a href="#">招生管理</a> &gt; 招生列表</p>
      </div>
      <div class="tablelist">
    	 <div class="title">招生管理</div>
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassRecruit!list.do">
       		<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="32" >招生标题：</td>		
							<td>
								<input value="${query.title}" id="title" name="query.title" maxlength="100"  class=""/>
							</td>
							<td height="32" >发布状态：</td>		
							<td>
								<select id="publishState" name="query.publishState" >
									<option value="">--请选择--</option>
									<option value="1" <c:if test="${query.publishState==1 }"> selected="selected" </c:if>>未发布</option>
									<option value="2" <c:if test="${query.publishState==2 }"> selected="selected" </c:if>>进行中</option>
									<option value="3" <c:if test="${query.publishState==3 }"> selected="selected" </c:if>>已结束</option>
								</select>
							</td>
							<td>
								<input type="submit" name="button2" id="button2" value="查 询" />
							</td>
						</tr>
						<tr>
							<td height="32" >报名开始时间：</td>		
							<td>
								<input value="<fmt:formatDate value="${query.startTime}" pattern="yyyy-MM-dd"/>" id="startTime" name="query.startTime" onclick='WdatePicker({isShowClear:true,readOnly:true})' maxlength="100"  class=""/>
							</td>
							<td height="32" >报名结束时间：</td>		
							<td>
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
	      <input type="button" class="but_cz"  onclick="add('${ctx}/bj/ClassRecruit!add.do',document.listForm);" value="添加" />
          <input type="button" class="but_cz"  onclick="edit2('${ctx}/bj/ClassRecruit!edit.do','items',document.listForm);" value="修改" />
          <input type="button" class="but_cz"  onclick="batchDelete('${ctx}/bj/ClassRecruit!remove.do','items',document.listForm);" value="删除" />
         <td align="right">
          <input type="button" class="but_cz"  onclick="batchfb('${ctx}/bj/ClassRecruit!fabuClass.do?state=2','items',document.listForm);" value="发布" />
	      <input type="button" class="but_cz"  onclick="batchStop('${ctx}/bj/ClassRecruit!fabuClass.do?state=3','items',document.listForm);" value="结束" />
	     </td>
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
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="text-align: center;">
	<tr>
	    <th width="30">
	  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
	    </th>
	  	<th width="50">序号</th>
	  	<th >招生标题</th>
	  	<th >报名区间</th>
	  	<th >发布状态</th>
	  	<th >创建人姓名</th>
	</tr>
	<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td>
			<input type="checkbox" name="items" value="id=${obj.id}&">
			<input type="hidden" name="objId" value="${obj.id }"/>
		</td>
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
				<c:if test="${fn:length(obj.title)>10}">
					<a href="${ctx}/bj/ClassRecruit!view.do?id=${obj.id}" title="${obj.title }">
						${fn:substring(obj.title,0,10)}...
					</a>
				</c:if>
				<c:if test="${fn:length(obj.title)<=10}">
					<a href="${ctx}/bj/ClassRecruit!view.do?id=${obj.id}" title="${obj.title }">
						${obj.title}
					</a>
				</c:if>
		</td>
		<td>
					<fmt:formatDate value="${obj.startTime}" pattern="yyyy-MM-dd"/>
		-
					<fmt:formatDate value="${obj.endTime}" pattern="yyyy-MM-dd"/>
		</td>
		<td>
					<c:if test="${obj.publishState==1 }"> 未发布</c:if>
					<c:if test="${obj.publishState==2 }"> 进行中</c:if>
					<c:if test="${obj.publishState==3 }"> 已结束</c:if>
					<input type="hidden" id = "${obj.id }_state" value="${obj.publishState }"/>
		</td>
		<td>
					${obj.addUserName}
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
	function batchfb(action,checkboxName,form){
		if (!hasOneChecked(checkboxName)){
	        alert('请选择要操作的对象!');
	        return;
		} else {
			var items = document.getElementsByName(checkboxName);
			var ids = document.getElementsByName("objId");
			var itemId = null;
			var id = null;
			var count = 0;
			var state = null;
			for (var i = 0; i < items.length; i++){
		        if (items[i].checked == true){
		       		itemId = items[i].value;
		        	id = ids[i].value;
		        	state = $("#"+id+"_state").val();
					count++;
		        }
		    }
			if (count != 1) {
		    	alert('请选择一项!');
		        return;
		    }else if(state == 2){
		    	alert("已发布!");
		    	return;
		    }else if (state == 3){
		    	alert('已结束!');
		    	return;
		    }else {
		    	form.action = action;
		        form.submit();
		    }
		}
}
function batchStop(action,checkboxName,form){
	if (!hasOneChecked(checkboxName)){
	        alert('请选择要操作的对象!');
	        return;
		} else {
			var items = document.getElementsByName(checkboxName);
			var ids = document.getElementsByName("objId");
			var itemId = null;
			var id = null;
			var count = 0;
			var state = null;
			for (var i = 0; i < items.length; i++){
		        if (items[i].checked == true){
		       		itemId = items[i].value;
		        	id = ids[i].value;
		        	state = $("#"+id+"_state").val();
					count++;
		        }
		    }
			if (count != 1) {
		    	alert('请选择一项!');
		        return;
		    }else if (state == 3){
		    	alert('已结束!');
		    	return;
		    }else {
		    	form.action = action;
		        form.submit();
		    }
		}
}
function edit2(action,checkboxName,form){
	if (!hasOneChecked(checkboxName)){
        alert('请选择要操作的对象!');
        return;
	} else {
		var items = document.getElementsByName(checkboxName);
		var ids = document.getElementsByName("objId");
		var itemId = null;
		var id = null;
		var count = 0;
		var state = null;
		for (var i = 0; i < items.length; i++){
	        if (items[i].checked == true){
	       		itemId = items[i].value;
	        	id = ids[i].value;
	        	state = $("#"+id+"_state").val();
				count++;
	        }
	    }
		if (count != 1) {
	    	alert('请选择一项!');
	        return;
	    }else if (state == 2){
	    	alert('正在进行中，不能修改');
	    }else if (state == 3){
	    	alert('已结束，不能修改!');
	    	return;
	    }else {
	    	form.action = action + "?" + itemId;
	        form.submit();
	    }
	}
}
function batchDelete(action,checkboxName,form){
	if (!hasOneChecked(checkboxName)){
        alert('请选择要操作的对象!');
        return;
	} else {
		var items = document.getElementsByName(checkboxName);
		var ids = document.getElementsByName("objId");
		var itemId = null;
		var id = null;
		var state = null;
		for (var i = 0; i < items.length; i++){
	        if (items[i].checked == true){
	       		itemId = items[i].value;
	        	id = ids[i].value;
	        	state = $("#"+id+"_state").val();
	        }
	    }
		if (state == 2){
	    	alert('正在进行中，不能删除');
	    }
	    ///else if (state == 3){
	    	//alert('已结束，不能删除!');
	    	//return;
	    //}
	    else {
	    	if(confirm("确定执行[删除]操作?")){
		    	form.action = action;
		        form.submit();
	        }
	    }
	}
}
</script>
</body>
</html>
