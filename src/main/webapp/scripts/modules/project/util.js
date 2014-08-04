var getStates = function(bigStateCode,selectId,url){
	if(!bigStateCode){return ;}
	var smallState = $("#"+selectId);
	var option='<option value="">--请选择--</option>';
	
	if(smallState){
		params = {code:bigStateCode};
	    $.ajax( {
			async : false,
			type : 'POST',
			dataType : "json",
			url : url,
			data:params,
			success : function(str) 
			{
	    		for (var i =0;i< str.length;i++){
	    				option += "<option value='"+str[i].code+"'>"+str[i].value+"</option>";
		    		}
				}
			});
		}
	smallState.html(option);
};

/**
 * 项目更新
 * @param action
 * @param checkboxName
 * @param form
 */
function edit(action,checkboxName,prompt){
	var items = $(":checked[name="+checkboxName+"]");
	if(items.length!=1){
		alert('请选择一项!');
		return ;
	}
	
	var itemvalue = items.val();
	id = itemvalue.substring(3,itemvalue.length-1);
	var stateval = $("#state_"+id).val();
//	var projectId = $("#project_"+id).val();
	var intstate = parseInt(stateval);
	//仅项目状态为“正常”、“同意结项”的项目，才可进行项目预算管理、修改项目信息、项目合同管理，其他状态时按钮为灰、不可操作
	if(intstate==1||intstate==3){
		window.location.href = action+id;
	}else{
		alert(prompt);
		return ;
	}
	
}
/**
 * 项目预算
 * @param action
 * @param checkboxName
 * @param form
 */
function budget(action,checkboxName,prompt){
	var items = $(":checked[name="+checkboxName+"]");
	if(items.length!=1){
		alert('请选择一项!');
		return ;
	}
	
	var itemvalue = items.val();
	id = itemvalue.substring(3,itemvalue.length-1);
	var stateval = $("#state_"+id).val();
	var projectId = $("#project_"+id).val();
	var intstate = parseInt(stateval);
	//仅项目状态为“正常”、“同意结项”的项目，才可进行项目预算管理、修改项目信息、项目合同管理，其他状态时按钮为灰、不可操作
	if(intstate==1||intstate==3){
		window.location.href = action+projectId;
	}else{
		alert(prompt);
		return ;
	}
	
}
/**
 * 项目绩效分数
 * @param action
 * @param checkboxName
 * @param form
 */
function projectPerformance(action,checkboxName,prompt){
	var items = $(":checked[name="+checkboxName+"]");
	if(items.length!=1){
		alert('请选择一项!');
		return ;
	}
	
	var itemvalue = items.val();
	id = itemvalue.substring(3,itemvalue.length-1);
	var stateval = $("#state_"+id).val();
	var projectId = $("#project_"+id).val();
	if(parseInt(stateval)>5){
		alert(prompt);
		return ;
	}
	var intstate = parseInt(stateval);
	//2、	仅项目状态为“正常”、“同意结项”、“等待成本最终核算”、“进行奖金核算”的项目，才可进行“维护项目经理绩效分数”，其他状态时按钮为灰、不可操作
	if(intstate==1||intstate==3||intstate==4||intstate==5){
		window.location.href = action+projectId;
	}else{
		alert(prompt);
		return ;
	}
	
}

function projectNote(action,checkboxName,prompt){
	var items = $(":checked[name="+checkboxName+"]");
	if(items.length!=1){
		alert('请选择一项!');
		return ;
	}
	var itemvalue = items.val();
	id = itemvalue.substring(3,itemvalue.length-1);
	var projectId = $("#project_"+id).val();
	window.location.href = action+projectId;
}

