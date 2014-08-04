<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>班级成员管理</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
</head>
<body>
<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">教师培训</a> &gt; <a href="#">班级成员管理</a> &gt; 班级成员列表</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" onclick="goBack()" />
          </p>
      </div>
      <div class="tablelist">
    	 <div class="title">班级成员管理</div>
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassBjUser!bmlist.do">
          	<input type="hidden" name="query.classBjId"  value="${query.classBjId }"/>
          	<input type="hidden" name="query.classTermId" value="${query.classTermId }"/>
          	<input type="hidden" name="query.bigclassId" value="${query.bigclassId }"/>
       		<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="32" >姓名：</td>		
							<td>
								<input value="${query.username}" id="query.username" name="query.username" maxlength="100"  class=""/>
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
	        <input type="button" class="but_cz"  onclick="adduser('${ctx}/bj/ClassBjUser!saveBaoming.do','items',document.listForm);" value="录取" />
          	<!--
          	<input type="button" class="but_cz"  onclick="adduser('${ctx}/bj/ClassBjUser!noPass.do','items',document.listForm);" value="不录取">
        	-->
        </td>
      </tr>
    </table>
</div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassBjUser!saveBaoming.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<input type="hidden" name="source" value="2"/>
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="text-align: center;">
	<tr>
	    <th width="30">
	  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
	    </th>
	  	<th width="50">序号</th>
	  	<th >姓名</th>
	  	<th >性别</th>
	  	<th >出生日期</th>
	  	<th >学历</th>
	  	<th >职称</th>
	  	<th >状态</th>
	</tr>
	<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td>
			<input type="checkbox" <c:if test="${obj.checked == 1 }">checked="checked" disabled="true"</c:if> name="items" value="id=${obj.id}&">
		</td>
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
					<a href="${ctx}/bj/ClassBjUser!view.do?id=${obj.id}">${obj.user.username}</a>
		</td>
		<td>
					${SEX[obj.user.teacher.sex] }
		</td>
		<td>
					${obj.user.teacher.birthMonth}
		</td>
		<td>
					${xl[obj.user.teacher.education]}
		</td>
		<td>
					${zc[obj.user.teacher.title]}
		</td>
		<td>
					<c:if test="${obj.admitState==2}">未处理</c:if>
					<c:if test="${obj.admitState==3}">已录取</c:if>
					<c:if test="${obj.admitState==4}">未录取</c:if>
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
					<jsp:param name="target" value="/bj/ClassBjUser!list.do" />
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
	function goBack(){
		location.href="${ctx}/bj/ClassBjUser!list.do?query.classBjId=${query.classBjId}&query.bigclassId=${query.bigclassId}&query.classTermId=${query.classTermId}";
	}
	function adduser(action,checkboxName,form){
		//var size = $(":checked[name=items]").length;
		//var count ="${query.planCount}";//计划招生人数
		//var num = "${query.actualCount}";//实际招生人数
		//var renshu = Number(size) + Number(num);
		//if(renshu>count){
		//	alert("实际招生人数将超过班级计划招生数!");
		//	return;
		//}
	    if (!hasOneChecked(checkboxName)){
	            alert('请选择要操作的对象!');
	            return;
	    }
	    form.action = action;
	    form.submit();
	}
</script>
</body>
</html>
