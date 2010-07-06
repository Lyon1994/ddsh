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

	<table border="0" width="231" id="table1" cellspacing="0" cellpadding="0" height="568">
		<tr>
			<td background="${images}/tree.jpg" valign="top">
			<table border="0" width="100%" id="table2">
				<tr>
					<td height="20">　</td>
					<td height="20" width="154">　</td>
				</tr>
				<#if Session["menu"]?exists>
					<#assign menu = Session["menu"]>
					<#list menu?keys as name>   
							<tr>
								<td height="44">　</td>
								<td height="44" width="154"><a onclick="javascript:parent.main.frame.location.href='${menu.get(name)}'" style="cursor:hand;">${name}</a></td>
							</tr>
					</#list>
				</#if>
				
				<tr>
					<td height="44">　</td>
					<td height="44" width="154"> </td>
				</tr>
				<tr>
					<td height="44">　</td>
					<td height="44" width="154">　</td>
				</tr>
				<tr>
					<td height="44">　</td>
					<td height="44" width="154">　</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>

</body>

</html>