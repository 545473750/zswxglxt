function fileQueueError(file, errorCode, message) {
	try {
		var imageName = "<font color='red'>文件上传错误</font>";
		var errorName = "";
		if (errorCode == SWFUpload.errorCode_QUEUE_LIMIT_EXCEEDED) {
			errorName = "You have attempted to queue too many files.";
		}
		if (errorName !== "") {
			alert(errorName);
			return;
		}
		
		switch (errorCode) {
		case SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED:
			alert("对不起，您选择的文件太多，你最多还能添加"+message+"个文件！");	
			break;
		case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
			imageName = "<font color='red'>文件大小为0</font>";
			break;
		case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
			imageName = "<font color='red'>文件太大</font>";
			break;
		case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
		case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
		default:
				alert(message);		
			break;
		}
		addReadyFileInfo(file,imageName,"无法上传");
	} catch (ex) {
		this.debug(ex);
	}
}

function fileDialogComplete(numFilesSelected, numFilesQueued) {
	try {
		if (numFilesQueued > 0) {
			document.getElementById('btnCancel').disabled = "";
			//this.startUpload();
		}
	} catch (ex) {
		this.debug(ex);
	}
}

function uploadProgress(file, bytesLoaded) {

	try {
		var percent = Math.ceil((bytesLoaded / file.size) * 100);
		var progress = new FileProgress(file,  this.customSettings.upload_target);
		progress.setProgress(percent);
		if (percent === 100) {
			progress.setStatus("<font color='red' style='font: 12px/1.4em Helvetica, Arial, sans-serif'>正在保存文件，请您稍候......</font>");//正在创建缩略图...
			progress.toggleCancel(false, this);
		} else {
			progress.setStatus("<font color='red' style='font: 12px/1.4em Helvetica, Arial, sans-serif'>正在上传......</font>");
			progress.toggleCancel(true, this);
		}
	} catch (ex) {
		this.debug(ex);
	}
}

function uploadSuccess(file, serverData) {
	try {
		var progress = new FileProgress(file,  this.customSettings.upload_target);
		addFileInfo(file.id,"文件上传完成");	
		document.getElementById("uploadhidden"+file.id+"").value=file.name;
	} catch (ex) {
		this.debug(ex);
	}
}

function addFileInfo(fileId,message){
	var row = document.getElementById(fileId);
	row.cells[3].innerHTML = "<font color='green'>"+message+"</font>";
}
//取消所有上传文件
function cancelUpload(){
	var infoTable = document.getElementById("infoTable");
	var rows = infoTable.rows;
	var ids = new Array();
	var row;
	if(rows==null){
		return false;
	}
	for(var i=0;i<rows.length;i++){
		ids[i] = rows[i].id;
	}	
	for(var i=0;i<ids.length;i++){
		deleteFile(ids[i]);
	}	
}

function fileQueued(file){
	addReadyFileInfo(file,"加入上传队列");
}

function addReadyFileInfo(file,message,status){
//用表格显示
	if(file==null){
		return false;
	}
	var infoTable = document.getElementById("infoTable");
	var row = infoTable.insertRow();
	row.id = file.id;
	var col1= row.insertCell();
	var col2= row.insertCell();
	var col3= row.insertCell();
	var col4= row.insertCell();
	var col5= row.insertCell();
	col1.innerHTML=message+":";
	col2.innerHTML=file.name;
	col3.innerHTML=getFileSize(file.size,2);
	if(status!=null&&status!=""){
		col4.innerHTML="<font color='red'>"+status+"</font>";
	}else{
		col4.innerHTML="";
	}
	col5.innerHTML="<input style='display:none;'  id='uploadhidden"+file.id+"' type='checkbox'  name='fileidlist'  checked='checked' value='no'/><a href='javascript:deleteFile(\""+file.id+"\")'>删除</a>";
	col1.style.width="90";
	col2.style.width="230";
	col2.className='uploadFileName';
	col3.style.width="80";
	col4.style.width="100";
	col5.style.width="30";
	col3.align="center";
	col4.align="center";
	col5.align="right";
}
function deleteFile(fileId){
	//用表格显示
	if(fileId==null||fileId==""){
		return false;
	}	
	
	var infoTable = document.getElementById("infoTable");
	var row = document.getElementById(fileId);
	
	var c=row.cells[3].innerHTML; 
	if(c.indexOf('文件上传完成')!=-1){
		var stats = swfu.getStats();
	    stats.successful_uploads--;
	    swfu.setStats(stats);
	   
	}
	
	infoTable.deleteRow(row.rowIndex);
	swfu.cancelUpload(fileId,false);
	
	
  
	
   
	
}

function uploadComplete(file) {
	try {
		/*  I want the next upload to continue automatically so I'll call startUpload here */
		if (this.getStats().files_queued > 0) {
			this.startUpload();
		} else {
			var progress = new FileProgress(file,  this.customSettings.upload_target);
			progress.setComplete();
			progress.setStatus("<font color='green' style='font: 12px/1.4em Helvetica, Arial, sans-serif'>所有文件上传完毕!</b></font>");
			progress.toggleCancel(false);
		}
	} catch (ex) {
		this.debug(ex);
	}
}

function uploadError(file, errorCode, message) {
	var imageName =  "<font color='red'>文件上传出错!</font>";
	var progress;
	try {
		switch (errorCode) {
		case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
			try {
				progress = new FileProgress(file,  this.customSettings.upload_target);
				progress.setCancelled();
				progress.setStatus("<font color='red'>取消上传!</font>");
				progress.toggleCancel(false);
			}
			catch (ex1) {
				this.debug(ex1);
			}
			break;
		case SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED:
			try {
				progress = new FileProgress(file,  this.customSettings.upload_target);
				progress.setCancelled();
				progress.setStatus("<font color='red'>停止上传!</font>");
				progress.toggleCancel(true);
			}
			catch (ex2) {
				this.debug(ex2);
			}
		case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
			imageName = "<font color='red'>文件太大!</font>";
			break;
		default:
			break;
		}
		addFileInfo(file.id,imageName);

	} catch (ex3) {
		this.debug(ex3);
	}

}


function addImage(src) {
	var newImg = document.createElement("img");
	newImg.style.margin = "5px";

	document.getElementById("thumbnails").appendChild(newImg);
	if (newImg.filters) {
		try {
			newImg.filters.item("DXImageTransform.Microsoft.Alpha").opacity = 0;
		} catch (e) {
			// If it is not set initially, the browser will throw an error.  This will set it if it is not set yet.
			newImg.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=' + 0 + ')';
		}
	} else {
		newImg.style.opacity = 0;
	}

	newImg.onload = function () {
		fadeIn(newImg, 0);
	};
	newImg.src = src;
}

function fadeIn(element, opacity) {
	var reduceOpacityBy = 5;
	var rate = 30;	// 15 fps


	if (opacity < 100) {
		opacity += reduceOpacityBy;
		if (opacity > 100) {
			opacity = 100;
		}

		if (element.filters) {
			try {
				element.filters.item("DXImageTransform.Microsoft.Alpha").opacity = opacity;
			} catch (e) {
				// If it is not set initially, the browser will throw an error.  This will set it if it is not set yet.
				element.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=' + opacity + ')';
			}
		} else {
			element.style.opacity = opacity / 100;
		}
	}

	if (opacity < 100) {
		setTimeout(function () {
			fadeIn(element, opacity);
		}, rate);
	}
}



/* ******************************************
 *	FileProgress Object
 *	Control object for displaying file info
 * ****************************************** */

function FileProgress(file, targetID) {
	this.fileProgressID = "divFileProgress";
	this.fileProgressWrapper = document.getElementById(this.fileProgressID);
	if (!this.fileProgressWrapper) {
		this.fileProgressWrapper = document.createElement("div");
		this.fileProgressWrapper.className = "progressWrapper";
		this.fileProgressWrapper.id = this.fileProgressID;

		this.fileProgressElement = document.createElement("div");
		this.fileProgressElement.className = "progressContainer";

		var progressCancel = document.createElement("a");
		progressCancel.className = "progressCancel";
		progressCancel.href = "#";
		progressCancel.style.visibility = "hidden";
		progressCancel.appendChild(document.createTextNode(" "));

		var progressText = document.createElement("div");
		progressText.className = "progressName";
		progressText.appendChild(document.createTextNode("上传文件: "+file.name+" ("+getFileSize(file.size,2)+")"));

		var progressBar = document.createElement("div");
		progressBar.className = "progressBarInProgress";

		var progressStatus = document.createElement("div");
		progressStatus.className = "progressBarStatus";
		progressStatus.innerHTML = "&nbsp;";

		this.fileProgressElement.appendChild(progressCancel);
		this.fileProgressElement.appendChild(progressText);
		this.fileProgressElement.appendChild(progressStatus);
		this.fileProgressElement.appendChild(progressBar);

		this.fileProgressWrapper.appendChild(this.fileProgressElement);
		document.getElementById(targetID).style.height="53px";
		document.getElementById(targetID).appendChild(this.fileProgressWrapper);
		fadeIn(this.fileProgressWrapper, 0);
		document.getElementById("idlist").value = document.getElementById("idlist").value+"&"+file.name;

	} else {
		this.fileProgressElement = this.fileProgressWrapper.firstChild;
		this.fileProgressElement.childNodes[1].firstChild.nodeValue = "上传文件: "+file.name+" ("+getFileSize(file.size,2)+")";
	}

	this.height = this.fileProgressWrapper.offsetHeight;

}
FileProgress.prototype.setProgress = function (percentage) {
	this.fileProgressElement.className = "progressContainer green";
	this.fileProgressElement.childNodes[3].className = "progressBarInProgress";
	this.fileProgressElement.childNodes[3].style.width = percentage + "%";
};
FileProgress.prototype.setComplete = function () {
	this.fileProgressElement.className = "progressContainer blue";
	this.fileProgressElement.childNodes[3].className = "progressBarComplete";
	this.fileProgressElement.childNodes[3].style.width = "";

};
FileProgress.prototype.setError = function () {
	this.fileProgressElement.className = "progressContainer red";
	this.fileProgressElement.childNodes[3].className = "progressBarError";
	this.fileProgressElement.childNodes[3].style.width = "";

};
FileProgress.prototype.setCancelled = function () {
	this.fileProgressElement.className = "progressContainer";
	this.fileProgressElement.childNodes[3].className = "progressBarError";
	this.fileProgressElement.childNodes[3].style.width = "";

};
FileProgress.prototype.setStatus = function (status) {
	this.fileProgressElement.childNodes[2].innerHTML = status;
};

FileProgress.prototype.toggleCancel = function (show, swfuploadInstance) {
	this.fileProgressElement.childNodes[0].style.visibility = show ? "visible" : "hidden";
	if (swfuploadInstance) {
		var fileID = this.fileProgressID;
		this.fileProgressElement.childNodes[0].onclick = function () {
			swfuploadInstance.cancelUpload(fileID);
			return false;
		};
	}
};

function getFileSize(filesize,how){
	var unit = "MB";
	var size = filesize/1024/1024
	if(size < 0.01){
		size = filesize/1024;
		unit = "KB";
	}
	if(size < 0.01){
		size = filesize;
		unit = "Byte";
	}
	size = Math.round (size*Math.pow(10,how))/Math.pow(10,how);
	return size+unit;

}
