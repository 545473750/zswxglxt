<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>流程管理</title>
		<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css" rel="stylesheet" />
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
		
		<script src="${ctx}/scripts/application.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
		<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
		<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
		<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
</head>

<body>
		<div class="main">
			<div class="maintit">
				<h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" /> 流程管理</h2>
			</div>

			<div class="centent">
				<div class="search">
					<form id="queryForm" name="queryForm" method="post" action="${ctx}/wf/WfProject!list.do">
						<label>
							名称：
        					<input value="${query.name}" id="name" name="query.name" maxlength="100"  class=""/> 
						</label>
						<label>
							<input type="submit" value="检 索" class="btn_search" onMouseOver="this.className='btn_search_over'" onMouseOut="this.className='btn_search'" />
						</label>
					</form>
					<div class="clear"></div>
				</div>

				<div class="shop" id="shop">
					<p class="left">
						<input type="button" class="but_shop"  onclick="add('${ctx}/wf/WfProject!add.do',document.listForm);" value="添加" />
				        <input type="button" class="but_shop"  onclick="edit2('${ctx}/wf/WfProject!edit.do','items',document.listForm);" value="修改" />
				        <input type="button" class="but_shop"  onclick="batchDelete2('${ctx}/wf/WfProject!remove.do','items',document.listForm);" value="删除" />
				        <input type="button" class="but_shop"  onclick="start2('${ctx}/wf/WfProject!start.do','items',document.listForm);" value="启用" />
				        <input type="button" class="but_shop"  onclick="stop('${ctx}/wf/WfProject!stop.do','items',document.listForm);" value="停止"/>
					</p>
					<p class="right">
						&nbsp;&nbsp;&nbsp;
						<jsp:include flush="true" page="/commons/toppagebar.jsp">
							<jsp:param name="target" value="/wf/WfProject!list.do" />
						</jsp:include>
					</p>
					<div class="clear"></div>
				</div>
				<form id="listForm" name="listForm" method="post" action="${ctx}/wf/WfProject!list.do">
					<span>
						<input type="hidden" value="0" id="state" />
						<input type="hidden" name="ableFlag" id="ableFlag" />
						<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
							<input type="hidden" name="${obj.key}" value="${obj.value}" />
						</c:forEach>
					</span>
					<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
						<tr>
							<th width="30">
						  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"/>
						    </th>
						  	<th width="50">序号</th>
						  	<th>名称</th>
						  	<th>所在组</th>
						  	<th>添加人姓名</th>
						  	<th>状态</th>
						  	<th>创建时间</th>
						  	<th>操作</th>
						</tr>
						<c:forEach items="${page.result}" var="obj" varStatus="status">
							<tr class="${status.count % 2 == 0 ? 'jg' : ''}">
								<td>
									<input type="checkbox" name="items" value="id=${obj.id}&"/>
									<input type="hidden" name="ids" value="${obj.id }"/>
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
									<input type="hidden" id="${obj.id }_state" value="${obj.useState }"/>
									<c:if test="${obj.useState == 0 }">未启用</c:if>
									<c:if test="${obj.useState == 1 }">启用</c:if>
									<c:if test="${obj.useState == 2 }">停止</c:if>
								</td>
								<td>
									<fmt:formatDate value="${obj.ts}" pattern="yyyy-MM-dd"/>
								</td>
								<td>		
									<c:if test="${obj.useState != 1}">
									<a href="${ctx }/wf/WfActivity!list.do?query.wfProject.id=${obj.id}">维护节点</a>
									</c:if>
									<c:if test="${obj.useState == 1}">维护节点</c:if>
								</td>
							</tr>
						</c:forEach>
					</table>
				</form>
				<div class="page">
					<jsp:include flush="true" page="/commons/pagebar.jsp">
						<jsp:param name="target" value="/wf/WfProject!list.do" />
					</jsp:include>
				</div>
			</div>
		</div>
<script type="text/javascript">
	//启用流程
	function start2(action,checkboxName,form){
		if (!hasOneChecked(checkboxName)){
	        alert('请选择要操作的对象!');
	        return;
		} else {
			var items = document.getElementsByName(checkboxName);
			var ids = document.getElementsByName("ids");
			var itemId = null;
			var count = 0;
			for (var i = 0; i < items.length; i++){
		        if (items[i].checked == true){
		        	itemId = ids[i].value;
					count++;
		        }
		    }
			if (count != 1) {
		    	alert('请选择一项!');
		        return;
		    }
		    $.ajax({
		    	type:'post',
		    	url:'${ctx }/wf/WfProject!checkUser.do',
		    	data:"id="+itemId,
		    	success:function(data){
		    		if(data == "1"){
		    			alert("流程未添加节点,不能启用!");
		    			return;
		    		}else if(data == "2"){
		    			alert("流程中的节点未设置参与者,不能启用!");
		    			return;
		    		}else{
			    		form.action = action+'?id='+itemId;
		        		form.submit();
		    		}
		    	}
		    });
	    	
		    
		}
		
	}
	//停止流程
	function stop(action,checkboxName,form){
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
		    	form.action = action+'?'+itemId;
		        form.submit();
		    }
		}
	}

//修改
function edit2(action,checkboxName,form){
	if (!hasOneChecked(checkboxName)){
        alert('请选择要操作的对象!');
        return;
	} else {
		var items = document.getElementsByName(checkboxName);
		var ids = document.getElementsByName("ids");
		var itemId = null;
		var id = null;
		var count = 0;
		for (var i = 0; i < items.length; i++){
	        if (items[i].checked == true){
	        	itemId = items[i].value;
	        	id = ids[i].value;
	        	if(document.getElementById(id+"_state").value==1){
	        		alert("该流程已启用，不能修改");
	        		return;
	        	}
	            count++;
	        }
	    }
		if (count != 1) {
	    	alert('请选择一项!');
	        return;
	    } else {
	    	form.action = action+'?'+itemId;
	        form.submit();
	    }
	}
};
function batchDelete2(action,checkboxName,form){
	if (!hasOneChecked(checkboxName)){
            alert('请选择要操作的对象!');
            return;
    }else{
    	var items = document.getElementsByName(checkboxName);
		var ids = document.getElementsByName("ids");
		var itemId = null;
		var id = null;
		var count = 0;
		for (var i = 0; i < items.length; i++){
	        if (items[i].checked == true){
	        	itemId = items[i].value;
	        	id = ids[i].value;
	        	if(document.getElementById(id+"_state").value==1){
	        		alert("流程已启用，不能删除");
	        		return;
	        	}
	            count++;
	        }
	    }
    }
    if (confirm('确定执行[删除]操作?')){
        form.action = action;
        form.submit();
    }
	
}
</script>
<%@ include file="/commons/messages.jsp"%>
</body>
</html>
