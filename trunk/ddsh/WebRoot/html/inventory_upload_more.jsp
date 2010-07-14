<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String ids=request.getParameter("ids");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>商品上架</title>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
	<link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="../js/jquery/jquery-1.4.2.min.js"></script>
	<script language="javascript">
		$(document).ready(
			function(){
				var ids='<%=ids%>';
					$.ajax({
					 	url: '../system/inventory!loadAll.zf?ids='+ids+'&t='+new Date().getTime(),
					 	type: 'POST',
					 	dataType: 'json',
					 	error: function(){alert('error');},
					 	success: function(json){
					 		for(var i=0;i<json.length;i++)
					 		{
					 			$("#begin").append("<tr id="+json[i].id+"><td align=\'center\'><input type='text' name='barcode' value='"+json[i].barcode+"' readonly/></td><td align=\'center\'><input type='text' name='name' value='"+json[i].name+"' readonly/></td><td align=\'center\'><input type='text' name='amount' value='"+json[i].amount+"'/></td><td align=\'center\'><input type='text' name='gridid'/></td></tr>");   
					 		}
						}
					});
					$('#ok').click( 
						function(){	
							var barcode=$('#barcode').attr('value');
							var inventoryid=$('#id').attr('value');
							var amount=$('#amount').attr('value');
							var userid=$('#userid').attr('value');
							var name=$('#name').attr('value');
							var price=$('#price').attr('value');
							var gridid=$('#gridid').attr('value');
							$.ajax({
								 	url: '../system/upload!add.zf?inventoryid='+inventoryid+'&name='+name+'&price='+price+'&gridid='+gridid+'&amount='+amount+'&barcode='+barcode+'&userid='+userid+'&t='+new Date().getTime(),
								 	type: 'POST',
								 	dataType: 'json',
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
	<form name="regedit" action="#" method="post">
	<table border="0" width="100%" cellspacing="0" cellpadding="0" height="25">
	<tr class="tree_title_txt">
	<td nowrap width="100%" class="tree_title_txt" valign="middle" id="cwCellTopTitTxt">
	商品上架</td>
	</tr>
	</table>

	<div>
	<table border="0" width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td class="maintab_kuang">
				<table border="0" width="100%" cellspacing="0" cellpadding="0" class="tab_table_title">
					<THEAD>
					    <TR>
					      <TH>条形码</TH>
					      <TH>名称</TH>
					      <TH>数量</TH>
					      <TH>格子编号</TH>
					    </TR>
					  </THEAD>
				  	<TBODY id="begin">
					</TBODY>
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
