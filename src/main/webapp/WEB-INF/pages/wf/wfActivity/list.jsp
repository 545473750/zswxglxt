<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>流程节点管理</title>
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
		<h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" /> 流程节点管理</h2>
		<h3><a href="${ctx}/wf/WfProject!list.do?query.wfProject.id=${query.wfProject.id}">返回 &gt;&gt;</a></h3>
	</div>
	<div class="centent">
		<div class="search">
			<form id="queryForm" name="queryForm" method="post" action="${ctx}/wf/WfActivity!list.do">
				<input type="hidden" name="proId" value="${proId }" />
      				<input type="hidden" name="query.wfProject.id" value="${query.wfProject.id }"/>
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
				<input type="button" class="but_shop" onclick="add('${ctx}/wf/WfActivity!add.do',document.listForm);" value="添加" />
		        <input type="button" class="but_shop" onclick="edit2('${ctx}/wf/WfActivity!edit.do','items',document.listForm);" value="修改" />
		        <input type="button" class="but_shop" onclick="batchDelete2 ('${ctx}/wf/WfActivity!remove.do','items',document.listForm);" value="删除" />
		        <span style="color: red;">行标记为黄色的表示未设置参与者</span>
			</p>
			<p class="right">
				&nbsp;&nbsp;&nbsp;
				<jsp:include flush="true" page="/commons/toppagebar.jsp">
					<jsp:param name="target" value="/wf/WfActivity!list.do" />
				</jsp:include>
			</p>
			<div class="clear"></div>
		</div>
		<form id="listForm" name="listForm" method="post" action="${ctx}/wf/WfActivity!list.do">
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
				  	<th>节点顺序</th>
				  	<th>操作</th>
				</tr>
				<c:forEach items="${page.result}" var="obj" varStatus="status">
					<tr class="${status.count % 2 == 0 ? 'jg' : ''}">
						<td>
							<input type="checkbox" name="items" value="id=${obj.id}&"/>
							<input type="hidden" name="objId" value="${obj.id }"/>
						</td>
						<td>
							${page.thisPageFirstElementNumber + vs.index}
						</td>
						<td>
							<a href="${ctx}/wf/WfActivity!view.do?id=${obj.id}<c:forEach var="p" items="${_pageBar_.parameter }"><c:if test="${p.key!='query.name'}">&${p.key}=${p.value}</c:if></c:forEach>">${obj.name}</a>
						</td>
						<td>
							${obj.orderNum}
						</td>
						<td>
							<a href="${ctx }/wf/WfActivityParticipan!list.do?query.wfActivity.id=${obj.id}&query.proId=${query.wfProject.id}&query.groupFlag=${query.groupFlag}&query.actType=${obj.actType}&query.wfProject.id=${query.wfProject.id}">设置参与者</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<div class="page">
			<jsp:include flush="true" page="/commons/pagebar.jsp">
				<jsp:param name="target" value="/wf/WfActivity!list.do" />
			</jsp:include>
		</div>
	</div>
</div>
<script type="text/javascript">
//修改
function edit2(action,checkboxName,form){
	if (!hasOneChecked(checkboxName)){
        alert('请选择要操作的对象!');
        return;
	} else {//判断该工资表是否已发布，已发布不能删除
		var items = document.getElementsByName(checkboxName);
		var ids = document.getElementsByName("objId");
		var itemId = null;
		var id = null;
		var count = 0;
		var flag = null;
		for (var i = 0; i < items.length; i++){
	        if (items[i].checked == true){
	        	itemId = items[i].value;
	        	id = ids[i].value;
	        	flag = $("#"+id+"_flag").val();
				count++;
	        }
	    }
		if (count != 1) {
	    	alert('请选择一项!');
	        return;
	    }else if (flag == 1){
	    	alert('该节点已完成，不能修改!');
	    	return;
	    }else {
	    	form.action = action+'?'+itemId;
	        form.submit();
	    }
	}
};
//删除
function batchDelete2(action,checkboxName,form){
    if (!hasOneChecked(checkboxName)){
            alert('请选择要操作的对象!');
            return;
    }else {//判断该工资表是否已发布，已发布不能删除
		var items = document.getElementsByName(checkboxName);
		var ids = document.getElementsByName("objId");
		var itemId = null;
		var id = null;
		for (var i = 0; i < items.length; i++){
	        if (items[i].checked == true){
	        	id = ids[i].value;
	        	var flag = $("#"+id+"_flag").val();
				if(flag == 1){
					alert("节点已完成,不能删除!");
					return;
				}
	        }
	    }
    }
    if (confirm('确定执行[删除]操作?')){
        form.action = action;
        form.submit();
    }
}
function goBack(){
	location.href="${ctx }/wf/WfProject!list.do";
}
	//$("#shop").smartFloat();  
</script>
<%@ include file="/commons/messages.jsp"%>
</body>
</html>
