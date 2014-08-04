<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看招生</title>
<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">教学教务</a> &gt; <a href="#">招生管理</a> &gt; 查看招生</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" onclick="history.back(-1)"/>
          </p>
      </div>
    <div class="tablelist">
     <div class="title">查看招生</div>
      <div class="table01">
          <table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr class="jg" >
				<td width="14%" height="36" class="leftbor" align="right" > 
					招生标题：
				</td>
				<td>
						${model.title}
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
					报名开始时间：
				</td>
				<td>
						<fmt:formatDate value="${model.startTime}" pattern="yyyy-MM-dd"/>
				</td>
				<td width="14%" height="36" class="leftbor" align="right" > 
					报名结束时间：
				</td>
				<td>
						<fmt:formatDate value="${model.endTime}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
			<tr class="jg" >
				<td width="14%" height="36" class="leftbor" align="right" > 
					发布状态：
				</td>
				<td colspan="3">
					   <c:if test="${model.publishState==1 }"> 未发布</c:if>
					   <c:if test="${model.publishState==2 }"> 进行中</c:if>
					   <c:if test="${model.publishState==3 }"> 已结束</c:if>
				</td>
			</tr>
			<tr>
				<td width="14%" height="36" class="leftbor" align="right" >
					培训班：
				</td>
				<td>
					<c:forEach items="${bigclasses}" var="bigclass">
						<a href="${ctx }/bj/ClassBigclass!view.do?id=${bigclass.id}">${bigclass.name }&nbsp;&nbsp;</a>
					</c:forEach>
				</td>
				<td width="14%" height="36" class="leftbor" align="right" >
					期数：
				</td>
				<td>
					<c:forEach items="${terms}" var="term">
						<a href="${ctx}/bj/ClassTerm!view.do?id=${term.id}" target="mainFrame">${term.name }&nbsp;&nbsp;</a>
					</c:forEach>
				</td>
			</tr>
			<tr class="jg">
				<td width="14%" height="36" class="leftbor" align="right" >
					学校：
				</td>
				<td colspan="3">
					${changeSchool }
				</td>
				
			</tr>
          </table>
          </div>
  <div class="page">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
             <td align="center">
		  		<input type="button" value="返回" class="but_cz" onclick="history.back(-1)" />
	   		</td>
	   	   </tr>
	   	</table>
	</div>
 </div>
  </div>
  </div>
  </div>
</body>
</html>
