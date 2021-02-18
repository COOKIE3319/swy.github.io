<%If c_rh = 1 Then%>
<div class="container">
	<div class="l20">
		<div class="x6">
			<div class="hd1">推荐<%=c_sname%></div>
			<div class="bd1">
				<ul class="list-group">
					<%
					Set rs = ado_query("select top 10 id,i_enable,i_order,i_name,i_parent,i_ifrec,i_ifhot,i_iftop,i_ifcov,i_bold,i_italic,i_color,i_picture,i_target,i_scontent,i_hits,i_date from cms_info where i_enable = 1 and i_ifrec = 1 and i_parent in ("&c_sub&") order by i_order desc , id desc")
					Do While Not rs.EOF
					%>
					<li class="cut"><a style="<%=rs("i_color")&rs("i_bold")&rs("i_italic")%>" href="<%=i_url(rs("id"))%>" target="<%=rs("i_target")%>" title="<%=rs("i_name")%>"><%=rs("i_name")%></a></li>
					<%
					rs.MoveNext
					Loop
					rs.Close
					Set rs = Nothing
					%>
				</ul>
			</div>
		</div>
		<div class="x6">
			<div class="hd1">热门<%=c_sname%></div>
			<div class="bd1">
				<ul class="list-group">
					<%
					Set rs = ado_query("select top 10 id,i_enable,i_order,i_name,i_parent,i_ifrec,i_ifhot,i_iftop,i_ifcov,i_bold,i_italic,i_color,i_picture,i_target,i_scontent,i_hits,i_date from cms_info where i_enable = 1 and i_ifhot = 1 and i_parent in ("&c_sub&") order by i_order desc , id desc")
					Do While Not rs.EOF
					%>
					<li class="cut"><a style="<%=rs("i_color")&rs("i_bold")&rs("i_italic")%>" href="<%=i_url(rs("id"))%>" target="<%=rs("i_target")%>" title="<%=rs("i_name")%>"><%=rs("i_name")%></a></li>
					<%
					rs.MoveNext
					Loop
					rs.Close
					Set rs = Nothing
					%>
				</ul>
			</div>
		</div>
	</div>
</div>
<%End If%>