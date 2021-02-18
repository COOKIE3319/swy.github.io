<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>用户登录</title>
<!--#include file="inc_head.asp"-->
</head>
<body>
<!--#include file="inc_header.asp"-->
<div class="container">
	<div id="login_wrap">
		<div class="l20">
			<div class="x5">
				<div class="h3">会员登录</div>
				<hr>
				<form method="post" class="form-big">
					<div class="form-group">
						<div class="label"><label for="m_name">用户名</label></div>
						<div class="field">
							<input id="m_name" class="input" name="m_name" type="text" data-validate="required:请填写用户名" value="" />
						</div>
					</div>
					<div class="form-group">
						<div class="label"><label for="m_password">密码</label></div>
						<div class="field">
							<input id="m_password" class="input" name="m_password" type="password" data-validate="required:请填写密码" value="" />
						</div>
					</div>
					<div class="form-group">
						<div class="label"><label for="verifycode">验证码</label> </div>
						<div class="field">
							<div class="l10">
								<div class="x4">
									<input id="verifycode" class="input" name="verifycode" type="text" data-validate="required:请填写验证码" value="" />
								</div>
								<div class="x4">
									<img src="<%=s_path%>system/verifycode.asp" onclick="javascript:this.src='<%=s_path%>system/verifycode.asp?tm='+Math.random()" style="background:#EEEEEE; height: 44px; padding:17px; cursor:pointer;" alt="点击更换" title="点击更换" />
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="label"><label></label></div>
						<div class="field">
							<input id="submit" class="btn btn-big bg-dot" name="submit" type="submit" value="会员登录" />
						</div>
					</div>
				</form>
			</div>
			<div class="x2"></div>
			<div class="x5">
				<div class="h3">还没有账户？</div>
				<hr>
				<a class="btn btn-big bg-sub mt10" href="register.asp">现在去注册</a>
			</div>
		</div>
	</div>
</div>
<!--#include file="inc_footer.asp"-->
</body>
</html>
