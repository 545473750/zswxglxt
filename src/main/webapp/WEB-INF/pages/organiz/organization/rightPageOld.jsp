<%@page import="com.opendata.organiz.model.*"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@include file="/commons/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title><%=Organization.TABLE_ALIAS%> 维护</title>
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css" rel="stylesheet" />
		
		<script src="${ctx}/scripts/jquery.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>

		<script src="${ctx}/scripts/application.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
		<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>

		<script type="text/javascript">
		$(function() {
			$("#dialog").dialog({
		        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 移动',
		        autoOpen: false,
		        width: 400,
		        //height: 276,
		        resizable: false,
		        modal: true,
		        autoResize: true,
		        overlay: {
		               opacity: 0.5,
		               background: "black"
		           }
		    });
		});
		
		function toggleContent(){
			var state=document.getElementById("state");
			if(state.value==0){
				state.value=1;
				document.getElementById("search").style.display="none";
			}else{
			     state.value=0;
			     document.getElementById("search").style.display="block";
			}
		}
		
		
		function move(pid, itemid) {
			openDialog('${ctx}/organiz/Organization!move.do?id=' + itemid + '&query.parentId=' + pid);
		}
		</script>
	</head>

	<body>
		<div class="main">
			<div class="maintit">
				<h2 style="background: yellow;" ><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" />单位管理</h2>
				
				<h2>
					<a href="${ctx}/organiz/Organization!loadUser.do?query.parentId=${query.parentId }" style="text-decoration: none;"> 
					<img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" /> 人员信息 
					</a>
				</h2>
				 
				<h3><a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a></h3>
			</div>

			<div class="centent">
				<div class="shop" id="shop">
					<p class="left">
						<!-- 
						<input onclick="javascript:add('${pid }', '${organizationModel.type }');" type="button" class="but_shop" value="添加" />
						<input type="button" class="but_shop" onclick="javascript:batchDelete('${ctx}/organiz/Organization!delete.do?id=${pid}&org_type=${organizationModel.type }&partitionId=${partitionId} ','items',document.forms.queryForm)" value="删除" />
						 -->
						<input type="button" class="but_shop"  onclick="add('${ctx}/organiz/Organization!create.do',document.listForm);" value="添加" />
				        <input type="button" class="but_shop"  onclick="edit('${ctx}/organiz/Organization!edit.do','items',document.listForm);" value="修改" />
				        <input type="button" class="but_shop"  onclick="batchDelete('${ctx}/organiz/Organization!delete.do','items',document.listForm);" value="删除" />
          
					</p>
					<div class="clear"></div>
				</div>
			<form id="listForm" name="listForm" method="post" style="display: inline;">
				
						<span> 
							<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
								<input type="hidden" name="${obj.key}" value="${obj.value}" />
							</c:forEach> 
						</span>
						<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
								<tr>
									<th><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)" /></th>
									<th>序号</th>
									<th>部门名称</th>
									<th>上级部门</th>
									<th>领导</th>
									<th>操作</th>
								</tr>
								<c:forEach items="${page.result}" var="item" varStatus="status">
								<tr class="${status.count % 2 == 0 ? 'jg' : ''}">
									<td><input type="checkbox" name="items" value="id=${item.id}&" /></td>
									<td>${page.thisPageFirstElementNumber + status.index}</td>
									<td>
										<a href="${ctx}/organiz/Organization!show.do?id=${item.id}&parentid=${pid }&partitionId=${partitionId}&org_type=${organizationModel.type }">
										<c:out value='${item.name}' /> 
										</a>&nbsp;
									</td>
									<td><c:out value='${item.organization.name}' />&nbsp;</td>
									
									<td><c:out value='${item.manager.username}' />&nbsp;</td>
									<td>
										<!-- 
										<a href="${ctx}/organiz/Organization!edit.do?id=${item.id}&parentid=${pid }&partitionId=${partitionId}">修改</a> |
										 -->
										<a href="javascript:void(0);" onclick="move('${query.parentId}', '${item.id }');"> 移动</a>
									</td>
								</tr>
								</c:forEach>
						</table>
			</form>
				<div class="page">
					<jsp:include flush="true" page="/commons/pagebar.jsp">
						<jsp:param name="target" value="/organiz/Organization!toRightPage.do" />
					</jsp:include>
				</div>
			</div>
			<div id="dialog" style="overflow: hidden;">
			<iframe id="addSit" frameborder="0" marginheight="0" scrolling="auto" marginwidth="0" width="400" height="300"></iframe>
			</div>

			<c:if test="${flag eq 'refresh' }">
			<script type="text/javascript">
			(function() {
				window.parent.leftFrame.location.href = "${ctx}/organiz/Organization!leftTree.do?query.parentId=${query.parentId }";
			})();
			</script>
			</c:if>
		</div>
	</body>
</html>