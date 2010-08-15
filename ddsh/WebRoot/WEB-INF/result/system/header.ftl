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
		<script language="javascript" src="${js}/jquery/jquery-1.4.2.min.js"></script>
		<script language="javascript" src="${js}/jquery/jquery-plugins/jQuery.FillOptions.js"></script>
		<script src="${js}/Security.js"></script>
		<script language="javascript">
			$(document).ready(
				function(){
					var now = new Date();
					var hour = now.getHours();
					if(hour < 6){$("#time").append("<font color='blue'><b>凌晨好！</b></font>")} 
					else if (hour < 9){$("#time").append("<font color='blue'><b>早上好！</b></font>")} 
					else if (hour < 12){$("#time").append("<font color='blue'><b>上午好！</b></font>")} 
					else if (hour < 14){$("#time").append("<font color='blue'><b>中午好！</b></font>")} 
					else if (hour < 17){$("#time").append("<font color='blue'><b>下午好！</b></font>")} 
					else if (hour < 19){$("#time").append("<font color='blue'><b>傍晚好！</b></font>")} 
					else if (hour < 22){$("#time").append("<font color='blue'><b>晚上好！</b></font>")} 
					else {$("#time").append("<font color='blue'><b>夜里好！</b></font>")} 

					$("#store").FillOptions("system/dic!load.zf?parent=store",{datatype:"json",textfield:"name",valuefiled:"value"});
					$("#store").change(function(){
				         if($("#store").val()=='01')
				                 alert('正在开发...');
				         else
				                 alert('正在开发...');
			         })
				}
			)
	
		</script>
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
							<td align="right"><span id='time'></span>&nbsp;<span><font color="blue"><b>欢迎您：<#if Session.userid?exists>${Session.typename} ${Session.name}(${Session.userid})</#if></b></font></span></td>
						</tr>
						<tr>
							<td align="right"><br>&nbsp;【<a href="#" onclick="window.parent.document.getElementById('main').contentWindow.location='main.zf'; ">商户首页</a>】&nbsp;<span>门 店：</span>&nbsp;<select name="store" id="store"></select>&nbsp;【<a href="javascript:parent.location='logout.zf'">退出系统</a>】</td>
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