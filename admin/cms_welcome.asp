<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_welcome"
%>
</head>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd"> 网站统计 </div>
		<div class="bd">
			<table class="table table-bordered">
				<tr>
					<th>频道</th>
					<th>信息</th>
					<th>幻灯</th>
					<th>留言</th>
					<th>评论</th>
					<th>订单</th>
					<th>应聘</th>
					<th>链接</th>
					<th>内接</th>
					<th>碎片</th>
				</tr>
				<tr class="ac">
					<td><%=get_count("cms_channel")%></td>
					<td><%=get_count("cms_info")%></td>
					<td><%=get_count("cms_banner")%></td>
					<td><%=get_count("cms_guestbook")%></td>
					<td><%=get_count("cms_comment")%></td>
					<td><%=get_count("cms_order")%></td>
					<td><%=get_count("cms_resume")%></td>
					<td><%=get_count("cms_link")%></td>
					<td><%=get_count("cms_sitelink")%></td>
					<td><%=get_count("cms_chip")%></td>
				</tr>
			</table>
			<%
			%>
		</div>
		<div class="hd"> 说明</div>
		<div class="bd">
			<p>
				一、此版本为免费版，无使用时间限制。
			</p>
			<p>
				二、商业目的使用建议购买收费版。
			</p>
			<p>
				三、<span style="color:#E53333;"><strong>和收费版的主要差异</strong></span>
			</p>
			<p>
				1.收费版支持专业的手机版网站，智能识别，可以绑定独立域名。
			</p>
			<p>
				2.收费版默认带三套电脑模板和三套手机模板，并可以后台随时切换使用。
			</p>
			<p>
				3.收费版有技术服务，去除所有的版权信息标识。
			</p>
			<p>
				四、<span style="color:#E53333;"><strong>收费版咨询方式</strong></span>
			</p>
			 <p>收费版演示：<a href="http://aspecms.pcfinal.cn/" target="_blank">http://aspecms.pcfinal.cn/</a></p>
			<p>
				QQ：<a href="http://wpa.qq.com/msgrd?v=3&uin=1615889545&site=qq&menu=yes"><span class="icon-qq"> 售前咨询 </span> <span class="badge">1615889545</span></a> &emsp;<a href="http://wpa.qq.com/msgrd?v=3&uin=78118345&site=qq&menu=yes"><span class="icon-qq"> 售前咨询 </span> <span class="badge">78118345</span></a> &emsp;<a href="http://wpa.qq.com/msgrd?v=3&uin=5474131&site=qq&menu=yes"><span class="icon-qq"> 技术服务 </span> <span class="badge">5474131</span></a>
			</p>
			<p>
				电话：13400472755
			</p>
			<p>
			微信：13400472755
			</p>
			<img src="weixin.jpg" width="160" >
		</div>

	</div>
</div>
<!--#include file="inc_bottom.asp"-->
</body>
</html>
