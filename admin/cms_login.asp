<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="height: 100%;">
<head>
<!--#include file="../system/conn.asp"-->
<!--#include file="../system/library.asp"-->
<!--#include file="../system/config.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<%
If Not inull(rf("submit")) Then
	Call null_back(rf("login_name"), "error")
	Call null_back(rf("login_password"), "error")
	Call null_back(rf("login_verifycode"), "error")
	If CStr(Session("CheckCode")) <> CStr(rfs("login_verifycode")) Then
		Call alert_href("验证码错误！","cms_login.asp")
	End If
	Set rs = ado_query("select * from cms_admin where a_enable = 1 and a_name='"&rfs("login_name")&"' and a_password='"&md5(rfs("login_password"))&"'")
	If Not rs.EOF Then
		Response.Cookies("adminname") = rfs("login_name")
		Response.Cookies("adminpassword") = rfs("login_password")
		Response.Cookies("upload") = "pcfinal"
		Response.Redirect "cms_welcome.asp"
	Else
		Call alert_href("错误提示：用户名或密码错误，请核对后重新输入！","cms_login.asp")
	End If
	rs.Close
	Set rs = Nothing
End If
%>
<title>登录后台</title>
<link rel="stylesheet" href="../plus/ui/ui.css" />
<link rel="stylesheet" href="../plus/ui/font.css" />
<link rel="stylesheet" href="style.css" />
<script type="text/javascript" src="../plus/jquery.min.js"></script>
<script type="text/javascript" src="../plus/layer/layer.js"></script>
<script type="text/javascript" src="../plus/ui/ui.js"></script>
<style type="text/css">
body , html { height: 100%; min-width: 1200px; color: #9298B0;}
</style>
<script type="text/javascript">
$(function() {
	$('#verifycode_img').mouseover(function(){
		layer.tips('点击切换验证码', this ,{ tips: 1});
	});
});
</script>
</head>
<body id="loginbody">
	<div class="container">
	<div class="l20">
		<div class="x6"></div>
		<div class="x4">
			<div id="login_wrap">
				<p style="font-size: 22px; text-align: center; line-height: 60px; ">凡诺企业网站管理系统</p>
				<p class="ac"><span class="color-gray f12"><%=site_version%></span></p>
				<form method="post" action="cms_login.asp" class="form-big">
					<div class="form-group">
						<div class="label"><label for="login_name">用户名</label></div>
						<div class="field">
							<input id="login_name" class="input" name="login_name" type="text" data-validate="required:请填写用户名" value="" />
						</div>
					</div>
					<div class="form-group">
						<div class="label"><label for="login_password">密码</label></div>
						<div class="field">
							<input id="login_password" class="input" name="login_password" type="password" data-validate="required:请填写密码" value="" />
						</div>
					</div>
					<div class="form-group">
						<div class="label"><label for="login_verifycode">验证码</label> </div>
						<div class="field">
							<div class="l10">
								<div class="x">
									<input id="login_verifycode" class="input" size="10" maxlength="4" name="login_verifycode" type="text" data-validate="required:请填写验证码" value="" />
								</div>
								<div class="x">
									<img id="verifycode_img" src="../system/verifycode.asp" onclick="javascript:this.src='../system/verifycode.asp?tm='+Math.random()" style="background:#EEEEEE; padding:17px; cursor:pointer;" alt="点击更换" title="点击更换" />
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="label"><label></label></div>
						<div class="field">
							<input id="submit" class="btn mt10 btn-big btn-block" style="background: #5E75BE; color: #FFF;" name="submit" type="submit" value="登录后台" />
						</div>
					</div>
				</form>
				<div class="ac">
				版权所有 <a href="http://www.pcfinal.cn" target="_blank">沧州市凡诺广告传媒有限公司</a>
				</div>
			</div>
		</div>
	</div>

	</div>
</body>
</html>
