<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>期数班级管理</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
</head>
<body>
<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">教师培训</a> &gt; <a href="#">期数班级管理</a> &gt; 期数班级列表</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" onclick="goBack()" />
          </p>
      </div>
      <div class="tablelist">
    	 <div class="title">期数班级管理</div>
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassTermBj!list.do">
          	<input type="hidden" name="query.classTermId" value="${query.classTermId }"/>
          	<input type="hidden" name="query.bigclassId" value="${query.bigclassId }"/>
       		<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="32" >班级名称：</td>		
							<td>
								<input value="${query.name}" id="name" name="query.name" maxlength="100"  class=""/>
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
	      <input type="button" class="but_cz"  onclick="add('${ctx}/bj/ClassTermBj!add.do',document.listForm);" value="添加班级" />
          <input type="button" class="but_cz"  onclick="edit('${ctx}/bj/ClassTermBj!edit.do','items',document.listForm);" value="修改班级" />
          <input type="button" class="but_cz"  onclick="batchDelete('${ctx}/bj/ClassTermBj!remove.do','items',document.listForm);" value="删除班级" />
          <input type="button" class="but_cz"  onclick="edit('${ctx}/bj/ClassTermBj!setBjTeacher.do','items',document.listForm);" value="班教师设置"/>
          <input type="button" class="but_cz"  onclick="addBjUser('${ctx}/bj/ClassBjUser!list.do','items',document.listForm);" value="班成员管理" />
          <!--
          <input type="button" class="but_cz"  onclick="kebiao('${ctx}/bj/ClassTimeTable!fullCalendar.do','items',document.listForm);" value="课表管理"/>
        -->
        </td>
      </tr>
    </table>
</div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassTermBj!list.do">
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
	  	<th >班级名称</th>
	  	<th >班主任</th>
	  	<th >辅导老师</th>
	  	<th>任课教师</th>
	  	<th >计划招生人数</th>
	  	<th >实际招生人数</th>
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
						<a href="${ctx}/bj/ClassTermBj!view.do?id=${obj.id}" title="${obj.name }">${obj.name}</a>...
					</c:if>
					<c:if test="${fn:length(obj.name)<=10}">
						<a href="${ctx}/bj/ClassTermBj!view.do?id=${obj.id}">${obj.name}</a>
					</c:if>
					
		</td>
		<td>
					${obj.classTeacher1}
		</td>
		<td>
					<c:if test="${fn:length(obj.classTeacher0)>10}">
						<span title="${obj.classTeacher0 }">
							${fn:substring(obj.classTeacher0,0,10) }...
						</span>
					</c:if>
					<c:if test="${fn:length(obj.classTeacher0)<=10}">
						${obj.classTeacher0 }
					</c:if>
		</td>
		<td>
					<c:if test="${fn:length(obj.classTeacher2)>10}">
						<span title="${obj.classTeacher2 }">
							${fn:substring(obj.classTeacher2,0,10) }...
						</span>
					</c:if>
					<c:if test="${fn:length(obj.classTeacher2)<=10}">
						${obj.classTeacher2 }
					</c:if>
		</td>
		<td>
					${obj.planCount}
		</td>
		<td>
					${obj.actualCount}
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
					<jsp:param name="target" value="/bj/ClassTermBj!list.do" />
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
	function addBjUser(action,checkboxName,form){
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
		    	form.action = action+'?query.classBjId=' + id;
		        form.submit();
		    }
		}
	}
	function kebiao(action,checkboxName,form){
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
		    	form.action = action+'?query.classBjId=' + id;
		        form.submit();
		    }
		}
	}
	function goBack(){
		location.href="${ctx}/bj/ClassTerm!list.do?query.bigclassId=${query.bigclassId}";
	}
</script>
</body>
</html>
