<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#include "/include/header.ftl" encoding="utf-8" parse=true>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <!-- HTTP 1.1 -->
        <meta http-equiv="Cache-Control" content="no-store"/>
        <!-- HTTP 1.0 -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <!-- Prevents caching at the Proxy Server -->
        <meta http-equiv="Expires" content="0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="generator" content="Eclipse" />
		<meta content="all" name="robots" />
		<meta content="<@s.text name="meta.author"/>" name="author" />
		<meta content="<@s.text name="meta.copyright"/>" name="copyright" />
		<meta content="<@s.text name="meta.keywords"/>" name="keywords" />
		<meta content="<@s.text name="meta.description"/>" name="description" />
  		<link href="${base}/favicon.ico" type="image/x-icon" rel="icon"/>
		<link href="${base}/favicon.ico" type="image/x-icon" rel="shortcut icon"/>
  		<link href="${base}/favicon.ico" type="image/x-icon" rel="bookmark"/>
    	<title>用户登录</title>
		<link href="${css}/mainstyle.css" rel="stylesheet" type="text/css">
    
	</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" bgcolor="#216DC5">
	<form name="login" action="submit.zf" method="POST">
	<table border="0" width="100%" id="table1" cellspacing="0" cellpadding="0" background="${images}/bg.jpg" height="600">
		<tr>
			<td valign="top" align="center">
			<table border="0" width="968" id="table2" cellspacing="0" cellpadding="0" background="${images}/login_pic.jpg" height="600">
				<tr>
					<td valign="top">
					<table border="0" width="968" id="table3" cellspacing="0" cellpadding="0">
						<tr>
							<td height="287" width="580">　</td>
							<td height="287" valign="bottom" align="left">
							<input type="text" name="userid" size="25" style="BORDER:solid 0px;BACKGROUND-COLOR: transparent"></td>
							<td valign="bottom" rowspan="4">
							<table border="0" width="100%" id="table4" cellspacing="0" cellpadding="0">
								<tr>
									<td align="left">
									<img border="0" src="${images}/tm.gif" style="CURSOR: hand" onClick="document.login.submit()" width="83" height="77"></td>
								</tr>
								<tr>
									<td>　</td>
								</tr>
							</table>
							</td>
						</tr>
						<tr>
							<td height="25" width="557">　</td>
							<td width="205" height="25">　</td>
						</tr>
						<tr>
							<td height="21" width="557">　</td>
							<td width="205" height="21" align="left">
							<input type="password" name="password" size="25" style="BORDER:solid 0px;BACKGROUND-COLOR: transparent"></td>
						</tr>
						<tr>
							<td width="557" height="22">　</td>
							<td width="205" height="22">　</td>
						</tr>
						<tr>
							<td width="557">
							<p align="right">验证码：&nbsp;&nbsp;</td>
							<td width="205" align="left">
							<input type="text" name="code" size="14" class="text_half"> 
							<img src="captcha.zf"  align="absMiddle"/></td>
							<td width="206" align="left">
							【<a href="用户申请.htm">新用户注册</a>】</td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
 	</form>
 
</body>

</html>