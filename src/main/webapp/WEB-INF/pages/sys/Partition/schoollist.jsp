<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>招生学校</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>
<body>
   <div class="tablelist" style="margin: 0px;">
   <div class="search" style="margin: 0px; height: 30px;">
       <form id="queryForm" name="queryForm" method="post" action="${ctx}/sys/Partition!findSchool.do">
    		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="32" >单位名称：</td>		
				<td>
					<input value="${query.name}" id="name" name="query.name" maxlength="100"  class=""/>
				</td>
				<td>
					<input type="submit" name="button2" id="button2" value="查 询" />
				</td>
			</tr>
     	</table>
     </form>
   </div>
<div class="table01" style="margin: 0px;">
<form id="listForm" name="listForm" method="post" action="${ctx}/sys/Partition!findSchool.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<table style="text-align: center;width: 100%;" cellpadding="0" cellspacing="0" border="0">
	  	<th width="50">序号</th>
	  	<th width="280">学校名称</th>
	  	<th >操作</th>
	</tr>
	<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
			${obj.name}
			<input type="hidden" name="username2" value="${obj.name}"/>
		</td>
		<td>
			<a href="javascript:void(0);"onclick="addToList('${obj.id}', '${obj.name }');">
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
					<jsp:param name="target" value="/sys/Partition!findSchool.do" />
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
	var nameFmt = name;
	
	if(nameFmt.length>16){
		nameFmt = nameFmt.substring(0,15)+"...";
	}
	// 显示
	//document.getElementById("userList").innerHTML = document.getElementById("userList").innerHTML + "<span id='"+id+"'>" + name + "&nbsp;<a onclick=\"delItem('"+id+"', '" + name + "')\" href='#'>X</a>&nbsp;&nbsp;</span>";
	window.parent.document.getElementById("userList").innerHTML = 
	window.parent.document.getElementById("userList").innerHTML + "<div class='iframe_name_box' id='" + id + "'><p class='iframe_name_text' title='"+ name +"'>" + nameFmt + "</p><p class='iframe_name_close'><a onclick=\"delItem('" + id + "', '" + name + "')\"><img src='${ctx}/images/component/open_textboxclose.gif' width='11' height='11' /></a></p></div>";
}
	
</script>
</body>
</html>
