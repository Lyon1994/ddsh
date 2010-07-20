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
	</head>
<body topmargin="0" leftmargin="5" rightmargin="0" bottommargin="0">
	<script> 
	function autoResize()
	{try{document.all["frame"].style.height=document.body.offsetHeight;}catch(e){}}
	</script>
	<iframe name="frame" src="${base}/html/<#if Request.page?exists>${Request.page}</#if>.html" style="funny:expression(autoResize())" align="left" height="550" width="100%" marginwidth="0" marginheight="0" scrolling="auto" FRAMEBORDER="0"></iframe> 
</body>



</html>