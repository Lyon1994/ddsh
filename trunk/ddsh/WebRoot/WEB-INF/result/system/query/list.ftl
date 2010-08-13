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

    	<title>销售查询</title>
		<link href="${css}/mainstyle.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="${jquery}/jquery-1.4.2.min.js"></script>
		<script language="javascript" src="${jquery_lib}/jquery.cookie.min.js"></script>
    	<script language="javascript" src="${jquery_jpage}/jquery.jpage.js"></script>

    	<link href="${jquery_jpage}/theme/blue/css/jpage.css" rel="stylesheet" type="text/css">
		<script language="javascript">
			<!--
			var b=false;

			function ck()
			{
				if(b)
					b=false;
				else
					b=true;
				var sel = document.getElementsByName("row");
			    for (var i=0;i<sel.length;i++ )
		    		sel[i].checked = b;  
			}

			
			function load(param)
			{
				var b="<table class='maintab_content_table' width='100%'><thead><tr class='maintab_content_table_title'><th width='1%'><input type='checkbox' name='select' onclick='ck()'/></th><th>交易号</th><th>条形码</th><th>物品名称</th><th>设计师</th><th>折扣</th><th>数量</th><th>单价</th><th>日期</th></tr></thead><tbody>";
				var a="</tbody></table>";
				
				var userid=$('#userid').attr('value');
				var barcode=$('#barcode').attr('value');
				var name=$('#name').attr('value');
				var begin=$('#begin').attr('value');
				var end=$('#end').attr('value');
				var transaction=$('#transaction').attr('value');
				var para='transaction='+transaction+'&userid='+userid+'&barcode='+barcode+'&name='+name+'&begin='+begin+'&end='+end+'&t='+new Date().getTime();

				$.ajax({
					 	url: 'query!count.zf',
					 	type: 'POST',
					 	dataType: 'json',
					 	data:para,//参数设置
					 	error: function(){alert('error');},
					 	success: function(json){
							//蓝色主题
							$('#list').jpage({dataBefore:b,dataAfter:a,dataStore: null,themeName:'blue',totalRecord:json[0],proxyUrl:'query!result.zf?t='+new Date().getTime()+'&type=0',openCookies:false,
							showMode:'full',ajaxParam:para}); 
					 	}
					}); 
			}
			function exports()
			{
				var userid=$('#userid').attr('value');
				var barcode=$('#barcode').attr('value');
				var name=$('#name').attr('value');
				var begin=$('#begin').attr('value');
				var end=$('#end').attr('value');
				var transaction=$('#transaction').attr('value');
				var para='transaction='+transaction+'&userid='+userid+'&barcode='+barcode+'&name='+name+'&begin='+begin+'&end='+end+'&t='+new Date().getTime();

				window.open('query!export.zf?'+para);
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
	<input type="hidden" id='transaction' value='<#if Request.transaction?exists>${Request.transaction}</#if>'/>
	<input type="hidden" id='userid' value='<#if Request.userid?exists>${Request.userid}</#if>'/>
	<input type="hidden" id='barcode' value='<#if Request.barcode?exists>${Request.barcode}</#if>'/>
	<input type="hidden" id='name' value='<#if Request.name?exists>${Request.name}</#if>'/>
	<input type="hidden" id='begin' value='<#if Request.begin?exists>${Request.begin}</#if>'/>
	<input type="hidden" id='end' value='<#if Request.end?exists>${Request.end}</#if>'/>
	<!--标题开始-->
	<table border="0" width="100%" cellspacing="0" cellpadding=" height="25">
	<tr class="tree_title_txt">
	<td nowrap width="100%" class="tree_title_txt" valign="middle" id="cwCellTopTitTxt">
	销售查询列表</td>
	</tr>
	</table>
	<!--标题结束-->
	<div style="width:50%;padding:0px;marging:0px">
		<table border="0" width="100%" cellspacing="0" cellpadding=" height="30">
			<tr>
				<td>
					<img src="${images}/export.gif" onclick="exports()" style="cursor:hand" />
					<img src="${images}/printer.gif"  style="cursor:hand" />
				</td>
			</tr>
		</table>
	</div>
	<div style="width:100%;padding:0px;marging:0px" id='list'></div>

</body>

</html>