<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String rowsvalue=request.getParameter("rowsvalue");
	rowsvalue= new String(rowsvalue.getBytes("iso-8859-1"),"UTF-8");         
	String totalprice=request.getParameter("totalprice");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>结账确认</title>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
	<link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="../js/jquery/jquery-1.4.2.min.js"></script>
	<script language="javascript" src="../js/CheckActivX.js"></script>
	<object id="LODOP" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
	</object> 

	<script language="javascript">
		var LODOP=document.getElementById("LODOP");//这行语句是为了符合DTD规范
		CheckLodop();
		function CreatePrintPage(rowsvalue,totalprice,receive,change,transaction) {
			LODOP.PRINT_INIT("东东设会");
			LODOP.SET_PRINT_PAGESIZE(3,600,5,"");//
			//LODOP.SET_PRINT_PAPER(0,0,500,500,"东东设会");
			LODOP.ADD_PRINT_TBURL(0,0,600,300,encodeURI('print_list.jsp?rowsvalue='+rowsvalue+'&totalprice='+totalprice+'&receive='+receive+'&change='+change+'&transaction='+transaction));

		};
		/*  
		*    ForDight(Dight,How):数值格式化函数，Dight要  
		*    格式化的  数字，How要保留的小数位数。  
		*/  
		function  ForDight(Dight,How)  
		{  
			Dight  =  Math.round  (Dight*Math.pow(10,How))/Math.pow(10,How);  
		    return  Dight;  
		}  
		var jschars = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
		function generateMixed(n) {
		    var res = "";
		    for(var i = 0; i < n ; i ++) {
		        var id = Math.ceil(Math.random()*35);
		        res += jschars[id];
		    }
		    return res;
		}
		$(document).ready(
			function(){
					$("#receive").focus();
					$('#receive').keydown(function(event){
							//alert(event.keyCode);
							//return false;
							if(event.keyCode==13){//扫描枪,回车
								var v = $("#receive").val()-$("#totalprice").val();
								$("#change").attr('value',ForDight(v,2));
							}
						}
					);
					$('#totalprice').attr('value','<%=totalprice%>');
					$('#ok').click( 
						function(){	
							var rowsvalue='<%=rowsvalue%>';
							var totalprice='<%=totalprice%>';
							var receive=$('#receive').attr('value');
							var change=$('#change').attr('value');
							var now= new Date();
							var year=now.getYear();
							var month=now.getMonth()+1;
							var day=now.getDate();
							var hour=now.getHours();
							var minute=now.getMinutes();
							var second=now.getSeconds();
							var transaction="dd"+year+month+day+hour+minute+second+generateMixed(5);
							var para='rowsvalue='+rowsvalue+'&totalprice='+totalprice+'&receive='+receive+'&change='+change+'&transaction='+transaction+'&t='+new Date().getTime();

							$.ajax({
								 	url: '../system/sale!add.zf',
								 	type: 'POST',
								 	dataType: 'json',
								 	data:para,//参数设置
								 	error: function(){alert('处理错误！');},
								 	success: function(json){
										alert(json.info);
								 	}
								});
							if($("#print").attr('checked')==true)
							{
								CreatePrintPage(rowsvalue,totalprice,receive,change,transaction);
								LODOP.PRINT();	
							}
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
	<table border="0" width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td class="maintab_kuang">
			<table border="0" width="100%" cellspacing="0" cellpadding="0" class="tab_table_title">
				<tr>
					<td>实收：</td>
					<td><input type="text" id="receive" name="receive" size="20" class="text" style='width:80px'/></td>
					<td>找零：</td>
					<td><input type="text" id="change" name="change" size="20" class="text" readonly style='width:80px'/></td>
				</tr>
				<tr>
					<td>总计：</td>
					<td><input type="text" id="totalprice" name="totalprice" size="20" class="text" readonly style='width:80px'/></td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td>是否打印小票：</td>
					<td><input type="checkbox" id="print" name="print" value='1' checked/></td>
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
