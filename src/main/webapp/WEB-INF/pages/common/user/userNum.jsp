<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>继教号录入</title>
<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/scripts/validform/checkform.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
<script src="${ctx}/scripts/validform/Validform_v5.3.2.js" type="text/javascript"></script>
<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
	<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
	$(function(){
		$("#dataform").Validform({
			tiptype:3
		});
	});
</script>
</head>
<body>
<div class="right">
<div class="llistbox">
	<div class="listmap">
          <p class="dqwz">当前位置： 继教号录入</p>
          <p class="fhbut">
          </p>
      </div>

    <div class="tablelist">
	<div class="title"> 继教号录入</div>
	<div class="table01">
  	<form id="dataform" method="post"  action="${ctx}/common/CommonUser!updateUserNum.do" enctype="multipart/form-data">
    	
		<!-- 实体表单-->
		<table width="100%" cellpadding="0" cellspacing="0" border="0" class="uiTable">
		<tr  >
			<td width="15%" height="36" class="leftbor" align="center">身份证号：</td>
			<td>
				<input type="text" value="${model.IDNum}" id="IDNum" name="IDNum"   ajaxurl="${ctx}/common/CommonUser!validIDNum.do"  datatype='*'  tip='身份证号' style="width: 320px"/>
			</td>
		</tr>
		
		<tr class="jg" >
			<td width="15%" height="36" class="leftbor" align="center">继教号：</td>
			<td>
				<input type="text" value="${model.userNum}" id="userNum" name="userNum" ajaxurl="${ctx}/common/CommonUser!validUserNum.do"   datatype='*' max='100'  tip='继教号' style="width: 320px"/>
			</td>
		</tr>
		
		</table>        

    	
    	<div class="page">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
             <td align="center">
		  		<input type="submit" value="保存" class="but_cz" id="btn" />
	   		</td>
	   	   </tr>
	   	</table>
		</div>
  </form>
  </div>    
</div> 
  </div>
 </div>
</body>
</html>
<%@ include file="/commons/messages.jsp"%>
