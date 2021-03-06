<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
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
					$.ajax({
					 	url: '../system/inventory!load.zf?id='+<%=id%>+'&t='+new Date().getTime(),
					 	type: 'POST',
					 	dataType: 'json',
					 	error: function(){alert('error');},
					 	success: function(json){
					 		if(json[0].amount<=0)
					 		{
					 			alert('库存不足,无法继续上架!');
					 			$('#ok').attr("disabled",true); 
					 		}else
					 		{
						 		$('#barcode').attr('value',json[0].barcode);
								$('#amount').attr('value',json[0].amount);
								$('#id').attr('value',json[0].id);
					 		}

					 	}
					});
					$('#ok').click( 
						function(){	
							var barcode=$('#barcode').attr('value');
							var id=$('#id').attr('value');
							var amount=$('#amount').attr('value');
							var para='id='+id+'&amount='+amount+'&barcode='+barcode+'&t='+new Date().getTime();
							$('#LoadingStatus').show();//显示进度条
							
							$.ajax({
								 	url: '../system/inventory!upload.zf',
								 	type: 'POST',
								 	dataType: 'json',
								 	data:para,//参数设置
								 	error: function(){$('#LoadingStatus').hide(2000);alert('处理错误！');},
								 	success: function(json){
								 		$('#LoadingStatus').hide(2000);
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
  <div id="LoadingStatus" style="background:red;color:#fff;float:right;width:100px;display:none;border:1px solid #000;z-index:1000;">正在处理...</div>
  
	<form name="regedit" action="#" method="post">
	<input type="hidden" id="id" name="id"/>
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
				<tr>
					<td>条形码：</td>
					<td><input type="text" id="barcode" name="barcode" size="20" class="readonly" readonly="readonly" /></td>
					<td>数量：</td>
					<td><input type="text" id="amount" name="amount" size="20" class="text"/></td>
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
