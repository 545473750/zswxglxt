<%@page import="com.opendata.organiz.model.*"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@include file="/commons/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>单位管理</title>
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
		
		function add(pid, org_type){
			location.href = "${ctx}/organiz/Unit!create.do?partitionId=${partitionId}&id=" + pid + "&org_type=" + org_type;
		}
		
		function move(pid, itemid) {
			openDialog('${ctx}/organiz/Organization!move.do?partitionId=${partitionId}&id=' + itemid + '&parentOrganizationId=' + pid);
		}
		function updateParentId(){
			location.href="${ctx}/organiz/Unit!updateParentId.do";
		}
		</script>
	</head>

	<body>
		<div class="main">
			<div class="maintit">
				<h2 style="background: yellow;"><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" />单位列表</h2>
				<h2>
					<a href="${ctx}/organiz/Organization!loadUser.do?query.parentId=${query.parentId }" style="text-decoration: none;"> 
					<img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" /> 人员信息 
					</a>
				</h2>
				 
				<h3><a href="#" onclick="history.back(-1)"></a></h3>
			</div>

			<div class="centent">
				<div class="search">
					<form id="queryForm" name="queryForm" method="post" action="${ctx}/organiz/Organization!toRightPage.do">
						<input type="hidden" name="query.parentId" value="${query.parentId }" />
						<label>
							单位名称：
							<input value="${query.name}" id="name" name="query.name" style="width: 100px;"/>
						</label>
						<label>
							单位性质：
							<select id="nature" name="query.nature" datatype="*" nullmsg="单位性质！" errormsg="请选择单位性质！">
								<option value="" selected="selected">---请选择---</option>
								<c:forEach items="${dwxzMap}" var="item">
								<option value="${item.key }" <c:if test="${item.key ==query.nature}">selected="selected"</c:if>>
									${item.value }
								</option>
								</c:forEach>
							</select>
						</label>
						<label>
							单位级别：
							<select id="unitlevel" name="query.unitlevel" datatype="*" nullmsg="单位级别！" errormsg="请选择单位级别！">
								<option value="" selected="selected">---请选择---</option>
								<c:forEach items="${dwjbMap}" var="item">
								<option value="${item.key }" <c:if test="${item.key ==query.unitlevel }">selected="selected"</c:if>>
									${item.value }
								</option>
								</c:forEach>
							</select>
						</label>
						<label>
							<input type="submit" value="检 索" class="btn_search" />
						</label>
					</form>
					<div class="clear"></div>
				</div>
				
				<div class="shop" id="shop">
					<p class="left">
					 <input type="button" class="but_shop"  onclick="edit('${ctx}/organiz/Organization!edit.do','items',document.listForm);" value="修改" />
					<!-- 
						<input type="button" class="but_shop"  onclick="add('${ctx}/organiz/Unit!create.do',document.listForm);" value="添加" />
				          <input type="button" class="but_shop"  onclick="edit('${ctx}/organiz/Unit!edit.do','items',document.listForm);" value="修改" />
				          <input type="button" class="but_shop"  onclick="batchDelete('${ctx}/organiz/Unit!delete.do','items',document.listForm);" value="删除" />
          				<input type="button" class="but_shop"  onclick="updateParentId();" value="更新parentId" />
					 -->
					</p>
					<div class="clear"></div>
				</div>
			<form id="listForm" name="listForm" method="post" >
						<span> 
							<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
								<input type="hidden" name="${obj.key}" value="${obj.value}" />
							</c:forEach> 
						</span>
						<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
								<tr>
									<th><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)" /></th>
									<th>序号</th>
									<th>单位编号</th>
									<th>单位名称</th>
									<th>单位级别</th>
									<th>单位性质</th>
									<th>管理员继教号</th>
									<th>管理员姓名</th>
									<th>操作</th>
								</tr>
								<c:forEach items="${page.result}" var="item" varStatus="status">
								<tr class="${status.count % 2 == 0 ? 'jg' : ''}">
									<td><input type="checkbox" name="items" value="id=${item.id}&" /></td>
									<td>${page.thisPageFirstElementNumber + status.index}</td>
									<td>
										<a href="${ctx}/organiz/Organization!show.do?id=${item.id}&parentid=${pid }&partitionId=${partitionId}&org_type=${organizationModel.type }">
										<c:out value='${item.code}' /> 
										</a>&nbsp;
									</td>
									<td><c:out value='${item.name}' />&nbsp;</td>
									<td><c:out value='${dwjbMap[item.unitlevel]}' />&nbsp;</td>
									<td><c:out value='${dwxzMap[item.nature]}' />&nbsp;</td>
									<td><c:out value='${item.manager.userNum}' />&nbsp;</td>
									<td><c:out value='${item.manager.username}' />&nbsp;</td>
									<td>
										<a href="${ctx}/organiz/Unit!loadUser.do?query.organizationId=${item.id}">单位人员</a> 
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
				
		</div>
		
		
		<c:if test="${flash.success != null}">
			<div id="flash_message" align="center" title="提示信息"
				style="display: none; padding-top: 25px; background-color: #EEFFFF;">
				${flash.success}
			</div>
			<script type="text/javascript">
				$(function() {
					$( "#flash_message" ).dialog({width:200,height:100,draggable: false,show: "Bounce",hide: "puff" });
					setTimeout(function() {
						$( "#flash_message" ).dialog( "close" );
					}, 3000 );
				});
			</script>
		</c:if>
	</body>
</html>