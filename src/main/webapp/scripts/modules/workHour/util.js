/**
 * 
 * @param action
 * @param checkboxName
 * @param prompt
 */
function selectProject(action,checkboxName,prompt){
	var items = $(":checked[name="+checkboxName+"]");
	if(items.length<1){
		alert(prompt);
		return ;
	}
	var id="";
	items.each(function(){
		id+=this.value+",";
	});
	
	window.location.href = action+id;
}