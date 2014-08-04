<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看期数班级</title>
<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="right">
<div class="llistbox">
<div class="listmap">
      <p class="dqwz">当前位置：<a href="#">教师培训</a> &gt; <a href="#">期数班级管理</a> &gt; 查看详情</p>
      <p class="fhbut">
        <input type="button" name="button" id="button" value="返 回" />
      </p>
</div>
 <div class="tablelist">
        <div class="title">查看详细</div>
        <div class="table01">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr class="jg" >
				<td width="14%" height="36" class="leftbor" align="right" > 
					班级名称：
				</td>
				<td>
						${model.name}
				</td>
				<td width="14%" height="36" class="leftbor" align="right" > 
					创建人姓名：
				</td>
				<td>
						${model.addUserName}
				</td>
			</tr>
			<tr  >
				<td width="14%" height="36" class="leftbor" align="right" > 
					计划招生人数：
				</td>
				<td>
						${model.planCount}
				</td>
				<td width="14%" height="36" class="leftbor" align="right" > 
					实际招生人数：
				</td>
				<td>
						${model.actualCount}
				</td>
			</tr>
			<tr class="jg">
				<td width="14%" height="36" class="leftbor" align="right" > 班主任：</td>
				<td>
					${model.classTeacher1}
				</td>
				<td width="14%" height="36" class="leftbor" align="right" > 班辅导老师：</td>
				<td width="40%">
					${model.classTeacher0}
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
</div>
</body>
</html>
