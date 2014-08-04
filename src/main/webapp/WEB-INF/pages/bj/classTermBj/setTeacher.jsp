<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>新增期数班级</title>
<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/scripts/validform/checkform.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
<script src="${ctx}/scripts/openDialog.js" type="text/javascript"></script>
<script src="${ctx}/scripts/validform/Validform_zg_v5.1.js" type="text/javascript"></script>
<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		$("#dataform").Validform();
	});
	function getChangeTeacher(url,teachervalue){
		parent.dialog({
			title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 选择人员',
			autoOpen: true,
			width: 720,
			height: 560,
			modal: true,
			overlay: {
				opacity: 0.5,
				background: "black"
			},
			useIframe: true,
			url:url+teachervalue
		});
	}
	
</script>
</head>
<body>
<div class="right">
<div class="llistbox">
	 <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">教师培训</a> &gt; <a href="#">班级管理</a> &gt; 设置班级教师</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" onclick="goBack()" />
          </p>
      </div>
    <div class="tablelist">
	<div class="title">设置班级教师</div>
	<div class="table01">
  	<form id="dataform" method="post"  action="${ctx}/bj/ClassTermBj!saveTeacher.do" >
    	 <span>
    	 	<input type="hidden" name="id" value="${model.id}"/>
			<c:forEach var="obj" items="${params }" varStatus="vs">
				<input type="hidden" name="${obj.key}" value="${obj.value}"/>
			</c:forEach>
	    </span>
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr class="jg">
	<td width="10%" height="36" class="leftbor" align="right" >班主任：</td>
	<td>
		<textarea rows="2" cols="50" id="teacher1" name="classTeacher1Name" onfocus="openDialogById('${ctx }/bj/ClassTerm!userList.do?teacher=teacher1&type=1')"  datatype='*' nullmsg="请选择班主任啊" tip='请选择班主任'>${model.classTeacher1}</textarea>
		<input type="hidden" value="${model.classTeacher1Id }" id="teacher1Id" name="classTeacher1Id"/>
	</td>
</tr>
<tr>
	<td width="13%" height="36" class="leftbor" align="right" >班辅导老师：</td>
	<td>
		<textarea rows="2" cols="50" id="teacher0" name="classTeacher0Name" onfocus="getChangeTeacher('${ctx }/bj/ClassTerm!userlist.do?teacher=teacher0&type=0?&teacherIds=',$('#teacher0Id').val())" datatype="*" tip="请选择班辅导老师">${model.classTeacher0}</textarea>
		<input type="hidden" value="${model.classTeacher0Id }" id="teacher0Id" name="classTeacher0Id"/>
	</td>
</tr>
<tr class="jg">
	<td width="10%" height="36" class="leftbor" align="right" >任课教师：</td>
	<td>
		<textarea rows="2" cols="50" id="teacher2" name="classTeacher2Name" onfocus="getChangeTeacher('${ctx }/bj/ClassTerm!userlist.do?teacher=teacher2&type=2&teacherIds=',$('#teacher2Id').val())"  datatype='*' nullmsg="请选择任课教师" tip='请选择任课教师'>${model.classTeacher2}</textarea>
		<input type="hidden" value="${model.classTeacher2Id }" id="teacher2Id" name="classTeacher2Id"/>
	</td>
</tr>
</table>  
</table> 
    	<div class="page">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
             <td align="center">
		  		<input type="submit" value="提 交" class="but_cz" />
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
//设置输入框的值
function setTeacherName(param,name,id){
	if(name!=null&&id!=null){
		$("#"+param+"Id").val(id);
		$("#"+param).val(name);
	}
}

function goBack(){
 	location.href="${ctx}/bj/ClassTermBj!list.do?query.classTermId=${query.classTermId}&query.bigclassId=${query.bigclassId}";
}
</script>
</body>
</html>
