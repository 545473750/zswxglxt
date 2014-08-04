<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/commons/taglibs.jsp"%>
		<script src="${ctx}/scripts/application.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
		<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
		<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
<script type="text/javascript">
		
		function changetype(){
			var dataScope = $("#dataScope").val();
			
			if(dataScope=='3'){
				var fanwei = document.getElementById("fanwei");
				fanwei.style.display="block";
			}else{
				var fanwei = document.getElementById("fanwei");
				fanwei.style.display="none";
			}
			if(dataScope!='3'){
				var qita = document.getElementById("qita");
				qita.style.display="block";
			}else{
				var qita = document.getElementById("qita");
				qita.style.display="none";
			}
		}
		
	</script>
<s:hidden id="id" name="id" />
<!-- 实体表单-->
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >用户id：</td>
	<td>
		<select id="userId" name = "userId" datatype="*" nullmsg="请选择用户！" errormsg="请选择用户！">
            			<c:forEach items="${userName}" var="user">
            				<option value = "${user.id}" <c:if test="${user.loginname == model.userId }">selected="selected" </c:if> >${user.loginname } &nbsp;&nbsp; ${user.username }</option>
                    	</c:forEach> 
		</select>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >数据范围</td>
	<td>
		<select id="dataScope" name = "dataScope" onchange="changetype(this)" datatype="*" nullmsg="请选择授权范围！" errormsg="请选择授权范围！">
				<option value = ""  >---请选择--- </option>
           <c:forEach items="${dicList}" var="dic">
            	<option value = "${dic.key}"  <c:if test="${dic.key == model.dataScope }">selected="selected" </c:if>>${dic.value } </option>
           </c:forEach> 
		</select>
	</td>
</tr>
<!-- 选择指定时显示 -->
		<tr class="jg">
		<td width="10%" height="36" class="leftbor" >注意</td>
		<td>
			<div>
		      <div id = "fanwei" style="display:none;">
		      	  <font color="red">选择”指定“选项后请在列表页面进行‘用户设置’</font>
				  
			  </div>
			</div>
			<div>
				<div id = "qita" style="display:none;">
		      	  <font color="red">请在列表页面进行‘权限设置’</font>
				  
			  </div>
			</div>
		</td>
		</tr>
</table>   
