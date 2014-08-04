<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看培训班期数</title>
<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="right">
<div class="llistbox">
<div class="listmap">
      <p class="dqwz">当前位置：<a href="#">教师培训</a> &gt; <a href="#">培训班期数管理</a> &gt; 查看详情</p>
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
					期数名称：
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
					开始日期：
				</td>
				<td>
						${model.startTime}
				</td>
				<td width="14%" height="36" class="leftbor" align="right" > 
					结束日期：
				</td>
				<td>
						${model.endTime}
				</td>
			</tr>
			<tr class="jg" >
				<td width="14%" height="36" class="leftbor" align="right" > 
					招生人数：
				</td>
				<td>
						${model.allLimit}
				</td>
				<td width="14%" height="36" class="leftbor" align="right" > 
					每班人数：
				</td>
				<td>
						${model.classLimit}
				</td>
			</tr>
			<tr>
				<td width="14%" height="36" class="leftbor" align="right" >期负责人：</td>
					<td>
						${model.termTeacher1 }
					</td>
					<td width="14%" height="36" class="leftbor" align="right" >期辅导老师：</td>
					<td>
						${model.termTeacher0 }
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
</div>
</body>
</html>
