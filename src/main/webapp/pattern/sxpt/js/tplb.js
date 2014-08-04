// JavaScript Document

	var t = n = 0, count;
	$(document).ready(function(){	
		count=$("#newsp_list a").length;
		$("#newsp_list a:not(:first-child)").hide();
		$("#newsp_info").html($("#newsp_list a:first-child").find("img").attr('alt'));
		$("#newsp_info").click(function(){window.open($("#newsp_list a:first-child").attr('href'), "_blank")});
		
		//初始化加载
		$("#expTitle").attr("href",$("#newsp_list a:first-child").attr('href'));
		$("#expTitle").html($("#newsp_list a:first-child").find("img").attr('alt'));
		
		var setint = 99999999;
		
		$("#newsp li").click(function() {
			var i = $(this).text() - 1;//获取Li元素内的值，即1，2，3，4
			n = i;
			if (i >= count) return;
			$("#newsp_info").html($("#newsp_list a").eq(i).find("img").attr('alt'));
			//复制给首条A标签
			
			//判断时间
			var currYear = new Date().getFullYear();
			var currMonth = new Date().getMonth() + 1;
			var currDate = new Date().getDate();
			
			if(currYear >= 2013){
				if(currYear > 2013 || currMonth > 8 || (currMonth >= 8 && currDate >=5)){
					$("#expTitle").attr("href",$("#newsp_list a").eq(i).attr("href"));
					$("#expTitle").html($("#newsp_list a").eq(i).find("img").attr('alt'));
					
					setint = 4000;
				}
			}
			
			$("#newsp_info").unbind().click(function(){window.open($("#newsp_list a").eq(i).attr('href'), "_blank")})
			$("#newsp_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);
			document.getElementById("banner").style.background="";
			$(this).toggleClass("on");
			$(this).siblings().removeAttr("class");
		});
		t = setInterval("showAuto()", setint);
		$("#newsp").hover(function(){clearInterval(t)}, function(){t = setInterval("showAuto()", setint);});
	})
	
	function showAuto()
	{
		n = n >=(count - 1) ? 0 : ++n;
		$("#newsp li").eq(n).trigger('click');
	}