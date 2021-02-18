<div id="footer">
	<div class="container">
		<div class="line">
			<%=site_copyright%>
		</div>
	</div>
</div>
<%If site_float = 1 Then%>
<!--#include file="inc_float.asp"-->
<%End If%>
<script type="text/javascript">
if (!(!!window.ActiveXObject || "ActiveXObject" in window)) {
	var wow = new WOW({
		boxClass: 'wow',
		animateClass: 'animated',
		offset: 0,
		mobile: true,
		live: true
	});
	wow.init();
}
</script>