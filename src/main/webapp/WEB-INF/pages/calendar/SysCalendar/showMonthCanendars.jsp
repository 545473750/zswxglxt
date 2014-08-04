<%@page import="com.opendata.calendar.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="java.util.Date"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet"
			type="text/css" />
		<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css"
			rel="stylesheet" />
		<script src="${ctx}/scripts/application.js"
			type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js"
			type="text/javascript"></script>
		<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js"
			type="text/javascript"></script>
		<script type="text/javascript"
			src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
		<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
		<script type="text/javascript"
			src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
</head>
<body>
<form action="/calendar/SysCalendar!list.do" method="get">
	<div class="main">
	<div class="maintit">
				<h2>
					<img src="${ctx}/${pattern}/images/tabicon.gif" width="16"
						height="16" align="absmiddle" />
					工作日历
				</h2>
				<h3>
					<a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a>
				</h3>
			</div>
	
	<div class="wbk-con" style="text-align: center;width:100%;border:0px solid red;">
	
		<table align="center"  width="705" border="0" cellpadding="0" cellspacing="1"  >
			<tr  class="rightmenu2">
		          <th height="20" align="center"><a href="${ctx }/calendar/SysCalendar!showMonthCanendars.do?year=${model.year-1}&month=${model.month}">《</a></th>
		          <th align="center"><a href="${ctx }/calendar/SysCalendar!showMonthCanendars.do?year=${model.year}&month=${model.month-1}">&lt;</a></th>
		          <th colspan="3" align="center"> ${model.year }年 ${model.month }月 </th>
		          <th align="center"><a href="${ctx }/calendar/SysCalendar!showMonthCanendars.do?year=${model.year}&month=${model.month+1}">&gt;</a></th>
		          <th align="center"><a href="${ctx }/calendar/SysCalendar!showMonthCanendars.do?year=${model.year+1}&month=${model.month}">》</a></th>
	        </tr>
	        <tr>
		          <td width="100" height="20" align="center" class="tabhead1">日</td>
		          <td width="100" align="center" class="tabhead1">一</td>
		          <td width="100" align="center" class="tabhead1">二</td>
		          <td width="100" align="center" class="tabhead1">三</td>
		          <td width="100" align="center" class="tabhead1">四</td>
		          <td width="100" align="center" class="tabhead1">五</td>
		          <td width="100" align="center" class="tabhead1">六</td>
		     </tr>
		     
		     <tr>
		     <fmt:formatDate value="${cdt}" pattern="yyyy-MM-dd" var="cdtfmt"/>
			     <c:forEach begin="1" end="${model.week-1 }">
			     	 <td width="100" height="60" bgcolor="#eaeaea" class="tr2" > &nbsp;</td>
			     </c:forEach>
			     <c:forEach items="${canendarList }" var="item">
			     	<td width="100" bgcolor="#eaeaea">
			          	<table border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
				              <tr>
				                <td width="28" height="24" align="center" bgcolor="#C7E2FC" >
				                	<strong><font <c:if test="${item.state==0 }">color="red"</c:if> >${item.day }</font></strong>
				                </td>
				                <td width="70" align="center" bgcolor="#C7E2FC">				                	
				                	<c:if test="${cdtfmt>item.sysDate}">
				                		${item.state==0?"非工作日":"工作日" }
				                	</c:if>
				                	<c:if test="${cdtfmt<=item.sysDate}">
				                	<a href="${ctx }/calendar/SysCalendar!edit.do?id=${item.id }">${item.state==0?"非工作日":"工作日" }</a>
				                	</c:if>
				                </td>
				              </tr>
				              <tr>
				                <td height="44"colspan="2" bgcolor="#eaeaea" style="font-size: 12px;" style="font-size: 12px; ">
				                <div style="height: 44px; width: 98px; overflow: hidden;" title='${item.remark }'>
				              	 	
				              	 	<br>
				              	 	<c:if test="${empty item.festival }">
				              	 		<c:if test="${empty item.solarTerms }">
				              	 			${item.simpleLunarDay }
				              	 		</c:if>
				              	 		<c:if test="${not empty item.solarTerms }">
				              	 			${item.solarTerms }
				              	 		</c:if>
				              	 	</c:if>
				              	 	<c:if test="${not empty item.simpleFestival }">
				              	 		${item.simpleFestival }
				              	 	</c:if>
				              	 	<br>
				              	 	${item.remark }
				                </div>
				                </td>
				              </tr>
				          </table>
		            </td>
		        	<c:if test="${item.trFlag==0 }">
		        	</tr><tr>
		        	</c:if>
			     </c:forEach>
			     <c:forEach begin="1" end="${lastNullTdCount }">
	        		<td width="100" height="50" bgcolor="#eaeaea" class="tr2">&nbsp;</td>
			     </c:forEach>
		     </tr>
		</table>
	</div>
	</div>
	</form>
	</body>
</html>