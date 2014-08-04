<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看考勤</title>
<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="right">
<div class="listmap">
      <p class="dqwz">当前位置：<a href="#">首 页</a> &gt; <a href="#">考勤管理</a> &gt; 查看详情</p>
      <p class="fhbut">
        <input type="button" name="button" id="button" value="返 回" />
      </p>
</div>
 <div class="tablelist">
        <div class="title">查看详细</div>
        <div class="table01">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr class="jg" >
							<td width="10%" height="36" class="leftbor" > 
					课表id：
				</td>
				<td>
						${model.courseName}
				</td>
			</tr>
			<tr  >
							<td width="10%" height="36" class="leftbor" > 
					出勤状态：
				</td>
				<td>
						${model.startTime}
				</td>
			</tr>
			<tr class="jg" >
							<td width="10%" height="36" class="leftbor" > 
					出勤时间：
				</td>
				<td>
						${model.endTime}
				</td>
			</tr>
			<tr  >
							<td width="10%" height="36" class="leftbor" > 
					考核教师：
				</td>
				<td>
						${model.teacherId}
				</td>
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
