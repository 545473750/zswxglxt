<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@page import="com.opendata.organiz.model.*" %>
<%@page import="com.opendata.application.model.*" %>

<rapid:override name="head">
	<title>权限授予</title>
	<c:set var="ctx" value="${pageContext.request.contextPath}" />
		<script language="javascript" src="${ctx}/scripts/jquery.js"></script>
		<script src="${ctx}/scripts/dhtmlxcommon.js"></script>
		<script src="${ctx}/scripts/dhtmlxtree.js"></script>
        <script src="<c:url value="/scripts/jquery.js"/>" type="text/javascript"></script>
		<link href="${ctx}/styles/global.css" id="global" rel="stylesheet" type="text/css" />
		<link href="${ctx}/styles/tree.css" rel="stylesheet" type="text/css" />
		<script src="${ctx}/scripts/hf.js" type="text/javascript"></script>
			<script language="javascript">
	$(function() {
		tree = new dhtmlXTreeObject("jsTree", "50%", "50%", 0);
		tree.setSkin('dhx_skyblue');
		tree.setImagePath("${ctx}/images/tree/");
		tree.setOnClickHandler(function(id) {
			openPathDocs(id);
		});
		//设置树的编码  
		tree.setEscapingMode("utf8");
		tree.enableCheckBoxes("1");
	    tree.enableThreeStateCheckboxes(2);//这个属性设成1表示初始化时，父项被选中，子项也全被选中 设成2是不级联只显示真是被选中的情况
	    tree.setOnCheckHandler(function(id) {
	     	var flag = tree.isItemChecked(id);// 1代表选中,0代表未选中
	     	if(flag == '1'){
		     	//如果子节点被选中 递归取得所有父节点选中
				// 如果父节点还有父节点
				var parentNodeId = tree.getParentId(id); // 当前节点的父节点
				if(parentNodeId != '0') {
					setParentNodeCheckBox(id, 1);
				}
			}
			// 递归处理子节点
			setTreeNodeCheckBox(id, flag);
			
		});
		tree.setXMLAutoLoading("${ctx}/organiz/Role!toGrantPage.do?id=${id}");
		tree.loadXML("${ctx}/organiz/Role!toGrantPage.do?id=${id}&partitionId=${partitionId}");
	});
	// 递归处理子节点
	function setTreeNodeCheckBox(cid, flag) {
		for(var index = 0; index < tree.hasChildren(cid); index++) {
			var childrenNodeId = tree.getItemIdByIndex(cid, index);
			// 子节点跟父节点的状态一致 同选中或同取消
			tree.setCheck(childrenNodeId, flag);
			// 如果子节点还有子节点，则递归处理
			if(tree.hasChildren(childrenNodeId) > 0) {
				setTreeNodeCheckBox(childrenNodeId, flag);
			}						
		}
	}
	
	// 递归处理父节点
	function setParentNodeCheckBox(id, flag) {
		var parentNodeId = tree.getParentId(id); // 当前节点的父节点
		if(flag == '1') {
			tree.setCheck(parentNodeId, flag);
		}
		// 递归处理
		if(tree.getParentId(parentNodeId) != "0") {
			setParentNodeCheckBox(parentNodeId, flag);
		}
	}
	
	//因为权限授予需要改成不选功能菜单的时候能选择上级的父显示菜单，所以需要此方法改成勾掉子节点的情况下父节点不随之勾掉
	dhtmlXTreeObject.prototype._correctCheckStates=function(dhtmlObject){   
	   if (!this.tscheck) return;   
	   if (!dhtmlObject) return;   
	   if (dhtmlObject.id==this.rootId) return;   
	   var act=dhtmlObject.childNodes;   
	   var flag1=0; var flag2=0;   
	   if (dhtmlObject.childsCount==0) return;   
	   for (var i=0; i<dhtmlObject.childsCount; i++){   
	      if (act[i].dscheck) continue;   
	      if (act[i].checkstate==0) flag1=1;   
	      else if (act[i].checkstate==1) flag2=1;   
	         else { flag1=1; flag2=1; break; }   
	         }   
	  
	   if ((flag1)&&(flag2)) this._setCheck(dhtmlObject,"unsure");   
	   else if (flag1)  {   
	    //this._setCheck(dhtmlObject,false);   
	   }   
	      else  this._setCheck(dhtmlObject,true);   
	  
	      //this._correctCheckStates(dhtmlObject.parentObject); //所有子节点全部勾掉后 父节点也随之勾掉  
	}  
	

	function openPathDocs(id) {
		tree.setItemColor(tree.getSelectedItemId(), "#696969", "#B8860B");
	
	}

	function autoselectNode() {
		tree.selectItem(node, true);
		tree.openItem(node);
	}
	
	function perFormSub(){
	   document.getElementById("permissionIds").value = tree.getAllCheckedBranches();
	   document.getElementById("id").value = '${id}';
	   document.getElementById("perForm").submit();
	}
</script>
</rapid:override>

<rapid:override name="content">
<body class="mainbody">
<form action="${ctx}/organiz/Role!grantPermission.do" id="perForm" name="perForm" method="post" >
<input type="hidden" name="id" id="id" value="${id}">
<input type="hidden" name="partitionId" value="${partitionId}"/>
<input type="hidden" name="permissionIds" id="permissionIds" value="">
<input type="hidden" name="dialogId" value="resourcesDialog"/>
<!-- 无外边框内容区开始 -->
<div class="wbkbox">
<!-- TAB标签结束 -->
	<div class="main-wbkcon" style="height: 310px;">
		<div align="left" style="padding-top: 5px;">
			<input id="submitButton" name="submitButton" type="button" value="提交" onclick="perFormSub();"/>
			<input type="button" value="关闭" onclick="window.parent.closeDialogNoRefreshById('resourcesDialog');"/>
		</div>
		<div id="jsTree" align="left" style="height:285px;width:100%;"></div>
	</div>
</div>
</form>
</body>
	<script>
	/*
		new Validation(document.forms[0],{onSubmit:true,onFormValidate : function(result,form) {
			var finalResult = result;
			//在这里添加自定义验证
			return disableSubmit(finalResult,'submitButton');
		}});*/
	</script>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>