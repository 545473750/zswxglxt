<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看大班</title>
<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/scripts/jquery.js" type="text/javascript"></script>
<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
<script type="text/javascript">
	function openDialogById(url,dialogId,iframeId){
		parent.dialog({
			title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 指定审核人员',
			autoOpen: true,
			width: 790,
			height: 500,
			modal: true,
			overlay: {
				opacity: 0.5,
				background: "black"
			},
			useIframe: true,
			url: url
		});
	}
</script>
</head>
 <body>
<div class="right">
<div class="llistbox">
<div class="listmap">
      <p class="dqwz">当前位置：<a href="#">教师培训</a> &gt; <a href="#">培训班审核</a> &gt; 审核</p>
      <p class="fhbut">
        <input type="button" name="button" id="button" value="返 回" />
      </p>
</div>
 <div class="tablelist">
        <div class="title">培训班审核</div>
        <div class="table01">
          <!-- 实体表单-->
<table cellpadding="0" cellspacing="0" border="0" width="100%">
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
	<td >${model.name}</td>
	<td width="10%" align="right" height="36" class="leftbor" >预设班主任：</td>
	<td >${model.headTeacherName}</td>
	<td width="10%" align="right" height="36" class="leftbor" >学科：</td>
	<td>${xk[model.subject] }</td>
</tr>

<tr class="jg">
	<td width="10%" align="right" height="36" class="leftbor" rowspan="3" >总学时：</td>
	<td rowspan="3">${model.totalHour}</td>
	<td width="10%" align="right" height="36" class="leftbor" >面授学时：</td>
	<td>${model.faceHour}</td>
	<td rowspan="3" width="12%" align="right" height="36" class="leftbor" >预设总学分：</td>
	<td rowspan="3">${model.prepareScore}</td>
</tr>
<tr>
	<td width="10%" align="right" height="36" class="leftbor" >网授学时：</td>
	<td>${model.netHour}</td>
</tr>
<tr class="jg">
	<td width="10%" align="right" height="36" class="leftbor" >实践学时：</td>
	<td>${model.practiceHour}</td>
</tr>
<tr>
	<td width="12%" align="right" height="36" class="leftbor" >招生对象：</td>
	<td colspan="3">${model.recruitObj}</td>
	<td width="10%" align="right" height="36" class="leftbor" >招生人数：</td>
	<td>${model.recruitCount}</td>
</tr>
<tr class="jg" >
	<td width="10%" align="right" height="36" class="leftbor" >资料费用：</td>
	<td>
		${model.materialsFee}
	</td>
	<td width="12%" align="right" height="36" class="leftbor" >用途：</td>
	<td colspan="3">${model.purpose}</td>
</tr>
<tr>
	<td width="10%" align="right" height="36" class="leftbor" >课程说明：</td>
	<td colspan="5">${model.description}</td>
</tr>
<tr class="jg" >
	<td width="10%" align="right" height="36" class="leftbor" >培训目标：</td>
	<td colspan="5">${model.trainTarget}</td>
</tr>
<tr>
	<td width="12%" align="right" height="36" class="leftbor" >考核方式：</td>
	<td colspan="5">${model.checkWays}</td>
</tr>
</table>     
<table style="text-align: center;" cellpadding="0" cellspacing="0" border="0" width="100%">
  <tr>
    <th colspan="5"><h3>本班每门课程教师任课情况</h3></th>
  </tr>
  <tr class="jg">
  	<td width="30%"  height="25"><h4>课程名称</h4></td>
  	<td width="10%"  height="25"><h4>本院教师</h4></td>
  	<td width="10%"  height="25"><h4>外请教师</h4></td>
  	<td width="10%"  height="25"><h4>学时</h4></td>
  	<td  height="25" width="30%"><h4>考核方式</h4></td>
  </tr>
   <c:forEach items="${classCourses2 }" var="classCourses" varStatus="stat">
  	<tr  class="${stat.count % 2 == 0 ? 'jg' : ''}">
		<td>
	    	${ classCourses.courseName}
	    </td>
	    <td>
	    	${classCourses.localTeacherName}
	    </td>
	    <td>
	    	${classCourses.outTeacherName }
	    </td>
	    <td>
	    	${classCourses.courseDate }
	    </td>
	    <td>
	    	<c:forTokens items="${classCourses.checkWay}" delims="," var = "way">${khfs[way]}&nbsp;&nbsp;</c:forTokens>
	    </td>
  	</tr>
  </c:forEach>
</table>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<th colspan="2" align="center"><h3>相关附件(讲义、资源等)</h3></th>
	</tr>
	<tr class="jg">
		<td width="12%" align="right">附件：</td>
		<td>
			<c:forEach items = "${attachments }" var = "attachment">
				<div style="margin: 2px; padding: 0px;">
					<a href="${ctx}/common/AttachmentUtil!download.do?attachId=${attachment.id}">${attachment.fileName}</a>
				</div>
			</c:forEach>
		</td>
	</tr>
</table>
<form id="listForm" name="listForm" method="post" action="${ctx }/wf/WfInstanceAudit!saveAdd.do" >
<input type="hidden" id="result" name="result" />
<input type="hidden" name="query.insId" value="${query.insId }"/>
<input type="hidden" name="query.state" value="${query.state }"/>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<th align="center" colspan="4"><h3>人员审核</h3></th>
	</tr>
	<c:if test="${audits!=null}">
	<c:forEach items="${audits}" var="audits">
	<!-- nodeState == 2说明是专家审核查看信息 -->
	<c:if test="${nodeState == 2}">
		<!-- 专家组能看见初审和终审意见，如果专家信息不共享，则看不见别的专家的审核意见 -->
		<c:if test="${audits.wfInstanceNode.actType == 2 && audits.wfInstanceNode.share == 0}">
			<c:if test="${audits.auditUserId == Login_Info.userID }"> 
				<tr>
					<td width="20%" bgcolor="#DDDDDD" colspan="4" align="center"><h4>流程步骤:${audits.wfInstanceNode.name}</h4></td>
				</tr>
				<tr class="jg">
					<td align="right" width="12%">审批人：</td>
					<td>
					${audits.auditUserName }
					</td>
					<td align="right">审核时间：</td>
					<td>
					<fmt:formatDate value="${audits.ts}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
				</tr>
				<tr>
					<td align="right" width="12%">审核意见：</td>
					<td width="50%">
						<c:if test="${audits.result==2}">
							${audits.opinion}
						</c:if>
						<c:if test="${audits.result==3}">
							${audits.opinion}
						</c:if>
					</td>
					<td width="12%" align="right">审核结果：</td>
					<td>
						<c:if test="${audits.result == 2}">审核通过</c:if>
						<c:if test="${audits.result == 3}">审核不通过</c:if>
					</td>
				</tr>
			</c:if>
		</c:if>
		<!-- 专家组共享信息，可以看见其他专家组的审核信息 -->
		<c:if test="${audits.wfInstanceNode.actType == 2 && audits.wfInstanceNode.share != 0}">
			<tr>
				<td width="20%" bgcolor="#DDDDDD" colspan="4" align="center"><h4>流程步骤：${audits.wfInstanceNode.name}</h4></td>
			</tr>
			<tr class="jg">
				<td align="right" width="12%">审批人：</td>
				<td>
				${audits.auditUserName }
				</td>
				<td align="right">审核时间：</td>
				<td>
				<fmt:formatDate value="${audits.ts}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
			</tr>
			<tr>
				<td align="right">审核意见：</td>
				<td width="50%">
					<c:if test="${audits.result==2}">
						${audits.opinion}
					</c:if>
					<c:if test="${audits.result==3}">
						${audits.opinion}
					</c:if>
				</td>
				<td width="12%" align="right">审核结果：</td>
				<td>
					<c:if test="${audits.result == 2}">审核通过</c:if>
					<c:if test="${audits.result == 3}">审核不通过</c:if>
				</td>
			</tr>
		</c:if>
		<c:if test="${audits.wfInstanceNode.actType == 1}">
			<tr>
				<td width="20%" bgcolor="#DDDDDD" colspan="4" align="center"><h4>流程步骤:${audits.wfInstanceNode.name}</h4></td>
			</tr>
			<tr class="jg">
				<td align="right" width="12%">审批人：</td>
				<td>
				${audits.auditUserName }
				</td>
				<td align="right">审核时间：</td>
				<td>
				<fmt:formatDate value="${audits.ts}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
			</tr>
			<tr>
				<td align="right">审核意见：</td>
				<td width="50%">
					<c:if test="${audits.result==2}">
						${audits.opinion}
					</c:if>
					<c:if test="${audits.result==3}">
						${audits.opinion}
					</c:if>
				</td>
				<td width="12%" align="right">审核结果：</td>
				<td>
					<c:if test="${audits.result == 2}">审核通过</c:if>
					<c:if test="${audits.result == 3}">审核不通过</c:if>
				</td>
			</tr>
		</c:if>
	</c:if>
	<c:if test="${nodeState == 1}">
		<tr>
			<td width="20%" bgcolor="#DDDDDD" colspan="4" align="center"><h4>流程步骤:${audits.wfInstanceNode.name}</h4></td>
		</tr>
		<tr class="jg">
			<td align="right" width="12%">审批人：</td>
			<td>
			${audits.auditUserName }
			</td>
			<td align="right">审核时间：</td>
			<td>
			<fmt:formatDate value="${audits.ts}" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
		</tr>
		<tr>
			<td align="right">审核意见：</td>
			<td width="50%">
				<c:if test="${audits.result==2}">
					${audits.opinion}
				</c:if>
				<c:if test="${audits.result==3}">
					${audits.opinion}
				</c:if>
			</td>
			<td width="12%" align="right">审核结果：</td>
			<td>
				<c:if test="${audits.result == 2}">审核通过</c:if>
				<c:if test="${audits.result == 3}">审核不通过</c:if>
			</td>
		</tr>
	</c:if>
</c:forEach>
</c:if>
	<tr>
		<td colspan="4" bgcolor="#DDDDDD" style="text-align: center;"><h4>流程步骤:${nodeName.name }</h4></td>
	</tr>
	<tr class="jg">
		<td width="12%" align="right">审批人：</td>
		<td colspan="3">${Login_Info.userName }</td>
			<!--<c:if test="${nodeType==1}">
				<td width="15%" align="right">指定审核人员：</td>
				<td colspan="3">
				<input type="text" id="ap"/>
				<a href="javascript:openDialogById('${ctx}/wf/WfInstanceParticipan!list.do?query.objId=${model.id }&groupFlag=4','resourcesDialog','grantResources');" style="text-decoration: underline;">选择</a>
			</c:if>
			-->
		<!--<c:if test="${nodeType==2}">
			<td width="15%" align="right">指定专家组：</td>
			<td>
			<input type="text" id="ap"/>
			<a href="javascript:openDialogById('${ctx}/wf/WfInstanceParticipan!zjzlist.do?query.objId=${model.id }&groupFlag=4','resourcesDialog','grantResources');" style="text-decoration: underline;">选择</a>
			<span id="error1" style="color: #A9A9A9;margin-left:10px; ">请选择专家组</span>
			</td>
		</c:if>
	-->
	</tr>
	<tr>
		<td width="10%" align="right">审批意见：</td>
		<td colspan="3">
			<textarea id="opinion" name="opinion" cols="50"></textarea>
			<span id="error4" style="color: #A9A9A9;margin-left:10px; ">请输入审核意见</span>
		</td>
	</tr>
</table>
<div class="page">
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
       <tr>
         <td align="center">
         	<input type="button" class="but_cz" value="审核通过" onclick="audit('2')"/>
         	<input type="button" class="but_cz" value="审核不通过" onclick="audit('3')"/>
         	<input type="button" class="but_cz"  value="返 回" onclick="history.back(-1)"  />
         </td>
       </tr>
   </table>
</div>
<script type="text/javascript">
	function audit(result){
		$("#result").val(result);
		document.listForm.submit();
	}
	
	function setAuditPerson(pname){
		if ( pname ) {
			$("#ap").val(pname);
		}
	}
</script>
</form>
</div>
</div>
</div>
</div>
</body>
</html>
