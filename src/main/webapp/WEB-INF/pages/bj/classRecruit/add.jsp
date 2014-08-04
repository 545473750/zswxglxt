<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>新增招生</title>
<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/scripts/validform/checkform.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
<script src="${ctx}/scripts/validform/Validform_zg_v5.1.js" type="text/javascript"></script>
<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		$("#dataform").Validform();
	});
</script>
</head>
<body>
<div class="right">
<div class="llistbox">
	 <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">教学教务</a> &gt; <a href="#">招生管理</a> &gt; 新增招生</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" onclick="goBack()" value="返 回" />
          </p>
      </div>
    <div class="tablelist">
	<div class="title">新增招生</div>
	<div class="table01">
  	<form id="dataform" name="dataform" method="post"  action="${ctx}/bj/ClassRecruit!saveAdd.do" >
    	 <span>
			<c:forEach var="obj" items="${params }" varStatus="vs">
				<input type="hidden" name="${obj.key}" value="${obj.value}"/>
			</c:forEach>
	    </span>
    <%@ include file="form_include.jsp" %>
    	<div class="page">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
             <td align="center">
		  		<input type="button" value="提 交" class="but_cz" id="btn" onclick="saveAdd()"/>
		  		<input type="button" value="提交并发布" class="but_cz" onclick="save();"/>
		   		<input type="button" value="取 消" class="but_cz" onclick="goBack()" />
	   		</td>
	   	   </tr>
	   	</table>
		</div>
  </form>
  </div>    
</div> 
  </div>
 </div>
<script type="text/javascript">
function saveAdd(){
	var maxDate = $("#maxDate").val();
	var endTime = $("#endTime").val();
	if(maxDate < endTime){
		alert("报名时间必须在期培训时间之前!");
		return;
	}
	$("#dataform").submit();
}
function save(){
	var maxDate = $("#maxDate").val();
	var endTime = $("#endTime").val();
	if(maxDate < endTime){
		alert("报名时间必须在期培训时间之前!");
		return;
	}
	$("#dataform").attr("action","${ctx}/bj/ClassRecruit!saveAddAndIssue.do");
	$("#dataform").submit();
}
function goBack(){
	location.href="${ctx}/bj/ClassRecruit!list.do"
}
</script>
</body>
</html>
