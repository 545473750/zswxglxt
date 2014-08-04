<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
Object installPath = session.getAttribute("installPath");
String installPathStr = "";
if(installPath!=null){
	installPathStr = installPath.toString();
}
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
  <!-- 无外边框内容区开始 -->
	<div id="loading" class="hid">
		<table width="100%" height="340px" style="border: 1px">
			<tr>
				<td align="center" valign="middle"><img src="<%=path %>/images/load.gif" /> 应用安装中，请稍后...</td>
			</tr>
		</table>
	
		</div>
    <script type="text/javascript">
      var installPath = '<%=installPathStr%>';
      if (confirm('${message}')){
      	 document.getElementById("loading").className="show";//安装提示显示
         window.parent.frames.mainFrame.location.href='<%=path%>/application/Application!${resultAction}.do';
      }else{
         if(installPath=='remote_install'){
          	window.parent.frames.mainFrame.location.href='<%=path%>/application/Application!toRemoteInstall.do';
         }else{
         	window.parent.frames.mainFrame.location.href='<%=path%>/application/Application!toLocalInstall.do';
         }
      	 
      }
    </script>
    
  </body>
</html>
