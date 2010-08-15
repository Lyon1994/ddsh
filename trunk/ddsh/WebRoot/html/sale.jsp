<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>售货</title>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="Expires" content="0"/> 
	<meta http-equiv="Cache-Control" content="no-cache"/> 
	<meta http-equiv="Pragma" content="no-cache"/> 
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
	<link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="../js/jquery/jquery-1.4.2.min.js"></script>
	<script language="javascript" src="../js/jquery/jquery-plugins/field/jquery.field.js"></script>
	<script language="javascript">
		function delete_(obj){
			$(obj).parent().parent().remove(); 
		}
		
		function deleteAll(obj){
			$(obj).parent().parent().remove(); 
		}
		/*  
		*    ForDight(Dight,How):数值格式化函数，Dight要  
		*    格式化的  数字，How要保留的小数位数。  
		*/  
		function  ForDight(Dight,How)  
		{  
			Dight  =  Math.round  (Dight*Math.pow(10,How))/Math.pow(10,How);  
		    return  Dight;  
		}  

		$(document).ready(
			function(){
					$("#barcode").focus();
					$('#barcode').keydown(function(event){
							//alert(event.keyCode);
							//return false;
							if(event.keyCode==13){//扫描枪,回车
								var barcode=$("#barcode").attr('value');
								$.ajax({
								 	url: '../system/inventory!load.zf?barcode='+barcode+'&t='+new Date().getTime(),
								 	type: 'POST',
								 	dataType: 'json',
								 	error: function(){alert('error');},
								 	success: function(json){
								 		if(json.length>0)
								 		{
								 			$("#begin").append("<tr id="+json[0].id+"><td align=\'center\'><img src='../images/delete.gif' onclick='delete_(this)' style='cursor:hand' /></td><td align=\'center\'><input type='text' name='barcode' value='"+json[0].barcode+"' readonly/></td><td align=\'center\'><input type='text' name='name' value='"+json[0].name+"' readonly/></td><td align=\'center\'><input type='text' name='price' value='"+json[0].price+"' readonly style='width:40px'/></td><td align=\'center\'><input type='text' name='discount' value='"+json[0].discount+"' style='width:40px'/></td><td align=\'center\'><input type='text' name='amount' value='1' style='width:40px'/></td></tr>");   
								 			$("#barcode").attr('value','');
								 		}else
								 		{
								 			alert('商品不存在！');
								 			$("#barcode").attr('value','');
								 		}	
								 	}
								});
							}else if(event.keyCode==46){//del键
								var rows=$('#begin').find('tr').length;//提取表格数据行
							    var rowsvalue='';
							   	$.each($('#begin').find('tr'), function(i,item){ 
							    	rowsvalue=rowsvalue+$('input[type="text"]',this).fieldArray();
							    	if(rows>1)
							    		rowsvalue=rowsvalue+'|';
							    	rows--;
							    });
							   	if(rowsvalue!='')
							   	{
							   		var t=rowsvalue.split('|');
							   		var totalprice=0;
							   		for(var m=0;m<t.length;m++)
							   		{
							   			var n=t[m].split(',');;
							   			totalprice=totalprice+(n[2]*n[3]*n[4]);
							   		}
									var returnstr;
				        			returnstr = window.showModalDialog(encodeURI('../html/sale_ok.jsp?rowsvalue='+rowsvalue+'&totalprice='+ForDight(totalprice,2)+'&rnd='+Math.random()),'',"dialogHeight: 250px; dialogWidth: 500px;center: yes; help: no;resizable: no; status: no;");
							   		
							   		if (returnstr =="refresh")//这种是利用返回值来刷新父页面
							   			$("#begin").empty();
							   			
							   	}else
							   		alert('请先扫描结账物品！');
							}
						}
						
					);

					$('#ok').click( 
						function(){	
							var rows=$('#begin').find('tr').length;//提取表格数据行
						    var rowsvalue='';
						   	$.each($('#begin').find('tr'), function(i,item){ 
						    	rowsvalue=rowsvalue+$('input[type="text"]',this).fieldArray();
						    	if(rows>1)
						    		rowsvalue=rowsvalue+'|';
						    	rows--;
						    });
						   	if(rowsvalue!='')
						   	{
						   		var t=rowsvalue.split('|');
						   		var totalprice=0;
						   		for(var m=0;m<t.length;m++)
						   		{
						   			var n=t[m].split(',');;
						   			totalprice=totalprice+(n[2]*n[3]*n[4]);
						   		}
								var returnstr;
			        			returnstr = window.showModalDialog(encodeURI('../html/sale_ok.jsp?rowsvalue='+rowsvalue+'&totalprice='+ForDight(totalprice,2)),'',"dialogHeight: 250px; dialogWidth: 500px;center: yes; help: no;resizable: no; status: no;");
							   	if (returnstr =="refresh")//这种是利用返回值来刷新父页面
							   			$("#begin").empty();
						   	}else
						   		alert('请先扫描结账物品！');
							
							return false;
						}
					);
			}
		)
	</script>
  </head>
  
  <body>
	<form name="regedit" action="#" method="post">
	<intput type="hidden" id="id" name="id"/>
	<table border="0" width="100%" cellspacing="0" cellpadding="0" height="25">
	<tr class="tree_title_txt">
	<td nowrap width="100%" class="tree_title_txt" valign="middle" id="cwCellTopTitTxt">
	售货</td>
	</tr>
	</table>

	<div>
	<table border="0" width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td class="maintab_kuang">
			<table border="0" width="100%" cellspacing="0" cellpadding="0" class="tab_table_title">
				<tr>
					<td>条形码：</td>
					<td><input type="text" id="barcode" name="barcode" size="20" class="text"/></td>
					<td>名称：</td>
					<td><input type="text" id="name" name="name" size="20" class="text" readonly/></td>
				</tr>
				<tr>
					<td colspan="4"><hr size="1"/></td>
				</tr>
				</table>
			</td>
		</tr>
	</table>
	 
	<table border="0" width="100%" cellspacing="0" cellpadding="0" style="margin-top:2px;" class="maintab2">
	<tr class="maintab">
	<td style="padding:0px 10px 0px 10px" align="center" >
		
	<table border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td nowrap><input type="button" value="结账" id="ok" class="com_button2"/>
	&nbsp;&nbsp;<input type="button" value="关闭" class="com_button2" onclick="javascript:self.close()"/>
	 	</td>
	</tr>
	</table>	
	</td>
	</tr>
	</table>	
	<table border="0" width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td class="maintab_kuang">
				<table border="0" width="100%" cellspacing="0" cellpadding="0" class="tab_table_title">
					<THEAD>
					    <TR>
							<TH></TH>
					      	<TH>条形码</TH>
					      	<TH>名称</TH>
					      	<TH>单价</TH>
					     	<TH>折扣</TH>
					     	<TH>数量</TH>
					    </TR>
					  </THEAD>
				  	<TBODY id="begin">
					</TBODY>
				</table>
			</td>
		</tr>
	</table>
	</div>
	</form>
  </body>
</html>
