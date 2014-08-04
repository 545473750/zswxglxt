<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看流程表</title>
<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div class="right">
<div class="llistbox">
	<div class="listmap">
         <p class="dqwz">当前位置：<a href="#">教师培训</a> &gt; <a href="#">流程管理</a> &gt; 查看流程</p>
         <p class="fhbut">
           <input type="button" name="button" id="button" value="返 回" onclick="history.back(-1)" />
         </p>
     </div>
     
<div class="tablelist">
        <div class="title">查看详细</div>
        <div class="table01">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    	<tr>
    		<th colspan="4">流程信息</th>
    	</tr>
		<tr class="jg" >
			<td width="14%" height="36" class="leftbor" align="right" > 
				名称：
			</td>
			<td width="36%">
					${project.name}
			</td>
			<td width="14%" class="leftbor" align="right">
				所在组：
			</td>
			<td width="36%">
					<c:forEach items="${szz}" var="s">
						<c:if test = "${s.key == project.groupFlag}">${s.value}</c:if>
					</c:forEach>
			</td>
		</tr>
		<tr>
			<td height="36" class="leftbor" align="right" > 
				添加人姓名：
			</td>
			<td>
					${project.addUserName}
			</td>
			<td height="36" class="leftbor" align="right" > 
				最后更新时间：
			</td>
			<td>
					<fmt:formatDate value="${project.updateTime}" pattern="yyyy-MM-dd"/>
			</td>
		</tr>
		<tr class="jg" >
			<td height="36" class="leftbor" align="right" > 
				描述：
			</td>
			<td colspan="3">
					${project.description}
			</td>
		</tr>
    </table>
    <table cellpadding="0" cellspacing="0" border="0" width="100%" style="text-align: center;">
    	<tr>
    		<th colspan="3">流程节点</th>
    	</tr>
    	<tr class="jg">
    		<td><h4>节点名称</h4></td>
    		<td><h4>审核顺序</h4></td>
    		<td><h4>参与者名称</h4></td>
    	</tr>
    	<c:forEach items="${activitys}" var="activity" varStatus="vs">
    		<tr class="${vs.count % 2 == 0 ? 'jg' : ''}">
    			<td>${activity.name }</td>
    			<td>${activity.orderNum }</td>
    			<td>
    				<c:if test="${activity.participans != null }">
    					${activity.participans}
    				</c:if>
    				<c:if test="${activity.participans == null }">
    					<span style="color: red;">未设置参与者</span>
    				</c:if>
    				<c:if test="${activity.actType == 2}">
	    				<span style="color: red;">
	    					<c:if test="${activity.share == 0 }">(信息不共享)</c:if>
	    					<c:if test="${activity.share == 1 }">(信息共享)</c:if>
	    				</span>
    				</c:if>
    			</td>
    		</tr>
    	</c:forEach>
    	<tr>
    		<td colspan="3"><input type="button" value="返回" onclick="history.back(-1)" class="but_cz"/></td>
    	</tr>
    </table>
  </div>
  </div>
  </div>
  </div>
</body>
</html>
