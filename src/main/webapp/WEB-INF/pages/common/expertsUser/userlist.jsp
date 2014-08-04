<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>专家组管理</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
</head>
<body>
<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">教师培训</a> &gt; <a href="#">专家组人员管理</a> &gt; 专家组人员列表</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" onclick="goBack()" value="返 回" />
          </p>
      </div>
      <div class="tablelist">
    	 <div class="title">专家组人员管理</div>
      <div class="search">
        <div class="clear"></div>
      </div>
<div class="page">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>
	      <input type="button" class="but_cz"  onclick="add('${ctx}/common/ExpertsUser!add.do',document.listForm);" value="添加人员" />
          <input type="button" class="but_cz"  onclick="batchDelete2('${ctx}/common/ExpertsUser!remove.do','items',document.listForm);" value="删除人员" />
       	  <span style="color: red;">专家组成员人数为3、5、7、9等大于1的奇数,否则不能使用</span>
        </td>
      </tr>
    </table>
</div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/common/ExpertsUser!list.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<input type="hidden" name="objId" value="${objId }" />
<input type="hidden" name="groupFlag" value="${groupFlag }"/>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
	    <th width="30">
	  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
	    </th>
	  	<th width="50">序号</th>
	  	<th >继教号</th>
	  	<th >姓名</th>
	</tr>
	<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td>
			<input type="checkbox" name="items" value="id=${obj.id}&">
		</td>
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
				${obj.userNum }
		</td>
		<td>
				<input type="hidden"  name = "userId" id = "userId" value = "${obj.userId }"/>
				${obj.userName }
		</td>
	</tr>
</c:forEach>
</table>
</form>
</div>
    <div class="page">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	 <tr>
           <td width="70%">
            <div class="pages">
				<jsp:include flush="true" page="/commons/pagebar.jsp">
					<jsp:param name="target" value="/common/ExpertsUser!list.do" />
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
		location.href="${ctx}/common/Experts!list.do";
	}
	function batchDelete2(action,checkboxName,form){
		if (!hasOneChecked(checkboxName)){
            alert('请选择要操作的对象!');
            return;
	    }else{
			var length = $("input[name=items]").length;	
			var checkedLength = $("input[name=items]:checked").length;
			if(length!=checkedLength){
				if(length-checkedLength==1){
					alert("专家成员人数必须大于1且为奇数!");
					return;
				}
				if((length-checkedLength)%2==0){
					alert("专家组成员人数必须为奇数!");
					return;
				}
			}		
	    }
	    if (confirm('确定执行[删除]操作?')){
	        form.action = action;
	        form.submit();
	    }
	}
</script>
</body>
</html>
