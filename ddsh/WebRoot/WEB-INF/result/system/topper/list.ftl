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

    	<title>上货审批列表</title>
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
				editHTML = '<input type="text" value="'+value+'" />';
				editHTML += '<input type="button" onclick="ok(this)" value="修改" />';
				editHTML += '<input type="button" onclick="cancel(this)" value="取消" />';
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
				var id = $obj.parent().attr("id").replace("tr_",""); //取得该行数据的ID，此例ID绑定在tr中
				var value = $obj.find("input:text")[0].value; //取得文本框的值，即新数据
			
				//AJAX 修改数据略
				//成功
				if(true){
					alert("success");
					$obj.data("oldtxt",value); //设置此单元格缓存为新数据
					cancel(obtn); //调用'取消'方法，
					//在此应传'取消'按钮过去，
					//但在'取消'事件中没有用'取消'按钮这个对象,
					//用的只是它的上一级，即td，
					//固在此直接用'修改'按钮替代
				}else{
					alert("error");
					cancel(obtn);
				}
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
					 	url: 'topper!del.zf?ids='+str+'&t='+new Date().getTime(),
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
			function apply()
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
				if(window.confirm("确定要接收这些产品吗？")){
					$.ajax({
					 	url: 'topper!apply.zf?ids='+str+'&t='+new Date().getTime(),
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
				var b="<table cellspacing=1 id='data'><thead><tr><th><input type='checkbox' name='select' onclick='ck()'/></th><th>物品名称</th><th>设计师</th><th>图片</th><th>数量</th><th>单价</th><th>总价</th><th>型号</th><th>规格</th><th>材料</th><th>产地</th><th>提交日期</th><th>备注</th></tr></thead><tbody>";
				var a="</tbody></table>";
				$.ajax({
					 	url: 'topper!count.zf?type=0&t='+new Date().getTime(),
					 	type: 'POST',
					 	dataType: 'json',
					 	error: function(){alert('error');},
					 	success: function(json){
							//蓝色主题
							$('#list').jpage({dataBefore:b,dataAfter:a,dataStore: null,themeName:'blue',totalRecord:json[0],proxyUrl:'topper!result.zf?t='+new Date().getTime()+'&type=0',openCookies:false,
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
	上货审批列表</td>
	</tr>
	</table>
	<!--标题结束-->
	<div style="width:50%;padding:0px;marging:0px">
		<table border="0" width="100%" cellspacing="0" cellpadding=" height="30">
			<tr>
				<td>
					<img src="${images}/delete.png" onclick="deletes()" />
					<img src="${images}/apply.png" onclick="apply()"/>
					<img src="${images}/export.png"/>
					<img src="${images}/printer.png"/>
				</td>
			</tr>
		</table>
	</div>
	<div style="width:100%;padding:0px;marging:0px" id='list'></div>

</body>

</html>