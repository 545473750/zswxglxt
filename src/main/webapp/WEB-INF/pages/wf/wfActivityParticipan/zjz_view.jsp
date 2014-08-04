<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看专家组</title>
<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="right">
  <div class="llistbox">
      <div class="listmap">
          <p class="dqwz">当前位置：<a href="#">首 页</a>  &gt; 流程管理 &gt; 节点管理 &gt; 专家组设置 &gt;查看专家组成员</p>
          <p class="fhbut">
            <input type="button" name="button" id="button" value="返 回" onclick="history.back(-1)"/>
          </p>
      </div>
    <div class="tablelist">
     <div class="title">查看专家组成员</div>
      <div class="table01">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr class="jg" >
				<td width="15%" height="36" class="leftbor" align="right" > 
					名称：
				</td>
				<td>
						${model.name}
				</td>
				<td width="15%" height="36" class="leftbor" align="right" > 
					分类：
				</td>
				<td>
					<c:if test="${1 == model.userFlag }">申报课程专家</c:if>
					<c:if test="${2 == model.userFlag }">选单课程专家 </c:if>
					<c:if test="${4 == model.userFlag }">组班专家 </c:if>
				</td>
			</tr>
			<tr  >
				<td width="15%" height="36" class="leftbor" align="right" > 
					创建时间：
				</td>
				<td colspan="3">
					${model.ts }
				</td>
			</tr>
			<tr class="jg">
				<td width="15%" height="36" class="leftbor" align="right" > 专家组成员：</td>
				<td colspan="3">
					<c:forEach items="${expertsUsers}" var="user">
						${user.userName }
					</c:forEach>
				</td>
			</tr>
          </table>
        </div>
  <div class="page">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
             <td align="center">
		  		<input type="button" value="返回" class="but_cz" onclick="history.back(-1)" />
	   		</td>
	   	   </tr>
	   	</table>
	</div>
 </div>
  </div>
  </div>
  </div>
</body>
</html>
