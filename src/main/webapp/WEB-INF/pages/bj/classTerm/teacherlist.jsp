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
    <div class="tablelist" style="margin: 0px;">
   <div class="search" style="margin: 0px; height: 70px;">
        <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassTerm!seachUser.do">
        	<input type="hidden" name="teacher" value="${teacher }"/>
			<input type="hidden" name="type" value="${type }"/>
        	<table>
        	<tr>
        		<td>姓名：</td>
        		<td  colspan="2">
        			<input value="${username}" id="username" name="username" maxlength="100" size="30" class=""/>
        		</td>
        	</tr>
        	<tr>
        		<td>继教号：</td>
        		<td colspan="2">
        			<input value="${userNum }" id="userNum" name="userNum" maxlength="100" size="30"/>
        		</td>
        	</tr>
        	<tr>
        		<td>所在单位：</td>
        		<td >
        		<input type="text" value="${orgName }" id="orgName" name="orgName" maxlength="100" size="30"/>
        		</td>
        		<td align="right"><input type="submit" value="查询" id="button2" name="button2"/></td>
        	</tr>  
        	</table>
        </form>
        <div class="clear"></div>
      </div>

<div class="table01" style="margin: 0px;">
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassTerm!userList.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<input type="hidden" name="teacher" value="${teacher }"/>
<input type="hidden" name="type" value="${type }"/>
<table style="text-align: center;width: 100%;" cellpadding="0" cellspacing="0" border="0">
	<tr>
	  	<th width="50">序号</th>
	  	<th>继教号</th>
	  	<th>姓名</th>
	  	<th>单位</th>
	  	<th>操作</th>
	</tr>
<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
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
		<td>
			<a href="javascript:void(0);"onclick="addToList('${obj.user.id}', '${obj.user.username }');">
			添加
			</a>
		</td>
	</tr>
</c:forEach>
</table>
</form>
</div>
   <div class="page">
    <table border="0" cellspacing="0" cellpadding="0">
    	 <tr>
           <td width="70%">
            <div class="pages">
				<jsp:include flush="true" page="/commons/pagebar.jsp">
					<jsp:param name="target" value="${ctx}/bj/ClassTerm!seachUser.do?teacher=${teacher}&type=${type }&teacherIds=${teacherIds }&username=${username }&orgName=${orgName }&userNum=${userNum }" />
		        </jsp:include>
		    </div>
		   </td>
		  </tr>
	</table>
   </div>
  </div>
<script type="text/javascript">
function addToList(id,name){
	if(window.parent.document.getElementById("ids").value == ""){
		// 设置ID
		window.parent.document.getElementById("ids").value = id;
		// 设置NAME
		window.parent.document.getElementById("names").value = name;
	} else {
		// 重复的要去掉
		var temp = window.parent.document.getElementById("ids").value;
		if(temp.indexOf(id) != -1) {
			alert("该记录已选择");
			return;
		}
		// 设置ID
		window.parent.document.getElementById("ids").value = window.parent.document.getElementById("ids").value + "," + id;
		// 设置NAME
		window.parent.document.getElementById("names").value = window.parent.document.getElementById("names").value + "," + name;
	}
	// 显示
	//document.getElementById("userList").innerHTML = document.getElementById("userList").innerHTML + "<span id='"+id+"'>" + name + "&nbsp;<a onclick=\"delItem('"+id+"', '" + name + "')\" href='#'>X</a>&nbsp;&nbsp;</span>";
	window.parent.document.getElementById("userList").innerHTML = 
	window.parent.document.getElementById("userList").innerHTML + "<div class='iframe_name_box' id='" + id + "'><p class='iframe_name_text'>" + name + "</p><p class='iframe_name_close'><a onclick=\"delItem('" + id + "', '" + name + "')\"><img src='${ctx}/images/component/open_textboxclose.gif' width='11' height='11' /></a></p></div>";
}
	//$("#shop").smartFloat();  
</script>
</body>
</html>
