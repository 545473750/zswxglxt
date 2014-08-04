<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看班级课表</title>
<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="right" style="width:680px;height:380px;background:#FFF;">

 <div class="tablelist">
        <div class="title">查看详细</div>
        <div class="table01">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr  class="jg" >
				<td   width="100" height="36" class="leftbor" > 
					课程名称：
				</td>
				<td width="200">
						${model.classCourse.courseName}
				</td>
				
				<td   width="100" height="36" class="leftbor" > 
					上课日期：
				</td>
				<td>
						${model.occurTime}
				</td>
			</tr>
			<tr  >
							<td  height="36" class="leftbor" > 
					上课开始时间：
				</td>
				<td>
						${model.startTime}
				</td>
				
				<td  height="36" class="leftbor" > 
					上课结束时间：
				</td>
				<td>
						${model.endTime}
				</td>
			</tr>
		
			<tr class="jg" >
							<td  height="36" class="leftbor" > 
					本院教师：
				</td>
				<td>
						${model.classCourse.localTeacherName}
				</td>
				
				<td  height="36" class="leftbor" > 
					外请教师：
				</td>
				<td>
						${model.classCourse.outTeacherName}
				</td>
				
			</tr>
			<tr  >
							<td  height="36" class="leftbor" > 
					授课方式：
				</td>
				<td colspan="3" >
						${teachWayMap[model.teachWay]} 
						<c:if test="${model.teachWay==2 }">
							<span style="margin-left:200px;">
							预定场地:${model.place.name }
							</span>
						</c:if>
				</td>
			</tr>
			
			<tr class="jg" >
							<td  height="36" class="leftbor" > 
					创建人：
				</td>
				<td colspan="3" >
						${model.addUserName}
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
