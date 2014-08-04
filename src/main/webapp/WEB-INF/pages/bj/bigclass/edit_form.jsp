<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 实体表单-->
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
<tr class="jg" >
	<td width="10%" align="right" height="36" class="leftbor" >培训类别：</td>
	<td>
		<select id="trainType" name="trainType" datatype="*" nullmsg="请选择培训类别" errormsg="请选择培训类别"> 
			<option value="">--请选择--</option>
			<c:forEach items="${pxlb }" var = "px">
				<option value="${px.key }" <c:if test="${px.key == model.trainType }">selected="selected"</c:if> >${px.value }</option>
			</c:forEach>
		</select>
	</td>
	<td width="10%" align="right">申请人：</td>
	<td>${username }</td>
	<td align="right">申请人单位：</td>
	<td>${orgName }</td>
</tr>
<tr>
	<td width="10%" align="right" height="36" class="leftbor" >班级名称：</td>
	<td>
		<input type="text" value="${model.name}" id="name" name="name"    datatype='string' max='100' ignore='ignore'  tip='长度不能超过100'/>
	</td>
	<td width="10%" align="right" height="36" class="leftbor" >预设班主任：</td>
	<td >
		<input type="text" value="${model.headTeacherName}" id="headTeacherName" name="headTeacherName" onfocus="openDialogById('${ctx}/bj/ClassBigclass!userlist.do?teacher=headTeacher');"  datatype='string' max='32' ignore='ignore'  tip='长度不能超过32'/>
		<input type="hidden" value="${model.headTeacherId }" id="headTeacherId" name="headTeacherId" />
	</td>
	<td width="10%" align="right" height="36" class="leftbor" >学科：</td>
	<td>
		<select id="subject" name="subject" datatype="*" nullmsg="请选择课程" errormsg="请选择课程">
			<option value="">--请选择--</option>
			<c:forEach items="${xk }" var="x">
				<option value="${x.key }" <c:if test="${x.key == model.subject }">selected="selected"</c:if> >${x.value }</option>
			</c:forEach>
		</select>
	</td>
</tr>
<tr class="jg">
	<td width="10%" align="right" height="36" class="leftbor" rowspan="3" >总学时：</td>
	<td rowspan="3">
		<input type="text" value="${model.totalHour}" id="totalHour" name="totalHour"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
	<td width="10%" align="right" height="36" class="leftbor" >面授学时：</td>
	<td>
		<input type="text" value="${model.faceHour}" id="faceHour" name="faceHour"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
	<td rowspan="3" width="12%" align="right" height="36" class="leftbor" >预设总学分：</td>
	<td rowspan="3">
		<input type="text" value="${model.prepareScore}" id="prepareScore" name="prepareScore"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
</tr>
<tr >
	<td width="10%" align="right" height="36" class="leftbor" >网授学时：</td>
	<td>
		<input type="text" value="${model.netHour}" id="netHour" name="netHour"    datatype='string'    tip='请输入一个整数'/>
	</td>
</tr>
<tr class="jg">
	<td width="10%" align="right" height="36" class="leftbor" >实践学时：</td>
	<td>
		<input type="text" value="${model.practiceHour}" id="practiceHour" name="practiceHour"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
</tr>
<tr>
	<td width="12%" align="right" height="36" class="leftbor" >招生对象：</td>
	<td colspan="3">
		<textarea id="recruitObj" name="recruitObj" cols="35" rows="2"  datatype='string' max='100' ignore='ignore'  tip='长度不能超过100'>${model.recruitObj}</textarea>
	</td>
	<td width="10%" align="right" height="36" class="leftbor" >招生人数：</td>
	<td>
		<input type="text" value="${model.recruitCount}" id="recruitCount" name="recruitCount"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" align="right" height="36" class="leftbor" >资料费用：</td>
	<td>
		<select id="materialsFee" name="materialsFee"  datatype="*" nullmsg="请选择资料费用" errormsg="请选择资料费用">
			<option value="">--请选择--</option>
			<option value="30" <c:if test="${model.materialsFee == 30 }">selected="selected"</c:if>  >30元</option>
			<option value="50" <c:if test="${model.materialsFee == 50 }">selected="selected"</c:if>  >50元</option>
			<option value="100" <c:if test="${model.materialsFee == 100 }">selected="selected"</c:if> >100元</option>
		</select>
	</td>
	<td width="12%" align="right" height="36" class="leftbor" >用途：</td>
	<td colspan="3">
		<textarea id="purpose" name="purpose" cols="30"    datatype='string' max='100'  tip='长度不能超过100'>${model.purpose}</textarea>
	</td>
</tr>
<tr>
	<td width="10%" align="right" height="36" class="leftbor" >课程说明：</td>
	<td colspan="5">
		<textarea id="description" name="description" cols="61" rows="4"  datatype='string' max='500'  tip='长度不能超过500'>${model.description}</textarea>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" align="right" height="36" class="leftbor" >培训目标：</td>
	<td colspan="5">
		<textarea id="trainTarget" name="trainTarget" cols="61" rows="4"  datatype='string' max='200'  tip='长度不能超过200'>${model.trainTarget}</textarea>
	</td>
</tr>
<tr>
	<td width="12%" align="right" height="36" class="leftbor" >考核方式：</td>
	<td colspan="5">
		<textarea id="checkWays" name="checkWays" cols="61" rows="4"  datatype='string'  max='200' tip='长度不能超过200'>${model.checkWays}</textarea>
	</td>
</tr>
</table>     
<table  id="cc" style="text-align: center;" cellpadding="0" cellspacing="0" border="0" width="100%">
  <tr class="jg" >
    <td colspan="6"><h3>本班每门课程教师任课情况</h3></td>
  </tr>
  <tr>
  	<td  height="25"><h4>课程名称</h4></td>
  	<td  height="25"><h4>本院教师</h4></td>
  	<td  height="25"><h4>外请教师</h4></td>
  	<td  height="25"><h4>学时</h4></td>
  	<td  height="25"><h4>考核方式</h4></td>
  	<td></td>
  </tr>
  <c:forEach items="${classCourses2 }" var="classCourses" varStatus="stat">
  	<tr name="cctr">
		<td width="19%">
			<input type="hidden" name="length" value="0"/>
	    	<input type="text" id="course${stat.index}Name" name="classCourses2[${stat.index}].courseName"  datatype='*' tip='请选择课程' value="${ classCourses.courseName}" onfocus="openDialogById('${ctx}/bj/ClassBigclass!courseList.do?courseId=course${stat.index}')" />
			<input type="hidden" id="course${stat.index}Id" name="classCourses2[${stat.index}].courseId" value="${classCourses.courseId }"/>    		
	    </td>
	    <td width="19%">
	    	<input size="10" type="text" id="local${stat.index}Name" name="classCourses2[${stat.index}].localTeacherName" datatype='*' tip='请选择教师' value="${classCourses.localTeacherName}" onfocus='openDialogById("${ctx}/bj/ClassBigclass!userlist.do?teacher=local${stat.index}");' />
	    	<input type="hidden" id="local${stat.index}Id" name="classCourses2[${stat.index}].localTeacherId" value="${classCourses.localTeacherId }"/>
	    </td>
	    <td width="19%">
	    	<input size="10" type="text" id="out${stat.index}Name" name="classCourses2[${stat.index}].outTeacherName" value="${classCourses.outTeacherName }" onfocus="openDialogById('${ctx}/bj/ClassBigclass!userlist.do?teacher=out${stat.index}');" />
	    	<p style="visibility: hidden;">让输入框对齐</p>
	    	<input type="hidden" id="out${stat.index}Id" name="classCourses2[${stat.index}].outTeacherId" value="${classCourses.outTeacherId }" />
	    </td>
	    <td width="19%">
	    	<input size="12" type="text" name="classCourses2[${stat.index}].courseDate" value="${classCourses.courseDate }" datatype='integer' tip='请输入一个整数' />
	    </td>
	    <td width="24%">
	    	<input size="12" type="text" id="khName${stat.index}" name="checkWay" datatype='*' tip='请选择考核方式' onfocus="openDialog('khNo${stat.index}','khName${stat.index}','${classCourses.checkWay }')" value="<c:forTokens items="${classCourses.checkWay}" delims="," var = "way">${khfs[way]}&nbsp;&nbsp;</c:forTokens>"/>
    		<input type="hidden" id="khNo${stat.index}" name="classCourses2[${stat.index}].checkWay" value="<c:forTokens items="${classCourses.checkWay}" delims="," var = "way">${way},</c:forTokens>"/>
	    </td>
	    <c:if test="${stat.last }">
	   		<td><input type="button" class="but_cz" value="添加" onclick="addline()"/></td>
	    </c:if>
	    <c:if test="${!stat.last }">
	    	<td></td>
	    </c:if>
  	</tr>
  </c:forEach>
</table>

<div id="showKh" >
	<c:forEach items = "${khfs }" var = "kh" varStatus = "status">
		&nbsp;<input type="checkbox" name="khKey" value="${kh.key }"/>${kh.value }
		<c:if test="${(status.index+1)%3 == 0 }"><br/></c:if>
	</c:forEach>
	&nbsp;&nbsp;&nbsp;
	<input type="hidden" name="khId"/>
	<input type="hidden" name="khfsName"/>
	<input type="button" onclick="getKhfs()" value="确定" class="but_cz"/>
	<input type="button" onclick="cancel('showKh')" value="取消" class="but_cz"/>
</div>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<td colspan="2" align="center"><h3>相关附件(讲义、资源等)</h3></td>
	</tr>
	<tr class="jg">
		<td align="right">附件</td>
		<td id="file"><input type="file" name="file"/>&nbsp;&nbsp;<input type="button" class="but_cz" value="添加" onclick="addFile()"/></td>
	</tr>
	<c:forEach items = "${attachments }" var = "attachment">
		<tr id="${attachment.id }">
			<td></td>
			<td>
				<a href="${ctx}/common/AttachmentUtil!download.do?attachId=${attachment.id}">${attachment.fileName}</a>&nbsp;
				<a href="javascript:void(0)" id="del" onclick="delAtt('${attachment.id }')">删除</a>
			</td>
		</tr>
	</c:forEach>
</table>
<script type="text/javascript">
	function delAtt(attachmentId){
		$.ajax({
			type:'POST',
			url:'${ctx}/bj/ClassBigclass!deleteAtt.do',
			data:'attachmentId='+attachmentId,
			success:function(msg){
				if(msg=="1"){
					$("#"+attachmentId).remove();
					alert("删除成功");
				}			
			}
		});
	};

	function addline(){
		var no = Number($("input[name=length]").last().val())+1;
		var text='<tr name="cctr" id="cc'+no+'">';
			text+='<input type="hidden" name="length" value="'+no+'"/>';
			text+='<td width="19%"><input type="text" id="course'+no+'Name" name="classCourses2['+no+'].courseName" datatype="*" tip="请选择课程" onfocus="openDialogById(\'${ctx}/bj/ClassBigclass!courseList.do?courseId=course'+no+'\')"/>';
			text+='<input type="hidden" id="course'+no+'Id" name="classCourses2['+no+'].courseId" /></td>';
			text+='<td width="19%"><input size="10" type="text" id="local'+no+'Name" name="classCourses2['+no+'].localTeacherName" datatype="*" tip="请选择教师" onfocus="openDialogById(\'${ctx}/bj/ClassBigclass!userlist.do?teacher=local'+no+'\')"/>';
			text+='<input type="hidden" id="local'+no+'Id" name="classCourses2['+no+'].localTeacherId"/></td>';
			text+='<td width="19%"><input size="10" type="text" id="out'+no+'Name" name="classCourses2['+no+'].outTeacherName" onfocus="openDialogById(\'${ctx}/bj/ClassBigclass!userlist.do?teacher=out'+no+'\')" />';
			text+='<input type="hidden" id="out'+no+'Id" name="classCourses2['+no+'].outTeacherId" /></td>';
			text+='<td width="19%"><input size="12" type="text" name="classCourses2['+no+'].courseDate" datatype="integer" tip="请输入一个整数" /></td>';
			text+='<td width="24%"><input size="12" id="khName'+no+'" type="text" datatype="*" tip="请选择考核方式"  onfocus="openDialog(\'khNo'+no+'\',\'khName'+no+'\',\'\')" />';
			text+='<input type="hidden" id="khNo'+no+'" name="classCourses2['+no+'].checkWay"/></td>';
			text+='<td><input type="button" value="删除" class="but_cz" onclick="delline('+no+')"/></td>';
			text+='</tr>';
		$("#cc").append(text);
	}
	function delline(no){
		$("#cc"+no).remove();
	}
	function addFile(){
		var no = $("div[name=fi]").length+1;
		var text = '<div name=""fi id="'+no+'">'
			text += '<td id="fi'+no+'"><input type="file" name="file"/>&nbsp;&nbsp;<input type="button" class="but_cz" value="删除" onclick="delFile('+no+')"/></td>';
			text += '</div>';
		$("#file").append(text);
	}
	function delFile(no){
		$("#"+no).remove();
	}
	
	//ifram 高度自动增长
	function syncHeight(){
	   var realHeight = 0;
	   if (navigator.userAgent.indexOf("Firefox") > 0 || navigator.userAgent.indexOf("Mozilla") > 0 || navigator.userAgent.indexOf("Safari") > 0 || navigator.userAgent.indexOf("Chrome") > 0) { // Mozilla, Safari,Chrome, ...  
	        realHeight = window.document.documentElement.offsetHeight;
	   } else if (navigator.userAgent.indexOf("MSIE") > 0) { // IE  
	        var bodyScrollHeight = document.body.scrollHeight; //取得body的scrollHeight  
	        realHeight = bodyScrollHeight; //取当中比较大的一个
	   } else {//其他浏览器  
	        realHeight = window.document.body.scrollHeight + window.document.body.clientHeight + 1;
	   }
	   if (realHeight < 700) {
	       realHeight = 700;
	   }
	   var mainFrame = parent.document.getElementById("mainFrame");
	   mainFrame.height = realHeight+40+'px';
   }
</script>   
