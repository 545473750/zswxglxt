<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>客户信息管理</title>
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
				<h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" /> 客户信息管理</h2>
			</div>

			<div class="centent">
				<div class="search">
					<form id="queryForm" name="queryForm" method="post" action="${ctx}/core/customer!list.do">
						<label>
							客户代码：
        					<input value="${query.cucustnr}" id="name" name="query.cucustnr" maxlength="100"  class=""/> 
						</label>
						<label>
							<input type="submit" value="检 索" class="btn_search" onMouseOver="this.className='btn_search_over'" onMouseOut="this.className='btn_search'" />
						</label>
					</form>
					<div class="clear"></div>
				</div>

				<div class="shop" id="shop">
					<p class="left">
						<input type="button" class="but_shop"  onclick="add('${ctx}/core/customer!toAdd.do',document.listForm);" value="添加" />
				        <input type="button" class="but_shop"  onclick="edit2('${ctx}/core/customer!toAdd.do','items',document.listForm);" value="修改" />
				        <input type="button" class="but_shop"  onclick="batchDelete2('${ctx}/core/customer!remove.do','items',document.listForm);" value="删除"/>
				        <input type="button" class="but_shop"  onclick="add('${ctx}/core/contract!toAdd.do','items',document.listForm);" value="新用户入网"/>
					</p>
					<p class="right">
						&nbsp;&nbsp;&nbsp;
						<jsp:include flush="true" page="/commons/toppagebar.jsp">
							<jsp:param name="target" value="/core/customer!list.do" />
						</jsp:include>
					</p>
					<div class="clear"></div>
				</div>
				<form id="listForm" name="listForm" method="post" action="${ctx}/core/customer!list.do">
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
						  	<th>客户编号</th>
						  	<th>姓名</th>
						  	<th>身份证号码</th>
						  	<th>客户类型</th>
						  	<th>客户状态</th>
						  	<th>客户星级</th>
						  	<th>联系电话</th>
						  	<th>创建时间</th>
						  	<th>操作</th>
						</tr>
						<c:forEach items="${page.result}" var="obj" varStatus="status">
							<tr class="${status.count % 2 == 0 ? 'jg' : ''}">
								<td>
									<input type="checkbox" name="items" value="id=${obj.id}&"/>
								</td>
								<td>
									${page.thisPageFirstElementNumber + vs.index}
								</td>
								<td>
									<a href="${ctx}/core/customer!view.do?id=${obj.id}">${obj.cucustnr}</a>
								</td>
								<td>
									${obj.addrcareOfName}
								</td>
								<td>
									${obj.curefnumber}
								</td>
								<td>
									${obj.cutype}
								</td>
								<td>
									${obj.custatus}
								</td>
								<td>
									${obj.culanguage}
								</td>
								<td>
									${obj.addrphonew}
								</td>
								<td>
									<fmt:formatDate value="${obj.ts}" pattern="yyyy-MM-dd HH:mm"/>
								</td>
								<td>
									<a href="${ctx }/core/customer!toAdd.do?id=${obj.id}">修改</a>
									<a href="${ctx }/core/customer!remove.do?items=id=${obj.id}&">删除</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</form>
				<div class="page">
					<jsp:include flush="true" page="/commons/pagebar.jsp">
						<jsp:param name="target" value="/core/customer!list.do" />
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

//修改
function edit2(action,checkboxName,form){
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
