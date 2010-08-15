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

    	<title>设计师每月统计分析</title>
		<link href="${css}/mainstyle.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="${jquery}/jquery-1.4.2.min.js"></script>
		<script language="javascript" src="${jquery_lib}/jquery.cookie.min.js"></script>
    	<script language="javascript" src="${jquery_jpage}/jquery.jpage.js"></script>

    	<link href="${jquery_jpage}/theme/blue/css/jpage.css" rel="stylesheet" type="text/css">
		<script language="javascript">
			<!--
			var b=false;

			function load(param)
			{
				var b="<table class='maintab_content_table' width='100%'><thead><tr class='maintab_content_table_title'><th>设计师编号</th><th>月份</th><th>销售额</th></tr></thead><tbody>";
				var a="</tbody></table>";
				$.ajax({
					 	url: 'total!count.zf?type=0&t='+new Date().getTime(),
					 	type: 'POST',
					 	dataType: 'json',
					 	error: function(){alert('error');},
					 	success: function(json){
							//蓝色主题
							$('#list').jpage({dataBefore:b,dataAfter:a,dataStore: null,themeName:'blue',totalRecord:json[0],proxyUrl:'total!result.zf?t='+new Date().getTime()+'&type=0',openCookies:false,
							showMode:'full',ajaxParam:param}); 
					 	}
					}); 
			}
			function exports()
			{
				window.open('total!export.zf?type=0&t='+new Date().getTime());
			}
			$(document).ready(
				function(){
					//demo1带参数
					var param = {
						'money':encodeURI($('#money').val())
					};
					load(param);
				}
			)
			//-->
		</script>

	</head>

<body>
	<!--标题开始-->
	<table border="0" width="100%" cellspacing="0" cellpadding=" height="25">
	<tr class="tree_title_txt">
	<td nowrap width="100%" class="tree_title_txt" valign="middle" id="cwCellTopTitTxt">
	设计师月销售统计列表</td>
	</tr>
	</table>
	<!--标题结束-->
	<div style="width:50%;padding:0px;marging:0px">
		<table border="0" width="100%" cellspacing="0" cellpadding=" height="30">
			<tr>
				<td height="30" valign="bottom">
					<img src="${images}/export.gif"  onclick="exports()" style="cursor:hand"/>
					<img src="${images}/printer.gif" style="cursor:hand"/>
				</td>
			</tr>
		</table>
	</div>
	<div style="width:100%;padding:0px;marging:0px" id='list'></div>

</body>

</html>