<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>分区管理</title>
		<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css" rel="stylesheet" />
		<script src="${ctx}/scripts/application.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
		<script type="text/javascript"
			src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
		<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/stmartFloat/smartFloat.js"
			type="text/javascript"></script>
		<script type="text/javascript">
		$(function() {
				$("#grantApplicationDialog").dialog({
			        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 应用设置',
			        autoOpen: false,
			        width: 700,
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
			$(function() {
				$("#grantAdministratorDialog").dialog({
			        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 管理员设置',
			        autoOpen: false,
			        width: 600,
			        resizable: false,
			        modal: true,
			        autoResize: true,
			        overlay: {
			               opacity: 0.5,
			               background: "black"
			           }
			    });
			});
			$(function() {
				$("#grantOrganizDialog").dialog({
			        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 组织机构设置',
			        autoOpen: false,
			        width: 420,
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
	</script>
	</head>
	<body>
		<div class="main">
			<input type="hidden" value="0" id="state" />

			<div class="maintit">
				<h2>
					<img src="${ctx}/${pattern}/images/tabicon.gif" width="16"
						height="16" align="absmiddle" />
					分区管理
				</h2>
				<h3>
					<a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a>
				</h3>
			</div>
			<div class="centent">
				<div class="search">
					<form id="queryForm" name="queryForm" method="post"
						action="${ctx}/sys/Partition!list.do">
						<label>
							分区名称：
							<input value="${query.name}" id="name" name="name"
								maxlength="100" class="" />

						</label>
						<label>
							<input type="submit" value="检 索" class="btn_search"
								onMouseOver="this.className='btn_search_over'"
								onMouseOut="this.className='btn_search'" />
						</label>
					</form>
					<div class="clear"></div>
				</div>

				<div class="shop" id="shop">
					<p class="left">
						<input onclick="add('${ctx}/sys/Partition!create.do',document.forms.listForm);" type="button" class="but_shop" value="添加" /> 
						<input type="button" class="but_shop" onclick="javascript:edit('${ctx}/sys/Partition!create.do','items',document.forms.listForm);"
							value="修改" />
						<input type="button" class="but_shop"
							onclick="javascript:batchDelete('${ctx}/sys/Partition!delete.do','items',document.forms.listForm);"
							value="删除" />
					</p>
					
					<div class="clear"></div>
				</div>

					<table cellpadding="0" cellspacing="0" border="0"  >
							<tr>
								<th>分区列表</th>
								<th>分区</th>
								<th>所有学校</th>
							</tr>
							<tr>
								<td >
									<div style="width:180px;height:400px;border: 1px solid #eee;">
									
									</div>
								</td>
								<td>
									
								</td>
								<td>
									
								</td>
								
							</tr>
							
					</table>
					
					
					
			</div>
			<div id="grantApplicationDialog" style="overflow: hidden;">
				<iframe id="grantApplication" frameborder="0" marginwidth="0"
					marginheight="0" scrolling="no" width="700" height="344"></iframe>
			</div>
			<!-- 管理员设置 -->
			<div id="grantAdministratorDialog" style="overflow: hidden;">
				<iframe id="grantAdministrator" frameborder="0" marginwidth="0"
					marginheight="0" scrolling="auto" width="600" height="334"></iframe>
			</div>
			<div id="grantOrganizDialog" style="overflow: hidden;">
				<iframe id="grantOrganiz" frameborder="0" marginwidth="0"
					marginheight="0" scrolling="no" width="420" height="344"></iframe>
			</div>
		</div>
	</body>
</html>
