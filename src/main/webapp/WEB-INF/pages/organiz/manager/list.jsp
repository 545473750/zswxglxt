<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>系统分级管理员管理</title>
	<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/application.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
		<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
		<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			$("#resourcesDialog").dialog({
		        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 权限设置',
		        autoOpen: false,
		        width: 420,
		        //height: 276,
		        resizable: true,
		        modal: true,
		        autoResize: true,
		        overlay: {
	               opacity: 0.5,
	               background: "black"
	            }
		    });
		    
		    $("#grantUserDialog").dialog({
		        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 用户设置',
		        width: 600,
		        //height: 276,
		        autoOpen: false,
		        resizable: false,
		        modal: true,
		        autoResize: true,
		        overlay: {
	               opacity: 0.5,
	               background: "black"
	            }
		    });
		});
	
		
	</script>
</head>
<body>
<div class="main">
  <div class="maintit">
      <h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" /> 系统分级管理员列表</h2>
      <h3><a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a></h3>
  </div>
    <div class="centent">
      <div class="search">
        <form id="queryForm" name="queryForm" method="post" action="${ctx}/organiz/Manager!list.do">
        	 
        	<label>
        		用户姓名：
        		<input value="${query.name}" id="name" name="query.name" maxlength="100"  class=""/> 
        	</label>  
        	<label>
        		数据范围：
        		<select id="dataScope" name = "query.dataScope" >
					<option value = ""  >---请选择--- </option>
		           <c:forEach items="${dicList}" var="dic">
		            	<option value = "${dic.key}"  <c:if test="${dic.key == query.dataScope }">selected="selected" </c:if>>${dic.value } </option>
		           </c:forEach> 
				</select>
        	</label>  
        	<label>
        		管理状态：
        		<select id="userState" name = "query.userState" >
					<option value = ""  >---请选择--- </option>
		           <c:forEach items="${userState}" var="state">
		            	<option value = "${state.key}"  <c:if test="${state.key == query.userState }">selected="selected" </c:if>>${state.value } </option>
		           </c:forEach> 
				</select>
        	</label>  
        	  
        	<label>
        		<input type="submit" value="检 索"   class="btn_search" onMouseOver="this.className='btn_search_over'" onMouseOut="this.className='btn_search'" />
        	</label>  
        </form>
        <div class="clear"></div>
      </div>
<div class="shop" id="shop">
        <p class="left">
          <input type="button" class="but_shop"  onclick="add('${ctx}/organiz/Manager!add.do',document.listForm);" value="添加" />
          <input type="button" class="but_shop"  onclick="edit('${ctx}/organiz/Manager!edit.do','items',document.listForm);" value="修改" />
          <input type="button" class="but_shop"  onclick="batchDelete('${ctx}/organiz/Manager!remove.do','items',document.listForm);" value="删除" />
        </p>
        <p class="right">
	          <select name="sortColumns" id="sortColumns" class="font12" onchange="sortColumns(this.value,document._pageForm_)" >
	          	<option value="ts">--默认排序--</option>
		        <option value="userId" <c:if test="${query.sortColumns == 'userId' }">selected="selected"</c:if>  >用户id</option>
		        <option value="name" <c:if test="${query.sortColumns == 'name' }">selected="selected"</c:if>  >用户姓名</option>
		        <option value="dataScope" <c:if test="${query.sortColumns == 'dataScope' }">selected="selected"</c:if>  >数据范围</option>
		        <option value="scopeValue" <c:if test="${query.sortColumns == 'scopeValue' }">selected="selected"</c:if>  >数据范围值</option>
		        <option value="menuIds" <c:if test="${query.sortColumns == 'menuIds' }">selected="selected"</c:if>  >菜单</option>
		        <option value="userState" <c:if test="${query.sortColumns == 'userState' }">selected="selected"</c:if>  >管理状态</option>
		        <option value="addUserId" <c:if test="${query.sortColumns == 'addUserId' }">selected="selected"</c:if>  >添加人ID</option>
		        <option value="addName" <c:if test="${query.sortColumns == 'addName' }">selected="selected"</c:if>  >添加人姓名</option>
		        <option value="addTime" <c:if test="${query.sortColumns == 'addTime' }">selected="selected"</c:if>  >添加时间</option>
	          </select>&nbsp;&nbsp;&nbsp;
      		  <jsp:include flush="true" page="/commons/toppagebar.jsp">
				<jsp:param name="target" value="/organiz/Manager!list.do" />
	           </jsp:include>
      		      	</p>
        <div class="clear"></div>
</div>
<form id="listForm" name="listForm" method="post" action="${ctx}/organiz/Manager!list.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
	<tr>
	    <th width="30">
	  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
	    </th>
	  	<th width="50">序号</th>
	  	<th >用户id</th>
	  	<th >用户姓名</th>
	  	<th >数据范围</th>
	  	
	  	<th >管理状态</th>
	  	<th >添加人ID</th>
	  	<th >添加人姓名</th>
	  	<th >添加时间</th>
	  	<th >操作</th>
	</tr>
<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td>
			<input type="checkbox" name="items" value="${obj.id}">
		</td>
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
					<a href="${ctx}/organiz/Manager!view.do?id=${obj.id}">${obj.userId}</a>
		</td>
		<td>
					${obj.name}
		</td>
		<td>
					<c:if test="${obj.dataScope =='1'}">
					个人
					</c:if>
					<c:if test="${obj.dataScope =='2'}">
					部门
					</c:if>
					<c:if test="${obj.dataScope =='3'}">
					指定
					</c:if>
					<c:if test="${obj.dataScope =='9'}">
					全部
					</c:if>
		</td>
		
		<td>
					
					<c:if test="${obj.userState == '1'}">
					正常
					</c:if>
					<c:if test="${obj.userState == '2'}">
					启用
					</c:if>
		</td>
		<td>
					${obj.addUserId}
		</td>
		<td>
					${obj.addName}
		</td>
		<td>
					<fmt:formatDate value="${obj.addTime}" pattern="yyyy-MM-dd"/>
		</td>
		<td>
				<c:if test="${obj.dataScope =='3'}">
					<a href="javascript:openDialogById('${ctx}/organiz/Manager!grantUserPage.do?id=${obj.id}&partitionId=${partitionId}' + '&r=' + Math.random(),'grantUserDialog','grantUser');">用户设置</a>
					| 
				</c:if>
				<a href="javascript:openDialogById('${ctx}/organiz/Manager!grantPage.do?id=${obj.id}&partitionId=${partitionId}','resourcesDialog','grantResources');">权限授予</a> 
		</td>
	</tr>
</c:forEach>
</table>
</form>
   <div class="page">
		<jsp:include flush="true" page="/commons/pagebar.jsp">
			<jsp:param name="target" value="/organiz/Manager!list.do" />
        </jsp:include>
   </div>
  </div>
</div>
<!-- 权限授予dialog -->	
		<div id="resourcesDialog" style="overflow: hidden;">
			<iframe id="grantResources" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" width="420" height="344"></iframe>
		</div>
		<!-- 用户设置dialog -->
		<div id="grantUserDialog" style="overflow: hidden;">
			<iframe id="grantUser" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" width="600" height="334"></iframe>
		</div>
<script type="text/javascript">
	$("#shop").smartFloat();  
</script>
</body>
</html>
