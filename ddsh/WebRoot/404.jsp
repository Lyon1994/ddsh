<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>404 - 页面不存在</title>
		<style type="text/css">
			BODY {	PADDING-RIGHT: 0px; PADDING-LEFT: 35px; BACKGROUND: url(/pss/images/photoback.gif) repeat-x left top; PADDING-BOTTOM: 0px; MARGIN: 0px; FONT: 12px Arial, Helvetica, sans-serif; COLOR: #333; PADDING-TOP: 35px}
			A {	COLOR: #007ab7; TEXT-DECORATION: none}
			A:hover {COLOR: #007ab7; TEXT-DECORATION: none}
			A:hover {COLOR: #de1d6a}
			.hidehr {DISPLAY: none}
			.show12 {PADDING-RIGHT: 0px; DISPLAY: block; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 5px 0px; PADDING-TOP: 0px}
			.show13 {PADDING-RIGHT: 0px; DISPLAY: block; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 5px 0px; PADDING-TOP: 0px}
			.show12 A {	BORDER-RIGHT: #bfdeed 1px solid; PADDING-RIGHT: 6px; BORDER-TOP: #bfdeed 1px solid; DISPLAY: inline-block; PADDING-LEFT: 6px; BACKGROUND: #d8ebf4; PADDING-BOTTOM: 2px; OVERFLOW: hidden; BORDER-LEFT: #bfdeed 1px solid; LINE-HEIGHT: 17px; PADDING-TOP: 2px; BORDER-BOTTOM: #bfdeed 1px solid; HEIGHT: 16px}
			.show13 A {	BORDER-RIGHT: #bfdeed 1px solid; PADDING-RIGHT: 6px; BORDER-TOP: #bfdeed 1px solid; DISPLAY: inline-block; PADDING-LEFT: 6px; BACKGROUND: #d8ebf4; PADDING-BOTTOM: 2px; OVERFLOW: hidden; BORDER-LEFT: #bfdeed 1px solid; LINE-HEIGHT: 17px; PADDING-TOP: 2px; BORDER-BOTTOM: #bfdeed 1px solid; HEIGHT: 16px}
			.show12 A:hover {	BORDER-RIGHT: #ea5e96 1px solid; BORDER-TOP: #ea5e96 1px solid; BACKGROUND: #fce8f0; BORDER-LEFT: #ea5e96 1px solid; COLOR: #de1d6a; BORDER-BOTTOM: #ea5e96 1px solid; TEXT-DECORATION: none}
			.show13 A:hover {	BORDER-RIGHT: #ea5e96 1px solid; BORDER-TOP: #ea5e96 1px solid; BACKGROUND: #fce8f0; BORDER-LEFT: #ea5e96 1px solid; COLOR: #de1d6a; BORDER-BOTTOM: #ea5e96 1px solid; TEXT-DECORATION: none}
			.show12 A {	FONT-WEIGHT: normal; FONT-SIZE: 12px}
			.show13 A {	BORDER-RIGHT: #ed268c 1px solid; BORDER-TOP: #ed268c 1px solid; BACKGROUND: #dd137b; BORDER-LEFT: #ed268c 1px solid; COLOR: #fff; BORDER-BOTTOM: #ed268c 1px solid}
			.img404 {PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(/pss/images/12630051960.gif) no-repeat left top; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 80px; PADDING-TOP: 0px; POSITION: relative; HEIGHT: 90px}
			H2 {PADDING-RIGHT: 0px; PADDING-LEFT: 0px; FONT-SIZE: 16px; FLOAT: left; PADDING-BOTTOM: 25px; MARGIN: 0px; WIDTH: 80%; LINE-HEIGHT: 0; PADDING-TOP: 25px; BORDER-BOTTOM: #ccc 1px solid; POSITION: relative}
			H3.wearesorry {	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 10px; LEFT: 117px; PADDING-BOTTOM: 0px; MARGIN: 0px; COLOR: #ccc; LINE-HEIGHT: 10px; PADDING-TOP: 0px; POSITION: absolute; TOP: 70px}
			.content {	CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; FONT-SIZE: 13px; LEFT: 80px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 80%; LINE-HEIGHT: 19px; PADDING-TOP: 0px; POSITION: relative; TOP: -30px}
			.content UL {PADDING-RIGHT: 35px; PADDING-LEFT: 35px; PADDING-BOTTOM: 20px; MARGIN: 0px; PADDING-TOP: 10px}
			.show12 UL {PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px 0px 0px 20px; PADDING-TOP: 0px; LIST-STYLE-TYPE: none}
			.show14 UL LI {	MARGIN-BOTTOM: 5px}
			
			H4 { font: 9pt/12pt 宋体 }
			
			.search {
				position: absolute;
				width: 650px;
				top: 260px;
				left: 250px;
			}
			
			
			
			.sp {
				BACKGROUND: url(/pss/images/s.png)
			}
			#fw {
				MARGIN: 0px auto; WIDTH: 451px; HEIGHT: 42px
			}
			#fc {
				PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 5px; WIDTH: 442px; PADDING-TOP: 5px; POSITION: relative; HEIGHT: 33px
			}
			#fc INPUT {
				BORDER-TOP-STYLE: none; FONT-FAMILY: Arial,sans-serif; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none
			}
			#qc {
				BORDER-RIGHT: #6a8aae 1px solid; PADDING-RIGHT: 2px; PADDING-LEFT: 2px; FLOAT: left; PADDING-BOTTOM: 3px; WIDTH: 356px; PADDING-TOP: 3px; POSITION: relative
			}
			#fc #query {
				BORDER-RIGHT: #fff 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: #fff 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 1.6em; BACKGROUND: none transparent scroll repeat 0% 0%; PADDING-BOTTOM: 0px; MARGIN: -1px 0px; BORDER-LEFT: #fff 1px solid; WIDTH: 326px; PADDING-TOP: 2px; BORDER-BOTTOM: #fff 1px solid; HEIGHT: 22px
			}
			#aca {
				BACKGROUND-POSITION: -415px -3px; RIGHT: 2px; OVERFLOW: hidden; WIDTH: 26px; CURSOR: pointer; TEXT-INDENT: -9999em; PADDING-TOP: 26px; POSITION: absolute; TOP: 3px; HEIGHT: 0px
			}
			#fc #qb {
				PADDING-RIGHT: 0px; BACKGROUND-POSITION: right -50px; PADDING-LEFT: 1px; FONT-WEIGHT: bold; FONT-SIZE: 1.4em; PADDING-BOTTOM: 0px; MARGIN: 0px; WORD-SPACING: 4px; WIDTH: 81px; CURSOR: pointer; COLOR: #fff; PADDING-TOP: 2px; HEIGHT: 33px; _margin-left: -3px
			}
			#fa {
				FONT-SIZE: 1.2em; LEFT: 100%; WIDTH: 5em; POSITION: absolute; TOP: 13px
			}
			
			
			
			
			#opciones {
				Z-INDEX: 7000; POSITION: fixed; PADDING-BOTTOM: 10px; PADDING-LEFT: 10px; WIDTH: 120px; PADDING-RIGHT: 10px; FONT: 12px/140% Arial, Helvetica, sans-serif; BACKGROUND: #e7e7e7; COLOR: #999; TOP: 0px; RIGHT: 0px; PADDING-TOP: 10px
			}
			#opciones H2 {
				BORDER-BOTTOM: #fff 1px solid; PADDING-BOTTOM: 3px; MARGIN: 0px 0px 3px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; COLOR: #666; FONT-SIZE: 16px; PADDING-TOP: 0px
			}
			#opciones H3 {
				PADDING-BOTTOM: 0px; TEXT-INDENT: 0px; MARGIN: 3px 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 15px; COLOR: #666666; PADDING-TOP: 0px
			}
			#opciones P {
				FONT-SIZE: 12px; text-align: center;
			}
			#opciones A {
				COLOR: #999; TEXT-DECORATION: none
			}
			#opciones A:hover {
				BACKGROUND: #666666; COLOR: #fff
			}
			#settings {
				Z-INDEX: 8000; POSITION: fixed; TEXT-INDENT: -99999px; WIDTH: 43px; DISPLAY: block; BACKGROUND: url(erro/opciones.gif) no-repeat 0px 0px; HEIGHT: 43px; TOP: 0px; CURSOR: pointer; RIGHT: 0px
			}
			#settings:hover {
				BACKGROUND: url(/pss/images/opciones.gif) no-repeat 0px -86px
			}
			.cerrar {
				BACKGROUND: url(/pss/images/opciones.gif) no-repeat 0px -43px!important;
			}

		</style>
		<script language="JavaScript" src="/pss/js/jquery/jquery-1.3.2.min.js"></script>
		<SCRIPT type=text/javascript> 
		$(document).ready(function(){
		  $('#opciones').hide();
					$('#settings').click(function(){
						$('#opciones').slideToggle();
						$(this).toggleClass("cerrar");
				
		    });
		  });
		</SCRIPT>

	</head>
<body>
	
	<H1 class=hidehr>当前在竹枫综合业务平台上找不到你要的页面。</H1>
	<DIV class=img404>　</DIV>
	<H2>抱歉，找不到您要的页面……</H2>
	<DIV class=content>您正在搜索的页面可能已经删除、更名或暂时不可用。</div>
	<H3 class=wearesorry>We're sorry but the page your are looking for is Not 
	Found...</H3>
	<DIV class=content>
	<code><br>请尝试以下操作：</code>   
	  <UL>
	  <LI><A title=返回首页重新查找该资源 href="<%=request.getContextPath() %>"><font color="#ff0000">返回首页进行查找</font></A> 
	  <LI><A title=返回上一个页面 href="javascript:history.back(-1)">返回上一页</A></LI>
	  <LI>确保浏览器的地址栏中显示的网站地址的拼写和格式正确无误
	  <LI>当你点击某个链接时，它可能已过期。</LI>
	</UL>
	 
	<h4>HTTP 错误 404 - 文件或目录未找到。<br>Internet 信息服务 (IIS)</h4>
	<hr>
	<p>技术信息（为技术支持人员提供）</p>
	<ul>
	<li>转到 <a href="http://go.microsoft.com/fwlink/?linkid=8180">Microsoft 产品支持服务</a>并搜索包括&ldquo;HTTP&rdquo;和&ldquo;404&rdquo;的标题。</li>
	<li>打开&ldquo;IIS 帮助&rdquo;（可在 IIS 管理器 (inetmgr) 中访问），然后搜索标题为&ldquo;网站设置&rdquo;、&ldquo;常规管理任务&rdquo;和&ldquo;关于自定义错误消息&rdquo;的主题。</li>
	</ul>
	</DIV>
	<SPAN style="VISIBILITY: hidden"></SPAN>
	<div id="404" class="search">
	<form action="search.zf" name="search">
	<div id="fw">
	    <div id="fc" class="sp">
	    <div id="qc">
	    <input type="hidden" name="catid" value="all" id="type"/>
	    <input type="hidden" name="dosubmit" value="1" />
	    <input type="text" id="query" name="title" autocomplete="off" />
	    <div id="aca" class="sp">▼</div></div>
	    <input type="submit" value="搜 索" id="qb" class="sp" />
	    </div>
	 </div>
	 
	</form>
	</div>
	 
	<DIV id=settings>Settings</DIV>
	<DIV id=opciones>
	<p>&nbsp;&nbsp; </p>
	<p>&nbsp;&nbsp; </p>
	<p>&nbsp;&nbsp; </p>
	<p><a href="#">官方网站</a></p>
	<p><a href="#">邮件系统</a></p>
	<p><a href="#">流程系统</a></p>
	<p><a href="#">财务系统</a></p>
	<p><a href="#">在线服务</a></p>
	<p><a href="#" target="_blank">模板下载</a></p>
	<p><a href="#">视频教程</a></p>
	<p>&nbsp;&nbsp; </p>
	<p> &nbsp;&nbsp;</p>
	<p> &nbsp;&nbsp;</p>
	<p>&nbsp;&nbsp; </p>
	<p> &nbsp;&nbsp;</p>
	<p> &nbsp;&nbsp;</p>
	<p>&nbsp;&nbsp; </p>
	<p> &nbsp;&nbsp;</p>
	<p> &nbsp;&nbsp;</p>
	<p>&nbsp;&nbsp; </p>
	<p> &nbsp;&nbsp;</p>
	<p> &nbsp;&nbsp;</p>
	<p>&nbsp;&nbsp; </p>
	<p> &nbsp;&nbsp;</p>
	<p> &nbsp;&nbsp;</p>
	</DIV>
	 
</body>
</html>