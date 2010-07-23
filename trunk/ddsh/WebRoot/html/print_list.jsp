<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String rowsvalue=request.getParameter("rowsvalue");
	rowsvalue= new String(rowsvalue.getBytes("iso-8859-1"),"UTF-8");         
	String totalprice=request.getParameter("totalprice");
	String receive=request.getParameter("receive");
	String change=request.getParameter("change");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
	<link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="../js/jquery/jquery-1.4.2.min.js"></script>
	<script language="javascript">
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
					var now= new Date();
					var year=now.getYear();
					var month=now.getMonth()+1;
					var day=now.getDate();
					var hour=now.getHours();
					var minute=now.getMinutes();
					var second=now.getSeconds();
					$('#time').append("结账日期:"+year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second);
					
					var rowsvalue='<%=rowsvalue%>';
					var receive='<%=receive%>';
					$('#receive').append(receive);
					var change='<%=change%>';
					$('#change').append(change);
					var totalprice='<%=totalprice%>';
					$('#totalprice').append(totalprice);
					var t=rowsvalue.split('|');
					
					for(var m=0;m<t.length;m++)
					{
						var n1=t[m];
						var n=n1.split(',');
						var totalprice=0;
						totalprice=totalprice+(n[2]*n[3]*n[4]);
						totalprice=ForDight(totalprice,2);
						$("#begin").append("<tr><td align=\'center\' style='width:100px'>"+n[1]+"</td><td align=\'center\' style='width:25px'>"+n[2]+"</td><td align=\'center\' style='width:15px'>"+n[3]+"</td><td align=\'center\' style='width:15px'>"+n[4]+"</td><td align=\'center\' style='width:25px'>"+totalprice+"</td></tr>");   
					}
			}
		)
	</script>
  </head>
  
  <body>
				<table border="0" width="180px" cellspacing="0" cellpadding="0">
					<thead>
					    <tr>
					      	<th colspan='5' align='left'>欢迎光临 - 东东社会</th>
					    </tr>
						<tr>
							<th colspan='5' align='left'>---------------------------------------------</th>
						</tr>
					    <tr>
					      	<th align='center' style='width:100px'>名称</th>
					      	<th align='center' style='width:25px'>单价</th>
					     	<th align='center' style='width:15px'>数量</th>
					     	<th align='center' style='width:15px'>折扣</th>
					     	<th align='center' style='width:25px'>小计</th>
					    </tr>
						<tr>
							<th colspan='5' align='left'>---------------------------------------------</th>
						</tr>
					  </thead>
				  	<tbody id="begin">
					</tbody>
					<tfoot>
						<tr>
							<th colspan='5' align='left'>---------------------------------------------</th>
						</tr>
						<tr>
							<th colspan='1' style='width:40px'>合计：</th>
							<th colspan='1' style='width:40px' id='totalprice'></th>
							<th colspan='3'>&nbsp;</th>
						</tr>
						<tr>
							<th  colspan='1' style='width:40px'>实收：</th>
							<th colspan='1' style='width:40px' id='receive'></th>
							<th colspan='3'>&nbsp;</th>
						</tr>
						<tr>
							<th colspan='1' style='width:40px'>找零：</th>
							<th colspan='1' style='width:40px' id='change'></th>
							<th colspan='3'>&nbsp;</th>
						</tr>
						<tr>
							<th colspan='5' align='left' id='time'></th>
						</tr>
						<tr>
							<th colspan='5' align='left'>---------------------------------------------</th>
						</tr>
						<tr>
							<th colspan='5' align='left'>最近暂无任何活动</th>
						</tr>
						<tr>
							<th colspan='5' align='left'>---------------------------------------------</th>
						</tr>
					</tfoot>

				</table>

  </body>
</html>
