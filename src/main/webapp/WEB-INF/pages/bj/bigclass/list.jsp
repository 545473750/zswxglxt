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
	<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>
<body>
<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">教师培训</a> &gt; <a href="#">培训班管理</a> &gt; 培训班列表</p>
      </div>
      <div class="tablelist">
    	 <div class="title">培训班管理</div>
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassBigclass!list.do">
       		<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="32" >培训班名称：</td>		
					<td>
						<input value="${query.name}" id="name" name="query.name" maxlength="100" size="40"/>
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
				</tr>
				<tr>
					<td>申请时间</td>
					<td>
						<input readonly="true" size="15" value="<fmt:formatDate value="${query.startTime}" pattern="yyyy-MM-dd"/>" id="startTime" name="query.startTime" maxlength="100"  class="" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\')}',isShowClear:true,readOnly:true})" />
						至
						<input readonly="true" size="15" value="<fmt:formatDate value="${query.endTime}" pattern="yyyy-MM-dd"/>" id="endTime" name="query.endTime" maxlength="100"  class="" onclick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\')}',isShowClear:true,readOnly:true})" />
					</td>
					<td>申请状态</td>
					<td>
						<select name="query.applyState" id="applyState" style="width: 103px;">
							<option value="">--请选择--</option>
							<option value="0" <c:if test="${query.applyState == 0 }">selected="selected"</c:if> >未发送审核</option>
							<option value="1" <c:if test="${query.applyState == 1 }">selected="selected"</c:if> >审核中</option>
							<option value="2" <c:if test="${query.applyState == 2 }">selected="selected"</c:if> >审核通过</option>
							<option value="3" <c:if test="${query.applyState == 3 }">selected="selected"</c:if> >审核未通过</option>
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
          <input type="button" class="but_cz"  onclick="addZB('${ctx}/bj/ClassBigclass!add.do',document.listForm);" value="申请组班" />
          <input type="button" class="but_cz"  onclick="edit2('${ctx}/bj/ClassBigclass!edit.do','items',document.listForm);" value="修改" />
          <input type="button" class="but_cz"  onclick="batchDelete2('${ctx}/bj/ClassBigclass!remove.do','items',document.listForm);" value="删除" />
        </td>
        <td style="text-align: right;">
        	<input type="button" class="but_cz"  onclick="send('${ctx}/bj/ClassBigclass!toSendJsp.do','items',document.listForm);" value="发送审批"/>
        </td>
      </tr>
    </table>
   </div>
   <div class="clear"></div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassBigclass!list.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<table width="100%" cellpadding="0" cellspacing="0" border="0"  style="text-align: center;">
	<tr>
	    <th width="30">
	  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
	    </th>
	  	<th width="50">序号</th>
	  	<th>培训班名称</th>
	  	<th>培训类别</th>
	  	<th>课程学时</th>
	  	<th>申请人</th>
	  	<th>申请状态</th>
	</tr>
	<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td>
			<input type="checkbox" name="items" value="id=${obj.id}&">
			<input type="hidden" name="ids" value="${obj.id }"/>
		</td>
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
				<c:if test="${fn:length(obj.name)>10}">
					<a href="${ctx}/bj/ClassBigclass!view.do?id=${obj.id}&showState=0" title="${obj.name }">
						${fn:substring(obj.name,0,10) }...
					</a>
				</c:if>
				<c:if test="${fn:length(obj.name)<=10}">
					<a href="${ctx}/bj/ClassBigclass!view.do?id=${obj.id}&showState=0">${obj.name}</a>
				</c:if>
		</td>
		<td>
					${pxlb[obj.trainType]}
		</td>
		<td>
					${obj.totalHour}
		</td>
		<td>
					${obj.applyUserName }
		</td>
		<td>
					<input type="hidden" id="${obj.id }_state" value="${obj.applyState }"/>
					<c:if test="${obj.applyState == 0}">未发送审核</c:if>
					<c:if test="${obj.applyState == 1}">审核中</c:if>
					<c:if test="${obj.applyState == 2}">审核通过</c:if>
					<c:if test="${obj.applyState == 3}">审核不通过</c:if>
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
					<jsp:param name="target" value="/bj/ClassBigclass!list.do" />
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
	//修改
	function edit2(action,checkboxName,form){
		if(!hasOneChecked(checkboxName)){
			alert('请选择要操作的对象!');
	        return;
		}else{
			var items = document.getElementsByName(checkboxName);
			var ids = document.getElementsByName("ids");
			var itmeId = null;
			var id = null;
			var count = null;
			for(var i = 0; i< items.length; i++){
				if(items[i].checked == true){
					itemId = items[i].value;
					id = ids[i].value;
					if($("#"+id+"_state").val() == 1){
						alert("审核中,不能修改!");
						return;
					}
					if($("#"+id+"_state").val() == 2){
						alert("审核已完成不能修改!");
						return;
					}
					if($("#"+id+"_state").val() == 3){
						alert("审核已完成不能修改!");
						return;
					}
					count++;
				}
			}
			if(count != 1){
				alert("请选择一项!");
				return;
			}else{
				form.action = action + '?' + itemId;
		        form.submit();
			}
		}
	}
	//删除
	function batchDelete2(action,checkboxName,form){
	    if (!hasOneChecked(checkboxName)){
	            alert('请选择要操作的对象!');
	            return;
	    }else{
	    	var items = document.getElementsByName(checkboxName);
			var ids = document.getElementsByName("ids");
			var itmeId = null;
			var id = null;
			var count = null;
			for(var i = 0; i< items.length; i++){
				if(items[i].checked == true){
					itemId = items[i].value;
					id = ids[i].value;
					if($("#"+id+"_state").val() == 1){
						alert("审核中,不能删除!");
						return;
					}
					if($("#"+id+"_state").val() == 2){
						alert("审核已完成不能删除!");
						return;
					}
					if($("#"+id+"_state").val() == 3){
						alert("审核已完成不能删除!");
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
	//发送
	function send(action,checkboxName,form){
		if (!hasOneChecked(checkboxName)){
        	alert('请选择要操作的对象!');
	        return;
		} else {
			var items = document.getElementsByName(checkboxName);
			var ids = document.getElementsByName("ids");
			var itmeId = null;
			var id = null;
			var count = 0;
			for (var i = 0; i < items.length; i++){
		        if (items[i].checked == true){
		        	itemId = items[i].value;
		        	id = ids[i].value;
		        	if($("#"+id+"_state").val() == 1){
						alert("已发送审核!");
						return;
					}
					if($("#"+id+"_state").val() == 2){
						alert("审核已完成!");
						return;
					}
					if($("#"+id+"_state").val() == 3){
						alert("审核已完成!");
						return;
					}
		            count++;
		        }
		    }
			if (count != 1) {
		    	alert('请选择一项!');
		        return;
		    } else {
		    	form.action = action + '?' + itemId;
		        form.submit();
		    }
		}
	}
	function addZB(action,form){
		form.action = action;
		form.submit();
	}
	
</script>

</body>
</html>
