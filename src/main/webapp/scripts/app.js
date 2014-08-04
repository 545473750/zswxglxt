function disableSubmit(finalResult,submitButtonId) {
	if(finalResult) {
		document.getElementById(submitButtonId).disabled = true;
		return finalResult;
	}else {
		return finalResult;
	}
}

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
//多选
function batch(action,checkboxName,form){
    if (!hasOneChecked(checkboxName)){
            alert('请选择要操作的对象!');
            return;
    }
    if (confirm('确定执行此操作?')){
        form.action = action;
        form.submit();
    }
}
//添加
var add = function(action,form){
	form.action = action;
    form.submit();
};
//修改
var edit = function(action,checkboxName,form){
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
	    	form.action = action+'?'+itemId;
	        form.submit();
	    }
	}
};
//排序
function sortColumns(selectValue,form){
	form.sortColumns.value=selectValue;
	form.submit();
};

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
        	window.parent.frames.mainFrame.location.href = action+'?'+itemId;
        }
    }
    
}



function openDialog(url){
	var horizontalPadding = 30;
    var verticalPadding = 30;
    document.getElementById("addSit").src=url;
   	$("#dialog").dialog( "open" );
    
}

function closeDialog() {
	$('#dialog').dialog('close');
	document.execCommand('Refresh');
//	document.designMode = "off";
//	document.execCommand('refresh', false, "");
}
function closeDialogById(dialogId) {
	$('#'+dialogId).dialog('close');
	document.execCommand('Refresh');
	window.location.reload();
//	document.designMode = "off";
//	document.execCommand('refresh', false, "");
}
function closeDialogNoRefresh() {
	$('#dialog').dialog('close');
	if($('#stationDialog') != null) {
		$('#stationDialog').dialog('close');
	}
}

function closeDialogNoRefreshById(dialogId) {
	$('#'+dialogId).dialog('close');
}

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
			document.write("<a title=\"" + parameters + "\" style=\"text-decoration: none\">" + parameters.substr(0, n) + "...</a>");
		} else {
			document.write(parameters);
		}
	}
}
/**
 * 带对话框提交
 * @param url
 * @param dialog
 */
function configSubmit(url,dialog){
	if(confirm(dialog)){
		window.location.href=url;
	}
	
}


function openwindow(url,name,iWidth,iHeight)
{
	//alert(url);
	var url; //转向网页的地址;
	var name; //网页名称，可为空;
	var iWidth; //弹出窗口的宽度;
	var iHeight; //弹出窗口的高度;
	var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	window.open(url,name,'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
}

function getFileSizeIncludeUnit(resSize){
	if ( resSize ) {
		var size = null;
    	if ( resSize<1024 ) {
    		return resSize+"B";
    	}
    	if ( resSize<1048576 ) {
    		size = (resSize/1024).toFixed(2);
    		return size+"KB";
    	}
    	if ( resSize<1073741824 ) {
    		size = (resSize/1048576).toFixed(2);
    		return size+"M";
    	}
    	size = (resSize/1099511627776).toFixed(2);
    	return size+"G";
	}else{
		return "-";
	}
}

function getSelectFiles(data){
	if ( data ) {
		var fileNum = $("#fileList tbody tr").length;
		fileNum = parseInt(fileNum);
		for ( var i=0; i<data.length; i++ ) {
			appendFile(data[i], fileNum+i);
		}
		parent.destroyFileWindow();
	}
}

function appendFile(file,index){
	var html = "\
		<tr id=\""+file.id+"\">\
			<td>\
				<input name=\"attachments["+index+"].resId\" type=\"hidden\" value=\""+file.id+"\"/>\
				<input name=\"attachments["+index+"].fileName\" type=\"hidden\" value=\""+file.name+"\"/>\
				<input name=\"attachments["+index+"].fileSize\" type=\"hidden\" value=\""+file.size+"\"/>"+file.name+"\
			</td>\
			<td>"+getFileSizeIncludeUnit(file.size)+"</td>\
			<td>\
				<a href=\"javascript:;\" id=\"del\" onclick=\"delAtt('"+file.id+"')\">删除</a>\
			</td>\
		</tr>";
	$("#fileList tbody").append(html);
}

function delAtt(attachmentId){
	var file = $("#"+attachmentId);
	//重新计算此文件后的所有下标
	file.nextAll().each(function(){
		$(this).find("input[type='hidden']").each(function(){
			var thisobj = $(this);
			var parts = thisobj.attr("name").split(/(\d+)/g);
				var str = parts[0]+(parseInt(parts[1])-1)+parts[2];
				thisobj.attr("name", str);
		});
	});
	$("#"+attachmentId).remove();
};
