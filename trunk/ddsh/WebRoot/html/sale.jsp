<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>售货</title>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
	<link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="../js/jquery/jquery-1.4.2.min.js"></script>
	<script language="javascript">
		function delete_(obj){
			$(obj).parent().parent().remove(); 
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
								 			$("#begin").append("<tr id="+json[0].id+"><td align=\'center\'><img src='../images/delete.gif' onclick='delete_(this)' style='cursor:hand' /></td><td align=\'center\'><input type='text' name='barcode' value='"+json[0].barcode+"' readonly/></td><td align=\'center\'><input type='text' name='name' value='"+json[0].name+"' readonly/></td><td align=\'center\'><input type='text' name='price' value='"+json[0].price+"' readonly style='width:60px'/></td><td align=\'center\'><input type='text' name='amount' value='"+json[0].amount+"' style='width:60px'/></td><td align=\'center\'><input type='text' name='discount' value='"+json[0].discount+"' style='width:60px'/></td><td align=\'center\'><input type='text' name='totalprice' value='"+(json[0].amount*(json[0].price*json[0].discount))+"' style='width:60px'/></td></tr>");   
								 		}else
								 			alert('商品不存在！');
										
								 	}
								});
							}
						}
					);
					$('#ok').click( 
						function(){	
							var barcode=$('#barcode').attr('value');
							var amount=$('#amount').attr('value');
							var price=$('#price').attr('value');
							var zk=$('#zk').attr('value');
							var totalprice=amount*(price*zk);
							var returnstr;
			        		returnstr = window.showModalDialog('../html/sale_ok.jsp?barcode='+barcode+'&amount='+amount+'&zk='+zk+'&totalprice='+totalprice,'',"dialogHeight: 400px; dialogWidth: 550px;center: yes; help: no;resizable: no; status: no;");
							
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
					     	<TH>数量</TH>
					     	<TH>折扣</TH>
					       	<TH>总价</TH>
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
