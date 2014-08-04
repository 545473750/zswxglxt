/**
 * 添加一行
 * outerid 外侧对象id
 */
function addDiv(outerid,reportId){
	var length = GetRandomNum(1,100); 
	if(length){
		length=reportId+"_"+length;
	}
	var div="<div>";
	div+="<input type='text' name='taskReport_"+length+"' readonly id='taskReport_"+length+"'/> &nbsp;";
	div+="<input type='button' value='上 传' onclick='odUploadFile(\"taskReport_"+length+"\",\"taskReport_"+length+"\")'>";
	div+="<input type='hidden' name='uploaded_file' id='taskReport_"+length+"_'/>";
	div+="<input type='button' value='删除' onclick='deleteFile(this)'>";
	div+="</div>";
	$("#"+outerid).append($(div));
	
}

function _addDiv(divid){
	var radNum = GetRandomNum(1,100); 
	var div="<div id=\"div_" + radNum + "\"><div style=\"clear: both;\"></div>";
		div+="<div>";
		div+="<div style=\"float: left;\">";
		div+="<div id=''>";
		div+="<input type='text' name='greatValidAttach_" + radNum + "' readonly id='greatValidAttach_" + radNum + "'/>&nbsp;&nbsp;";
		div+="<input type=\"button\" value=\"上 传\" onclick=\"odUploadFile('greatValidAttach_" + radNum + "','greatValidAttach_" + radNum + "')\" />";
		div+="<input type='hidden' name='uploaded_file' id='greatValidAttach_" + radNum + "_'/>";
		div+="</div>";
		div+="</div>";
		div+="<div style=\"float: left;\"><input type='button' value='删除' onclick='deleteDiv(" + radNum + ")'/></div>";
		div+="</div>";
		div+="</div>";
	$("#"+divid).append(div);
}
/**
 * 删除一行
 * @param thisbutton
 */
function deleteFile(thisbutton){
	$(thisbutton).parent().remove();
}

function deleteAttachfile(thisbutton,attachId){
	
	var deleteAttach = $("#deleteAttach");
	var attachs = deleteAttach.val();
	if(!attachs){
		attachs="";
	}
	attachs+=attachId+";";
	deleteAttach.val(attachs);
	$(thisbutton).parent().parent().remove();
}

function _deleteAttaFile(a,attaId) {
	// 记录要删除的附件ID
	var deleteAttaFiles = $("#deleteAttaFiles").attr('value');
	if(deleteAttaFiles != null) {
		var arr = new Array();//创建一个数组
		if(deleteAttaFiles != '') {
			arr = deleteAttaFiles.split(',');
		}
		arr.push(attaId);
		$("#deleteAttaFiles").attr('value', arr.join(','));
	}
	// 删除DIV
	$(a).parent().remove();
}

function deleteDiv(radNum) {
	$("#" + "div_" + radNum).remove();
}
/**
 * 获取随机数
 * @param Min
 * @param Max
 * @returns
 */
function GetRandomNum(Min,Max)
{   
var Range = Max - Min;   
var Rand = Math.random();   
return(Min + Math.round(Rand * Range));   
}   