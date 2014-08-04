<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看流程实例节点表</title>
<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="right">
<div class="listmap">
      <p class="dqwz">当前位置：<a href="#">首 页</a> &gt; <a href="#">流程实例节点表管理</a> &gt; 查看详情</p>
      <p class="fhbut">
        <input type="button" name="button" id="button" value="返 回" />
      </p>
</div>
 <div class="tablelist">
        <div class="title">查看详细</div>
        <div class="table01">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr class="jg" >
							<td width="10%" height="36" class="leftbor" > 
					名称：
				</td>
				<td>
						${model.name}
				</td>
			</tr>
			<tr  >
							<td width="10%" height="36" class="leftbor" > 
					节点顺序：
				</td>
				<td>
						${model.orderNum}
				</td>
			</tr>
			<tr class="jg" >
							<td width="10%" height="36" class="leftbor" > 
					节点类型：
				</td>
				<td>
						${model.actType}
				</td>
			</tr>
			<tr  >
							<td width="10%" height="36" class="leftbor" > 
					节点状态：
				</td>
				<td>
						${model.actFlag}
				</td>
			</tr>
			<tr class="jg" >
							<td width="10%" height="36" class="leftbor" > 
					功能描述：
				</td>
				<td>
						${model.description}
				</td>
			</tr>
			<tr  >
							<td width="10%" height="36" class="leftbor" > 
					扩展字段1：
				</td>
				<td>
						${model.extFiled1}
				</td>
			</tr>
			<tr class="jg" >
							<td width="10%" height="36" class="leftbor" > 
					扩展字段2：
				</td>
				<td>
						${model.extFiled2}
				</td>
			</tr>
			<tr  >
							<td width="10%" height="36" class="leftbor" > 
					扩展字段3：
				</td>
				<td>
						${model.extFiled3}
				</td>
			</tr>
          </table>
          <div class="page">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="center"><input  type="button" class="but_cz"  value="返 回" onclick="history.back(-1)"  /></td>
              </tr>
            </table>
          </div>
      </div>
</div>
</body>
</html>
