<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看培训班</title>
<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="right">
<div class="llistbox">
<div class="listmap">
      <p class="dqwz">当前位置：<a href="#">教师培训</a> &gt; <a href="#">培训班管理</a> &gt; 查看详情</p>
      <p class="fhbut">
        <input type="button" name="button" id="button" value="返 回" onclick="history.back(-1)"/>
      </p>
</div>
 <div class="tablelist">
        <div class="title">查看详细</div>
        <div class="table01">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
	   <tr>
			<th colspan="6">培训班信息</th>
	   </tr>
	<tr class="jg" >
	<td width="10%" align="right" height="36" class="leftbor" >培训类别：</td>
	<td>
		${pxlb[model.trainType]}
	</td>
	<td width="10%" align="right">申请人：</td>
	<td>${username }</td>
	<td align="right">申请人单位：</td>
	<td>${orgName }</td>
</tr>
<tr>
	<td width="10%" align="right" height="36" class="leftbor" >班级名称：</td>
	<td>
		${model.name}
	</td>
	<td width="10%" align="right" height="36" class="leftbor" >预设班主任：</td>
	<td >
		${model.headTeacherName}
	</td>
	<td width="10%" align="right" height="36" class="leftbor" >学科：</td>
	<td>
		${xk[model.subject]}
	</td>
</tr>
<tr class="jg">
	<td width="10%" align="right" height="36" class="leftbor" rowspan="3" >总学时：</td>
	<td rowspan="3">
		${model.totalHour}
	</td>
	<td width="10%" align="right" height="36" class="leftbor" >面授学时：</td>
	<td>
		${model.faceHour}
	</td>
	<td rowspan="3" width="12%" align="right" height="36" class="leftbor" >预设总学分：</td>
	<td rowspan="3">
		${model.prepareScore}
	</td>
</tr>
<tr >
	<td width="10%" align="right" height="36" class="leftbor" >网授学时：</td>
	<td>
		${model.netHour}
	</td>
</tr>
<tr class="jg">
	<td width="10%" align="right" height="36" class="leftbor" >实践学时：</td>
	<td>
		${model.practiceHour}
	</td>
</tr>
<tr>
	<td width="12%" align="right" height="36" class="leftbor" >招生对象：</td>
	<td colspan="3">
			${model.recruitObj}
	</td>
	<td width="10%" align="right" height="36" class="leftbor" >招生人数：</td>
	<td>
		${model.recruitCount}
	</td>
</tr>
<tr class="jg" >
	<td width="12%" height="36" align="right">申请时间：</td>
	<td colspan="5">${model.ts }</td>
</tr>
<tr>
	<td width="12%" align="right" height="36" class="leftbor" >资料费用：</td>
	<td>
		${model.materialsFee }元
	</td>
	<td width="12%" align="right" height="36" class="leftbor" >用途：</td>
	<td colspan="3">
			${model.purpose}
	</td>
</tr>
<tr class="jg" >
	<td width="10%" align="right" height="36" class="leftbor" >课程说明：</td>
	<td colspan="5">
			${model.description}
	</td>
</tr>
<tr>
	<td width="10%" align="right" height="36" class="leftbor" >培训目标：</td>
	<td colspan="5">
			${model.trainTarget}
	</td>
</tr>
<tr class="jg" >
	<td width="12%" align="right" height="36" class="leftbor" >考核方式：</td>
	<td colspan="5">
			${model.checkWays}
	</td>
</tr>
</table>     
<table  id="cc" style="text-align: center;" cellpadding="0" cellspacing="0" border="0" width="100%">
  <tr class="jg" >
    <th colspan="6"><h3>本班每门课程教师任课情况</h3></th>
  </tr>
  <tr class="jg">
  	<td width="30%"  height="25"><h4>课程名称</h4></td>
  	<td width="10%"  height="25"><h4>本院教师</h4></td>
  	<td width="10%"  height="25"><h4>外请教师</h4></td>
  	<td width="10%"  height="25"><h4>学时</h4></td>
  	<td  height="25" width="30%"><h4>考核方式</h4></td>
  	<td></td>
  </tr>
  <c:forEach items="${classCourses2 }" var="classCourses" varStatus="stat">
  	<tr class="${stat.count % 2 == 0 ? 'jg' : ''}">
		<td width="35%">
	    	${ classCourses.courseName}
	    </td>
	    <td width="12%">
	    	${classCourses.localTeacherName}
	    </td>
	    <td width="12%">
	    	${classCourses.outTeacherName }
	    </td>
	    <td width="12%">
	    	${classCourses.courseDate }
	    </td>
	    <td width="24%">
	    	<c:forTokens items="${classCourses.checkWay}" delims="," var = "way">${khfs[way]}&nbsp;&nbsp;</c:forTokens>
	    </td>
  	</tr>
  </c:forEach>
</table>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr class="jg">
		<th colspan="2" align="center"><h3>相关附件(讲义、资源等)</h3></th>
	</tr>
	<tr id="${attachment.id }">
		<td width="15%" align="right">附件：</td>
		<td>
		<c:forEach items = "${attachments }" var = "attachment">
			<div><a href="${ctx}/common/AttachmentUtil!download.do?attachId=${attachment.id}">${attachment.fileName}</a></div>
		</c:forEach>
		</td>
	</tr>
</table>
<c:if test="${audits != null}">
<!-- showState == 1表示显示审核信息，即不是发起人查看，是审核人员查看详细信息 -->
<c:if test="${showState == 1}">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<th align="center" colspan="6"><h3>申请组班审核意见</h3></th>
	</tr>
	<c:forEach items="${audits}" var="audit" varStatus="vs">
		<!-- nodeState == 2说明是专家审核查看信息 -->
		<c:if test="${nodeState == 2}">
		<!-- 专家组能看见初审和终审意见，如果专家信息不共享，则看不见别的专家的审核意见 -->
		<c:if test="${audit.wfInstanceNode.actType == 2 && audit.wfInstanceNode.share == 0}">
			<c:if test="${audit.auditUserId == Login_Info.userID }"> 
				<tr>
					<td width="12%" align="center" bgcolor="#DDDDDD" colspan="4"><h4>流程步骤：${audit.wfInstanceNode.name }</h4></td>
				</tr>
				<tr  class="jg">
					<td width="12%" align="right">审批人：</td>
					<td width="14%">${audit.auditUserName }</td>
					<td width="12%" align="right">审核时间：</td>
					<td><fmt:formatDate value="${audit.ts}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				</tr>
				<tr>
					<td width="10%" align="right">审批意见：</td>
					<td width="50%">
						${audit.opinion }
					</td>
					<td width="12%" align="right">审核结果：</td>
					<td>
						<c:if test="${audit.result == 2}">审核通过</c:if>
						<c:if test="${audit.result == 3}">审核不通过</c:if>
					</td>
				</tr>
			</c:if>
		</c:if>
		<!-- 专家组共享信息，可以看见其他专家组的审核信息 -->
		<c:if test="${audit.wfInstanceNode.actType == 2 && audit.wfInstanceNode.share != 0}">
			<tr>
				<td width="12%" align="center" bgcolor="#DDDDDD" colspan="4"><h4>流程步骤：${audit.wfInstanceNode.name }</h4></td>
			</tr>
			<tr  class="jg">
				<td width="12%" align="right">审批人：</td>
				<td width="14%">${audit.auditUserName }</td>
				<td width="12%" align="right">审核时间：</td>
				<td><fmt:formatDate value="${audit.ts}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
			<tr>
				<td width="10%" align="right">审批意见：</td>
				<td width="50%">
					${audit.opinion }
				</td>
				<td width="12%" align="right">审核结果：</td>
				<td>
					<c:if test="${audit.result == 2}">审核通过</c:if>
					<c:if test="${audit.result == 3}">审核不通过</c:if>
				</td>
			</tr>
		</c:if>
		<c:if test="${audit.wfInstanceNode.actType == 1}">
			<tr>
				<td width="12%" align="center" bgcolor="#DDDDDD" colspan="4"><h4>流程步骤：${audit.wfInstanceNode.name }</h4></td>
			</tr>
			<tr  class="jg">
				<td width="12%" align="right">审批人：</td>
				<td width="14%">${audit.auditUserName }</td>
				<td width="12%" align="right">审核时间：</td>
				<td><fmt:formatDate value="${audit.ts}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
			<tr>
				<td width="10%" align="right">审批意见：</td>
				<td width="50%">
					${audit.opinion }
				</td>
				<td width="12%" align="right">审核结果：</td>
				<td>
					<c:if test="${audit.result == 2}">审核通过</c:if>
					<c:if test="${audit.result == 3}">审核不通过</c:if>
				</td>
			</tr>
		</c:if>
		</c:if>
		<!-- nodeState == 1说明是一般审核，即一个人审核 -->
		<c:if test="${nodeState == 1}">
			<tr>
				<td width="12%" align="center" bgcolor="#DDDDDD" colspan="4"><h4>流程步骤：${audit.wfInstanceNode.name }</h4></td>
			</tr>
			<tr  class="jg">
				<td width="12%" align="right">审批人：</td>
				<td width="14%">${audit.auditUserName }</td>
				<td width="12%" align="right">审核时间：</td>
				<td><fmt:formatDate value="${audit.ts}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
			<tr>
				<td width="10%" align="right">审批意见：</td>
				<td width="50%">
					${audit.opinion }
				</td>
				<td width="12%" align="right">审核结果：</td>
				<td>
					<c:if test="${audit.result == 2}">审核通过</c:if>
					<c:if test="${audit.result == 3}">审核不通过</c:if>
				</td>
			</tr>
		</c:if>
	</c:forEach>
</table>
</c:if>
</c:if>
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
