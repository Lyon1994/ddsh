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
        <link href="${css}/mainstyle.css" rel="stylesheet" type="text/css">

    	<title></title>
	</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">


<table border="0" width="217" id="table3" cellspacing="0" cellpadding="0">
	<tr>
		<td><img border="0" src="${images}/menu_bg1.jpg" width="217" height="11"></td>
	</tr>

		
		
		
		<#if Session["menu"]?exists>
					<#assign menu = Session["menu"]>
					<#list menu?keys as name>   
						<tr>
		<td background="${images}/menu_bg2.jpg">
		<table border="0" width="100%" id="table4" cellspacing="0" cellpadding="0" background="${images}/menu_btn_bg.jpg" height="46">
			<tr>
				<td>
				<table border="0" width="217" id="table5" cellspacing="0" cellpadding="0">
					<tr>
						<td width="70">　</td>
						<td><b><a onclick="javascript:parent.main.frame.location.href='${menu.get(name)}'" style="cursor:hand;">${name}</a></b></td>
					</tr>
				</table>
				</td>
			</tr>
					</table>
		</td>
	</tr>
					</#list>
				</#if>
		
			

	<tr>
		<td><img border="0" src="${images}/menu_bg3.jpg" width="217" height="10"></td>
	</tr>
</table>

</body>

</html>