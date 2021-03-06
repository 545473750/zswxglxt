<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>修改专家组</title>
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
          <p class="dqwz">当前位置：<a href="#">教师培训</a> &gt; <a href="#">专家组管理</a> &gt; 修改专家组</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" />
          </p>
      </div>
    <div class="tablelist">
	<div class="title">修改专家组</div>
	<div class="table01">
  	<form id="dataform" method="post"  action="${ctx}/common/Experts!saveEdit.do" >
    	 <span>
		    	<input type="hidden" name="id" value="${model.id}"/>
				<c:forEach var="obj" items="${params }" varStatus="vs">
					<input type="hidden" name="${obj.key}" value="${obj.value}"/>
				</c:forEach>
		    </span>
    <%@ include file="form_include.jsp" %>
     <input type="hidden" name="objId" value="${objId }" />
    	<div class="page">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
             <td align="center">
		  		<input type="submit" value="提 交" class="but_cz" id="btn" />
		   		<input type="button" value="取 消" class="but_cz" onclick="history.back(-1)" />
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
