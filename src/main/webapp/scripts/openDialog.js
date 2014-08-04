//打开对话框
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


//设置输入框的值
function setTeacherName(param,name,id){
	alert("2");
	if(name!=null&&id!=null){
		$("#"+param+"Id").val(id);
		$("#"+param).val(name);
	}
}

