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
          <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassBjUser!list.do">
          	<input type="hidden" name="query.bigclassId" value="${query.bigclassId }"/>
          	<input type="hidden" name="query.classTermId" value="${query.classTermId }"/>
          	<input type="hidden" name="query.classBjId"  value="${query.classBjId }"/>
       		<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="32" >姓名：</td>		
							<td>
								<input value="${query.user.username}" id="query.user.username" name="query.user.username" maxlength="100"  class=""/>
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
	      <input type="button" class="but_cz"  onclick="add('${ctx}/bj/ClassBjUser!userList.do',document.listForm);" value="添加学员" />
	      <input type="button" class="but_cz"  onclick="addBaoM('${ctx}/bj/ClassBjUser!bmlist.do',document.listForm);" value="报名学员管理"/>
          <input type="button" class="but_cz"  onclick="batchDelete('${ctx}/bj/ClassBjUser!remove.do','items',document.listForm);" value="删除" />
        </td>
      </tr>
    </table>
</div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassBjUser!list.do">
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
	  	<th >姓名</th>
	  	<th >性别</th>
	  	<th >出生日期</th>
	  	<th >学历</th>
	  	<th >职称</th>
	</tr>
	<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td>
			<input type="checkbox" name="items" value="id=${obj.id}&">
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
		location.href="${ctx}/bj/ClassTermBj!list.do?query.classTermId=${query.classTermId}&query.bigclassId=${query.bigclassId}";
	}
	function addBaoM(action,form){
		form.action = action;
    	form.submit();
	}
</script>
</body>
</html>
