<div id="float">
	<%If Not inull(site_qrcode) Then%>
	<div class="wrap">
		<span class="icon icon-qrcode"></span>
		<div class="name">二维码</div>
		<div class="content">
			<img src="<%=site_qrcode%>" />
		</div>
	</div>
	<%End If%>
	<%If Not inull(site_wxqrcode) Then%>
	<div class="wrap">
		<span class="icon icon-weixin"></span>
		<div class="name">微信</div>
		<div class="content">
			<img src="<%=site_wxqrcode%>" />
			<%If Not inull(site_weixin) Then%>
				<p class="ac">微信号：<%=site_weixin%></p>
			<%End If%>
		</div>
	</div>
	<%End If%>
	<%If Not inull(site_qq) Then%>
	<%
	arr_site_qq = Split(site_qq,"|")
	For i = 0 To UBound(arr_site_qq)
	%>
	<div class="wrap">
		<span class="icon icon-qq"></span>
		<div class="name">QQ</div>
		<div class="content">
			<a href="http://wpa.qq.com/msgrd?v=3&uin=<%=arr_site_qq(i)%>&site=qq&menu=yes"><%=arr_site_qq(i)%></a>
		</div>
	</div>
	<%
	Next
	%>
	<%End If%>
	<%If Not inull(site_weibo) Then%>
	<div class="wrap">
		<span class="icon icon-weibo"></span>
		<div class="name">微博</div>
		<div class="content"><%=site_weibo%></div>
	</div>
	<%End If%>
	<%If Not inull(site_phone) Then%>
	<div class="wrap">
		<span class="icon icon-phone"></span>
		<div class="name">电话</div>
		<div class="content"><%=site_phone%></div>
	</div>
	<%End If%>
	<%If Not inull(site_email) Then%>
	<div class="wrap">
		<span class="icon icon-envelope"></span>
		<div class="name">邮件</div>
		<div class="content"><%=site_email%></div>
	</div>
	<%End If%>
	<%If Not inull(site_address) Then%>
	<div class="wrap">
		<span class="icon icon-map-marker"></span>
		<div class="name">地址</div>
		<div class="content"><%=site_address%></div>
	</div>
	<%End If%>
	<div class="wrap gotop">
		<span class="icon icon-chevron-up "></span>
		<div class="name">顶部</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	var offsettop = $('#float').offset().top;
	$(window).scroll(function() {
		$('#float').animate({
			top: offsettop + $(window).scrollTop() + "px"
		}, {
			duration: 600,
			queue: false
		});
	});
	$('#float').slide({
		type: "menu",
		titCell: '.wrap',
		targetCell: '.content',
		effect: 'fade',
		delayTime: 0,
		triggerTime: 0
	});
	$('.gotop').click(function() {
		$('html,body').animate({
			scrollTop: '0px'
		}, 100);
	});
});
</script>