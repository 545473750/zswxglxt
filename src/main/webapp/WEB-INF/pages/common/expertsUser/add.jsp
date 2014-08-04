<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>组员添加</title>
<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/scripts/validform/checkform.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
<script src="${ctx}/scripts/validform/Validform_zg_v5.1.js" type="text/javascript"></script>
<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		//$("#dataform").Validform();
	});
	function setAllCheckboxState(name,state) {
		var elms = document.getElementsByName(name);
		for(var i = 0; i < elms.length; i++) {
			if(elms[i].disabled == false){
				elms[i].checked = state;
			}
			
		}
	}
</script>
</head>
<body>
	<div class="right">
		<div class="llistbox">
			 <div class="listmap">
	          	<p class="dqwz">当前位置：<a href="#">教师培训</a> &gt; <a href="#">专家组人员管理</a> &gt; 添加专家组人员</p>
	          	<p class="fhbut">
	            	<input type="button" name="button" id="button" value="返 回" onclick="goBack()"/>
	          	</p>
	      	  </div>
 			  <div class="tablelist">
 			  
			  	<div class="title">添加专家组人员</div>
			  	<div class="search">
			        <form id="queryForm" name="queryForm" method="post" action="${ctx}/common/ExpertsUser!add.do">
			        	<input type="hidden" name="objId" value="${objId }" />
				    	<input type="hidden" name="expertsId" value="${expertsId }"/>
				    	<input type="hidden" name="id" value="${model.id}"/>
				    	<input type="hidden" name="id" value="${userCount }"/>
				    	<input type="hidden" name="query.experts.id" value="${query.experts.id }"/>
			        	<table>
							<tr>
								<td>姓名：</td>
								<td><input value="${username}" id="username" name="username" maxlength="100" size="30" class=""/> </td>
								<td>继教号：</td>
								<td><input value="${userNum}" id="userNum" name="userNum" maxlength="100" class=""/></td>
							</tr>
							<tr>
								<td>所在单位：</td>
								<td><input type="text" value="${orgName }" id="orgName" name="orgName" maxlength="100" size="30"/></td>
								<td colspan="2" align="right"><input type="submit" value="查询" id="button2" name="button2" /></td>
							</tr>
						</table>
			        </form>
			        <div class="clear"></div>
			      </div>
				<div class="table01" align="center">
			  	<form id="dataform" method="post"  action="${ctx}/common/ExpertsUser!saveAdd.do" >
				    <span>
				    	<input type="hidden" name="id" value="${model.id}"/>
				    	<input type="hidden" name="id" value="${userCount }"/>
					<c:forEach var="obj" items="${params}" varStatus="vs">
						<input type="hidden" name="${obj.key}" value="${obj.value}"/>
					</c:forEach>
				    </span>
				    <%@ include file="form_include.jsp" %>
				    <input type="hidden" name="objId" value="${objId }" />
				    <input type="hidden" name="expertsId" value="${expertsId }"/>
					<div class="page">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
						<input type="button" value="提 交" class="but_cz" onclick="save()"/>
					    <input type="button" value="取 消" class="but_cz" onclick="goBack()" />
						</td>
					</tr>
				</table>
			</div>
			  </form>
  			</div>
		<div class="page">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
	   	 <tr>
	          <td width="70%">
	           <div class="pages">
				<jsp:include flush="true" page="/commons/pagebar.jsp">
					<jsp:param name="target" value="/common/ExpertsUser!add.do?objId=${objId}&username=${username }&orgName=${orgName }&userNum=${userNum }" />
		        </jsp:include>
		   	</div>
		   	</td>
		  </tr>
		</table>
		</div>
  		</div>
   </div>
</div>
<script type="text/javascript">
	function goBack(){
		location.href="${ctx}/common/ExpertsUser!list.do?query.experts.id=${expertsId}";
	}
	function save(){
		var items = $("input[name=items]:checked");
		var size = items.length+${userCount};
		if(size<=1){
			alert("专家组成员人数必须大于1!");
			return;
		}
		if(size%2==0){
			alert("专家组成员人数必须是奇数!");
			return;
		}
		$("#dataform").submit();
	}
</script>
      
</body>
</html>
