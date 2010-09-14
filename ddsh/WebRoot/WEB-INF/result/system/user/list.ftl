<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#include "/include/header.ftl" encoding="utf-8" parse=true>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<#include "/include/meta.ftl" encoding="utf-8" parse=true>
    	<title>用户列表</title>

		<script language="javascript" src="${js}/common-min.js"></script>
		<script language="javascript" src="${jquery_lib}/jquery.cookie.min.js"></script>
    	<script language="javascript" src="${jquery_jpage}/jquery.jpage.js"></script>

    	<link href="${jquery_jpage}/theme/blue/css/jpage.css" rel="stylesheet" type="text/css">
		<script language="javascript">
			<!--
			prefix='user';
			function load(param)
			{
				var b="<table class='maintab_content_table' width='100%'><thead><tr class='maintab_content_table_title'><th width='1%'><input type='checkbox' name='select' onclick='ck()'/></th><th>用户编号</th><th>名称</th><th>品牌</th><th>密码</th><th>类型</th><th>状态</th><th>手机号码</th><th>电话</th><th>传真</th><th>邮件</th><th>联系地址</th><th>验证日期</th></tr></thead><tbody>";
				var a="</tbody></table>";
				$.ajax({
					 	url: prefix+'!count.zf?type=1&t='+new Date().getTime(),
					 	type: 'POST',
					 	dataType: 'json',
					 	error: function(){alert('error');},
					 	success: function(json){
				//蓝色主题
				$('#list').jpage({dataBefore:b,dataAfter:a,dataStore: null,themeName:'blue',totalRecord:json[0],proxyUrl:prefix+'!result.zf?t='+new Date().getTime()+'&type=1',openCookies:false,
				showMode:'full',ajaxParam:param,actionAfter:editbox}); 
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
				<td height="30" valign="bottom">
					<a href="${base}/html/regedit_user_2.html"><img src="${images}/add.gif" style="cursor:hand"/></a>
					<img src="${images}/delete.gif" onclick="deletes()"  style="cursor:hand"/>
					<img src="${images}/export.gif" onclick="exports()"  style="cursor:hand"/>
					<img src="${images}/printer.gif" style="cursor:hand"/>
				</td>
			</tr>
		</table>
	</div>
	<div style="width:100%;padding:0px;marging:0px" id='list'></div>

</body>

</html>