<%@page import="com.opendata.organiz.model.*"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>组织机构</title>
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet"
			type="text/css" />
	</head>

	<body>
		<!-- 无外边框内容区开始 -->
		<div class="main">
			<div class="maintit">
				<h2>
					<img src="${ctx}/${pattern}/images/tabicon.gif" width="16"
						height="16" align="absmiddle" />
					组织机构
				</h2>
				<h3>
					<a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a>
				</h3>
			</div>

			<div class="centent" style="padding-top: 10px;">
				<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
					<tr class="jg">
						<td width="10%" height="36" class="leftbor"><%=Organization.ALIAS_CODE%></td>
						<td class="trbor1">
							${org.code }
						</td>
					</tr>

					<tr>
						<td><%=Organization.ALIAS_NAME%></td>
						<td>
							${org.name }
						</td>
					</tr>
					<tr class="jg">
						<td><%=Organization.ALIAS_TYPE%></td>
						<td>
							${org.typeString }
						</td>
					</tr>

					<tr>
						<td><%=Organization.ALIAS_TS%></td>
						<td>
							${org.ts }
						</td>
					</tr>
					<tr class="jg">
						<td><%=Organization.ALIAS_SEQUENCE%></td>
						<td >
							${org.sequence }
						</td>
					</tr>

					<tr>
						<td><%=Organization.ALIAS_DESCRIPTION%></td>
						<td>
							${org.description }
						</td>
					</tr>

				</table>
				<div class="page">
					<input type="button" value="返回" class="but_shop"
						onclick="history.back(-1)" />
				</div>
			</div>
		</div>
		</form>
	</body>
</html>