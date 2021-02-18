<%
site_version = "免费版-11.7-20201026"
'=====获取网站的基本信息=====
Set rs = ado_query("select * from cms_system")
site_skin = rs("site_skin")
site_mskin = rs("site_mskin")
site_mode = rs("site_mode")
site_member = rs("site_member")
site_guestbook = rs("site_guestbook")
site_comment = rs("site_comment")
site_order = rs("site_order")
site_name = rs("site_name")
site_url = rs("site_url")
site_murl = rs("site_murl")
site_mclose = rs("site_mclose")
site_sname = rs("site_sname")
site_title = iif((inull(site_sname)),site_name,site_sname&" - "&site_name)
site_url = rs("site_url")
site_float = rs("site_float")
site_key = rs("site_key")
site_des = rs("site_des")
site_copyright = rs("site_copyright")
site_qrcode = rs("site_qrcode")
site_phone = rs("site_phone")
site_qq = rs("site_qq")
site_mcopyright = rs("site_mcopyright")
site_guestbook_notice = rs("site_guestbook_notice")
site_comment_notice = rs("site_comment_notice")
site_order_notice = rs("site_order_notice")
site_member_notice = rs("site_member_notice")
site_s1 = rs("site_s1")
site_s2 = rs("site_s2")
site_s3 = rs("site_s3")
site_s4 = rs("site_s4")
site_s5 = rs("site_s5")
site_s6 = rs("site_s6")
site_s7 = rs("site_s7")
site_s8 = rs("site_s8")
site_s9 = rs("site_s9")
site_s10 = rs("site_s10")
site_s11 = rs("site_s11")
site_s12 = rs("site_s12")
site_p1 = rs("site_p1")
site_p2 = rs("site_p2")
site_p3 = rs("site_p3")
site_p4 = rs("site_p4")
site_p5 = rs("site_p5")
site_banner = rs("site_banner")
site_thumbnail = rs("site_thumbnail")
site_twidth = rs("site_twidth")
site_theight = rs("site_theight")
site_hotkey = rs("site_hotkey")
site_weixin = rs("site_weixin")
site_wxqrcode = rs("site_wxqrcode")
site_weibo = rs("site_weibo")
site_email = rs("site_email")
site_address = rs("site_address")
rs.Close
Set rs = Nothing
Set rs = ado_query("select * from cms_skin where s_path = '"&site_skin&"'")
	site_logo = rs("s_logo")
rs.Close
Set rs = Nothing
Set rs = ado_query("select * from cms_skin where s_path = '"&site_mskin&"'")
	site_mlogo = rs("s_logo")
rs.Close
Set rs = Nothing
skin = site_dir&"skins/"&site_skin&"/"
mskin = site_dir&"skins/"&site_mskin&"/"

s_path = site_dir
t_path = skin
t_mpath = mskin

nopicture = site_dir&"uploadfile/nopic.png"
recruitment_education = "不限|初中|高中|中专|大专|本科|研究生|硕士|博士"
recruitment_gender = "不限|男|女|中性"
recruitment_age = "不限|18岁以上|20岁以上|30岁以上|40岁以上|50岁以上|60岁以上|20岁-30岁|30岁-40岁|40岁-50岁|50岁-60岁"
recruitment_salary = "面议|1000-2000元|2000-3000元|3000-4000元|4000-5000元|5000-6000元|6000-7000元|7000-8000元|8000-9000元|10000元以上"
recruitment_language = "不限|英文|其它|多语"
recruitment_quantity= "不限|1人|1-5人|5-10人|10-50人|50人以上"
resume_education = "初中|高中|中专|大专|本科|研究生|硕士|博士"
resume_gender = "男|女|中性"
site_copyright = site_copyright&str_decode("ADOAxAA9A1IAwABaA2IAxOAXAC3AtMBQACAAu9APAD3A39AYz9lzcZWvADOAtMA9A19Ax9BeA1tALMAbA19AyABSA2AAK9ANACWAyOB7A2xAH9BOA1IAu9BhA18AtMBkAC8AtOBmAC3ALe2abZgALAANA1EAL9AWACWAxAAY")
If Not inull(Request.Cookies("membername")) And Not inull(Request.Cookies("memberpassword")) Then
	Set rs = ado_query("select * from cms_member where m_name = '"&Request.Cookies("membername")&"' and m_password = '"&md5(Request.Cookies("memberpassword"))&"'")
	If Not rs.EOF Then
		member_login = True
		member_id = rs("id")
		member_enable = rs("m_enable")
		member_name = rs("m_name")
		member_password = rs("m_password")
		member_tname = rs("m_tname")
		member_tel = rs("m_tel")
		member_qq = rs("m_qq")
		member_wx = rs("m_wx")
		member_email = rs("m_email")
		member_address = rs("m_address")
		member_date = rs("m_date")
	End If
	rs.Close
	Set rs = Nothing
End If
Sub check_member_login()
	If Not member_login Then
		Response.Redirect(site_dir&"login.asp")
	End If
End Sub
'频道和信息地址
Function c_url(t0,t1)
	c_url = site_dir&"channel/"&t1&".html"
	If site_mode = 1 Then
		c_url = site_dir&"channel.asp?id="&t0&""
	End If
End Function

Function i_url(t0)
	i_url = site_dir&"info/"&t0&".html"
	If site_mode = 1 Then
		i_url = site_dir&"info.asp?id="&t0&""
	End If
End Function

'=====获取会员的基本信息=====


'获取指定ID的碎片内容

Function get_chip(t0)
	Set rs_gc = ado_query("select * from cms_chip where id = "&t0&" ")
	If rs_gc.EOF Then
		get_chip = ""
	Else
		get_chip = rs_gc("c_content")
	End If
End Function

'频道当前位置

Function channel_location(t0)
	Set rs_cl = ado_query("select * from cms_channel where id = "&t0&"")
	current_channel = iif(rs_cl("id") = Int(c_id), " class=""current""", "")
	channel_location = "<a"&current_channel&" href="""&c_url(rs_cl("id"),rs_cl("c_fname"))&""" target="""&rs_cl("c_target")&""">"&rs_cl("c_name")&"</a>"
	If rs_cl("c_parent") <> 0 Then
		channel_location = channel_location(rs_cl("c_parent"))&" > "&channel_location
	End If
	rs_cl.Close
	Set rs_cl = Nothing
End Function


Function channel_dlist(t0, t1, t2, t3)
	Set rs_cl = ado_query("select * from cms_channel where c_enable = 1 and c_parent = "&t0&" order by c_order asc , id asc")
	For i = 1 To t1
		separator = separator&"　"
	Next
	Do While Not rs_cl.EOF
		current = iif(rs_cl("id") = Int(t3), " current", "")
		channel_dlist = channel_dlist&"<li class=""level"&i&current&"""><a href="""&c_url(rs_cl("id"),rs_cl("c_fname"))&""" target="""&rs_cl("c_target")&""">"&separator&t2&rs_cl("c_name")&"</a></li>"&vbCrLf&channel_dlist(rs_cl("id"), i, t2, t3)
		rs_cl.movenext
	Loop
	rs_cl.Close
	Set rs_cl = Nothing
End Function

'分类列表 - 递推一级分类

Function channel_list(t0)
	Set rs_csl = ado_query("select * from cms_channel where c_enable = 1 and c_parent = "&t0&" order by c_order asc , id asc")
	Do While Not rs_csl.EOF
		current = iif(rs_csl("id") = Int(c_id), " class=""current""", "")
		channel_list = channel_list&"<li><a"&current&" href="""&c_url(rs_csl("id"),rs_csl("c_fname"))&""" target="""&rs_csl("c_target")&""">"&rs_csl("c_name")&"</a></li>"
		rs_csl.movenext
	Loop
	rs_csl.Close
	Set rs_csl = Nothing
End Function

'根据ID获取频道相关任何字段

Function get_channel(t0, t1)
	Set rs_gc = ado_query("select * from cms_channel where id = "&t0&" ")
	If rs_gc.EOF Then
		get_channel = "不存在"
	Else
		get_channel = rs_gc(t1)
	End If
	rs_gc.Close
	Set rs_gc = Nothing
End Function

'站内链接

Function site_link(byval Str)
	Dim rs
	Set rs = conn.Execute("select * from cms_sitelink where s_enable = 1 order by id asc")
	While Not rs.EOF
		Str = p_replace(Str, rs("s_name"), "<a href="""&rs("s_url")&""" target=""_blank"" >"&rs("s_name")&"</a>")
		rs.movenext
	Wend
	rs.Close
	Set rs = Nothing
	site_link = Str
End Function


Function p_replace(content, asp, htm)
	If IsNull(content) Then Exit Function
	Dim Matches, strs, i
	strs = content
	Set Matches = str_execute("(\<a[^<>]+\>.+?\<\/a\>)|(\<img[^<>]+\>)",strs)
	i = 0
	Dim MyArray()
	For Each Match in Matches
		ReDim Preserve MyArray(i)
		MyArray(i) = Mid(Match.Value, 1, Len(Match.Value))
		strs = Replace(strs, Match.Value, "<"&i&">")
		i = i + 1
	Next
	If i = 0 Then
		content = Replace(content, asp, htm)
		p_replace = content
		Exit Function
	End If
	strs = Replace(strs, asp, htm)
	For i = 0 To UBound(MyArray)
		strs = Replace(strs, "<"&i&">", MyArray(i))
	Next
	p_replace = strs
End Function

'字符串右侧加入指定class
Function right_str(t0,t1,t2)
	right_str = Left(t0,Len(t0)-t1)&"<span class="""&t2&""">"&Right(t0,t1)&"</span>"
End Function
Function left_str(t0,t1,t2)
	left_str = "<span class="""&t2&""">"&Left(t0,t1)&"</span>"&Right(t0,Len(t0)-t1)
End Function
'检测是否为手机访问
Function ism()
	HTTP_ACCEPT = Request.ServerVariables("HTTP_ACCEPT")                 '获取浏览器信息
	HTTP_USER_AGENT = LCase(Request.ServerVariables("HTTP_USER_AGENT"))  '获取AGENT
	HTTP_X_WAP_PROFILE = Request.ServerVariables("HTTP_X_WAP_PROFILE")   'WAP特定信息 品牌机自带浏览器都会有
	HTTP_UA_OS = Request.ServerVariables("HTTP_UA_OS")                   '手机系统 电脑为空
	HTTP_VIA = LCase(Request.ServerVariables("HTTP_VIA"))                '网关信息
	ism = False
	If UBound(Split(HTTP_ACCEPT,"vnd.wap")) > 0 Then ism = True
	If HTTP_USER_AGENT = "" Then  ism = True
	If HTTP_X_WAP_PROFILE <> "" Then  ism = True
	If HTTP_UA_OS <> "" Then  ism = True
	If UBound(Split(HTTP_VIA,"wap")) > 0 Then  ism = True
	If UBound(Split(HTTP_USER_AGENT,"netfront")) > 0 Then  ism = True
	If UBound(Split(HTTP_USER_AGENT,"iphone")) > 0 Then  ism = True
	If UBound(Split(HTTP_USER_AGENT,"opera mini")) > 0 Then  ism = True
	If UBound(Split(HTTP_USER_AGENT,"ucweb")) > 0 Then  ism = True
	If UBound(Split(HTTP_USER_AGENT,"windows ce")) > 0 Then  ism = True
	If UBound(Split(HTTP_USER_AGENT,"symbianos")) > 0 Then  ism = True
	If UBound(Split(HTTP_USER_AGENT,"java")) > 0 Then  ism = True
	If UBound(Split(HTTP_USER_AGENT,"android")) > 0 Then  ism = True
	If site_murl = "http://"&Request.ServerVariables("SERVER_NAME") Then ism = True
	If site_mclose = 1 Then ism = False
	ism = False
End Function
%>
