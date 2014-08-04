<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看系统编制</title>
<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/scripts/validform/checkform.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
<script src="${ctx}/scripts/validform/Validform_zg_v5.1.js" type="text/javascript"></script>
<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>
<body  style="border: 0px solid red;height:500px; overflow-y: auto;overflow-x:hidden;">
<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">系统管理</a>  &gt; 系统编制</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" onclick="history.back(-1)"/>
          </p>
      </div>
    <div class="tablelist">
     <div class="title">查看系统编制</div>
      <div class="table01">
   <!-- 实体表单-->
<table width="100%" cellpadding="0" cellspacing="0" border="0" >

<tr  >
	<td width="15%" height="36"    align="center">编制名称：</td>
	<td >
		${model.name}
	</td>
	</tr>
	<tr  >
					<td width="10%" height="36" align="center" > 
				所属部门：
			</td>
			<td>
					${model.org.name}
			</td>
		</tr>
		<tr class="jg" >
					<td width="10%" height="36" align="center" > 
				业务范围：
			</td>
			<td>
					${ywfw[model.scope]}
			</td>
		</tr>
		<tr  >
					<td width="10%" height="36" align="center" > 
				角色：
			</td>
			<td>
					${model.role.name}
			</td>
		</tr>
		<tr class="jg" >
					<td width="10%" height="36" align="center" > 
				学科：
			</td>
			<td>
					${xk[model.subjectId]}
			</td>
		</tr>
		<tr  >
					<td width="10%" height="36" align="center" > 
				学段：
			</td>
			<td>
					${xd[model.semester]}
			</td>
		</tr>
		<tr class="jg" >
					<td width="10%" height="36" align="center" > 
				在编人员：
			</td>
			<td>
					${model.user.username}
			</td>
		</tr>
		<tr  >
					<td width="10%" height="36" align="center"> 
				是否外部编制：
			</td>
			<td>
				${model.isOut==0?"是":"否" }	
			</td>
		</tr>
		<tr class="jg" >
					<td width="10%" height="36" align="center" > 
				直接上级：
			</td>
			<td>
					${zjsj[model.directHeader]}
			</td>
		</tr>
		<tr  >
					<td width="10%" height="36" align="center" > 
				编制说明：
			</td>
			<td>
					${model.description}
			</td>
		</tr>
		<tr class="jg" >
					<td width="10%" height="36" align="center" > 
				显示顺序：
			</td>
			<td>
					${model.seq}
			</td>
		</tr>
		<tr class="jg" >
					<td width="10%" height="36" align="center" > 
				添加人姓名：
			</td>
			<td>
					${model.addUserName}
			</td>
		</tr>
		<tr  >
					<td width="10%" height="36" align="center" > 
				添加时间：
			</td>
			<td>
					<fmt:formatDate value="${model.addTime}" pattern="yyyy-MM-dd"/>
			</td>
		</tr>
</table>
	<div class="page">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
             <td align="center">
		  		<input type="button" value="返回" class="but_cz" onclick="history.back(-1)" />
	   		</td>
	   	   </tr>
	   	</table>
	</div>
 </div>
  </div>
  </div>
  </div>
</body>
</html>
