<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#include "/include/header.ftl" encoding="utf-8" parse=true>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<#include "/include/meta.ftl" encoding="utf-8" parse=true>
		<script language="javascript">
			$(document).ready(
				function(){

				}
			)
	
		</script>
	</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
<table border="0" width="100%" id="table3" cellspacing="5" bgcolor="#DBDBDB">
	<tr>
		<td>
		<table border="0" width="100%" id="table4" cellspacing="0" cellpadding="0">
			<tr>
				<td height="20">
				<div id="foot-links"><a href="#">关于東東設會</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">帮助中心</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a target="_blank" href="#">诚征英才</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">账户安全</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">联系我们</a></div>
				</td>
				<td align="right"><span><font color="blue">当前在线用户：${Session.onlines} 个 &nbsp;&nbsp;<b>上次登录时间：<#if Session.lastime?exists>${Session.lastime} IP：${Session.ip} 地点：${Session.location1} </#if></b></font></span></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<table border="0" width="100%" id="table2" cellspacing="0" cellpadding="0" background="${images}/top_line.jpg" height="14">
	<tr>
		<td>　</td>
	</tr>
</table>
</body>
</html>