<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>流程功能点表管理</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
</head>
<body>

<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">首 页</a> &gt; <a href="#">功能点管理</a> &gt; 功能点列表</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" />
          </p>
      </div>
  
    <div class="tablelist">
    	 <div class="title">功能点管理</div>
      <div class="search">
        <form id="queryForm" name="queryForm" method="post" action="${ctx}/wf/WfFunction!list.do">
        	<table border="0" cellspacing="0" cellpadding="0">
        	<tr>
        		<td height="32">
        		名称：
        		<input value="${query.name}" id="name" name="query.name" maxlength="100"  class=""/> 
        		</td>  
        		<td>
        		节点类型：
        		<select id="insType" name="query.insType" >
					<option value="">--请选择--</option>
					<option value="1" <c:if test="${query.insType == 1 }">selected="selected"</c:if> >开始</option>
					<option value="2" <c:if test="${query.insType == 2 }">selected="selected"</c:if> >普通</option>
					<option value="9" <c:if test="${query.insType == 9 }">selected="selected"</c:if> >结束</option>
				</select>
        		</td>  
        		<td>
        			<input type="submit" name="button2" id="button2" value="查 询" />
        		</td>  
        	</tr>
        </table>
        </form>
        <div class="clear"></div>
      </div>
<div class="page">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
         <td>
          <input type="button" class="but_cz"  onclick="add('${ctx}/wf/WfFunction!add.do',document.listForm);" value="添加" />
          <input type="button" class="but_cz"  onclick="edit('${ctx}/wf/WfFunction!edit.do','items',document.listForm);" value="修改" id="edit"/>
          <input type="button" class="but_cz"  onclick="batchDelete2('${ctx}/wf/WfFunction!remove.do','items',document.listForm);" value="删除" />
        </td>
      </tr>
    </table>
</div>
<div class="clear"></div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/wf/WfFunction!list.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
	    <th width="30">
	  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
	    </th>
	  	<th width="50">序号</th>
	  	<th >名称</th>
	  	<th >页面url</th>
	  	<th >所在组</th>
	  	<th >参数名称</th>
	  	<th >功能分类</th>
	  	<th >节点类型</th>
	</tr>
<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" onMouseOver=this.className="highlight" onMouseOut=this.className="${vs.count % 2 == 0 ? 'jg' : ''}">
		<td>
			<input type="checkbox" name="items" value="id=${obj.id}&">
			<input type="hidden" name="objId" value="${obj.id }"/>
		</td>
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
					<a href="${ctx}/wf/WfFunction!view.do?id=${obj.id}">${obj.name}</a>
		</td>
		<td>
					${obj.url}
		</td>
		<td>
					<c:forEach items="${szz}" var="s">
						<c:if test = "${s.key == obj.groupFlag}">${s.value}</c:if>
					</c:forEach>
		</td>
		<td>
					${obj.parName}
		</td>
		<td>
					${obj.funType}
		</td>
		<td>
					<c:if test="${obj.insType==1}">开始</c:if>
					<c:if test="${obj.insType==2}">普通</c:if>
					<c:if test="${obj.insType==9}">结束</c:if>
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
				<jsp:param name="target" value="/wf/WfFunction!list.do" />
	        </jsp:include>
   			</div>
           </td>
        </tr>
       </table>
   </div>
  </div>
</div>
<script type="text/javascript">
$(function(){
	$("#edit").click(function(){
	var items = $("[name=items]");
		if(items == null){
			alert("请选择要操作的对象!");
			return：
		}
		var ids = $(["name=objId"]);
		var id = null;
		for(var i = 0; i<itmes.length;i++){
			if(itmes[i].checked == true){
				id = ids.eq(i).val();
				$.ajax({
					type:"POST",
	        		url:"${ctx}/wf/WfInstance!checkIsUse.do",
	        		data:"id="+id,
	        		dataType:"text",
	        		success:function(flag){
	        		alert(flag);
	        			if(flag == "1"){
	        				alert("功能点已被使用不能删除！");
	        				return;
	        			}
	        		}
				});
			}
		}
	});
});
	//$("#shop").smartFloat();  
</script>
</div>
</body>
</html>
