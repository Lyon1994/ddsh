<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>商品退回</title>

    <meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
	<link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="../js/jquery/jquery-1.4.2.min.js"></script>
	<script language="javascript" src="../js/jquery/jquery-plugins/jQuery.FillOptions.js"></script>
	<script language="javascript" src="../js/jquery/jquery-plugins/validation/jquery.validate.js"></script>
	<script language="javascript">
		$(document).ready(
			function(){
					$("#reason").FillOptions("../system/dic!load.zf?parent=reason",{datatype:"json",textfield:"name",valuefiled:"value"});
					$("#regedit").validate();
					$.ajax({
					 	url: '../system/submit!load.zf?id='+<%=id%>+'&t='+new Date().getTime(),
					 	type: 'POST',
					 	dataType: 'json',
					 	error: function(){alert('error');},
					 	success: function(json){
							$('#barcode').attr('value',json[0].barcode);
							$('#amount').attr('value',json[0].amount);
							$('#id').attr('value',json[0].id);
					 	}
					});
					$('#ok').click( 
						function(){	
							var id=$('#id').attr('value');
							var reason=$('#reason').attr('value');
							var amount=$('#amount').attr('value');
							var barcode=$('#barcode').attr('value');
							var para='id='+id+'&amount='+amount+'&reason='+reason+'&barcode='+barcode+'&t='+new Date().getTime();
							
							$.ajax({
								 	url: '../system/submit!back.zf',
								 	type: 'POST',
								 	dataType: 'json',
								 	data:para,//参数设置
								 	error: function(){alert('error');},
								 	success: function(json){
										alert(json.info);
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
	<form id="regedit" name="regedit" action="#" method="post">
	<input type="hidden" id="id" name="id"/>
	<table border="0" width="100%" cellspacing="0" cellpadding="0" height="25">
	<tr class="tree_title_txt">
	<td nowrap width="100%" class="tree_title_txt" valign="middle" id="cwCellTopTitTxt">
	商品退回</td>
	</tr>
	</table>

	<div>
	<table border="0" width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td class="maintab_kuang">
			<table border="0" width="100%" cellspacing="0" cellpadding="0" class="tab_table_title">
				<tr>
					<td>条形码：</td>
					<td><input type="text" id="barcode" name="barcode" size="20" class="text" readonly="readonly" /></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>数量：</td>
					<td><input type="text" id="amount" name="amount" size="20" class="text required digits" minlength="1"/></td>
					<td></td>
					<td></td>
				</tr>
				
				<tr>
					<td>退回原因：</td>
					<td><select id="reason" name="reason"></select></td>
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
