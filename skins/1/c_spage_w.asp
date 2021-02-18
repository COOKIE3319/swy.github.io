<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title><%=c_title%></title><%If Not inull(c_key) Then%>
<meta name="keywords" content="<%=c_key%>" /><%End If%><%If Not inull(c_des) Then%>
<meta name="description" content="<%=c_des%>" /><%End If%>
<!--#include file="inc_head.asp"-->
</head>
<body>
<!--#include file="inc_header.asp"-->
<%If Not inull(c_cover) Then%><div id="channel_cover"><img src="<%=c_cover%>" alt="<%=c_title%>" title="<%=c_title%>" /></div><%End If%>
<div class="container">
	<!--#include file="inc_channel.asp"-->
		<%If c_slideshow <> "" then%>
		<div id="channel_slideshow">
			<div class="bd">
				<%
				arr_slideshow = Split(c_slideshow, "|")
				For i = 0 To UBound(arr_slideshow)
					echo "<a href="""&arr_slideshow(i)&""" data-lightbox=""group"" data-title="""&c_name&"""><img src="""&arr_slideshow(i)&""" alt="""&c_name&""" title="""&c_name&"""></a>"
				Next
				%>
			</div>
			<div class="hd">
				<ul class="l4">
					<%
					arr_slideshow = Split(c_slideshow, "|")
					For i = 0 To UBound(arr_slideshow)
						echo "<li class=""x1 mb4""><div class=""img""><div class=""thumbnail""><img src="""&arr_slideshow(i)&"""/></div></div></li>"
					Next
					%>
				</ul>
			</div>
		</div>
		<script type="text/javascript">
		$(function() {
			$('#channel_slideshow').slide({
				trigger : 'click'
			});
		});
		</script>
		<%End If%>
	<div id="channel_content"> <%=c_content%> </div>
</div>
<!--#include file="inc_footer.asp"-->
<%If site_thumbnail = 1 Then%>
<script type="text/javascript">
$(function(){
	var thumbnail = $('.thumbnail');
	thumbnail.find('img').jqthumb({
		width: thumbnail.width(),
		height: thumbnail.width() / <%=site_twidth%> * <%=site_theight%>
	});
});
</script>
<%End If%>
</body>
</html>