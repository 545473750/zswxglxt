<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 实体表单-->
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
<input type="hidden" value="${model.orderNum}" id="orderNum" name="orderNum"/>
<tr class="jg" >
	<td width="18%" align="right" height="36" class="leftbor" >名称：</td>
	<td>
		<input type="text" value="${model.name}" id="name" name="name" size="65" datatype='string' max='100'  tip='长度不能超过100'/>
	</td>
</tr>
<tr id="fun" <c:if test="${model.actType != 2 }"> class="jg" </c:if> >
	<td width="18%" align="right"  height="36" class="leftbor" >功能描述：</td>
	<td>
		<textarea id="description" name="description" rows="3" cols="50" datatype='*' max='500' ignore='ignore'  tip='长度不能超过500'>${model.description }</textarea>
	</td>
</tr>
</table>         

<script type="text/javascript">
function change(){
	var acttype = $("#actType").val();
	if(acttype == 1 || acttype == ''){
		$("#radio").css("display","none");
		$("#fun").attr("class","jg");
	}
	if(acttype == 2){
		$("#radio").css("display","");
		$("#fun").removeClass("jg");
	}
}
</script>
