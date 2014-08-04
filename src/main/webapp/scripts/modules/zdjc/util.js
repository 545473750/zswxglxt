var getProjectTypes = function(url,year,projectTypeId){
	var option='<option value="">--请选择--</option>';
	if(year){
		var params = {year:year};
	    $.ajax({
			async : false,
			type : 'POST',
			dataType : "json",
			url : url,
			data:params,
			success : function(str) 
			{
    			for (var i =0;i< str.length;i++){
    				option += "<option value='"+str[i].type+"'>"+str[i].typeOne+"</option>";
	    		}
			}
		});
	}
	$("#"+projectTypeId).html(option);
};

var getConfirmType = function(url,projectType,projectTypeId){
	var option='<option value="">--请选择--</option>';
	if(projectType){
		var params = {year:$("#year").val(),projectType:projectType};
	    $.ajax({
			async : false,
			type : 'POST',
			dataType : "json",
			url : url,
			data:params,
			success : function(str) 
			{
    			for (var i =0;i< str.length;i++){
    			//	alert(str[i].id);alert(str[i].typeTwo);
    				option += "<option value='"+str[i].id+"'>"+str[i].typeTwo+"</option>";
	    		}
			}
		});
	}
	$("#"+projectTypeId).html(option);
};

var getSeq = function(url){
//	var url="${ctx}/zdjc/GreatTask!findSeqs.do";
	var oldZdProjectTypeId=$("#oldZdProjectTypeId").val();
	var projectTypeId = $("#confirmType").val();
//	alert(projectTypeId);
	if(projectTypeId){
		var params = {projectTypeId:projectTypeId,oldZdProjectTypeId:oldZdProjectTypeId};
	    $.ajax({
			async : false,
			type : 'POST',
			url : url,
			data:params,
			success : function(str) 
			{
				if(str!=0){
					$("#spanseq").html(str);
					$("#seq").val(str);
					$("#seqnumber").val(str.split("-")[2]);
				}
				if(str==0){
					$("#spanseq").html($("#oldSeq").val());
					$("#seq").val($("#oldSeq").val());
					$("#seqnumber").val($("#oldSeqnumber").val());
				}
				
			}
		});
	}
	
};
