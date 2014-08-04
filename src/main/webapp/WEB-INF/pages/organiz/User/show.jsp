<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>用户</title>
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
	</head>

		<body>
			<form action="/organiz/User!list.do" method="get">
				<div class="main">
					<div class="maintit">
						<h2><img src="${ctx}/${pattern}/images/tabicon.gif" width="16" height="16" align="absmiddle" />用户</h2>
						<h3><a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a></h3>
					</div>
					<div class="centent">
						<s:hidden name="id" id="id" value="%{model.id}" />
						<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
							<tr>
								<td width="10%" height="36" class="leftbor" > 登录名</td>
								<td><s:property value="%{model.loginname}" /></td>
								
							</tr>
							<tr>
								<td width="10%" height="36" class="leftbor" > 姓名</td>
								<td >
									<s:property value="%{model.username}" />
								</td>
							</tr>
							
							<tr>
								<td width="10%" height="36" class="leftbor" > 继教号</td>
								<td >
									<s:property value="%{model.userNum}" />
								</td>
							</tr>
							
							
							<tr>
								<td width="10%" height="36" class="leftbor" > 身份证号</td>
								<td >
									<s:property value="%{model.IDNum}" />
								</td>
							</tr>
							
							<!-- 
							<tr>
								<td width="10%" height="36" class="leftbor" >手机号</td>
								<td >
									<s:property value="%{model.phone}" />
								</td>
							</tr>

							<tr>
								<td width="10%" height="36" class="leftbor" >出生年月</td>
								<td class="trbor1">
									<s:property value="%{model.birthday}" />
								</td>
							</tr>
							<tr>
								<td width="10%" height="36" class="leftbor" >年龄</td>
								<td class="trbor1">
									<s:property value="%{model.age}" />
								</td>
							</tr>
							<tr>
								<td width="10%" height="36" class="leftbor" >性别</td>
								<td class="trbor1">
									<s:property value="%{model.sexString}" />
								</td>
							</tr>
							<tr>
								<td width="10%" height="36" class="leftbor" >电子邮箱</td>
								<td class="trbor1">
									<s:property value="%{model.mail}" />
								</td>
							</tr>
							<tr>
								<td width="10%" height="36" class="leftbor" >QQ</td>
								<td class="trbor1">
									<s:property value="%{model.qq}" />
								</td>
							</tr>
							<tr>
								<td width="10%" height="36" class="leftbor" >MSN</td>
								<td class="trbor1">
									<s:property value="%{model.msn}" />
								</td>
							</tr>
							<tr>
								<td width="10%" height="36" class="leftbor" >微博</td>
								<td class="trbor1">
									<s:property value="%{model.wblog}" />
								</td>
							</tr>
							<tr>
								<td width="10%" height="36" class="leftbor" >岗位</td>
								<td class="trbor1">
									<s:property value="%{model.stationString}" />
								</td>
							</tr>
							<tr>
								<td width="10%" height="36" class="leftbor" >岗位级别</td>
								<td class="trbor1">
									<s:property value="%{model.stationLevelString}" />
								</td>
							</tr>
							<tr>
								<td width="10%" height="36" class="leftbor" >是否离职</td>
								<td class="trbor1">
									<s:if test="%{model.isLeave==1}">否</s:if>
									<s:elseif test="%{model.isLeave==2}">是</s:elseif>
									<s:else>未知</s:else>
								</td>
							</tr>
							<tr>
								<td width="10%" height="36" class="leftbor" >创建时间</td>
								<td class="trbor1">
									<s:property value="%{model.ts}" />
								</td>
							</tr>
								<tr>
								<td width="10%" height="36" class="leftbor" >备注</td>
								<td class="trbor1">
									<s:property value="%{model.remark}" />
								</td>
							</tr>
							 -->
							<tr>
								<td width="10%" height="36" class="leftbor" >所属部门</td>
								<td class="trbor1">
									<s:property value="%{model.deptsString}" />
								</td>
							</tr>
						
						</table>
						<div class="page">
						<input type="submit" value="提 交" class="but_shop" />
						<input type="button" value="取 消" class="but_shop" onclick="history.back(-1)" />
					</div>
					</div>
				</div>
			</form>
		</body>
</html>