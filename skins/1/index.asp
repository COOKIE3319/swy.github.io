<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title><%=site_title%></title><%If Not inull(site_key) Then%>
<meta name="keywords" content="<%=site_key%>" /><%End If%><%If Not inull(site_des) Then%>
<meta name="description" content="<%=site_des%>" /><%End If%>
<!--#include file="inc_head.asp"-->
<script type="text/javascript">
$(function(){
	$('#navigation .home a').addClass('current');
	$('.index_news').slide({
		easing: 'easeInOutBack',
		autoPlay: true,
		interTime: 4000,
		delayTime: 500,
		scroll: 1,
		vis: 3,
		mainCell: '.bd',
		effect: 'topLoop'
	});
	$('.index_case').slide({
		titCell : '.wrap',
		targetCell: '.bd',
		effect: 'slideDown'
	})
	$('#form_search').submit(function() {
		if ($('#search_key').val() == '') {
			layer.msg('请输入要搜索的关键词', {
				icon: 2,
				time: 2000
			});
			return false;
		}
	})

});
</script>
</head>
<body>
<!--#include file="inc_header.asp"-->
<!--#include file="inc_banner.asp"-->
<div id="search">
	<div class="container">
		热门关键词：
		<%
		tmp_hotkey = Split(site_hotkey,"|")
		For hi = 0 To UBound(tmp_hotkey)
			echo "<a href="""&s_path&"search.asp?key="&tmp_hotkey(hi)&""">"&tmp_hotkey(hi)&"</a> "
		Next
		%>
		<form method="get" id="form_search" action="<%=site_dir%>search.asp">
			<input id="search_key" name="key" type="text" maxlength="255" size="60" value="" />
			<button id="search_btn" type="submit"><span class="icon-search"></span></button>
		</form>
	</div>
</div>
<%
Set rss = ado_query("select * from cms_channel where id = 3")
If Not rss.EOF Then
	products_twidth = iif((rss("c_twidth") = 0),site_twidth,rss("c_twidth"))
	products_theight = iif((rss("c_theight") = 0),site_theight,rss("c_theight"))
%>
<div id="index-1">
	<div class="caname"><%=rss("c_aname")%></div>
	<div class="cname"><span><%=rss("c_name")%></span></div>
	<div class="cline"></div>
	<div class="cseoname"><%=rss("c_seoname")%></div>
	<div class="container">
		<div class="l40">
			<div class="x3 wow bounceInLeft">
				<div class="clist">
					<div class="clistname"><%=rss("c_sname")%>分类</div>
					<ul>
						<%
						Set rs = ado_query("select * from cms_channel where c_enable = 1 and c_parent = "&rss("id")&" order by c_order asc , id asc")
						Do While Not rs.EOF
						%>
						<li><a href="<%=c_url(rs("id"),rs("c_fname"))%>" target="<%=rs("c_target")%>"><%=rs("c_name")%></a></li>
						<%
						rs.MoveNext
						Loop
						rs.Close
						Set rs = Nothing
						%>
					</ul>
				</div>
			</div>
			<div class="x9 wow bounceInRight">
				<div class="l20 plist">
					<%
					Set rs = ado_query("select top 6 id,i_enable,i_order,i_name,i_parent,i_ifrec,i_ifhot,i_iftop,i_ifcov,i_bold,i_italic,i_color,i_picture,i_target,i_scontent,i_hits,i_date from cms_info where i_enable = 1 and i_parent in ("&rss("c_sub")&") order by i_order desc , id desc")
					Do While Not rs.EOF
					%>
					<div class="x4">
						<div class="wrap">
							<div class="picture"><div class="products_thumbnail"><a href="<%=i_url(rs("id"))%>" target="<%=rs("i_target")%>"><img src="<%=iif((inull(rs("i_picture"))),nopicture,rs("i_picture"))%>" alt="<%=rs("i_name")%>" title="<%=rs("i_name")%>"/></a></div></div>
							<div class="title cut"><a style="<%=rs("i_color")&rs("i_bold")&rs("i_italic")%>" href="<%=i_url(rs("id"))%>" target="<%=rs("i_target")%>" title="<%=rs("i_name")%>"><%=rs("i_name")%></a></div>
						</div>
					</div>
					<%
					rs.movenext
					Loop
					rs.Close
					Set rs = Nothing
					%>
				</div>
			</div>
		</div>
	</div>
</div>
<%If site_thumbnail = 1 Then%>
<script type="text/javascript">
$(function(){
	var products_thumbnail = $('.products_thumbnail');
	products_thumbnail.find('img').jqthumb({
		width: products_thumbnail.width(),
		height: products_thumbnail.width() / <%=products_twidth%> * <%=products_theight%>
	});
});
</script>
<%End If%>
<%
End If
rss.Close
Set rss = Nothing
%>
<%
Set rss = ado_query("select * from cms_channel where id = 1")
If Not rss.EOF Then
	about_twidth = iif((rss("c_twidth") = 0),site_twidth,rss("c_twidth"))
	about_theight = iif((rss("c_theight") = 0),site_theight,rss("c_theight"))
%>
<div id="index-2">
	<div class="caname"><%=rss("c_aname")%></div>
	<div class="cname"><span><%=rss("c_name")%></span></div>
	<div class="cline"></div>
	<div class="cseoname"><%=rss("c_seoname")%></div>
	<div class="container wow bounceInUp">
		<%=rss("c_scontent")%>
	</div>
</div>
<%
End If
rss.Close
Set rss = Nothing
%>
<%
Set rss = ado_query("select * from cms_channel where id = 2")
If Not rss.EOF Then
	news_twidth = iif((rss("c_twidth") = 0),site_twidth,rss("c_twidth"))
	news_theight = iif((rss("c_theight") = 0),site_theight,rss("c_theight"))
%>
<div id="index-3">
	<div class="caname"><%=rss("c_aname")%></div>
	<div class="cname"><span><%=rss("c_name")%></span></div>
	<div class="cline"></div>
	<div class="cseoname"><%=rss("c_seoname")%></div>
	<div class="container wow fadeInDown">
		<div class="nlist">
			<div class="l40">
				<%
				Set rs = ado_query("select top 6 id,i_enable,i_order,i_name,i_parent,i_ifrec,i_ifhot,i_iftop,i_ifcov,i_bold,i_italic,i_color,i_picture,i_target,i_scontent,i_hits,i_date from cms_info where i_parent in ("&rss("c_sub")&") order by i_order desc , id desc")
				Do While Not rs.EOF
				%>
				<div class="x6">
					<div class="wrap mb40">
						<div class="line">
							<div class="x2">
								<div class="date">
									<div class="day"><%=str_time("dd",rs("i_date"))%></div>
									<div class="ym"><%=str_time("y/mm",rs("i_date"))%></div>
								</div>
							</div>
							<div class="x10">
								<div class="content">
									<div class="title cut"><a style="<%=rs("i_color")&rs("i_bold")&rs("i_italic")%>" href="<%=i_url(rs("id"))%>" target="<%=rs("i_target")%>" title="<%=rs("i_name")%>"><%=rs("i_name")%></a></div>
									<div class="scontent"><%=str_left(rs("i_scontent"),100,"...")%></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
				rs.MoveNext
				Loop
				rs.Close
				Set rs = Nothing
				%>
			</div>
		</div>
	</div>
</div>
<%
End If
rss.Close
Set rss = Nothing
%>
<div id="index-4">
	<div class="container">
		<div class="l20">
			<div class="x7 wow fadeInLeft">
				<%
				Set rss = ado_query("select * from cms_channel where id = 4")
				If Not rss.EOF Then
				honor_twidth = iif((rss("c_twidth") = 0),site_twidth,rss("c_twidth"))
				honor_theight = iif((rss("c_theight") = 0),site_theight,rss("c_theight"))
				%>
				<div class="hdi"><span class="fr more"><a href="<%=c_url(rss("id"),rss("c_fname"))%>">MORE+</a></span><%=rss("c_name")%> <%=rss("c_aname")%></div>
				<div class="bdi">
					<div class="l20 picture_slist">
						<%
						Set rs = ado_query("select top 8 id,i_enable,i_order,i_name,i_parent,i_ifrec,i_ifhot,i_iftop,i_ifcov,i_bold,i_italic,i_color,i_picture,i_target,i_scontent,i_hits,i_date from cms_info where i_enable = 1 and i_parent in ("&rss("c_sub")&") order by i_order desc , id desc")
						Do While Not rs.EOF
						%>
						<div class="x3">
							<div class="wrap">
								<div class="picture"><div class="honor_thumbnail"><a href="<%=i_url(rs("id"))%>" target="<%=rs("i_target")%>"><img src="<%=iif((inull(rs("i_picture"))),nopicture,rs("i_picture"))%>" alt="<%=rs("i_name")%>" title="<%=rs("i_name")%>"/></a></div></div>
								<div class="title cut"><a style="<%=rs("i_color")&rs("i_bold")&rs("i_italic")%>" href="<%=i_url(rs("id"))%>" target="<%=rs("i_target")%>" title="<%=rs("i_name")%>"><%=rs("i_name")%></a></div>
							</div>
						</div>
						<%
						rs.movenext
						Loop
						rs.Close
						Set rs = Nothing
						%>
					</div>
				</div>
				<%If site_thumbnail = 1 Then%>
				<script type="text/javascript">
				$(function(){
					var honor_thumbnail = $('.honor_thumbnail');
					honor_thumbnail.find('img').jqthumb({
						width: honor_thumbnail.width(),
						height: honor_thumbnail.width() / <%=honor_twidth%> * <%=honor_theight%>
					});
				});
				</script>
				<%End If%>
				<%
				End If
				rss.Close
				Set rss = Nothing
				%>
			</div>
			<div class="x5 wow fadeInRight">
				<%
				Set rss = ado_query("select * from cms_channel where id = 5")
				If Not rss.EOF Then
				case_twidth = iif((rss("c_twidth") = 0),site_twidth,rss("c_twidth"))
				case_theight = iif((rss("c_theight") = 0),site_theight,rss("c_theight"))
				%>
				<div class="hdi"><span class="fr more"><a href="<%=c_url(rss("id"),rss("c_fname"))%>">MORE+</a></span><%=rss("c_name")%> <%=rss("c_aname")%></div>
				<div class="bdi">
					<div class="index_case">
						<%
						Set rs = ado_query("select top 8 id,i_enable,i_order,i_name,i_parent,i_ifrec,i_ifhot,i_iftop,i_ifcov,i_bold,i_italic,i_color,i_picture,i_target,i_scontent,i_hits,i_date from cms_info where i_enable = 1 and i_parent in ("&rss("c_sub")&") order by i_order desc , id desc")
						Do While Not rs.EOF
						%>
						<div class="wrap">
							<div class="hd cut"><a style="<%=rs("i_color")&rs("i_bold")&rs("i_italic")%>" href="<%=i_url(rs("id"))%>" target="<%=rs("i_target")%>" title="<%=rs("i_name")%>"><%=rs("i_name")%></a></div>
							<div class="bd">
								<div class="l10">
									<div class="x3">
										<div class="case_thumbnail"><a href="<%=i_url(rs("id"))%>" target="<%=rs("i_target")%>"><img src="<%=iif((inull(rs("i_picture"))),nopicture,rs("i_picture"))%>" alt="<%=rs("i_name")%>" title="<%=rs("i_name")%>"/></a></div>
									</div>
									<div class="x9 content"><%=rs("i_scontent")%></div>
								</div>
							</div>
						</div>
						<%
						rs.movenext
						Loop
						rs.Close
						Set rs = Nothing
						%>
					</div>
				</div>
				<%If site_thumbnail = 1 Then%>
				<script type="text/javascript">
				$(function(){
					var case_thumbnail = $('.case_thumbnail');
					case_thumbnail.find('img').jqthumb({
						width: case_thumbnail.width(),
						height: case_thumbnail.width() / <%=case_twidth%> * <%=case_theight%>
					});
				});
				</script>
				<%End If%>
				<%
				End If
				rss.Close
				Set rss = Nothing
				%>
			</div>
		</div>
	</div>
</div>
<div id="index-5">
	<div class="container">
		<div class="hdi"><span class="fr more"><a href="<%=s_path%>link.asp">JOIN+</a></span>友情链接</div>
		<div class="l10 mtb20">
			<%
			Set rs = ado_query("select * from cms_link where l_picture = '' and l_enable = 1 order by l_order asc , id asc")
			Do While Not rs.EOF
			%>
			<div class="x"><a href="<%=rs("l_url")%>" target="_blank"><%=rs("l_name")%></a></div>
			<%
			rs.movenext
			Loop
			rs.Close
			Set rs = Nothing
			%>
		</div>
		<div class="l8">
			<%
			Set rs = ado_query("select * from cms_link where l_picture <> '' and l_enable = 1 order by l_order asc , id asc")
			Do While Not rs.EOF
			%>
			<div class="xx12 mb8"><a href="<%=rs("l_url")%>" target="_blank"><img src="<%=rs("l_picture")%>" title="<%=rs("l_name")%>" alt="<%=rs("l_name")%>" /></a></div>
			<%
			rs.movenext
			Loop
			rs.Close
			Set rs = Nothing
			%>
		</div>
	</div>
</div>
<!--#include file="inc_footer.asp"-->
</body>
</html>
