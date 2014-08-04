<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>系统变量 维护</title>
	<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>	
	
</head>
<body>
<div class="main">
 <div class="maintit">
 		<input type="hidden" value="0"  id="state"/>
      <h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" /> 系统参数</h2>
      <h3><a href="javasript:history.back(-1)">返回 &gt;&gt;</a></h3>
  </div>
  <div class="centent">
  <!-- 搜索开始 -->
      <div class="search">
        <form id="queryForm" name="queryForm" method="post" action="${ctx}/sys/Sysvariable!list.do">
        	<label>
        		变量名称：
        		<input value="${query.name}" id="name" name="query.name" maxlength="100"  class=""/> 
        	</label> 
        	<label>
        		所属应用：
        		<select id="applicationId" name="query.applicationId" >
        			<option selected="selected" value="">--请选择--</option>
        			<c:forEach items="${applications}" var="item" >
        			<option value="${item.id}" <c:if test="${item.id==query.applicationId}"> selected="selected"</c:if>>${item.name}</option>
        			</c:forEach>
        		</select>
        	</label>  
        	<label>
        		<input type="submit" value="检 索"   class="btn_search" onMouseOver="this.className='btn_search_over'" onMouseOut="this.className='btn_search'" />
        	</label>  
        </form>
        <div class="clear"></div>
      </div>
      <!-- 搜索结束 -->
      <div class="shop" id="shop">
        <p class="left">
          <input type="button" class="but_shop"  onclick="add('${ctx}/sys/Sysvariable!create.do',document.listForm);" value="添加" />
          <input type="button" class="but_shop"  onclick="edit('${ctx}/sys/Sysvariable!edit.do','items',document.listForm);" value="修改" />
          <input type="button" class="but_shop"  onclick="batchDelete('${ctx}/sys/Sysvariable!delete.do','items',document.listForm);" value="删除" />
        </p>
        <p class="right">
	          <select name="sortColumns" id="sortColumns" class="font12" onchange="sortColumns(this.value,document._pageForm_)" >
	          	<option value="ts">--默认排序--</option>
		        <option value="name" <c:if test="${query.sortColumns == 'name' }">selected="selected"</c:if>  >变量名称</option>
		        <option value="applicationId" <c:if test="${query.sortColumns == 'applicationId' }">selected="selected"</c:if>  >所属应用</option>
	          </select>&nbsp;&nbsp;&nbsp;
      		  <jsp:include flush="true" page="/commons/toppagebar.jsp">
				<jsp:param name="target" value="/sys/Sysvariable!list.do" />
	           </jsp:include>
      	</p>
        <div class="clear"></div>
	</div>
	 <!-- 排序模块结束 -->
	<form id="listForm" name="listForm"	action="<c:url value="${ctx}/sys/Sysvariable!list.do"/>" method="post">
	<!-- 内容区开始 -->
		<span>
			<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
				<input type="hidden" name="${obj.key}" value="${obj.value}"/>
			</c:forEach>
		</span>
		<table  border="0" cellspacing="0" class="uiTable">
			  <tr>
			  	<th width="30"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				<th width="50">序号</th>
				<th sortColumn="name" >变量名称</th>
				<th sortColumn="code" >变量值</th>
				<th sortColumn="applicationId" >所属应用</th>
				<th sortColumn="discription" >描述</th>
			  </tr>
		  	  <c:forEach items="${page.result}" var="item" varStatus="vs">
		  	  <tr class="${vs.count % 2 == 0 ? 'jg' : ''}" onMouseOver=this.className="highlight" onMouseOut=this.className="${vs.count % 2 == 0 ? 'jg' : ''}">
				<td><input type="checkbox" name="items" value="id=${item.id}&"></td>
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><a href="${ctx}/sys/Sysvariable!show.do?id=${item.id}&"><c:out value='${item.name}'/></a>&nbsp;</td>
				<td><c:out value='${item.code}'/>&nbsp;</td>
				<td><c:out value="${item.application.name }"/>&nbsp;</td>
				
				<td>
				<c:choose> 
				    <c:when test="${fn:length(item.discription) > 5}"> 
				     <c:out value="${fn:substring(item.discription, 0, 5)}..." /> 
				    </c:when> 
				    <c:otherwise>
				     <c:out value='${item.discription}'/>&nbsp;
				    </c:otherwise> 
			    </c:choose> 
				</td>
			  </tr>
		  	  </c:forEach>
		</table>
	</form>
	 	<div class="page">
			<jsp:include flush="true" page="/commons/pagebar.jsp">
				<jsp:param name="target" value="/sys/Sysvariable!list.do" />
	        </jsp:include>
	   </div>
	  </div>
	</div>
<script type="text/javascript">
	$("#shop").smartFloat();  
</script>
</body>
</html>
