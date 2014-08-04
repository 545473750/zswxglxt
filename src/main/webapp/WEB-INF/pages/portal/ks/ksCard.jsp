<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link href="${ctx}/${portal}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>

<body>
      <div class="maincon">
        <table width="370" border="0" cellspacing="0" cellpadding="0">
         <c:forEach begin="0" end="0"  var="ks" items="${exams}">
         	<tr>
         	<td width="85" height="98"><a href="#"><img src="${ctx}/${portal}/images/pic04.jpg" width="70" height="88" /></a></td>
         	
            <td width="285"><label title="${ks.name}"> 
                <c:set var="name" value="${fn:trim(ks.name)}" />
                <c:choose> 
	                <c:when test="${fn:length(ks.name)>14}"> 
	                	<a href="${ctx}/course/Detail!viewxd.do?id=${ks.id}" target="_blank"><c:out value="${fn:substring(ks.name,0,14)}..." /> </a>
	                </c:when> 
	                <c:otherwise> 
	                	<a href="${ctx}/course/Detail!viewxd.do?id=${ks.id}" target="_blank"><c:out value="${ks.name}" /></a>
	                </c:otherwise> 
                </c:choose> 
            </label><br />
            <label title="${ks.description}">                
                <c:set var="description" value="${fn:trim(ks.description)}" />
                <c:choose> 
	                <c:when test="${fn:length(ks.description)>80}"> 
	                	<c:out value="${fn:substring(ks.description,0,80)}..." />
	                </c:when> 
	                <c:otherwise> 
	                	<c:out value="${ks.description}" />
	                </c:otherwise> 
                </c:choose> 
            </label></td>
         	</tr>
         	</c:forEach>
          </table>
        <table style="width: 100%">
        <ul>
     <c:forEach begin="1" end="4"  var="ks" items="${exams}">
     	 <li><span><fmt:formatDate value="${ks.createTime}" pattern="yyyy-MM-dd"/></span><label title="${ks.name}">
                <c:set var="name" value="${fn:trim(ks.name)}" />
                <c:choose> 
	                <c:when test="${fn:length(ks.name)>14}"> 
	                	<a href="${ctx}/portal/Ks!view.do?id=${ks.id}" target="_blank"><c:out value="${fn:substring(ks.name,0,14)}..." /> </a>
	                </c:when> 
	                <c:otherwise> 
	                	<a href="${ctx}/portal/Ks!view.do?id=${ks.id}" target="_blank"><c:out value="${ks.name}" /></a>
	                </c:otherwise> 
                </c:choose> 
            </label></li>
         	</c:forEach></ul>
         </table>
      </div>
  
</body>
</html>
