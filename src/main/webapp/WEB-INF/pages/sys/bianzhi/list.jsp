<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@include file="/commons/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>编制管理</title>
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
				<h2 ><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" />编制管理</h2>
				<!-- 
				<h2>
					<a href="${ctx}/organiz/Organization!loadUser.do?parentid=${pid }&partitionId=${partitionId}&parentOrganizationType=${organizationModel.type}" style="text-decoration: none;"> 
					<img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" /> 人员信息 
					</a>
				</h2>
				 -->
				<h3><a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a></h3>
			</div>

			<div class="centent">
				<div class="shop" id="shop">
					<p class="left">
						<input type="button" class="but_shop"  onclick="add('${ctx}/sys/Bianzhi!add.do',document.listForm);" value="添加" />
				          <input type="button" class="but_shop"  onclick="edit('${ctx}/sys/Bianzhi!edit.do','items',document.listForm);" value="修改" />
				          <input type="button" class="but_shop"  onclick="batchDelete('${ctx}/sys/Bianzhi!remove.do','items',document.listForm);" value="删除" />
					</p>
					<div class="clear"></div>
				</div>
			<form id="listForm" name="listForm" method="post">
						<span>
						 <repeatsubmit:uniqueKey/>
						<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
							<input type="hidden" name="${obj.key}" value="${obj.value}"/>
						</c:forEach>
						</span>
						<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
							<tr>
							    <th width="30">
							  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
							    </th>
							  	<th width="50">序号</th>
							  	<th >编制名称</th>
							  	<th >在编人员</th>
							  	<th >角色</th>
							  	<th >直接上级</th>
							</tr>
						<c:forEach var="obj" items="${page.result}" varStatus="vs">
							<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
								<td align="center">
									<input type="checkbox" name="items" value="id=${obj.id}&">
									<input type="hidden" name="objId" value="${obj.id }"/>
								</td>
								<td align="center">
									${page.thisPageFirstElementNumber + vs.index}
								</td>
								<td align="center">
											<a href="${ctx}/sys/Bianzhi!view.do?id=${obj.id}">${obj.name}</a>
								</td>
								<td align="center">
											${obj.user.username}
								</td>
								<td align="center">
											${obj.role.name}
								</td>
								<td align="center">
											${obj.bianzhi.name}
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