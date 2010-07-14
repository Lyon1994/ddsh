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

    	<title>库存列表</title>
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
			function uploadQuick()
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
				var returnstr;
        		returnstr = window.showModalDialog('../html/inventory_upload_more.jsp?ids='+str,'',"dialogHeight: 500px; dialogWidth: 750px;center: yes; help: no;resizable: no; status: no;");
				load('');
			}

			function upload()
			{
				var str="";
				var m=0;
				var sel = document.getElementsByName("row");
				for(var i=0;i<sel.length;i++)
			    {
			   		if(sel[i].checked==true)
			   		{
			   			str+=sel[i].value+",";
			   			m=m+1;
			   		}

			    }
			    if(str==""){
					alert("请至少选择一条记录");
					return false;
				}
				if(m>1)
			    {
			    	alert("请选择一条记录!不能多选操作");
					return false;
			    }
				var returnstr;
        		returnstr = window.showModalDialog('../html/inventory_upload.jsp?id='+str.replace(',',''),'',"dialogHeight: 500px; dialogWidth: 750px;center: yes; help: no;resizable: no; status: no;");
				load('');

			}
			function load(param)
			{
				var b="<table class='maintab_content_table' width='100%'><thead><tr class='maintab_content_table_title'><th width='1%'><input type='checkbox' name='select' onclick='ck()'/></th><th>条形码</th><th>物品名称</th><th>设计师</th><th>数量</th><th>单价</th><th>总价</th><th>型号</th><th>规格</th><th>材料</th><th>产地</th><th>处理日期</th><th>处理人</th></tr></thead><tbody>";
				var a="</tbody></table>";
				$.ajax({
					 	url: 'inventory!count.zf?type=1&t='+new Date().getTime(),
					 	type: 'POST',
					 	dataType: 'json',
					 	error: function(){alert('error');},
					 	success: function(json){
							//蓝色主题
							$('#list').jpage({dataBefore:b,dataAfter:a,dataStore: null,themeName:'blue',totalRecord:json[0],proxyUrl:'inventory!result.zf?t='+new Date().getTime()+'&type=1',openCookies:false,
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
	</head>

<body>
	<!--标题开始-->
	<table border="0" width="100%" cellspacing="0" cellpadding=" height="25">
	<tr class="tree_title_txt">
	<td nowrap width="100%" class="tree_title_txt" valign="middle" id="cwCellTopTitTxt">
	库存列表</td>
	</tr>
	</table>
	<!--标题结束-->
	<div style="width:50%;padding:0px;marging:0px">
		<table border="0" width="100%" cellspacing="0" cellpadding=" height="30">
			<tr>
				<td>
					<!--<img src="${images}/mup.gif" onclick="uploadQuick()" alt="批量上架" style="cursor:hand"/>-->
					<img src="${images}/sup.gif" onclick="upload()" alt="单品上架" style="cursor:hand"/>
					<!--<img src="${images}/mreturn.gif" onclick="upload()" alt="批量退货" style="cursor:hand"/>
					<img src="${images}/return.gif" onclick="upload()" alt="单品退货" style="cursor:hand"/>-->
					<img src="${images}/export.gif"/>
					<img src="${images}/printer.gif"/>
				</td>
			</tr>
		</table>
	</div>
	<div style="width:100%;padding:0px;marging:0px" id='list'></div>

</body>

</html>