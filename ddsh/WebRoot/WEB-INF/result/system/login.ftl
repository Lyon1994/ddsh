<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#include "/include/header.ftl" encoding="utf-8" parse=true>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<#include "/include/meta.ftl" encoding="utf-8" parse=true>
    	<title>用户登录</title>

		
		<script type=text/javascript src="http://fw.qq.com/ipaddress" charset=gb2312></script>
		<script language="javascript">
			var isIE=!!window.ActiveXObject;
			var isIE6=isIE&&!window.XMLHttpRequest;
			var isIE8=isIE&&!!document.documentMode;
			var isIE7=isIE&&!isIE6&&!isIE8;

			$(document).ready(
				function(){
						$("#userid").focus();
						$('#refresh').click(function(){
							$('#image').attr('src','captcha.zf?random='+Math.random());
						});
						$("body").bind('keyup',function(event) {
							if(event.keyCode==13){
								document.login.submit();
							}   
						});
						$("#info").attr("value",IPData[0]+","+IPData[1]+","+IPData[2]+","+IPData[3]);
						if(isIE){
							if(isIE6){
								$("#explorer").append("<font color='red'>经检测您的浏览器太老了<br>为了更好的体验,建议您使用IE8浏览器!</font>");
							}else if(isIE8){
								$("#explorer").append("<font color='green'>经检测您的浏览器完全符合本系统!</font>");
							}else if(isIE7){
								$("#explorer").append("<font color='red'>经检测您的浏览器太老了<br>为了更好的体验,建议您使用IE8浏览器!</font>");
							}
						}else
							$("#explorer").append("<font color='red'>经检测您的浏览器为非IE<br>为了更好的体验,建议您使用IE8浏览器!</font>");
				}
			)
		</script>
		<style type="text/css">
			body {
			text-align: center;
			color: #333;
			line-height:30px;
			}
			.text {
			margin:0px;
			padding:20px;
			}
			.text2 {
			font-size:14px;
			line-height:18px;
			}
			
			#diyheader {
			margin-right: auto;
			margin-left: auto;
			padding: 0px;
			width: 825px;
			height: 30px;
			text-align: left;
			}
			#diycontain {
			margin-left: auto;
			margin-right: auto;
			width:825px;
			}
			#diymainbg {
			float: left;
			padding: 0px;
			width:100%; 
			height:100%;
			background: #ffffff;
			}
			#diyleft {
			float: left;
			margin: 0px 0px 0px 0px;
			padding: 0px;
			width: 545px;
			text-align:left;
			background-image:url(#);
			height:100%;
			}
			#diyright {
			float: left;
			margin: 0px 0px 0px 0px;
			padding: 0px;
			width: 280px;
			text-align:left;
			}
			#diyright2 {
			float: right;
			margin: 0px 0px 0px 0px;
			padding: 0px;
			width: 78px;
			text-align:left;
			background: #00ff00;
			background-image:url(#);
			height:100%;
			}
			#diyfooter {
			clear: both;
			margin-right: auto;
			margin-left: auto;
			padding: 0px;
			width:825px;
			height: 60px;
			}
		</style>
	</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">

	<div id="diyheader"></div>
	
	<div id="diycontain">
	<div id="diymainbg">
		
	<div id="diyleft">
	<table border="0" width="100%" id="table1">
		<tr>
			<td>
			<img border="0" src="${images}/logo.gif" width="274" height="50"></td>
		</tr>
		<tr>
			<td>　</td>
		</tr>
		<tr>
			<td><img border="0" src="${images}/ddpic.jpg"></td>
		</tr>
		<tr>
			<td>　</td>
		</tr>
		<tr>
			<td>
			<div align="center">
				<table border="0" width="90%" id="table7">
					<tr>
			<td class="text2" align="left"><b class="text2">東東設會管理平台</b><p class="text2" style="line-height:28px;"><br>
			東東設會管理平台是东东设会全新打造的一个应用平台，通过这个平台，第三方设计师的信息和商品管理被全自动的展示和了解，实时把握商品信息，方便快捷管理商品，赶快加入我们吧。<br>
			<br>
			加入东东社会管理平台的优势：<br>
			●&nbsp;商铺动态实时通知 <br>
			●&nbsp;管理和了解第一手商品信息 <br>
			●&nbsp;我的钱包功能，了解收支状况</td>
					</tr>
					<tr>
						<td>　</td>
					</tr>
				</table>
			</div>
			</td>
		</tr>
		<tr>
			<td class="text2">　</td>
		</tr>
	</table>
	</div>
	<form name="login" action='submit.zf' method='post'>
	<input type='hidden' name='info' id='info'/>
	<div id="diyright">
	<table border="0" width="100%" id="table2">
		<tr>
			<td>
			<p align="right">帮助中心</td>
		</tr>
	</table>
	<table border="0" width="100%" id="table3" style="border-collapse:collapse">
		<tr>
			<td style="border: 1px solid #9EB2BD;height:495px;padding:10px;background-image: url('images/reg_bg.gif'); background-repeat: no-repeat; background-position: 0% 100%;" valign="top">
			<table border="0" width="100%" id="table4">
				<tr>
					<td>
					<img border="0" src="${images}/logo_login.gif" width="118" height="31"></td>
				</tr>
				<tr>
					<td>
					<table border="0" width="100%" id="table5">
						<tr>
							<td height="35" class="text2">用户名：</td>
							<td><input type="text" id="userid" name="userid" size="25" style="width:160px;height:18px;"></td>
						</tr>
						<tr>
							<td height="35" class="text2">密&nbsp;&nbsp;&nbsp; 码：</td>
							<td><input type="password" name="password" size="25" style="width:160px;height:18px;"></td>
						</tr>
						<tr>
							<td height="35" class="text2">验证码：</td>
							<td><input type="text" name="code" size="25" style="width:160px;height:18px;"></td>
						</tr>
						<tr>
							<td>　</td>
							<td><font color="#808080">输入以下字符，不区分大小写</font></td>
						</tr>
						<tr>
							<td>　</td>
							<td><img id='image' src="captcha.zf"  align="absMiddle"/></td>
						</tr>
						<tr>
							<td>　</td>
							<td><a id='refresh' style="cursor:hand;">看不清换一张</a></td>
						</tr>
					</table>
					</td>
				</tr>
				<tr>
					<td height="60">
					<p align="center">
					<img border="0" src="${images}/btn_login.gif"   style="cursor:hand;width:129;height:35" onclick="javascript:document.login.submit();"></td>
				</tr>
				<tr>
					<td><hr size="1"></td>
				</tr>
				<tr>
					<td><b class="text2"><br>还没東東設會账户？</b><br>
					<br>
					<a href="html/regedit_user.html">立即免费注册</a></td>
				</tr>
				<tr>
					<td><b class="text2"><br><span id='explorer'></span></b><br>
					<br>
					立刻下载 &nbsp;<a target='_blank' href="http://www.google.com/toolbar/ie8/intl/zh-CN/install.html">Internet Explorer 8</a>
					<br>
					系统建议<br>
					分辨率：1024*768以上
					</td>
				</tr>
				<tr>
					<td>　</td>
				</tr>
				<tr>
					<td>　</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	<p><br></p>
	</div>
	</form>
	
	
	</div>
	</div>
	
	<div id="diyfooter">
		<table border="0" width="100%" id="table6">
			<tr>
				<td><hr size="1"></td>
			</tr>
			<tr>
				<td height="30"><div id="foot-links"><a href="#">关于東東設會</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">帮助中心</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a target="_blank" href="#">诚征英才</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">账户安全</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">联系我们</a></div></td>
			</tr>
			<tr>
				<td>
				<p align="center">Copyright &copy; 2010 DDSOHO. All Rights 
				Reserved 東東設會 版权所有&nbsp;系统支持：<a target="_blank" href="http://www.zf-info.com">上海竹枫软件</a>&nbsp;TEL:13761844061</td>
			</tr>
		</table>
	</div>

</body>
</html>