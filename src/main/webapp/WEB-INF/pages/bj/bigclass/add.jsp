<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>新增培训班</title>
<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/scripts/validform/checkform.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
<script src="${ctx}/scripts/validform/Validform_zg_v5.1.js" type="text/javascript"></script>
<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
	    $("#dataform").Validform();
	});  
	$(function(){
	    $("#showKh").dialog({
	    	title: '考核方式',
	    	autoOpen: false,
	        width: 190,
	        height: 190,
	        resizable: true,
	        modal: true,
	        autoResize: true,
	        position:'bottom',
			overlay: {
               opacity: 0.5,
               background: "black"
	        }
	    });
	});
</script>
</head>
<body>
<div class="right">
<div class="llistbox">
	 <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">教师培训</a> &gt; <a href="#">培训班管理</a> &gt; 添加培训班</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" onclick="goBack()" />
          </p>
      </div>
    <div class="tablelist">
	<div class="title">添加培训班</div>
	<div class="table01">
  	<form id="dataform" name="dataform" method="post"  action="${ctx}/bj/ClassBigclass!saveAdd.do"  enctype="multipart/form-data">
    	 <span>
			<c:forEach var="obj" items="${params }" varStatus="vs">
				<input type="hidden" name="${obj.key}" value="${obj.value}"/>
			</c:forEach>
	    </span>
    <%@ include file="form_include.jsp" %>
    	<div class="page">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
             <td align="center">
             	<input type="button" value="提交并发送审批" class="but_cz" id="btnAndSend" onclick="saveAndSend('${ctx}/bj/ClassBigclass!saveAndSend.do',document.dataform);"/>
		  		<input type="button" value="提 交" class="but_cz" id="btn" onclick="saveAdd()"/>
		   		<input type="button" value="取 消" class="but_cz" onclick="goBack()" />
	   		</td>
	   	   </tr>
	   	</table>
		</div>
  </form>
  </div>    
</div> 
  </div>
<script type="text/javascript">
	function openDialogById(url,dialogId,iframeId){
		parent.dialog({
			title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 选择人员',
			autoOpen: true,
			width: 810,
			height: 600,
			modal: true,
			overlay: {
				opacity: 0.5,
				background: "black"
			},
			useIframe: true,
			url: url
		});
	}
	//打开dialog
	function openDialog(id,value){
		var horizontalPadding = 30;
		var verticalPadding = 30;
		$("input[name=khId]").val(id);
		$("input[name=khfsName]").val(value);
		var khKeys = $("input[name=khKey]");
		for(var i = 0; i < khKeys.length; i++){
			$("input[name=khKey]").eq(i).attr("checked",false);
		}
		$("#showKh").dialog("open");
	}
	function getKhfs(){
		var id = document.getElementsByName("khId")[0].value;
		var name = document.getElementsByName("khfsName")[0].value;
		var khIds = document.getElementsByName("khKey");
		var khfsId = null;
		var strId = null;
		var strName = null;
		for(var i = 0; i < khIds.length; i++){
			if(khIds[i].checked == true){
				khfsId = khIds[i].value;
				if(khfsId == 1){
					if(strName == null){
						strName = '综合 ';
					}else{
						strName += '综合 ';
					}
				}else if(khfsId == 2){
					if(strName == null){
						strName = '考试 ';
					}else{
						strName += '考试 ';
					}
				}else if(khfsId == 3){
					if(strName == null){
						strName = '测验 ';
					}else{
						strName += '测验 ';
					}	
				}else if(khfsId == 4){
					if(strName == null){
						strName = '作业 ';
					}else{
						strName += '作业 ';
					}
				}else if(khfsId == 5){
					if(strName == null){
						strName = '论文 ';
					}else{
						strName += '论文 ';
					}
				}else if(khfsId == 6){
					if(strName == null){
						strName = '报告 ';
					}else{
						strName += '报告 '
					}
				}else if(khfsId == 7){
					if(strName == null){
						strName = '讨论 ';
					}else{
						strName += '讨论 ';
					}
				}else if(khfsId == 8){
					if(strName == null){
						strName = '实验  ';
					}else{
						strName += '实验  ';
					}
				}else if(khfsId == 9){
					if(strName == null){
						strName = '说课 ';
					}else{
						strName += '说课 ';
					}
				}else if(khfsId == 10){
					if(strName == null){
						strName = '展示 ';
					}else{
						strName += '展示 ';
					}
				}else if(khfsId == 11){
					if(strName == null){
						strName = '课时 ';
					}else{
						strName += '课时 ';
					}
				}else if(khfsId == 12){
					if(strName == null){
						strName = '其它 ';
					}else{
						strName += '其它 ';
					}
				}
				if(strId != null){
					strId += ","+khfsId;
				}else{
					strId = khfsId;
				}
			}
			
		}
		$("#"+id).val(strId);
		$("#"+name).val(strName);
		cancel('showKh');
	}
	//关闭dialog
	function cancel(id){
		$("#"+id).dialog("close");
	}
	
	function saveAndSend(action,form){
		form.action = action;
		$("#dataform").submit();
	}
	
	//提交
	function saveAdd(){
		$("#dataform").submit();
	}
	
	//设置班主任名称和id
	function setIdAndName(param,name,id){
		if(name!=null&&id!=null){
			$("#"+param+"Name").val(name);
			$("#"+param+"Id").val(id);
		}
	}
	
	function goBack(){
		location.href="${ctx}/bj/ClassBigclass!list.do";
	}
</script>
 </div>
</body>
</html>
