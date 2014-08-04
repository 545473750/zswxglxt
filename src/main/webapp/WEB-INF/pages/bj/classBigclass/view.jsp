<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看培训班</title>
<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="right">
<div class="listmap">
      <p class="dqwz">当前位置：<a href="#">首 页</a> &gt; <a href="#">培训班管理</a> &gt; 查看详情</p>
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
					培训类别：
				</td>
				<td>
						${model.trainType}
				</td>
			</tr>
			<tr  >
							<td width="10%" height="36" class="leftbor" > 
					班级名称：
				</td>
				<td>
						${model.name}
				</td>
			</tr>
			<tr class="jg" >
							<td width="10%" height="36" class="leftbor" > 
					预设班主任：
				</td>
				<td>
						${model.headTeacherId}
				</td>
			</tr>
			<tr  >
							<td width="10%" height="36" class="leftbor" > 
					学科：
				</td>
				<td>
						${model.subject}
				</td>
			</tr>
			<tr class="jg" >
							<td width="10%" height="36" class="leftbor" > 
					总学时：
				</td>
				<td>
						${model.totalHour}
				</td>
			</tr>
			<tr  >
							<td width="10%" height="36" class="leftbor" > 
					面授学时：
				</td>
				<td>
						${model.faceHour}
				</td>
			</tr>
			<tr class="jg" >
							<td width="10%" height="36" class="leftbor" > 
					网授学时：
				</td>
				<td>
						${model.netHour}
				</td>
			</tr>
			<tr  >
							<td width="10%" height="36" class="leftbor" > 
					实践学习：
				</td>
				<td>
						${model.practiceHour}
				</td>
			</tr>
			<tr class="jg" >
							<td width="10%" height="36" class="leftbor" > 
					预设总学分：
				</td>
				<td>
						${model.prepareScore}
				</td>
			</tr>
			<tr  >
							<td width="10%" height="36" class="leftbor" > 
					招生对象：
				</td>
				<td>
						${model.recruitObj}
				</td>
			</tr>
			<tr class="jg" >
							<td width="10%" height="36" class="leftbor" > 
					招生人数：
				</td>
				<td>
						${model.recruitCount}
				</td>
			</tr>
			<tr  >
							<td width="10%" height="36" class="leftbor" > 
					资料费用：
				</td>
				<td>
						${model.materialsFee}
				</td>
			</tr>
			<tr class="jg" >
							<td width="10%" height="36" class="leftbor" > 
					用途：
				</td>
				<td>
						${model.purpose}
				</td>
			</tr>
			<tr  >
							<td width="10%" height="36" class="leftbor" > 
					课程说明：
				</td>
				<td>
						${model.description}
				</td>
			</tr>
			<tr class="jg" >
							<td width="10%" height="36" class="leftbor" > 
					培训目标：
				</td>
				<td>
						${model.trainTarget}
				</td>
			</tr>
			<tr  >
							<td width="10%" height="36" class="leftbor" > 
					考核方式：
				</td>
				<td>
						${model.checkWay}
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
