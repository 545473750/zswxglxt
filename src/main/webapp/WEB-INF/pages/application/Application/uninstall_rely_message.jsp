<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<style type="text/css">
	.hid {
	display: none;
	margin: 0 auto;
	vertical-align:middle; 
	}
	</style>
  
  <body>
  <!-- 提示框 -->
	<div id="loading" class="hid">
	<table width="100%" height="340px" style="border: 1px">
		<tr>
			<td align="center" valign="middle"><img src="<%=path %>/images/load.gif" /> 应用卸载中，请稍后...</td>
		</tr>
	</table>
	</div>
    <script type="text/javascript">
      if (confirm('${message}')){
         document.getElementById("loading").className="show";//卸载提示显示
         window.parent.frames.mainFrame.location.href='<%=path%>/application/Application!unInstall.do?id=${id}';
      }else{
      	window.parent.frames.mainFrame.location.href='<%=path%>/application/Application!list.do';
      }
    </script>
    
    
  </body>
</html>
