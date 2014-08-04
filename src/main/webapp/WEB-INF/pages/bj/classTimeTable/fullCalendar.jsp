<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>班级课表管理</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<link href='${ctx}/scripts/fullcalendar/fullcalendar.css' rel='stylesheet' />
	<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css" rel="stylesheet" />
		
	
	<style type="text/css">
		body {
		
		text-align: center;
		font-size: 13px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		}
		#calendar {
			width: 100%;
			margin: 10px auto;
		}
		#loading {
			position: absolute;
			top: 5px;
			right: 5px;
		}
		
		
	</style>
	
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/fullcalendar/fullcalendar.js" type="text/javascript"></script>
	<script src='${ctx}/scripts/fullcalendar/fullcalendar.min.js' type="text/javascript"></script>
	<script src='${ctx}/scripts/fullcalendar/gcal.js' type="text/javascript"></script>
	<script>
	$(document).ready(function() {

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
			editable: true,
			eventClick: function(event) {
				
            	var dt = $.fullCalendar.formatDate( event.start, 'yyyy-MM-dd' );
				var cdt = $.fullCalendar.formatDate( new Date(), 'yyyy-MM-dd' );
				var rd = $.fullCalendar.parseDate(dt).getTime();
				var cd = $.fullCalendar.parseDate(cdt).getTime();
				if ( rd>=cd ) {
					$('#task').dialog({
					    title: '课表编辑',
					    autoOpen: false,
				        width:700,
					    height:400,
				        resizable: true,
				        modal: false,
				        autoResize: true,
				        //隐藏默认的关闭按钮
				      //  open: function (event, ui) {$(".ui-dialog-titlebar-close", $(this).parent()).hide();},
						closeOnEscape: true ,
					//	buttons:{ "Ok": function() { $(this).dialog("close");}},
				        overlay: {
			               opacity: 0.5,
			               background: "black"
			            }
					});
					var examDate = $.fullCalendar.formatDate( event.start, 'yyyy-MM-dd' );
					openDialogById("${ctx}/bj/ClassTimeTable!edit.do?query.occurTime="+examDate+"&id="+event.id+"&query.termId=${query.termId}&query.bigclassId=${query.bigclassId}&query.classId=${query.classId}","task","taskFrame");
				}else{
					$('#task').dialog({
					    title: '课表详情',
					    autoOpen: false,
					    
				        width:700,
					    height:400,
				        resizable: true,
				        modal: false,
				        autoResize: true,
				        overlay: {
			               opacity: 0.5,
			               background: "black"
			            }
					});
					var examDate = $.fullCalendar.formatDate( event.start, 'yyyy-MM-dd' );
					openDialogById("${ctx}/bj/ClassTimeTable!view.do?query.occurTime="+examDate+"&id="+event.id+"&query.termId=${query.termId}&query.bigclassId=${query.bigclassId}&query.classId=${query.classId}","task","taskFrame");
					
				}
				return false;
			},
			eventMouseover: function(event, jsEvent, view){
				jsEvent.target.style.cursor='pointer';
			},
			dayRender: function(date, cell){
				var dt = $.fullCalendar.formatDate( date, 'yyyy-MM-dd' );
				var cdt = $.fullCalendar.formatDate( new Date(), 'yyyy-MM-dd' );
				//循环日期
				var rd = $.fullCalendar.parseDate(dt).getTime();
				//当前日期
				var cd = $.fullCalendar.parseDate(cdt).getTime();
				
				if ( rd>=cd ) {
					cell.attr("style", "cursor:pointer;");
					cell.dblclick(function(e){
						$("#tasklist").dialog({
					        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" />课表管理',
					//        position:'left',     
					        autoOpen: false,
					        width:700,
						    height:400,
					        resizable: true,
					        modal: false,
					        autoResize: true,
					        close: function(event, ui) { window.closeDialogById("tasklist");},
					        overlay: {
				               opacity: 0.5,
				               background: "black"
				            }
					    });
						openDialogById("${ctx}/bj/ClassTimeTable!list.do?query.occurTime="+dt+"&query.termId=${query.termId}&query.bigclassId=${query.bigclassId}&query.classId=${query.classId}","tasklist","tasklistFrame");
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
		          url : "${ctx}/bj/ClassTimeTable!jsonData.do", 
		          async : false, 
		          data: {
		              startTime: s,
		              endTime  : e,
		              classId:"${query.classId}"
		          },
		          success : function(data){
		            data = eval("(" + data + ")");
		            callback(data);
		          }
		        });
		    }
			
			
		});
		
	});

</script>
	
</head>
<body>
<div class="right" >
  <div style="margin-left:10px;background:#FFF;">
  <!-- 
  		<div id='loading' style='display:none'>加载中...</div>
  		 -->
      <div class="listmap">
	      <p class="dqwz">当前位置： <a href="#">班级课表管理</a> </p>
	      <form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassTermBj!list.do">
	      <p class="fhbut">
	        <input type="hidden" name="query.termId" value="${query.termId }"/>
          	<input type="hidden" name="query.bigclassId" value="${query.bigclassId }"/>
          	<input type="hidden" name="query.classId" value="${query.classId }"/>
          	
	      </p>
	      </form>
		</div>
		
      <div class="clear"></div>
      
       
	    <div id='calendar'></div>
	    <div style="display:none;">
			<div id="task" style="overflow: hidden;"/>
				<iframe src="" id="taskFrame" width="100%" height="380px" scrolling="auto" frameborder="0" marginheight="0" marginwidth="0"></iframe>
			</div>
		</div>
		<div style="display:none;">
			<div id="tasklist" style="overflow: hidden;"/>
				<iframe src="" id="tasklistFrame" width="100%" height="380px" scrolling="auto" frameborder="0" marginheight="0" marginwidth="0"></iframe>
			</div>
		</div>
  </div>
</div>
</body>
</html>
