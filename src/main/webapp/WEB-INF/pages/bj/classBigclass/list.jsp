<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>培训班管理</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
</head>
<body>
<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">首 页</a> &gt; <a href="#">培训班管理</a> &gt; 培训班列表</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" />
          </p>
      </div>
      <div class="tablelist">
    	 <div class="title">培训班管理</div>
      <div class="search">
          <form id="queryForm" name="queryForm" method="post" action="${ctx}/bj/ClassBigclass!list.do">
       		<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="32" >培训类别：</td>		
							<td>
								<input value="${query.trainType}" id="trainType" name="query.trainType" maxlength="100"  class=""/>
							</td>
							<td height="32" >班级名称：</td>		
							<td>
								<input value="${query.name}" id="name" name="query.name" maxlength="100"  class=""/>
							</td>
							<td>
								<input type="submit" name="button2" id="button2" value="查 询" />
							</td>
						</tr>
						<tr>
							<td height="32" >预设班主任：</td>		
							<td>
								<input value="${query.headTeacherId}" id="headTeacherId" name="query.headTeacherId" maxlength="100"  class=""/>
							</td>
							<td height="32" >学科：</td>		
							<td>
								<input value="${query.subject}" id="subject" name="query.subject" maxlength="100"  class=""/>
							</td>
						</tr>
						<tr>
							<td height="32" >总学时：</td>		
							<td>
								<input value="${query.totalHour}" id="totalHour" name="query.totalHour" maxlength="100"  class=""/>
							</td>
							<td height="32" >面授学时：</td>		
							<td>
								<input value="${query.faceHour}" id="faceHour" name="query.faceHour" maxlength="100"  class=""/>
							</td>
						</tr>
						<tr>
							<td height="32" >网授学时：</td>		
							<td>
								<input value="${query.netHour}" id="netHour" name="query.netHour" maxlength="100"  class=""/>
							</td>
							<td height="32" >实践学习：</td>		
							<td>
								<input value="${query.practiceHour}" id="practiceHour" name="query.practiceHour" maxlength="100"  class=""/>
							</td>
						</tr>
						<tr>
							<td height="32" >预设总学分：</td>		
							<td>
								<input value="${query.prepareScore}" id="prepareScore" name="query.prepareScore" maxlength="100"  class=""/>
							</td>
							<td height="32" >招生对象：</td>		
							<td>
								<input value="${query.recruitObj}" id="recruitObj" name="query.recruitObj" maxlength="100"  class=""/>
							</td>
						</tr>
						<tr>
							<td height="32" >招生人数：</td>		
							<td>
								<input value="${query.recruitCount}" id="recruitCount" name="query.recruitCount" maxlength="100"  class=""/>
							</td>
							<td height="32" >资料费用：</td>		
							<td>
								<input value="${query.materialsFee}" id="materialsFee" name="query.materialsFee" maxlength="100"  class=""/>
							</td>
						</tr>
						<tr>
							<td height="32" >用途：</td>		
							<td>
								<input value="${query.purpose}" id="purpose" name="query.purpose" maxlength="100"  class=""/>
							</td>
							<td height="32" >课程说明：</td>		
							<td>
								<input value="${query.description}" id="description" name="query.description" maxlength="100"  class=""/>
							</td>
						</tr>
						<tr>
							<td height="32" >培训目标：</td>		
							<td>
								<input value="${query.trainTarget}" id="trainTarget" name="query.trainTarget" maxlength="100"  class=""/>
							</td>
							<td height="32" >考核方式：</td>		
							<td>
								<input value="${query.checkWay}" id="checkWay" name="query.checkWay" maxlength="100"  class=""/>
							</td>
						</tr>
        	</table>
        </form>
        <div class="clear"></div>
      </div>
<div class="page">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>
	        <input type="button" class="but_shop"  onclick="add('${ctx}/bj/ClassBigclass!add.do',document.listForm);" value="添加" />
          <input type="button" class="but_shop"  onclick="edit('${ctx}/bj/ClassBigclass!edit.do','items',document.listForm);" value="修改" />
          <input type="button" class="but_shop"  onclick="batchDelete('${ctx}/bj/ClassBigclass!remove.do','items',document.listForm);" value="删除" />
        </td>
      </tr>
    </table>
</div>
<div class="table01" align="center">
<form id="listForm" name="listForm" method="post" action="${ctx}/bj/ClassBigclass!list.do">
<span>
 <repeatsubmit:uniqueKey/>
<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
	<input type="hidden" name="${obj.key}" value="${obj.value}"/>
</c:forEach>
</span>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
	    <th width="30">
	  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
	    </th>
	  	<th width="50">序号</th>
	  	<th >培训类别</th>
	  	<th >班级名称</th>
	  	<th >预设班主任</th>
	  	<th >学科</th>
	  	<th >总学时</th>
	  	<th >面授学时</th>
	  	<th >网授学时</th>
	  	<th >实践学习</th>
	  	<th >预设总学分</th>
	  	<th >招生对象</th>
	  	<th >招生人数</th>
	  	<th >资料费用</th>
	  	<th >用途</th>
	  	<th >课程说明</th>
	  	<th >培训目标</th>
	  	<th >考核方式</th>
	</tr>
	<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td>
			<input type="checkbox" name="items" value="id=${obj.id}&">
		</td>
		<td>
			${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td>
					<a href="${ctx}/bj/ClassBigclass!view.do?id=${obj.id}">${obj.trainType}</a>
		</td>
		<td>
					${obj.name}
		</td>
		<td>
					${obj.headTeacherId}
		</td>
		<td>
					${obj.subject}
		</td>
		<td>
					${obj.totalHour}
		</td>
		<td>
					${obj.faceHour}
		</td>
		<td>
					${obj.netHour}
		</td>
		<td>
					${obj.practiceHour}
		</td>
		<td>
					${obj.prepareScore}
		</td>
		<td>
					${obj.recruitObj}
		</td>
		<td>
					${obj.recruitCount}
		</td>
		<td>
					${obj.materialsFee}
		</td>
		<td>
					${obj.purpose}
		</td>
		<td>
					${obj.description}
		</td>
		<td>
					${obj.trainTarget}
		</td>
		<td>
					${obj.checkWay}
		</td>
	</tr>
</c:forEach>
</table>
</form>
</div>
    <div class="page">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	 <tr>
           <td width="70%">
            <div class="pages">
				<jsp:include flush="true" page="/commons/pagebar.jsp">
					<jsp:param name="target" value="/bj/ClassBigclass!list.do" />
		        </jsp:include>
        	</div>
           </td>
        </tr>
       </table>
   </div>
  </div>
  </div>
</div>
</body>
</html>
