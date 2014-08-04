//禁用提交按钮，避免用户重复提交
function disableSubmit(finalResult,submitButtonId) {
	if(finalResult) {
		document.getElementById(submitButtonId).disabled = true;
		return finalResult;
	}else {
		return finalResult;
	}
}

//批量删除方法 接收参数 action访问地址、多选框名称、提交表单名称
function batchDelete(action,checkboxName,form){
    if (!hasOneChecked(checkboxName)){
            alert('请选择要操作的对象!');
            return;
    }
    if (confirm('确定执行[删除]操作?')){
        form.action = action;
        form.submit();
    }
}

//审核通过方法 接收参数 action访问地址、多选框名称、提交表单名称
function batchExamine(action,checkboxName,form){
    if (!hasOneChecked(checkboxName)){
            alert('请选择要操作的对象!');
            return;
    }
    if (confirm('确定执行[审核通过]操作?')){
        form.action = action;
        form.submit();
    }
}

//审核不通过方法 接收参数 action访问地址、多选框名称、提交表单名称
function batchExamineError(action,checkboxName,form){
    if (!hasOneChecked(checkboxName)){
            alert('请选择要操作的对象!');
            return;
    }
    if (confirm('确定执行[审核不通过]操作?')){
        form.action = action;
        form.submit();
    }
}

// ------------------------------------------------批量启用/停用
function batchEnabled(action, checkboxName, form) {
	if (!hasOneChecked(checkboxName)){
	    alert('请选择要操作的对象!');
	    return;
	}
	if (confirm('确定执行[启用]操作?')){
	    form.action = action;
	    document.getElementById('ableFlag').value = 'enabled';
	    form.submit();
	}
}

//停用方法 接收参数 action访问地址、多选框名称、提交表单名称
function batchDisabled(action, checkboxName, form) {
	if (!hasOneChecked(checkboxName)){
	    alert('请选择要操作的对象!');
	    return;
	}
	if (confirm('确定执行[停用]操作?')){
	    form.action = action;
	    document.getElementById('ableFlag').value = 'disabled';
	    form.submit();
	}
}
// ------------------------------------------------批量启用/停用

//-------------------岗位管理-人员设置
function configUserForStation(action, checkboxName, form) {
//	if (!hasOneChecked(checkboxName)){
//	    alert('请选择要设置的对象!');
//	    return;
//	}
//	if (confirm('确定执行操作?')){
	    form.action = action;
	    form.submit();
//	}
}

// -------------------岗位管理-人员设置

// -----------------组织机构管理--人员信息
function configUserForOrganization(action, checkboxName, form) {
//	if (!hasOneChecked(checkboxName)){
//	    alert('请选择要设置的对象!');
//	    return;
//	}
	if (confirm('确定执行操作?')){
	    form.action = action;
	    form.submit();
	}
}
// -----------------组织机构管理--人员信息

function batchEdit(action,checkboxName,form){
    if (!hasOneChecked(checkboxName)){
            alert('请选择要操作的对象!');
            return;
    } else {
    	var items = document.getElementsByName(checkboxName);
    	var itemId = null;
    	var count = 0;
    	for (var i = 0; i < items.length; i++){
            if (items[i].checked == true){
            	itemId = items[i].value;
                count++;
            }
        }
    	if (count != 1) {
        	alert('请选择一项!');
            return;
        } else {
        	location.href=action+'?'+itemId;
        	//window.parent.frames.mainFrame.location.href = action+'?'+itemId;
        }
    }
    
}


//修改方法 接收参数 action访问地址、多选框名称、提交表单名称
function batchDialogEdit(action,checkboxName,form){
    if (!hasOneChecked(checkboxName)){
            alert('请选择要操作的对象!');
            return;
    } else {
    	var items = document.getElementsByName(checkboxName);
    	var itemId = null;
    	var count = 0;
	    for (var i = 0; i < items.length; i++){
	        if (items[i].checked == true){
	        	count++;
	        	itemId = items[i].value;
	            // break;
	        }
	    }
    	if (count != 1) {
    		alert('请选择一项!');
            return;
    	} else {
    		openDialog(action+'?'+itemId);
    	}
    }
    
}

//打开dialog方法 此方法打开的是id为dialog的对象 接收参数 url地址
function openDialog(url){
	var horizontalPadding = 30;
    var verticalPadding = 30;
    document.getElementById("addSit").src=url;
   	$("#dialog").dialog( "open" );
    
}

//关闭dialog并刷新父页面方法 此关闭方法关闭的是id为dialog的窗口
function closeDialog() {
	$('#dialog').dialog('close');
	document.execCommand('Refresh');
	//document.designMode = "off";
	//document.execCommand('refresh', false, "");
}
//关闭dialog不刷新父页面方法 此关闭方法关闭的是id为dialog的窗口
function closeDialogNoRefresh() {
	$('#dialog').dialog('close');
	if($('#stationDialog') != null) {
		$('#stationDialog').dialog('close');
	}
}

//根据dialogId关闭dialog
function closeDialogNoRefreshById(dialogId) {
	$('#'+dialogId).dialog('close');
}

//判断多选框是否勾选
function hasOneChecked(name){
    var items = document.getElementsByName(name);
    if (items.length > 0) {
        for (var i = 0; i < items.length; i++){
            if (items[i].checked == true){
                return true;
            }
        }
    } else {
        if (items.checked == true) {
            return true;
        }
    }
    return false;
}

function setAllCheckboxState(name,state) {
	var elms = document.getElementsByName(name);
	for(var i = 0; i < elms.length; i++) {
		elms[i].checked = state;
	}
}

function getReferenceForm(elm) {
	while(elm && elm.tagName != 'BODY') {
		if(elm.tagName == 'FORM') return elm;
		elm = elm.parentNode;
	}
	return null;
}
//根据id打开dialog
function openDialogById(url,dialogId,iframeId){
			var horizontalPadding = 30;
		    var verticalPadding = 30;
		    document.getElementById(""+iframeId).src=url;
		   	$("#"+dialogId).dialog( "open" );
    
}

/**
 *限制字符显示个数
 */
function limitn(parameters, n) {
	if (parameters) {
		if (parameters.length > n) {
			document.write("<span title=\"" + parameters + "\" style=\"text-decoration: none\">" + parameters.substr(0, n) + "...</span>");
		} else {
			document.write(parameters);
		}
	}
}

/**
 * 窗口定向到某个页面
 * @param url
 */
function windowLocation(url){
	location.href = url;
}
/**
 * list页面打开或者隐藏搜索块
 */
function toggleContent(){
	var state=document.getElementById("state");
	if(state.value==0){
		
		state.value=1;
		document.getElementById("search").style.display="none";
		
	}else{
	     state.value=0;
	     document.getElementById("search").style.display="block";
	}
}
/**
 * 选择一条数据并跳转到指定页面
 * @param action
 * @param checkboxName
 * @param form
 */
function selectOne(action,checkboxName,form){
	var items = $(":checked[name="+checkboxName+"]");
	if(items.length!=1){
		alert('请选择一项!');
		return ;
	}
	var itemvalue = items.val();
	id = itemvalue.substring(3,itemvalue.length-1);
	form.action = action+id;
	form.submit();
}

function openwindow(url,name,iWidth,iHeight)
{
	var url; //转向网页的地址;
	var name; //网页名称，可为空;
	var iWidth; //弹出窗口的宽度;
	var iHeight; //弹出窗口的高度;
	var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	window.open(url,name,'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
}
