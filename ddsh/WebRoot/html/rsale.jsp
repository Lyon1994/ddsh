<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>退货</title>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="Expires" content="0"/> 
	<meta http-equiv="Cache-Control" content="no-cache"/> 
	<meta http-equiv="Pragma" content="no-cache"/> 
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
	<link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="../js/jquery/jquery-1.4.2.min.js"></script>
	<script language="javascript" src="../js/jquery/jquery-plugins/jQuery.FillOptions.js"></script>
	<script language="javascript">
		$(document).ready(
			function(){
					$("#reason").FillOptions("../system/dic!load.zf?parent=reason",{datatype:"json",textfield:"name",valuefiled:"value"});
					$("#barcode").focus();
					$('#barcode').keydown(function(event){
							//alert(event.keyCode);
							//return false;
							if(event.keyCode==13){//扫描枪,回车
								var barcode=$("#barcode").attr('value');
								if($("#name").attr('value')!='')
								{
									 var bln = window.confirm("确定要退回吗?");
									 if(bln)
									 {
										var transaction=$('#transaction').attr('value');
										var barcode=$('#barcode').attr('value');
										var amount=$('#amount').attr('value');
										var reason=$('#reason').attr('value');
										var para='type=03&transaction='+transaction+'&amount='+amount+'&barcode='+barcode+'&reason='+reason+'&t='+new Date().getTime();
										
										$.ajax({
											 	url: '../system/back!add.zf',
											 	type: 'POST',
											 	dataType: 'json',
											 	data:para,//参数设置
											 	error: function(){alert('error');},
											 	success: function(json){
													alert(json.info);
													$("#barcode").attr('value','');
													$("#barcode").focus();
													$("#name").attr('value','');
									 				$("#price").attr('value','');
											 	}
										});
									 }
								}else
								{
									$.ajax({
									 	url: '../system/inventory!load.zf?barcode='+barcode+'&t='+new Date().getTime(),
									 	type: 'POST',
									 	dataType: 'json',
									 	error: function(){alert('error');},
									 	success: function(json){
									 		if(json.length>0)
									 		{
									 			$("#name").attr('value',json[0].name);
									 			$("#price").attr('value',json[0].price);
									 		}else
									 			alert('商品不存在！');
									 	}
									});
								}
							}else if(event.keyCode==46){//del键
								var transaction=$('#transaction').attr('value');
								var barcode=$('#barcode').attr('value');
								var amount=$('#amount').attr('value');
								var reason=$('#reason').attr('value');
								var para='type=03&transaction='+transaction+'&amount='+amount+'&barcode='+barcode+'&reason='+reason+'&t='+new Date().getTime();
								
								$.ajax({
									 	url: '../system/back!add.zf',
									 	type: 'POST',
									 	dataType: 'json',
									 	data:para,//参数设置
									 	error: function(){alert('error');},
									 	success: function(json){
											alert(json.info);
											$("#barcode").attr('value','');
											$("#barcode").focus();
											$("#name").attr('value','');
									 		$("#price").attr('value','');
									 	}
								});
							}
						}
					);
					$('#ok').click( 
						function(){	
							var transaction=$('#transaction').attr('value');
							var barcode=$('#barcode').attr('value');
							var amount=$('#amount').attr('value');
							var reason=$('#reason').attr('value');
							var para='type=03&transaction='+transaction+'&amount='+amount+'&barcode='+barcode+'&reason='+reason+'&t='+new Date().getTime();
							
							$.ajax({
								 	url: '../system/back!add.zf',
								 	type: 'POST',
								 	dataType: 'json',
								 	data:para,//参数设置
								 	error: function(){alert('error');},
								 	success: function(json){
										alert(json.info);
										$("#barcode").attr('value','');
										$("#barcode").focus();
										$("#name").attr('value','');
									 	$("#price").attr('value','');
								 	}
							});
							return false;
						}
					);
			}
		)
	</script>
  </head>
  
    <body>
	<form name="regedit" action="#" method="post">
	<input type="hidden" id="id" name="id"/>
	<table border="0" width="100%" cellspacing="0" cellpadding="0" height="25">
	<tr class="tree_title_txt">
	<td nowrap width="100%" class="tree_title_txt" valign="middle" id="cwCellTopTitTxt">
	退货</td>
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
					<td>交易号：</td>
					<td><input type="text" id="transaction" name="transaction" size="20" class="text"/></td>
				</tr>
				<tr>
					<td>商品名称：</td>
					<td><input type="text" id="name" name="name" size="20" class="text" readonly/></td>
					<td>单价：</td>
					<td><input type="text" id="price" name="price"  size="20" class="text" readonly/></td>
				</tr>
				<tr>
					<td>折扣：</td>
					<td><input type="text" id="discount" name="discount" value='1' size="20" class="text"/></td>
					<td>数量：</td>
					<td><input type="text" id="amount" name="amount" value='1' size="20" class="text"/></td>
				</tr>
				<tr>
					<td>退回原因：</td>
					<td><select id="reason" name="reason"></select></td>
					<td colspan="2"></td>
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
	<td nowrap><input type="button" value="确定" id="ok" class="com_button2"/>
	&nbsp;&nbsp;<input type="button" value="关闭" class="com_button2" onclick="javascript:self.close()"/>
	 	</td>
	</tr>
	</table>	
	</td>
	</tr>
	</table>	 
	</div>
	</form>
  </body>
</html>
