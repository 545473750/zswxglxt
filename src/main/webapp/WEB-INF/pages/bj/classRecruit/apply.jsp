<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>招生管理</title>
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
          <p class="dqwz">当前位置：<a href="#">教学教务</a> &gt; <a href="#">培训班报名</a> &gt; 报名列表</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" />
          </p>
      </div>
      <div class="tablelist">
    	 <div class="title">个人报名管理</div>
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassRecruit!applyList.do">
       		<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="32" >招生标题：</td>		
							<td>
								<input value="${query.title}" id="title" name="query.title" maxlength="100"  class=""/>
							</td>
							<td height="32" >是否已报名：</td>		
							<td>
								<select id="bmState" name="bmState" >
									<option value="0" <c:if test="${bmState==0 }"> selected="selected" </c:if>>未报名</option>
									<option value="1" <c:if test="${bmState==1 }"> selected="selected" </c:if>>已报名</option>
								</select>
							</td>
							<td>
								<c:if test="${type == 2}">
								<input type="button" name="button2" id="button2" class="but_cz" value="查 询" onclick="seach('${ctx}/bj/ClassRecruit!applyList.do',document.queryForm)" />
								</c:if>
								<c:if test="${type == 3}">
								<input type="button" name="button2" id="button2" class="but_cz" value="查 询" onclick="seach('${ctx}/bj/ClassRecruit!applySet.do',document.queryForm)" />
								</c:if>
							</td>
						</tr>
						<tr>
							<td height="32" >招生期间：</td>		
							<td colspan="4">
								<input value="<fmt:formatDate value="${query.startTime}" pattern="yyyy-MM-dd"/>" id="startTime" name="query.startTime" onclick='WdatePicker({isShowClear:true,readOnly:true})' maxlength="100"  class=""/>
							至
								<input value="<fmt:formatDate value="${query.endTime}" pattern="yyyy-MM-dd"/>" id="endTime" name="query.endTime" onclick='WdatePicker({isShowClear:true,readOnly:true})' maxlength="100"  class=""/>
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
        <c:if test="${bmState == 0}">
          <input type="button" class="but_cz"  onclick="apply('${ctx}/bj/ClassBjUser!saveBm.do','items',document.listForm);" value="报名" />
        </c:if>
        </td>
      </tr>
    </table>
</div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassRecruit!list.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="text-align: center;">
	<tr>
		<c:if test="${bmState == 0}">
	    <th width="30">
	  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
	    </th>
	    </c:if>
	  	<th width="50">序号</th>
	  	<th >招生标题</th>
	  	<th >报名时间</th>
	  	<th >招生对象</th>
	  	<th>报名方式</th>
	  	<th>报名状态</th>
	</tr>
	<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<c:if test="${bmState == 0}">
		<td>
			<input type="checkbox" name="items" value="id=${obj.classTermRecruit.classRecruit.id}&">
			<input type="hidden" name="objId" value="${obj.classTermRecruit.classRecruit.id }"/>
		</td>
		</c:if>
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
					<a href="${ctx}/bj/ClassRecruit!detailed.do?id=${obj.classTermRecruit.classRecruit.id}&type=${obj.source}&bmState=${bmState}">${obj.classTermRecruit.classRecruit.title}</a>
		</td>
		<td>
					<fmt:formatDate value="${obj.classTermRecruit.classRecruit.startTime}" pattern="yyyy-MM-dd"/>
					至
					<fmt:formatDate value="${obj.classTermRecruit.classRecruit.endTime}" pattern="yyyy-MM-dd"/>
		</td>
		<td>
					${obj.classTermRecruit.classBigclass.recruitObj }
		</td>
		<td>
					<c:if test="${obj.source == 1}">无</c:if>
					<c:if test="${obj.source == 2}">个人报名</c:if>
					<c:if test="${obj.source == 3}">集体报名</c:if>
		</td>
		<td>
					<c:if test="${obj.admitState == 0}">审核中</c:if>
					<c:if test="${obj.admitState == 1}">审核未通过</c:if>
					<c:if test="${obj.admitState == 2}">审核通过</c:if>
					<c:if test="${obj.admitState == 3}">已录取</c:if>
					<c:if test="${obj.admitState == 4}">未录取</c:if>
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
					<jsp:param name="target" value="/bj/ClassRecruit!list.do" />
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
function seach(action,form){
	form.action = action;
	form.submit();
}
function apply(action,checkboxName,form){
	if (!hasOneChecked(checkboxName)){
        alert('请选择要操作的对象!');
        return;
	} else {
	   	if(confirm("确定执行[报名]操作?")){
	    	form.action = action;
	        form.submit();
	    }
	}
}
</script>
</body>
</html>
