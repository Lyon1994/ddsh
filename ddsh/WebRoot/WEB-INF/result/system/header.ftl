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
    	<title></title>
		<link href="${css}/mainstyle.css" rel="stylesheet" type="text/css">
	</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">

<table border="0" width="100%" id="table2" cellspacing="0" cellpadding="0" background="images/top_line.jpg" height="14">
	<tr>
		<td>　</td>
	</tr>
</table>
<div align="center">
	<table border="0" width="100%" id="table3" cellspacing="0" cellpadding="0">
		<tr>
			<td height="10"></td>
		</tr>
		<tr>
			<td>
			<table border="0" width="100%" id="table4" cellspacing="0" cellpadding="0" background="images/banner_2.jpg">
				<tr>
					<td width="1%">
					<img border="0" src="images/banner_1.jpg"></td>
					<td background="images/banner_2.jpg">
					<table border="0" width="100%" id="table5">
						<tr>
							<td align="right">欢迎你：<#if Session.userid?exists>${Session.typename} ${Session.name}(${Session.userid})</#if>&nbsp;&nbsp;&nbsp;&nbsp;*提示：使用[F11]键全屏显示</td>
						</tr>
						<tr>
							<td align="right"><br>【<a href="javascript:parent.location='logout.zf'">退出系统</a>】<!--【<a href="网站菜单.htm" target="contents">设计师界面</a>】【<a href="管理员菜单.htm" target="contents">管理员界面</a>】--></td>
						</tr>
					</table>
					</td>
					<td width="1" align="right">
					<img border="0" src="images/banner_3.jpg"></td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
</div>

</body>
</html>