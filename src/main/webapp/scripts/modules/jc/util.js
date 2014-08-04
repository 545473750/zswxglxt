
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
    				option += "<option value='"+str[i].id+"'>"+str[i].typeOne+str[i].typeTwo+"</option>";
	    		}
			}
		});
	}
	$("#"+projectTypeId).html(option);
};

function operateOne(url,dialog){
	if(confirm(dialog)){
		window.location.href=url;
	}
	
}