<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>培训班期数管理</title>
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
          <p class="dqwz">当前位置：<a href="#">教师培训</a> &gt; <a href="#">培训班期数管理</a> &gt; 培训班期数列表</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" onclick="goBack()" />
          </p>
      </div>
      <div class="tablelist">
    	 <div class="title">培训班期数管理</div>
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassTerm!list.do">
          	<input type="hidden" name="query.bigclassId" value="${query.bigclassId }"/>
       		<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="32" >期数：</td>		
							<td colspan="2">
								<input type="text" id="name" name="query.name" value="${query.name }" />
							</td>
							
						</tr>
							<td height="32" >开始日期：</td>		
							<td>
								<input readonly="true" value="<fmt:formatDate value="${query.startTime}" pattern="yyyy-MM-dd"/>" id="startTime" name="query.startTime" maxlength="100"  class="" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\')}',isShowClear:true,readOnly:true})" />
								至
								<input readonly="true" value="<fmt:formatDate value="${query.endTime}" pattern="yyyy-MM-dd"/>" id="endTime" name="query.endTime" maxlength="100"  class="" onclick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\')}',isShowClear:true,readOnly:true})" />
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
	      <input type="button" class="but_cz"  onclick="add('${ctx}/bj/ClassTerm!add.do',document.listForm);" value="添加期数" />
          <input type="button" class="but_cz"  onclick="edit2('${ctx}/bj/ClassTerm!edit.do','items',document.listForm);" value="修改期数" />
          <input type="button" class="but_cz"  onclick="batchDelete2('${ctx}/bj/ClassTerm!remove.do','items',document.listForm);" value="删除期数" />
          <input type="button" class="but_cz"  onclick="classManager('${ctx}/bj/ClassTermBj!list.do','items',document.listForm);" value="班级管理">
        </td>
      </tr>
    </table>
</div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassTerm!list.do">
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
	  	<th >期数</th>
	  	<th >开始日期</th>
	  	<th >结束日期</th>
	  	<th >使用状态</th>
	  	<th >期负责人</th>
	  	<th >期辅导老师</th>
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
					<a href="${ctx}/bj/ClassTerm!view.do?id=${obj.id}" title="${obj.name }">
						${fn:substring(obj.name,0,10) }...
					</a>
				</c:if>
				<c:if test="${fn:length(obj.name)<=10}">
					<a href="${ctx}/bj/ClassTerm!view.do?id=${obj.id}">${obj.name}</a>
				</c:if>
		</td>
		<td>
					<fmt:formatDate value="${obj.startTime}" pattern="yyyy-MM-dd"/>
		</td>
		<td>
					<fmt:formatDate value="${obj.endTime}" pattern="yyyy-MM-dd"/>
		</td>
		<td>
					<c:if test="${obj.isUse == 0}">未使用</c:if>
					<c:if test="${obj.isUse == 1}">已使用</c:if>
					<input type="hidden" id="${obj.id }_isUse" value="${obj.isUse }"/>
		</td>
		<td>
					${obj.termTeacher1}
		</td>
		<td> 
					<c:if test="${fn:length(obj.termTeacher0)>10}">
						<span title="${obj.termTeacher0 }">
							${fn:substring(obj.termTeacher0,0,10) }...
						</span>
					</c:if>
					<c:if test="${fn:length(obj.termTeacher0)<=10}">
						${obj.termTeacher0 }
					</c:if>
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
					<jsp:param name="target" value="/bj/ClassTerm!list.do" />
		        </jsp:include>
        	</div>
           </td>
        </tr>
       </table>
   </div>
  </div>
  </div>
<script type="text/javascript">
	function classManager(action,checkboxName,form){
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
	            count++;
	        }
	    }
		if (count != 1) {
	    	alert('请选择一项!');
	        return;
	    } else {
	    	form.action = action+'?query.classTermId=' + id;
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
			var ids = document.getElementsByName("ids");
			var itemId = null;
			var id = null;
			var count = 0;
			for (var i = 0; i < items.length; i++){
		        if (items[i].checked == true){
		        	itemId = items[i].value;
		        	id = ids[i].value;
		            count++;
		        }
		    }
			if (count != 1) {
		    	alert('请选择一项!');
		        return;
		    }else if($("#"+id+"_isUse").val() == 1 ){
		    	alert("该期已被使用，不能修改");
		    	return;
		    } else {
		    	form.action = action+'?' + itemId;
		        form.submit();
		    }
		}
	}
	
	function batchDelete2(action,checkboxName,form){
		if (!hasOneChecked(checkboxName)){
	        alert('请选择要操作的对象!');
	        return;
		} else {
			var items = document.getElementsByName(checkboxName);
			var ids = document.getElementsByName("ids");
			var itemId = null;
			var id = null;
			for (var i = 0; i < items.length; i++){
		        if (items[i].checked == true){
		        	itemId = items[i].value;
		        	id = ids[i].value;
		        }
		    }
			if($("#"+id+"_isUse").val() == 1 ){
		    	alert("期数已被使用，不能删除");
		    	return;
		    } else {
		    	if(confirm("确定执行[删除]操作?")){
			    	form.action = action;
			        form.submit();
		        }
		    }
		}
	}
	
	function goBack(){
		location.href="${ctx}/bj/ClassTerm!classList.do";
	}
</script>
</div>
</body>
</html>
