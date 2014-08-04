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
<!-- Top -->
<div id="header">
  <div class="subnav">
    <p class="welcome">欢迎来到朝阳教师研修平台！</p>
    <p class="sublink"><a href="#">教师之家</a>  |  <a href="#">加入收藏</a>  |  <a href="#">设为首页</a></p>
  </div>
  <div class="banner">
    <div class="search">
      <table width="276" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="66">站内搜索</td>
          <td width="210"><form id="form1" name="form1" method="post" action="">
            <input type="text" name="textfield" id="textfield" class="s_t" />
            <input type="submit" name="button" id="button" value="提交" class="s_b" />
          </form></td>
        </tr>
      </table>
    </div>
  </div>
  <div class="nav">
  <a href="http://yxwx.bjchyedu.cn/" > 首  页</a>
  <a href="http://yxwx.bjchyedu.cn/tggg/" myrel="dropmenu1">通知公告</a> 
  <a href="http://yxwx.bjchyedu.cn/xwdt/" myrel="dropmenu2">新闻动态</a> 
  <a href="http://yxwx.bjchyedu.cn/jspx/" myrel="dropmenu3">教师培训</a> 
  <a href="http://yxwx.bjchyedu.cn/jyky/" myrel="dropmenu4">教研科研</a> 
  <a href="http://yxwx.bjchyedu.cn/xxdj/" myrel="dropmenu5">信息电教</a> 
  <a href="http://yxwx.bjchyedu.cn/jjgl/" myrel="dropmenu6">继教管理</a> 
  <a href="http://yxwx.bjchyedu.cn/jxjw/" myrel="dropmenu7">教学教务</a> 
  </div>
<!-- Top end -->
<!-- Conter -->
<div id="content">
  <div class="dqwz">当前位置：<a href="http://yxwx.bjchyedu.cn/" > 首  页</a> &gt; <a href="${ctx}/portal/Yxcg!list.do">研修成果列表</a> &gt;查看详情</div>
  <div class="show_box">
    <div class="show_tit">${model.name}</div>
    <div class="show_text">
      <%--<p><img src="images/pic.jpg" width="440" height="282" /></p>
      --%><p>${model.description }</p>
    </div>
    <div class="show_bot"><fmt:formatDate value="${model.ts}" pattern="yyyy-MM-dd"/></div>
  </div>
</div>
<!-- Conter End -->
<div id="footer">
  <div class="linkxz">
    <select name="select" id="select">
      <option>--教育网站--</option>
    </select>
    <select name="select2" id="select2">
      <option>--名校查询--</option>
    </select>
    <select name="select3" id="select3">
      <option>--出行资讯--</option>
    </select>
    <select name="select4" id="select4">
      <option>--资源下载--</option>
    </select>
  </div>
  <div class="copyright">版权所有：朝阳区教育委员会  京ICP备05038995号<br />地址：北京市朝阳区石佛营西里二号 邮编：100025 电话:010-85851085<br /><img src="images/jsq.gif" width="228" height="19" /></div>
</div>
</body>
</html>
