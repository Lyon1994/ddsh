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

    	<title>用户列表</title>
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
			function deletes()
			{
				var str="";
				var sel = document.getElementsByName("row");
			    for(var i=0;i<sel.length;i++)
			    {
			   		if(sel[i].checked==true)
			   			str+=sel[i].value+",";
			    }
				if(str==""){
					alert("请至少选择一条记录");
					return false;
				}
				if(window.confirm("确定要删除这些用户吗？")){
					$.ajax({
					 	url: 'user!del.zf?ids='+str+'&t='+new Date().getTime(),
					 	type: 'POST',
					 	dataType: 'json',
					 	error: function(){alert('error');},
					 	success: function(json){
							alert(json.info); 
							load('');
					 	}
					}); 
				}
			}
			
			function load(param)
			{
				var b="<table cellspacing=1 id='data'><thead><tr><th><input type='checkbox' name='select' onclick='ck()'/></th><th>用户编号</th><th>名称</th><th>类型</th><th>手机号码</th><th>电话</th><th>传真</th><th>邮件</th><th>联系地址</th></tr></thead><tbody>";
				var a="</tbody></table>";
				$.ajax({
					 	url: 'user!count.zf?type=1&t='+new Date().getTime(),
					 	type: 'POST',
					 	dataType: 'json',
					 	error: function(){alert('error');},
					 	success: function(json){
							//蓝色主题
							$('#list').jpage({dataBefore:b,dataAfter:a,dataStore: null,themeName:'blue',totalRecord:json[0],proxyUrl:'user!result.zf?t='+new Date().getTime()+'&type=1',openCookies:false,
							showMode:'full',ajaxParam:param}); 
					 	}
					}); 
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
		<style type="text/css">
			#data{font-family:"Lucida Sans Unicode", "Lucida Grande", Sans-Serif;font-size:12px;width:99%;text-align:left;border-collapse:collapse;background:url("http://media.smashingmagazine.com/cdn_smash/images/express-css-table-design/table-images/patternb.png");}
			#data thead tr{background:url("http://media.smashingmagazine.com/cdn_smash/images/express-css-table-design/table-images/patternb-head.png");}
			#data th{font-size:13px;font-weight:normal;border-bottom:1px solid #fff;color:#039;padding:8px;}
			#data td{border-bottom:1px solid #fff;color:#669;border-top:1px solid transparent;padding:8px;}
			#data tbody tr:hover td{color:#339;background:#cdcdee;}
		</style>
	</head>

<body>
	<!--标题开始-->
	<table border="0" width="100%" cellspacing="0" cellpadding=" height="25">
	<tr class="tree_title_txt">
	<td nowrap width="100%" class="tree_title_txt" valign="middle" id="cwCellTopTitTxt">
	人员管理</td>
	</tr>
	</table>
	<!--标题结束-->
	<div style="width:50%;padding:0px;marging:0px">
		<table border="0" width="100%" cellspacing="0" cellpadding=" height="30">
			<tr>
				<td>
					<a href="${base}/html/regedit_user.html"><img src="${images}/add.png"/></a>
					<img src="${images}/delete.png" onclick="deletes()" />
					<img src="${images}/edit.png"/>
					<img src="${images}/export.png"/>
					<img src="${images}/printer.png"/>
				</td>
			</tr>
		</table>
	</div>
	<div style="width:100%;padding:0px;marging:0px" id='list'></div>

</body>

</html>