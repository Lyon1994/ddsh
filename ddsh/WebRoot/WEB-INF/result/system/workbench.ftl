<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#include "/include/header.ftl" encoding="utf-8" parse=true>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
	    <#include "/include/meta.ftl" encoding="utf-8">
	    <title>东东设会在线销售管理系统</title>
		<script type="text/javascript">   
		<!--     
		    window.onbeforeunload = onbeforeunload_handler;   
		    window.onunload = onunload_handler;   
		    function onbeforeunload_handler(){   
		       window.event.returnValue = "为了账号安全,退出请点系统的【退出按钮】！";
		    }   
		       
		    function onunload_handler(){   
		        //var warning="谢谢光临";   
		        //alert(warning); 
		        //window.location.href='logout.zf';
		    }   
		// -->   
		</script>  
	</head>
	<frameset framespacing="0" border="0" frameborder="0" rows="101,*,40">
		<frame name="banner" scrolling="no" noresize target="contents" src="header.zf">
		<frameset cols="240,*">
			<frame id='contents' name="contents" src="left.zf">
			<frame id='main' name="main" src="main.zf" scrolling="no">
		</frameset>
		<frame name="bottom" scrolling="no" noresize target="contents" src="footer.zf">
		<noframes>
		<body>
	 
		<p>此网页使用了框架，但您的浏览器不支持框架。</p>
	 
		</body>
		</noframes>
	</frameset>

</html> 