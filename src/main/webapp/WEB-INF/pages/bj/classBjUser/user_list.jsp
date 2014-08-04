<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>用户列表</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
  </head>
  
<body>

  <div class="right">
  <div class="llistbox">
  	 <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">教师培训</a> &gt; <a href="#">班级成员管理</a> &gt; 用户列表</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" onclick="goBack()" />
          </p>
      </div>
    <div class="tablelist">
    	 <div class="title">用户列表</div>
    <div class="centent">
      <div class="search">
        <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassBjUser!userList.do">
			<input type="hidden" name="query.classTermId" value="${query.classTermId }"/>
			<input type="hidden" name="query.classBjId" value="${query.classBjId }"/>
			<input type="hidden" name="query.bigclassId" value="${query.bigclassId }"/>
        	<table>
				<tr>
					<td>姓名：</td>
					<td><input value="${username}" id="username" name="username" maxlength="100" size="30" class=""/> </td>
					<td>继教号：</td>
					<td><input value="${userNum}" id="userNum" name="userNum" maxlength="100" class=""/></td>
				</tr>
				<tr>
					<td>所在单位：</td>
					<td><input type="text" value="${orgName }" id="orgName" name="orgName" maxlength="100" size="30"/></td>
					<td colspan="2" align="right"><input type="submit" value="查询" id="button2" name="button2" /></td>
				</tr>
			</table>
        </form>
        <div class="clear"></div>
      </div>

<div class="table01">
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassBjUser!saveAdd.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<input type="hidden" name="source" value="1"/>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
	    <th width="30">
	  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
	    </th>
	  	<th width="50">序号</th>
	  	<th>继教号</th>
	  	<th >名称</th>
	  	<th>单位</th>
	</tr>
<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" onMouseOver=this.className="highlight" onMouseOut=this.className="${vs.count % 2 == 0 ? 'jg' : ''}">
		<td align="center">
			<input type="checkbox" <c:if test="${obj.user.checked == 1}">disabled="true" checked="checked"</c:if> <c:if test="${obj.user.checked != 1 }">name="items"</c:if> value="id=${obj.user.id}&">
		</td>
		<td align="center">
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td align="center">
			${obj.user.userNum }
		</td>
		<td align="center">
			${obj.user.username}
		</td>
		<td align="center">
			${obj.organization.name }
		</td>
	</tr>
</c:forEach>
	
</table>
</form>
</div>
	<div class="page" style="margin-bottom: 8px;">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr >
				<td colspan="5" align="center">
					<input type="button" class="but_cz"  onclick="adduser('items',document.listForm);" value="提交" />
					<input type="button" class="but_cz"  onclick="goBack()" value="取消"/>
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
					<jsp:param name="target" value="/bj/ClassBjUser!userList.do?username=${username }&orgName=${orgName }&userNum=${userNum }" />
		        </jsp:include>
		    </div>
		   </td>
		  </tr>
	</table>
   </div>
  </div>
</div>
<script type="text/javascript">
function adduser(checkboxName,form){
	//var size = $(":checked[name=items]").length;
	//var count ="${query.planCount}";//计划招生人数
	//var num = "${query.actualCount}";//实际招生人数
	///var renshu = Number(size) + Number(num);
    if (!hasOneChecked(checkboxName)){
            alert('请选择要操作的对象!');
            return;
    }
   // if(renshu>count){
		//alert("实际招生人数将超过班级计划招生数!");
		//return;
	//}
    form.submit();
}
function goBack(){
	location.href="${ctx}/bj/ClassBjUser!list.do?query.classBjId=${query.classBjId}&query.bigclassId=${query.bigclassId}&query.classTermId=${query.classTermId}";
}
	//$("#shop").smartFloat();  
</script>
</div>
</body>
</html>
