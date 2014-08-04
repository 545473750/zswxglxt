<%@page import="com.opendata.organiz.model.*" %>
<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/commons/taglibs.jsp" %>
<%@ taglib uri="/WEB-INF/tags/attachment.tld" prefix="attach" %>
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="<c:url value="/scripts/modules/project/util.js"/>"></script>
	<script type="text/javascript">
		
		$(function() {
			$("#dialog")
					.dialog(
							{
								title : '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 组织机构',
								autoOpen : false,
								width : 600,
								resizable : false,
								modal : true,
								autoResize : true,
								overlay : {
									opacity : 0.5,
									background : "black"
								}
							});
			$("#station").change();
			$("#stationLevel").val("${model.stationLevel}");
		});

		function choiceOrganization() {
			// 附带参数，已经选择的组织机构ID
			var selectedIds = document.getElementById('organizationIds').value;
			openDialog('${ctx}/organiz/Organization!choiceOrganization.do?partitionId=${partitionId}&selectedIds=' + selectedIds);
		}
		
		function getAge(date)
		{
// 			var biryear = date.cal.sdate.y;
			var localYear = new Date().getFullYear();
			var age = Number(localYear)-Number(date);
			$("#age").val(age);
		}
		
		var getStates = function(bigStateCode,selectId,url){
			if(!bigStateCode){return ;}
			var smallState = $("#"+selectId);
			var option='<option value="">--请选择--</option>';
			
			if(smallState){
				params = {code:bigStateCode};
			    $.ajax( {
					async : false,
					type : 'POST',
					dataType : "json",
					url : '${ctx}'+url,
					data:params,
					success : function(str) 
					{
			    		for (var i =0;i< str.length;i++){
			    				option += "<option value='"+str[i].code+"'>"+str[i].value+"</option>";
				    		}
						}
					});
				}
			smallState.html(option);
		};
		
	</script>
	
	<s:hidden id="id" name="id" />
	<s:hidden id="partitionId" name="partitionId"/>
	<!-- ONGL access static field: @package.class@field or @vs@field -->
	<!-- 姓名 -->	
	<s:textfield label="%{@com.opendata.organiz.model.User@ALIAS_USERNAME}" 
			cssStyle="width:155px;" 
			cssClass="required" 
			key="username" value="%{model.username}" 
			required="true" />
	<tr>
		<td>
			上传照片:
		</td>
		<td><attach:file styleid="userImage" name="userImage" /></td>
	</tr>		
	<!-- 登录名 -->
	<tr>
		<td>
			&nbsp;<s:property value="%{@com.opendata.organiz.model.User@ALIAS_LOGINNAME}"/>*:
		</td>
		<td>
			<s:hidden name="loginname" id="loginname" value="%{model.loginname}"/>${model.loginname}
		</td>
		<td rowspan="4">
			<s:if test="#request.attachment!=null">
				<img src="${requestScope.servletUrl}?id=${attachment.id}&clientId=${attachment.clientId}" width="140" height="187"/>
			</s:if>
			<s:else>
				<img src="${ctx}/images/no_photo.gif" width="140" height="187"/>
			</s:else>
		</td>
	</tr>
	<c:if test="${id==null}">
	<s:password label="%{@com.opendata.organiz.model.User@ALIAS_PASSWORD}" 
			cssStyle="width:155px;" 
			cssClass="required" 
			key="password" value="%{model.password}" 
			required="true" />
	</c:if>	
	
	
	<!-- 联系方式 -->	
	<s:textfield label="%{@com.opendata.organiz.model.User@ALIAS_PHONE}" 
			cssStyle="width:155px;" 
			cssClass="" 
			key="phone" value="%{model.phone}" 
			required="false" />
	
	<!-- 生日 -->
	<s:textfield label="%{@com.opendata.organiz.model.User@ALIAS_BIRTHDAY}" id="birthday" name="birthday" 
			key="birthday" value="%{model.birthday}"
			onclick="WdatePicker({dateFmt:'yyyy-MM-dd',onpicking:function(dp){getAge(dp.cal.date.y);}});"
			cssClass="" 
			cssStyle="width:155px;" 
			required="false" readonly="true" />
	
	
	<!-- 年龄 -->
	<s:textfield key="age" value="%{model.age}" cssStyle="width:155px;" label="%{@com.opendata.organiz.model.User@ALIAS_AGE}" required="false" ></s:textfield>
	<!-- 工资 -->
	<s:textfield key="salary" value="%{model.salaryDecrypt}" cssStyle="width:155px;" label="工资" cssClass="required validate-integer min-value-0 max-value-2147483647" required="false" ></s:textfield>
	<!-- 性别  -->
	<s:select label="%{@com.opendata.organiz.model.User@ALIAS_SEX}" 
			id="sex" name="sex" list="sexMap" listKey="key" listValue="value" 
			headerKey="" headerValue="--请选择--"/>		
	
	<!-- 电子邮箱 -->
	<s:textfield key="mail" value="%{model.mail}" cssStyle="width:155px;" label="%{@com.opendata.organiz.model.User@ALIAS_MAIL}" required="false"></s:textfield>
	<!-- QQ -->
	<s:textfield key="qq" value="%{model.qq}" cssStyle="width:155px;" label="%{@com.opendata.organiz.model.User@ALIAS_QQ}" required="false"></s:textfield>
	<!-- MSN -->
	<s:textfield key="msn" value="%{model.msn}" cssStyle="width:155px;" label="%{@com.opendata.organiz.model.User@ALIAS_MSN}" required="false"></s:textfield>
	<!-- MSN -->
	<s:textfield key="wblog" value="%{model.wblog}" cssStyle="width:155px;" label="%{@com.opendata.organiz.model.User@ALIAS_WBLOG}" required="false"></s:textfield>
	<!-- 岗位 -->
	<!-- 岗位 -->
	<s:select list="%{#request.stations}" id="station"  listKey="code" listValue="value" value="%{model.station}" onchange="getStates(this.value,'stationLevel','/performance/PerformanceUserDetail!getStates.do')"  headerKey="" headerValue="请选择" label="%{@com.opendata.organiz.model.User@ALIAS_STATION}" ></s:select>
	<!-- 岗位级别 -->
	<tr>
		<td>
			<s:property value="%{@com.opendata.organiz.model.User@ALIAS_STATIONLEVEL}"/>
		</td>
		<td>
			<select id="stationLevel" name="stationLevel" class="required " >
				<option value="" selected="selected">请选择</option>
			</select>
		</td>
	</tr>
	<!-- 是否离职 -->
	<s:radio list="#{0:'是',1:'否'}" key="isLeave" listKey="key" listValue="value" value="%{model.isLeave}" label="%{@com.opendata.organiz.model.User@ALIAS_ISLEAVE}"></s:radio>
	<!-- 状态 -->
	<!--<s:radio list="#{0:'休假',1:'工作'}" key="status" listKey="key" listValue="value" value="%{model.status}" label="%{@com.opendata.organiz.model.User@ALIAS_STATUS}"></s:radio>-->
	
	<!-- 所属部门 -->
	<tr>
		<td>所属部门:</td>
		<td>
			<input id="organizationIds" name="deptIDs" value="<s:property value="%{model.deptIDs}"/>" type="hidden"/>
			<textarea cols="" rows="2" style="width: 330px;" readonly="readonly" id="organizationTexts"><s:property value="%{model.deptsString}"/></textarea>
			<a href="javascript:void(0);" onclick="choiceOrganization();" > <strong>选择</strong></a>
		</td>
	</tr>
	<!-- 备注 -->
	<s:textarea label="%{@com.opendata.organiz.model.User@ALIAS_REMARK}" id="remark" name="remark" cssStyle="width:330px;height:70px;" required="false" />
	<div id="dialog" style="overflow: hidden;">
		<iframe id="addSit" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" width="600" height="344"></iframe>
	</div>
