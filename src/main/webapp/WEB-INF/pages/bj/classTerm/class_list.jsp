<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>期数管理</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
</head>
<body>
<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">教师培训</a> &gt; <a href="#">培训班期数管理</a> &gt; 培训班列表</p>
      </div>
      <div class="tablelist">
    	 <div class="title">培训班列表</div>
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassTerm!classList.do">
       		<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="32" >培训班名称：</td>		
							<td>
								<input value="${query.bigclassName}" id="bigclassName" name="query.bigclassName" maxlength="100"  class=""/>
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
							<td>
								<input type="submit" name="button2" id="button2" value="查 询" />
							</td>
						</tr>
        	</table>
        </form>
        <div class="clear"></div>
      </div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassBigclass!list.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="text-align: center;">
	<tr>
	  	<th width="50">序号</th>
	  	<th>培训班名称</th>
	  	<th>培训类别</th>
	  	<th>培训学时</th>
	  	<th>申请人</th>
	  	<th>入库时间</th>
	  	<th>操作</th>
	</tr>
	<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
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
					<fmt:formatDate value="${obj.ts}" pattern="yyyy-MM-dd"/>	
		</td>
		<td>
					<a href="${ctx}/bj/ClassTerm!list.do?query.bigclassId=${obj.id}">期数管理</a>
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
					<jsp:param name="target" value="${ctx}/bj/ClassTerm!classList.do" />
		        </jsp:include>
        	</div>
           </td>
        </tr>
       </table>
   </div>
  </div>
  </div>
</div>
</body>
</html>
