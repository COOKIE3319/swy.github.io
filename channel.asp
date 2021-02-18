<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inc.asp"-->
<%
If site_mode = 1 Then
	Call non_numeric_back(rqs("id"),"error")
	sql = "select * from cms_channel where id = "&rqs("id")&""
Else
	sql = "select * from cms_channel where c_fname = '"&rqs("name")&"'"
End If
Set rs = ado_query(sql)
If rs.EOF Then
	die "error"
End If
c_id = rs("id")
c_enable = rs("c_enable")
c_protected = rs("c_protected")
c_member = rs("c_member")
c_order = rs("c_order")
c_name = rs("c_name")
c_fname = rs("c_fname")
c_nav = rs("c_nav")
c_nname = rs("c_nname")
c_aname = rs("c_aname")
c_sname = rs("c_sname")
c_parent = rs("c_parent")
c_ifsub = rs("c_ifsub")
c_sub = rs("c_sub")
c_main = rs("c_main")
c_type = rs("c_type")
c_itype = rs("c_itype")
c_mtype = rs("c_mtype")
c_mitype = rs("c_mitype")
c_icon = rs("c_icon")
c_cover = rs("c_cover")
c_page = rs("c_page")
c_seoname = rs("c_seoname")
c_key = rs("c_key")
c_des = rs("c_des")
c_link = rs("c_link")
c_target = rs("c_target")
c_scontent = rs("c_scontent")
c_content = rs("c_content")
c_mscontent = rs("c_mscontent")
c_mcontent = iif((inull(rs("c_mcontent"))),c_content,rs("c_mcontent"))
c_rh = rs("c_rh")
c_date = rs("c_date")
c_mdate = rs("c_mdate")
c_twidth = rs("c_twidth")
c_theight = rs("c_theight")
c_slideshow = rs("c_slideshow")
rs.Close
Set rs = Nothing
If c_twidth <> 0 And c_theight <> 0 Then
	site_twidth = c_twidth
	site_theight = c_theight
End If
If Not inull(c_slideshow) Then
	Set matches = str_execute("<img[^>]*src\s*=\s*['"&CHR(34)&"]?([\w/\-\:.]*)['"&CHR(34)&"]?[^>]*>",c_slideshow)
	c_slideshow = ""
	For Each Match in matches
		'c_slideshow = c_slideshow & Match.Value'获取整个img
		c_slideshow = c_slideshow&spacer&Match.SubMatches(0)'只取src
		spacer = "|"
	Next
End If
If c_member = 1 Then
	If Not member_login Then
		Call alert_href("此内容需要您登录后才能访问",site_dir&"login.asp")
	End If
End If

If Not inull(c_link) Then
	Response.Redirect(c_link)
End If
c_title = iif((inull(c_seoname)),c_name&" - "&site_name,c_name&" - "&c_seoname&" - "&site_name)
current_nav = c_main
include(iif(ism(),mskin&c_mtype,skin&c_type))
%>