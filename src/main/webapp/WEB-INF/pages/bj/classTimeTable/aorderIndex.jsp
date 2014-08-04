<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=7"/>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
	<link href='${ctx}/scripts/fullcalendar/fullcalendar.css' rel='stylesheet' />
	<link href='${ctx}/scripts/fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print'/>
	<!--
	<link rel="stylesheet" href="${jsPath}/easy_ui/themes/default/easyui.css" type="text/css"></link>
	<link rel="stylesheet" href="${jsPath}/easy_ui/themes/default/dialog.css" type="text/css"></link>
	<link rel="stylesheet" href="${jsPath}/jquery/jquery.qtip.min.css" type="text/css"></link>
	-->
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/fullcalendar/fullcalendar.js" type="text/javascript"></script>
	<script src='${ctx}/scripts/fullcalendar/fullcalendar.min.js' type="text/javascript"></script>
	<script src='${ctx}/scripts/fullcalendar/gcal.js' type="text/javascript"></script>
	<script src='${jsPath}/jquery/jquery.qtip.min.js' type="text/javascript"></script>
	<style type="text/css">
		body {
			margin-top: 40px;
			text-align: center;
			font-size: 13px;
			font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		}
		#calendar {
			width: 900px;
			margin: 0 auto;
		}
		#loading {
			position: absolute;
			top: 5px;
			right: 5px;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function() {
			var date = new Date();
			var d = date.getDate();
			var m = date.getMonth();
			var y = date.getFullYear();
			
			var allowDates = eval("("+"[${dates}]"+")");
			function isAllow(dt){
				if ( dt ) {
					for ( var i=0; i<allowDates.length; i++ ) {
						if ( dt==allowDates[i] ) {
							return true;
						}
					}
				}
				return false;
			}
			
			$('#calendar').fullCalendar({
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month'
				},
				titleFormat: {
					month: 'yyyy-MM'
				},
                monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],  
                monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],  
                dayNames: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],  
                dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],  
                today: ["今天"],  
                firstDay: 1,  
                buttonText: {  
                    today: '今天',  
                    month: '月',  
                    week: '周',  
                    day: '日',  
                    prev: '上一月',  
                    next: '下一月'  
                },
                theme:true,
                currentTimezone: 'Asia/Beijing',
				eventClick: function(event) {
                	var dt = $.fullCalendar.formatDate( event.start, 'yyyy-MM-dd' );
					var cdt = $.fullCalendar.formatDate( new Date(), 'yyyy-MM-dd' );
					var rd = $.fullCalendar.parseDate(dt).getTime();
					var cd = $.fullCalendar.parseDate(cdt).getTime();
					if ( rd>=cd ) {
						$('#task').dialog({
						    title: '场次编辑',
						    width:700,
						    height:400,
						    draggable:false,
						    droppable:false,
						    resizable:true
						});
						var examDate = $.fullCalendar.formatDate( event.start, 'yyyy-MM-dd' );
						$("#taskFrame").attr("src", "${path}/zgtc/exam/aorder!edit.action?act=ajaxinput&id="+event.id+"&room.id="+event.roomid+"&examDate="+examDate);
						$('#task').parent().show();
					}
					return false;
				},
				eventMouseover: function(event, jsEvent, view){
					jsEvent.target.style.cursor='pointer';
				},
				dayRender: function(date, cell){
					var dt = $.fullCalendar.formatDate( date, 'yyyy-MM-dd' );
					var cdt = $.fullCalendar.formatDate( new Date(), 'yyyy-MM-dd' );
					var rd = $.fullCalendar.parseDate(dt).getTime();
					var cd = $.fullCalendar.parseDate(cdt).getTime();
					if ( rd>=cd&&isAllow(dt) ) {
						cell.attr("style", "cursor:pointer;");
						cell.dblclick(function(e){
							$('#tasklist').dialog({
							    title: '场次管理',
							    width:700,
							    height:400,
							    draggable:false,
							    droppable:false,
							    resizable:true
							});
							$("#tasklistFrame").attr("src", "${path}/zgtc/exam/aorder!list.action?room.id=${entity.room.id}&examDate="+dt);
							$('#tasklist').parent().show();
						});
					}
				},
				loading: function(bool) {
					if (bool) {
						$('#loading').show();
					}else{
						$('#loading').hide();
					}
				},
				events: function(start, end, callback) {
					var s = $.fullCalendar.formatDate(start,'yyyy-MM-dd');
					var e = $.fullCalendar.formatDate(end,'yyyy-MM-dd');
					$.ajax({ 
			          type : "post", 
			          url : "${path}/zgtc/exam/aorder!orders.action?room.id=${entity.room.id}", 
			          async : false, 
			          data: {
			              start: s,
			              end  : e
			          },
			          success : function(data){
			            data = eval("(" + data + ")");
			            callback(data);
			          }
			        });
			    },
			    eventRender: function(event, element) {
			    	if ( event.appCount>=event.examAmount ) {
			    		element.css("backgroundColor", "red");
			    	}else if ( event.appCount>=(event.examAmount/2) ) {
			    		element.css("backgroundColor", "orange");
			    	}
			    	element.qtip({
			            content: '场次:'+event.name+'<br/>'+'状态:'+event.status+'<br/>'+'人数:'+event.appCount
			        });
			    }
			});
		});
		
		function updateEvent(title, name, id, status){
			var event = $("#calendar").fullCalendar("clientEvents", id)[0];
			event.title = title;
			event.name = name;
			event.status = status;
			$("#calendar").fullCalendar('updateEvent',event,true);
		}
		
		function refetchEvents(){
			$("#calendar").fullCalendar( 'refetchEvents' );
		}
		
		function closeDialog(){
			$('#task').dialog("close");
		}
	</script>
  </head>
  <body>
  	<div id='loading' style='display:none'>加载中...</div>
    <div id='calendar'></div>
    <div style="display:none;">
		<div id="task" style="overflow: hidden;"/>
			<iframe src="" id="taskFrame" width="100%" height="360px" scrolling="auto" frameborder="0" marginheight="0" marginwidth="0"></iframe>
		</div>
	</div>
	<div style="display:none;">
		<div id="tasklist" style="overflow: hidden;"/>
			<iframe src="" id="tasklistFrame" width="100%" height="360px" scrolling="auto" frameborder="0" marginheight="0" marginwidth="0"></iframe>
		</div>
	</div>
  </body>
</html>