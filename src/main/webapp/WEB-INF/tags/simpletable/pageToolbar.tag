<%@ tag pageEncoding="UTF-8"%>
<%@ attribute name="page" required="true" type="cn.org.rapid_framework.page.Page" description="Page.java" %>
<%@ attribute name="pageSizeSelectList" type="java.lang.Number[]" required="false"  %>
<%@ attribute name="isShowPageSizeList" type="java.lang.Boolean" required="false"  %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	// set default values
	Integer[] defaultPageSizes = new Integer[]{10,50,100};
	if(jspContext.getAttribute("pageSizeSelectList") == null) {
		jspContext.setAttribute("pageSizeSelectList",defaultPageSizes); 
	}
	
	if(jspContext.getAttribute("isShowPageSizeList") == null) {
		jspContext.setAttribute("isShowPageSizeList",true); 
	} 
%>

<table width="100%"  border="0" cellspacing="0" class="gridToolbar">
  <tr>
	<td>
		<div class="box" >
		
			<div  class="leftControls" >
				<span class="leftbuttonLabel">   
				<c:choose>
				<c:when test="${page.firstPage}">【首页】</c:when>
				<c:otherwise>【<a href="javascript:simpleTable.togglePage(1);">首页</a>】</c:otherwise>
				</c:choose>
				
				<c:choose>
				<c:when test="${page.hasPreviousPage}">【<a href="javascript:simpleTable.togglePage(${page.previousPageNumber});">上一页</a>】</c:when>
				<c:otherwise>【上一页】</c:otherwise>
				</c:choose>
				
				<c:forEach var="item" items="${page.linkPageNumbers}">
				<c:choose>
				<c:when test="${item == page.thisPageNumber}">[${item}]</c:when>
				<c:otherwise><a href="javascript:simpleTable.togglePage(${item});">[${item}]</a></c:otherwise>
				</c:choose>
				</c:forEach>
				
				<c:choose>
				<c:when test="${page.hasNextPage}">【<a href="javascript:simpleTable.togglePage(${page.nextPageNumber});">下一页</a>】</c:when>
				<c:otherwise>【下一页】</c:otherwise>
				</c:choose>
				
				<c:choose>
				<c:when test="${page.lastPage}">【尾页】</c:when>
				<c:otherwise>【<a href="javascript:simpleTable.togglePage(${page.lastPageNumber});">尾页</a>】</c:otherwise>
				</c:choose>
				
				</span>
				<jsp:doBody/>
			</div>
			
			<div class="paginationControls">
				<span class="buttonLabel">共有${page.totalCount}条记录，当前第${page.thisPageFirstElementNumber}至${page.thisPageLastElementNumber}条记录。每页</span>
				<c:if test="${isShowPageSizeList}">
				<select onChange="simpleTable.togglePageSize(this.value)">
					<c:forEach var="item" items="${pageSizeSelectList}">
						<option style= "font-size:10px;" value="${item}" ${page.pageSize == item ? 'selected' : '' }>${item}</option>
					</c:forEach> 
				</select>
				</c:if>
				<span class="endbuttonLabel">条记录</span>
			</div>
	</td>
  </tr>
</table>