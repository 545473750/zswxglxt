<%@ page import="com.opendata.organiz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>

<rapid:override name="head">
	<title><%=User.TABLE_ALIAS%> 维护</title>

	<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet">	
	<style type="text/css">
		<!--
		html,body {height:100%;_overflow-x:hidden;_margin-right:16px;}
		-->
	</style>
	<script type="text/javascript" src="<c:url value="/scripts/modules/project/util.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
	<!-- 树形下拉列表 easyui-combotree   -->
	<link rel="stylesheet" type="text/css" href="${ctx }/scripts/jquery-easyui-1.2.6/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${ctx }/scripts/jquery-easyui-1.2.6/themes/icon.css">
	<script type="text/javascript" src="${ctx }/scripts/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			// 分页需要依赖的初始化动作
			window.simpleTable = new SimpleTable('queryForm', '${page.thisPageNumber}', '${page.pageSize}', '${pageRequest.sortColumns}');
		$("#station").change(function(){
				getStates($(this).val(),'stationLevel','${ctx }/cost/ControlBonus!getStates.do');
			});
		var station = '${query.station}';
			if ( station ) {
				$("#station").change();
				//TODO 选中岗位级别需要改进------------
				var stationLevel = '${query.stationLevel}';
				if ( stationLevel ) {
					setTimeout(function(){
						$("#stationLevel").val(stationLevel);
					}, 0);
				}
			}
		
		});
		
		function toggleContent() {
			var state = document.getElementById("state");
			if (state.value == 0) {
				state.value = 1;
				document.getElementById("search").style.display = "none";
			} else {
				state.value = 0;
				document.getElementById("search").style.display = "block";
			}
		}
	</script>
</rapid:override>



<rapid:override name="content">
	<body class="mainbody">
	
	<form action="${pageContext.request.contextPath}/organiz/User!resetPassword.do" method="post" id="resetPasswordForm">
		<input id="_userid" name="id" type="hidden" />
		<input id="_abledFlag" name="abledFlag" type="hidden" />
		<input id="_partitionId" name="partitionId" type="hidden" value="${partitionId}"/>
	</form>
	
	<input type="hidden" value="0"  id="state"/>
	<form id="queryForm" name="queryForm" action="<c:url value="/organiz/Contacts!list.do"/>" method="post" style="display: inline;">
	<input type="hidden" name="ableFlag" id="ableFlag"/>
	<input type="hidden" name="partitionId" id="partitionId" value="${partitionId}"/>
	<!-- 内容区开始 -->
	<div class="mainbox-top"><img src="<c:url value="images/mainbox01.gif"/>" width="7" height="7" /></div><!-- 上圆角边线 -->
	<div class="mainbox">
		<div class="mainsubnav" style="minHeight:0%">
		    <div class="m-title"><span><img src="<c:url value="images/main_ico04.gif"/>" width="16" height="16" align="absmiddle" /> 查询</span>
		    </div>
		</div>
		<!-- 查询块 -->
		<div class="search" id="search">
		   <div class="search-tit"><img src="<c:url value="images/searchico.jpg"/>" width="30" height="31" align="absmiddle" /> 查询</div>
		   <div class="search-form">
		   <div class="queryPanel">
		      <table width="100%" border="0" cellspacing="0" cellpadding="5">
				<tr>	
					<!-- <td class="tdLabel"><%=User.ALIAS_LOGINNAME%></td>		
					<td><input value="${query.loginname}" id="loginname" name="loginname" maxlength="20" class="" style="width: 88px;"/></td> -->
					<td class="tdLabel"><%=User.ALIAS_USERNAME%></td>		
					<td><input value="${query.username}" id="username" name="username" maxlength="20" class="" style="width: 88px;"/></td>
					<!-- <td class="tdLabel"><%=User.ALIAS_DEPTS%></td>		
					<td>
					<input id="deptId" name="deptId" value="${query.deptId }" class="easyui-combotree" url="${ctx}/common/Common!getAllCombotree.do"  style="width:115px;"> -->
					<!-- <td  class="tdLabel">岗位</td>
					<td >
						<select name="station" id="station">
							<option value="">请选择</option>
							<c:forEach items="${posts}" var="post">
							<option value="${post.key}" <c:if test="${query.station==post.key}">selected="selected"</c:if>>${post.value}</option>
							</c:forEach>
						</select>
						<input type="hidden" value="1" name="isLeave"/>
					</td>
					 -->
					<td><input type="image" src="<c:url value="images/cx.gif"/>" onclick="getReferenceForm(this).action='${ctx}/organiz/Contacts!list.do'"/></td>
				</tr>	
		      </table>
		    </div>
		    </div>
		</div>
		<div class="gridTable">
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  <tr>
			  	<th><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				<th>序号</th>
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="username" ><%=User.ALIAS_USERNAME%></th>
				<!-- <th ><%=User.ALIAS_DEPTS%></th> -->
				<th sortColumn="phone" ><%=User.ALIAS_PHONE%></th>
				<th>电子邮箱</th>
				<th ><%=User.ALIAS_QQ%></th>
				<th ><%=User.ALIAS_MSN%></th>
				<!-- <th ><%=User.ALIAS_STATION%></th> -->
			  </tr>
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td><input type="checkbox" name="items" value="id=${item.id}&partitionId=${partitionId}&"></td>
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><a href="${ctx}/organiz/Contacts!show.do?id=${item.id}&"><c:out value='${item.username}'/></a>&nbsp;</td>
				
				<!-- <td>
				<c:choose> 
				    <c:when test="${fn:length(item.deptsString) > 8}"> 
				     <c:out value="${fn:substring(item.deptsString, 0, 8)}..." /> 
				    </c:when> 
				    <c:otherwise>
				     <c:out value='${item.deptsString}'/>&nbsp;
				    </c:otherwise> 
			    </c:choose>
				</td>
				 -->
				<td><c:out value='${item.phone}'/>&nbsp;</td>
				<td>${item.mail}</td>
				<td><c:out value='${item.qq}'/>&nbsp;</td>
				<td><c:out value='${item.msn}'/>&nbsp;</td>
				<!-- <td><c:out value='${item.stationString}'/>&nbsp;</td> -->
<%-- 				<td><c:out value='${item.deptsString}'/>&nbsp;</td> --%>
				
			  </tr>
		  	  </c:forEach>
		  </tbody>
		</table>
		
		<simpletable:pageToolbar page="${page}"></simpletable:pageToolbar>
		</div>
	</div>
	<div class="mainbox-bot"><img src="<c:url value="images/mainbox03.gif"/>" width="7" height="7" /></div><!-- 下圆角边线 -->	
	</form>
</body>
</rapid:override>
<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp"%>

