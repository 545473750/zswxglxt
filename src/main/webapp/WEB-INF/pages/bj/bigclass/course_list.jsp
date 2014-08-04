<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>课程申报管理</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>
<body>

<div class="right">
  <div class="llistbox">
    <div class="tablelist">
    	 <div class="title">课程申报管理</div>
      <div class="search">
        <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassBigclass!courseList.do">
         <table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="32">课程名称：</td>
              <td ><input value="${name}" id="name" name="name"   /></td>
              <td height="32">课程分类：</td>
              <td >
              	<select id="courseFlag" name="courseFlag">
					<option value="" >---请选择---</option>
					<option value="1" <c:if test="${'1' == courseFlag }">selected="selected" </c:if>>分院课程</option>
					<option value="2" <c:if test="${'2' == courseFlag }">selected="selected" </c:if>>教研课程</option>
					<option value="3" <c:if test="${'3' == courseFlag }">selected="selected" </c:if>>校本课程 </option>
					<option value="4" <c:if test="${'4' == courseFlag }">selected="selected" </c:if>>实验课程</option>
				</select>
               </td>
              
               <td><input type="submit" value="查 询" /></td>
            </tr>
          </table>
        </form>
        <div class="clear"></div>
      </div>
<div class="page">
   </div>
        <div class="clear"></div>

<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassBigclass!courseList.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<input type="hidden" name="courseId" value="${courseId }"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0"  >
	<tr>
	    <th width="30">
	    </th>
	  	<th width="50">序号</th>
	  	<th >课程名称</th>
	  	<th >课程学时</th>
	  	<th >课程分类</th>
	  	<th >课程类别</th>
	  	<th >申请日期</th>
	  	<th >申请人姓名</th>
	  	<!--
	  		<th >申请状态</th>
		-->
	</tr>
<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" onMouseOver=this.className="highlight" onMouseOut=this.className="${vs.count % 2 == 0 ? 'jg' : ''}">
		<td>
			<input type="radio" name="items" value="${obj.id}">
			<input type="hidden" name="courseNames" value="${obj.name }"/>
		</td>
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
					<a href="${ctx}/course/Apply!view.do?id=${obj.id}">${obj.name}</a>
		</td>
		<td>
					${obj.courseTime}
		</td>
		<td>
					<c:if test="${'1' == obj.courseFlag}">分院课程</c:if>
					<c:if test="${'2' == obj.courseFlag}">教研课程</c:if>
					<c:if test="${'3' == obj.courseFlag}">校本课程</c:if>
					<c:if test="${'4' == obj.courseFlag}">实验课程</c:if>
		</td>
		<td>
				<c:if test="${obj.courseFlag != '4'}">
					 <c:if test="${'1' == obj.courseType }">专业必修 </c:if>
					 <c:if test="${'2' == obj.courseType }">公共必修 </c:if>
					 <c:if test="${'3' == obj.courseType }">专题必修</c:if>
					 <c:if test="${'4' == obj.courseType }">讲座</c:if>
				</c:if>
				<c:if test="${obj.courseFlag == '4'}">
					${kcfl[obj.courseType] }
				</c:if>
		</td>
		
		<td>
				<c:if test="${obj.courseFlag == '4'}">
					<fmt:formatDate value="${obj.detail.ts}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</c:if>
				<c:if test="${obj.courseFlag != '4'}">
					<fmt:formatDate value="${obj.apply.applyTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</c:if>
		</td>
		<td>
				<c:if test="${obj.courseFlag == '4'}">
					${obj.detail.addUserName }
				</c:if>
				<c:if test="${obj.courseFlag != '4'}">
					${obj.apply.applyUserName}
				</c:if>
		</td>
		<!--<td>
				<c:if test="${obj.courseFlag == 4}">
					${obj.detail.addUserName }
				</c:if>
				<c:if test="${obj.courseFlag != 4}">
					<c:if test="${obj.apply.applyState==0}">未审核</c:if>
					<c:if test="${obj.apply.applyState==1}">审核中</c:if>
					<c:if test="${obj.apply.applyState==2}">审核通过</c:if>
					<c:if test="${obj.apply.applyState==3}">审核不通过</c:if>
				</c:if>
		</td>
		-->
	</tr>
</c:forEach>
	<tr>
		<td colspan="8" align="center">
			<input type="button" class="but_cz"  onclick="addCourse('items',document.listForm);" value="添加" />
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
					<jsp:param name="target" value="/bj/ClassBigclass!courseList.do?courseId=${courseId}" />
		        </jsp:include>
        	</div>
           </td>
        </tr>
       </table>
   </div>
  </div>
</div>
<script type="text/javascript">
//删除
function addCourse(checkboxName,form){
    if (!hasOneChecked(checkboxName)){
            alert('请选择要操作的对象!');
            return;
    }else {
		var items = document.getElementsByName(checkboxName);
		var courseNames = document.getElementsByName("courseNames");
		var id = null;
		var name = null;
		for (var i = 0; i < items.length; i++){
	        if (items[i].checked == true){
	        	id = items[i].value;
	        	name = courseNames[i].value;
	        }
	    }
    }
    parent.mainFrame.window.setIdAndName("${courseId}",name,id);
    window.parent.closeDialog();
}
	//$("#shop").smartFloat();  
</script>
</body>
</html>
