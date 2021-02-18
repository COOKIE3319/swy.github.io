<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inc.asp"-->
<%
If site_member = 2 Then
	Call alert_back("已经关闭注册！")
End If
If Not inull(rfs("save")) Then
	Call null_back(rfs("verifycode"), "error")
	If CStr(Session("CheckCode")) <> CStr(rfs("verifycode")) Then
		Call alert_back("验证码错误！")
	End If
	Call null_back(rfs("m_name"),"error")
	Call null_back(rfs("m_password"),"error")
	Set rs = ado_query("select * from cms_member where m_name = '"&rfs("m_name")&"'")
	If Not rs.EOF Then
		Call alert_back("此用户名已经被注册过了")
	End If
	rs.Close
	Set rs = Nothing
	Set rs = ado_mquery("select * from cms_member")
	rs.AddNew
	rs("m_enable") = site_member
	rs("m_name") = rfs("m_name")
	rs("m_password") = md5(rfs("m_password"))
	rs("m_tname") = rfs("m_tname")
	rs("m_tel") = rfs("m_tel")
	rs("m_qq") = rfs("m_qq")
	rs("m_wx") = rfs("m_wx")
	rs("m_email") = rfs("m_email")
	rs("m_address") = rfs("m_address")
	rs("m_date") = Now()
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("注册成功，请登录","login.asp")
End If
include(iif(ism(),mskin&"register.asp",skin&"register.asp"))
%>
