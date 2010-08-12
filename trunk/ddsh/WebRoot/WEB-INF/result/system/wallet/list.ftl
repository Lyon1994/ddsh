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

    	<title>电子钱包</title>
		<link href="${css}/mainstyle.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="${jquery}/jquery-1.4.2.min.js"></script>
		<script language="javascript" src="${jquery_lib}/jquery.cookie.min.js"></script>
    	<script language="javascript" src="${jquery_jpage}/jquery.jpage.js"></script>

    	<link href="${jquery_jpage}/theme/blue/css/jpage.css" rel="stylesheet" type="text/css">
		<script language="javascript">
			<!--
			var b=false;
			var editHTML;
			var editText;
			function setEditHTML(value){
				editHTML = '<input type="text" class="text_half" value="'+value+'" />';
				editHTML += '&nbsp;<input type="image" onclick="ok(this)" src="${images}/accept.gif" border="0" alt="确定" />';
				editHTML += '&nbsp;<input type="image" onclick="cancel(this)" src="${images}/closs.gif" border="0" alt="关闭" />';
			}
			//取消
			function cancel(cbtn){
				var $obj = $(cbtn).parent(); //'取消'按钮的上一级，即单元格td
				$obj.html($obj.data("oldtxt")); //将单元格内容设为原始数据，取消修改
				$obj.bind("dblclick",function(){ //重新绑定单元格双击事件
					editText = $(this).html();
					setEditHTML(editText);
					$(this).data("oldtxt",editText).html(editHTML).unbind("dblclick");
				});
			}
			
			//修改
			function ok(obtn){
				var $obj = $(obtn).parent(); //'修改'按钮的上一级，即单元格td
				var tdid=$obj.attr("id");
				var trid = $obj.parent().attr("id"); //取得该行数据的ID，此例ID绑定在tr中
				var value = $obj.find("input:text")[0].value; //取得文本框的值，即新数据
				var param='trid='+trid+'&tdid='+tdid+'&value='+value+'&t='+new Date().getTime();
				//alert(tdid);
				//alert(trid);
				//alert(value);
				$.ajax({
					 	url: 'wallet!edit.zf',
					 	type: 'POST',
					 	dataType: 'json',
					 	data:param,
					 	error: function(){alert('error');},
					 	success: function(json){
							alert(json.info); 
							if(json.result==true){
								$obj.data("oldtxt",value); //设置此单元格缓存为新数据
								cancel(obtn); //调用'取消'方法，
								//在此应传'取消'按钮过去，
								//但在'取消'事件中没有用'取消'按钮这个对象,
								//用的只是它的上一级，即td，
								//固在此直接用'修改'按钮替代
							}else{
								cancel(obtn);
							}
							load('');
					 	}
				}); 
			}
			function editbox()
			{
				//绑定事件
				$(".editbox").each(function(){ //取得所有class为editbox的对像
					$(this).bind("dblclick",function(){ //给其绑定双击事件
						editText = $(this).html(); //取得表格单元格的文本
						setEditHTML(editText); //初始化控件
						$(this).data("oldtxt",editText) //将单元格原文本保存在其缓存中，便修改失败或取消时用
						.html(editHTML) //改变单元格内容为编辑状态
						.unbind("dblclick"); //删除单元格双击事件，避免多次双击
					});
				});
			}
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
				if(window.confirm("确定要删除这些记录吗？")){
					$.ajax({
					 	url: 'wallet!del.zf?ids='+str+'&t='+new Date().getTime(),
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
				var b="<table class='maintab_content_table' width='100%'><thead><tr class='maintab_content_table_title'><th width='1%'><input type='checkbox' name='select' onclick='ck()'/></th><th>用户编号</th><th>银行账号</th><th>银行名称</th><th>开户人</th><th>开户地址</th><th>余额</th><th>分成比例</th><th>修改人</th><th>日期</th></tr></thead><tbody>";
				var a="</tbody></table>";
				$.ajax({
					 	url: 'wallet!count.zf?type=1&t='+new Date().getTime(),
					 	type: 'POST',
					 	dataType: 'json',
					 	error: function(){alert('error');},
					 	success: function(json){
							//蓝色主题
							$('#list').jpage({dataBefore:b,dataAfter:a,dataStore: null,themeName:'blue',totalRecord:json[0],proxyUrl:'wallet!result.zf?t='+new Date().getTime()+'&type=1',openCookies:false,
							showMode:'full',ajaxParam:param,actionAfter:editbox}); 
					 	}
					}); 
			}
			function exports()
			{
				window.open('sell!export.zf?type=1&t='+new Date().getTime());
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
	在售列表</td>
	</tr>
	</table>
	<!--标题结束-->
	<div style="width:50%;padding:0px;marging:0px">
		<table border="0" width="100%" cellspacing="0" cellpadding=" height="30">
			<tr>
				<td>
					<a href="${base}/html/regedit_wallet.html"><img src="${images}/add.gif" style="cursor:hand"/></a>
					<img src="${images}/delete.gif" onclick="deletes()"  style="cursor:hand"/>
					<img src="${images}/export.gif" onclick="exports()" style="cursor:hand" />
					<img src="${images}/printer.gif" style="cursor:hand" />
				</td>
			</tr>
		</table>
	</div>
	<div style="width:100%;padding:0px;marging:0px" id='list'></div>

</body>

</html>