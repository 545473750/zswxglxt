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
		<input type="text" value="${model.name}" id="name" name="name"    datatype='string' max='100' tip='长度不能超过100'/>
	</td>
	<td width="10%" align="right" height="36" class="leftbor" >预设班主任：</td>
	<td >
		<input type="text" value="${model.headTeacherName}" id="headTeacherName" name="headTeacherName" onfocus="openDialogById('${ctx}/bj/ClassBigclass!userlist.do?teacher=headTeacher');"  datatype='string' max='32'   tip='长度不能超过32'/>
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
		<input type="text" value="${model.totalHour}" id="totalHour" name="totalHour"    datatype='integer'   tip='请输入一个整数'/>
	</td>
	<td width="10%" align="right" height="36" class="leftbor" >面授学时：</td>
	<td>
		<input type="text" value="${model.faceHour}" id="faceHour" name="faceHour"    datatype='integer'   tip='请输入一个整数'/>
	</td>
	<td rowspan="3" width="12%" align="right" height="36" class="leftbor" >预设总学分：</td>
	<td rowspan="3">
		<input type="text" value="${model.prepareScore}" id="prepareScore" name="prepareScore"    datatype='integer'   tip='请输入一个整数'/>
	</td>
</tr>
<tr >
	<td width="10%" align="right" height="36" class="leftbor" >网授学时：</td>
	<td>
		<input type="text" value="${model.netHour}" id="netHour" name="netHour"    datatype='integer'    tip='请输入一个整数'/>
	</td>
</tr>
<tr class="jg">
	<td width="10%" align="right" height="36" class="leftbor" >实践学时：</td>
	<td>
		<input type="text" value="${model.practiceHour}" id="practiceHour" name="practiceHour" datatype='integer' tip='请输入一个整数'/>
	</td>
</tr>
<tr>
	<td width="12%" align="right" height="36" class="leftbor" >招生对象：</td>
	<td colspan="3">
		<textarea id="recruitObj" name="recruitObj" cols="35" rows="2"  datatype='*' max='100' tip='长度不能超过100'>${model.recruitObj}</textarea>
	</td>
	<td width="10%" align="right" height="36" class="leftbor" >招生人数：</td>
	<td>
		<input type="text" value="${model.recruitCount}" id="recruitCount" name="recruitCount" datatype='integer' tip='请输入一个整数'/>
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
		<textarea id="purpose" name="purpose" cols="30" datatype='*' max='200' tip='长度不能超过100'>${model.purpose}</textarea>
	</td>
</tr>
<tr>
	<td width="10%" align="right" height="36" class="leftbor" >课程说明：</td>
	<td colspan="5">
		<textarea id="description" name="description" cols="61" rows="4"  datatype='*' max='200' tip='长度不能超过200'>${model.description}</textarea>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" align="right" height="36" class="leftbor" >培训目标：</td>
	<td colspan="5">
		<textarea id="trainTarget" name="trainTarget" cols="61" rows="4"  datatype='*' max='200'   tip='长度不能超过200'>${model.trainTarget}</textarea>
	</td>
</tr>
<tr>
	<td width="12%" align="right" height="36" class="leftbor" >考核方式：</td>
	<td colspan="5">
		<textarea id="checkWays" name="checkWays" cols="61" rows="4"  datatype='*' max='200'  tip='长度不能超过200'>${model.checkWays}</textarea>
	</td>
</tr>
</table>     
<table  id="cct" style="text-align: center;" cellpadding="0" cellspacing="0" border="0" width="100%">
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
  <tr>
    <td width="19%">
    	<input type="hidden" name="length" value="0"/>
    	<input type="text" id="courseName" name="classCourses2[0].courseName" datatype='*' tip='请选择课程' onfocus="openDialogById('${ctx}/bj/ClassBigclass!courseList.do?courseId=course')" />
		<input type="hidden" id="courseId" name="classCourses2[0].courseId" />    		
    </td>
    <td width="19%">
    	<input size="10" type="text" id="localName" name="classCourses2[0].localTeacherName" datatype='*' tip='请选择教师' onfocus='openDialogById("${ctx}/bj/ClassBigclass!userlist.do?teacher=local");' />
    	<input type="hidden" id="localId" name="classCourses2[0].localTeacherId" />
    </td>
    <td width="19%">
    	<input size="10" type="text" id="outName" name="classCourses2[0].outTeacherName" onfocus="openDialogById('${ctx}/bj/ClassBigclass!userlist.do?teacher=out');" />
    	<p style="visibility: hidden;">让输入框对齐</p>
    	<input type="hidden" id="outId" name="classCourses2[0].outTeacherId" />
    </td>
    <td width="19%">
    	<input size="12" type="text" name="classCourses2[0].courseDate" datatype='integer' tip='请输入一个整数'/>
    </td>
    <td width="24%">
    	<input size="12" type="text" id="khName" name="checkWay" onfocus="openDialog('khNo','khName')"  datatype='*' tip='请选择考核方式'/>
    	<input type="hidden" id="khNo" name="classCourses2[0].checkWay"/>
    </td>
    <td><input type="button" class="but_cz" value="添加" onclick="addline()"/></td>
  </tr>
</table>

<div id="showKh" style="padding: 10px;" >
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
		<td align="right">附件：</td>
		<td id="file"><input type="file" name="file"/>&nbsp;&nbsp;<input type="button" class="but_cz" value="添加" onclick="addFile()"/></td>
	</tr>
</table>
<script type="text/javascript">
	function addline(){
		var no = Number($("input[name=length]").last().val())+1;
		var text='<tr name="cctr" id="'+no+'">';
			text+='<input type="hidden" name="length" value="'+no+'"/>';
			text+='<td width="19%"><input type="text" id="course'+no+'Name" name="classCourses2['+no+'].courseName" datatype="*" tip="请选择课程" onfocus="openDialogById(\'${ctx}/bj/ClassBigclass!courseList.do?courseId=course'+no+'\')"/>';
			text+='<input type="hidden" id="course'+no+'Id" name="classCourses2['+no+'].courseId" /></td>';
			text+='<td width="19%"><input size="10" type="text" id="local'+no+'Name" name="classCourses2['+no+'].localTeacherName" datatype="*" tip="请选择教师" onfocus="openDialogById(\'${ctx}/bj/ClassBigclass!userlist.do?teacher=local'+no+'\')"/>';
			text+='<input type="hidden" id="local'+no+'Id" name="classCourses2['+no+'].localTeacherId"/></td>';
			text+='<td width="19%"><input size="10" type="text" id="out'+no+'Name" name="classCourses2['+no+'].outTeacherName" onfocus="openDialogById(\'${ctx}/bj/ClassBigclass!userlist.do?teacher=out'+no+'\')" />';
			text+='<input type="hidden" id="out'+no+'Id" name="classCourses2['+no+'].outTeacherId" /></td>';
			text+='<td width="19%"><input size="12" type="text" name="classCourses2['+no+'].courseDate" datatype="integer" tip="请输入一个整数" /></td>';
			text+='<td width="24%"><input size="12" id="khName'+no+'" type="text" datatype="*" tip="请选择考核方式"  onfocus="openDialog(\'khNo'+no+'\',\'khName'+no+'\')" />';
			text+='<input type="hidden" id="khNo'+no+'" name="classCourses2['+no+'].checkWay"/></td>';
			text+='<td><input type="button" value="删除" class="but_cz" onclick="delline('+no+')"/></td>';
			text+='</tr>';
		$("#cct").append(text);
		syncHeight();
	}
	
	function delline(no){
		$("#"+no).remove();
		syncHeight();
	} 
	function addFile(){
		var no = $("div[name=fi]").length+1;
		var text = '<div name=""fi id="'+no+'">'
			text += '<td id="fi'+no+'"><input type="file" name="file"/>&nbsp;&nbsp;<input type="button" class="but_cz" value="删除" onclick="delFile('+no+')"/></td>';
			text += '</div>';
		$("#file").append(text);
		syncHeight();
	}
	function delFile(no){
		$("#"+no).remove();
		syncHeight();
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
