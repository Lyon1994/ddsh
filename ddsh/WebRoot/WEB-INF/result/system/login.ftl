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
  		<link href="${base}/favicon.ico" type="image/x-icon" rel="icon"/>
		<link href="${base}/favicon.ico" type="image/x-icon" rel="shortcut icon"/>
  		<link href="${base}/favicon.ico" type="image/x-icon" rel="bookmark"/>
    	<title>用户登录</title>
		<link href="${css}/mainstyle.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="js/jquery/jquery-1.4.2.min.js"></script>
		<script language="javascript">
			$(document).ready(
				function(){
						$("#userid").focus();
				}
			)
		</script>
	</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" bgcolor="#216DC5">
	<form name="login" action="submit.zf" method="POST">
	<table border="0" width="100%" id="table1" cellspacing="0" cellpadding="0" background="${images}/bg.jpg" height="600">
		<tr>
			<td valign="top" align="center">
			<table border="0" width="778" id="table2" cellspacing="0" cellpadding="0" background="${images}/login_pic.jpg" height="600">
				<tr>
					<td valign="top">
					<table border="0" width="778" id="table3" cellspacing="0" cellpadding="0">
						<tr>
							<td height="285" width="455">　</td>
							<td  valign="bottom" align="left" width="170">
							<input type="text" id="userid" name="userid" size="25" style="BORDER:solid 0px;BACKGROUND-COLOR: transparent"></td>
							<td valign="bottom" rowspan="4">
							<table border="0" width="100%" id="table4" cellspacing="0" cellpadding="0">
								<tr>
									<td>
									<img border="0" src="${images}/tm.gif" style="CURSOR: hand" onClick="document.login.submit()" width="83" height="77"></td>
								</tr>
								<tr>
									<td height="10"></td>
								</tr>
							</table>
							</td>
						</tr>
						<tr height="28">
							<td>　</td>
							<td>　</td>
						</tr>
						<tr>
							<td>　</td>
							<td height="21" align="left">
							<input type="password" name="password" size="25" style="BORDER:solid 0px;BACKGROUND-COLOR: transparent"></td>
						</tr>
						<tr>
							<td>　</td>
							<td>　</td>
						</tr>
						<tr>
							<td>
							<p align="right">验证码：&nbsp;&nbsp;</td>
							<td align="left">
							<input type="text" name="code" size="14" class="text_half"> 
							<img src="captcha.zf"  align="absMiddle"/></td>
							<td><br>
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