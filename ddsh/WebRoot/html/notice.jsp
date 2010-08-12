<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>公告</title>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
	<link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="../js/jquery/jquery-1.4.2.min.js"></script>
	<script language="javascript">

		$(document).ready(
			function(){
					var id='<%=id%>';
					$.ajax({
						url: '../system/notice!load.zf?id='+id,
						type: 'POST',
						dataType: 'json',
						error: function(){alert('处理错误！');},
						success: function(json){
							$('#title').append(json[0].name);
							$('#content').append(json[0].detail);
							$('#footer').append(json[0].date);
						}
					});
			}
		)
	</script>
  </head>
  
  <body>
	<table border="0" width="80%"  align='center' cellspacing="0" cellpadding="0">
		<tr height='5'>
			<td>
				 &nbsp;
			</td>
		</tr>
		<tr align='center'>
			<td>
				<span style='color:red;font-size:large;' id='title'/>
			</td>
		</tr>
		<tr height='15'>
			<td>
				 &nbsp;
			</td>
		</tr>
		<tr>
			<td>
				<span id='content'/>
			</td>
		</tr>
		<tr height='15'>
			<td>
				 &nbsp;
			</td>
		</tr>
		<tr>
			<td align='right'>
				<span>東東設會</span>&nbsp;
			</td>
			<td align='right'>
				<span id='footer'/>
			</td>
		</tr>
	</table>
  </body>
</html>
