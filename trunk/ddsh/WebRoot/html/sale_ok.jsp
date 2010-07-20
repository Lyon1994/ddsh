<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String bd=request.getParameter("barcode");
	String totalprice=request.getParameter("totalprice");
	String zk=request.getParameter("zk");
	String amount=request.getParameter("amount");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>结账确认</title>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
	<link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="../js/jquery/jquery-1.4.2.min.js"></script>
	<script language="javascript">
		$(document).ready(
			function(){
				var bd='<%=bd%>';
				var totalprice='<%=totalprice%>';
				var amount='<%=amount%>';
				var zk='<%=zk%>';
					$.ajax({
					 	url: '../system/inventory!load.zf?barcode='+bd+'&t='+new Date().getTime(),
					 	type: 'POST',
					 	dataType: 'json',
					 	error: function(){alert('error');},
					 	success: function(json){
					 		$('#barcode').attr('value',json[0].barcode);
							$('#name').attr('value',json[0].name);
							$('#totalprice').attr('value',totalprice);
							$('#amount').attr('value',amount);
							$('#id').attr('value',json[0].id);
							$('#price').attr('value',json[0].price);
							$('#zk').attr('value',zk);
					 	}
					});
					$('#ok').click( 
						function(){	
							var barcode=$('#barcode').attr('value');
							var amount=$('#amount').attr('value');
							var zk=$('#zk').attr('value');
							var totalprice=amount*zk;
							var returnstr;
			        		returnstr = window.showModalDialog('../html/sale_ok.jsp?barcode='+barcode+'&totalprice='+totalprice,'',"dialogHeight: 500px; dialogWidth: 750px;center: yes; help: no;resizable: no; status: no;");
							
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
	结账确认</td>
	</tr>
	</table>

	<div>
	物品列表
	<table border="0" width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td class="maintab_kuang">
			<table border="0" width="100%" cellspacing="0" cellpadding="0" class="tab_table_title">
				<tr>
					<td>收取：</td>
					<td><input type="text" id="barcode" name="barcode" size="20" class="text" readonly/></td>
					<td>总计：</td>
					<td><input type="text" id="name" name="name" size="20" class="text" readonly/></td>
				</tr>
				<tr>
					<td>找零：</td>
					<td><input type="text" id="amount" name="amount" size="20" class="text" readonly/></td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td>是否打印小票：</td>
					<td><input type="checkbox" id="print" name="print" checked/></td>
					<td></td>
					<td></td>
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
