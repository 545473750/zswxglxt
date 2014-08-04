<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看班级成员</title>
<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="right">
<div class="listmap">
      <p class="dqwz">当前位置：<a href="#">教师培训</a> &gt; <a href="#">班级成员管理</a> &gt; 班成员详细信息</p>
      <p class="fhbut">
        <input type="button" name="button" id="button" value="返 回" />
      </p>
</div>
 <div class="tablelist">
        <div class="title">查看详细</div>
        <div class="table01">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr class="jg" >
				<td width="12%" height="36" align="right" class="leftbor" > 
					姓名：
				</td>
				<td width="37%">
						${user.username}
				</td>
				<td width="12%" align="right">继教号：</td>
				<td width="37%">
					${user.userNum }
				</td>
			</tr>
			<tr>
				<td  height="36" align="right">性别：</td>
				<td>
					<c:if test="${user.teacher.sex == 0}">男</c:if>
					<c:if test="${user.teacher.sex == 1}">女</c:if>
				</td>
				<td align="right">单位：</td>
				<td>
					<c:forEach items="${user.ouRelations}" var="ou">
						${ou.organization.name }
					</c:forEach>
				</td>
			</tr>
			<tr class="jg">
				<td  height="36" align="right">出生日期：</td>
				<td>${user.teacher.birthMonth }</td>
				<td align="right">学历：</td>
				<td>${xl[user.teacher.education]}</td>
			</tr>
			<tr>
				<td height="36" align="right">专业：</td>
				<td>${user.teacher.specialty }</td>
				<td align="right">职称：</td>
				<td>${zc[user.teacher.title]}</td>
			</tr>
          </table>
          <div class="page">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="center"><input  type="button" class="but_cz"  value="返 回" onclick="history.back(-1)"  /></td>
              </tr>
            </table>
          </div>
      </div>
</div>
</body>
</html>
