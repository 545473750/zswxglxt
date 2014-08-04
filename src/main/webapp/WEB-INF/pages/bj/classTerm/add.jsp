<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>新增培训班期数</title>
<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/scripts/validform/checkform.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
<script src="${ctx}/scripts/validform/Validform_zg_v5.1.js" type="text/javascript"></script>
<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>

<script type="text/javascript">
	$(function(){
		$("#dataform").Validform();
	});
</script>
</head>
<body>
<div class="right">
<div class="llistbox">
	 <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">教师培训</a> &gt; <a href="#">培训班期数管理</a> &gt; 添加培训班期数</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" onclick="goBack()" />
          </p>
      </div>
    <div class="tablelist">
	<div class="title">添加培训班期数</div>
	<div class="table01">
  	<form id="dataform" method="post"  action="${ctx}/bj/ClassTerm!saveAdd.do" >
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
		  		<input type="button" value="提 交" class="but_cz" id="btn" onclick="save()" />
		   		<input type="button" value="取 消" class="but_cz" onclick="goBack()" />
	   		</td>
	   	   </tr>
	   	</table>
		</div>
  </form>
  </div>    
</div> 
  </div>
 </div>
<script type="text/javascript">
	function save(){
		var allLimit = $("#allLimit").val();
		var classLimit = $("#classLimit").val();
		if(parseInt(classLimit) > parseInt(allLimit)){
			alert("每班人数不能大于招生人数!");
			return;
		}
		$("#dataform").submit();
	}

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
	
	function setTeacherName(param,name,id){
		if(name!=null&&id!=null){
			$("#"+param+"Id").val(id);
			$("#"+param).val(name);
		}
	}
	
	function goBack(){
		location.href="${ctx}/bj/ClassTerm!list.do?query.bigclassId=${query.bigclassId}";
	}
</script>
</body>
</html>
