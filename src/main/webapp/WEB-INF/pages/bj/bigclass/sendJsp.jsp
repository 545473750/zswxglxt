<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>流程表管理</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
</head>
<body>

<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">教师培训</a> &gt; <a href="#">培训班管理</a> &gt; 培训班流程列表</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" onclick="goBack()" />
          </p>
      </div>
      <div class="tablelist">
    	 <div class="title">培训班流程列表</div>
      <div class="search">
        <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassBigclass!toSendJsp.do">
        <table border="0" cellspacing="0" cellpadding="0">
        	<tr>
        		<td>
        		名称：
        		<input value="${projectName}" id="projectName" name="projectName" maxlength="100"  class=""/> 
        		</td>
	        	<td>
	        		<input type="submit" name="button2" id="button2" value="查 询" />
	        	</td>  
        	</tr>
        </table>
        </form>
        <div class="clear"></div>
      </div>

   <div class="clear"></div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassBigclass!send.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<input type="hidden" name="id" value="${id }">
<table cellpadding="0" cellspacing="0" border="0" width="100%" style="text-align: center;">
	<tr>
	    <th width="30">
	    </th>
	  	<th width="50">序号</th>
	  	<th >名称</th>
	  	<th >所在组</th>
	  	<th >添加人姓名</th>
	  	<th >状态</th>
	  	<th >创建时间</th>
	</tr>
<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" <c:if test="${fn:length(obj.wfActivitys)<=0  }">style="background-color:yellow;"</c:if>>
		<td>
			<input type="radio" name="projectId" value="${obj.id}">
		</td>
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
					<a href="${ctx}/bj/ClassBigclass!wfPView.do?projectId=${obj.id}">${obj.name}</a>
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
	</tr>
</c:forEach>
</table>
</form>
</div>
	<div class="page">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:center;margin-bottom: 8px;">
    	 <tr>
           <td>
           	<input type="button" onclick="send()" value="提交" class="but_cz"/>&nbsp;&nbsp;<input type="button" value="返回" onclick="goBack()" class="but_cz"/>
           </td>
        </tr>
       </table>
   </div>
   <div class="page">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	 <tr>
           <td width="70%">
            <div class="pages">
			<jsp:include flush="true" page="/commons/pagebar.jsp">
				<jsp:param name="target" value="/bj/ClassBigclass!toSendJsp.do" />
	        </jsp:include>
   			</div>
           </td>
        </tr>
       </table>
   </div>
  </div>
</div>
<script type="text/javascript">
	//$("#shop").smartFloat();  
	
	function goBack(){
		location.href="${ctx}/bj/ClassBigclass!list.do";
	}

	function send(){
		var value = $("input:radio[name=projectId]:checked").val();
		if(value == null){
			alert("请选择要操作的对象!");
			return;
		}
		$("#listForm").submit();
	}

</script>
</div>
</body>
</html>
