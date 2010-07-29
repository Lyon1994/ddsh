<?php
$this->breadcrumbs=array(
	'收入构成分析',
);
?>
<?php echo CHtml::cssFile('/geecai/calendar/css/jscal2.css'); ?>
<?php echo CHtml::cssFile('/geecai/calendar/css/border-radius.css'); ?>
<?php echo CHtml::cssFile('/geecai/calendar/css/win2k/win2k.css'); ?>
<?php echo CHtml::scriptFile('/geecai/jq/jquery.js'); ?>
<?php echo CHtml::scriptFile('/geecai/FusionCharts/FusionCharts.js'); ?>
<?php echo CHtml::scriptFile('/geecai/calendar/js/jscal2.js'); ?>
<?php echo CHtml::scriptFile('/geecai/calendar/js/lang/cn.js'); ?>
<?php echo CHtml::scriptFile('/geecai/js/jquery.checkboxes.pack.js'); ?>
<style>
<!--
body,table{
    font-size:12px;
}
#grid {
    table-layout:fixed;
    empty-cells:show; 
    margin:0 auto;
    border:1px solid #cad9ea;
    color:#666;
}
#grid td{
	border:1px solid #cad9ea;
    padding:0 1em 0;
}
#grid tr{
	background-color:#f5fafe;
}
#list table {width:100%;}
#list  table  td{padding:4px 10px 4px 5px;}
#list  table  caption{padding:4px 10px 4px 5px;}
img{margin-bottom:-3px;}
.btn {
height:25px;width:40px;background:#e8f5f4;BORDER-RIGHT: #7b9ebd 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #7b9ebd 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px;  BORDER-LEFT: #7b9ebd 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #7b9ebd 1px solid
}
.btn1_mouseover {
height:25px;width:40px;BORDER-RIGHT: #7EBF4F 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #7EBF4F 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#CAE4B6); BORDER-LEFT: #7EBF4F 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #7EBF4F 1px solid
}
-->
</style>
<script type="text/javascript">

function renderTable(url)
{
	$.ajax({
	 	url: url,
	 	type: 'POST',
	 	//dataType: 'html',
	 	error: function(){alert('table error');},
	 	success: function(json){
	 		$("#list").empty();   
	 		$(json).appendTo("#list"); 
			//$.each(json,function(i,n){
				//$("<tr><td>"+n[0]+"</td><td><font color=green>+</font>"+n[1]+"</td><td><font color=green>+</font>"+n[2]+"</td></tr>").appendTo("#list table tbody");    

		    //});
	 	}
	}); 
}
function renderChart(chart,url,value,search)
{
    var myChart = new FusionCharts("../../FusionCharts/"+chart+".swf", "myChartId", "350", "250","0", "1");    
    var time_=$('#time_').attr('value');
	var t=url+'%3Fvalue='+value+'%26search='+search+'%26time_='+time_+'%26t='+new Date().getTime();
    myChart.setDataURL(t);    
    myChart.addParam('wmode', 'transparent');
    myChart.addParam('value', value);
    myChart.addParam('search', search);
    myChart.addParam('time_', time_);
    myChart.render("tag"); 
}
function renderFamily()
{
	$.ajax({
	 	url: '../family/select?t='+new Date().getTime(),
	 	type: 'POST',
	 	dataType: 'json',
	 	error: function(){alert('family error');},
	 	success: function(json){
	 		$("#select").empty();   
	 		$.each(json,function(i,n){
		 		if(n[1]=='all')
	 				$("<input type='checkbox' id='all' checked value="+n[1]+">"+n[0]+"</input><br>").appendTo("#select");   
		 		else
		 			$("<input type='checkbox' value="+n[1]+">"+n[0]+"</input><br>").appendTo("#select");   
		    });
		    $("input[type=checkbox]").click(function() {
			    if(this.value=='all')
			    	$("#chart").unCheckCheckboxes(":not(#all)");
			    else
			    	$("#chart").unCheckCheckboxes("#all", true);
			    var str='';
			    $('input[type=checkbox]').each(function(){
				    if(this.checked){ 
					    if(str){
						    str+=','+this.value;
						}else{
							str=this.value;
						}
					}
				});
				if(str=='')
					str="all";
				var search=$('#s_').attr('value');
				if(search=='')
					str='2';
				$('#f_').attr('value',str);
				if(search=='4')
				{
					var time_=$('#time_').attr('value');
					renderTable('summaryTag?t='+new Date().getTime()+'&value='+str+'&search=4&time_='+time_);
			    	renderChart("Pie3D","chartTag",str,'4');
				}else
				{
					renderTable('summaryTag?t='+new Date().getTime()+'&value='+str+'&search='+search);
			    	renderChart("Pie3D","chartTag",str,search);
				}
				
			 });
	 	}
	}); 
}
function initEvent()
{
	
	$(":button").hover(function() {   
		$(this).addClass('btn1_mouseover');   
	}, function() {   
		$(this).removeClass('btn1_mouseover');   
	});  
	$("#Month").css({background:'#5b9fc9'});
	var date = new Date();
	$("#f_date1").attr("value",date.getFullYear()+'/'+(date.getMonth()+1)+'/1');
	$("#f_date2").attr("value",date.getFullYear()+'/'+(date.getMonth()+1)+'/'+date.getDate());
	$(".btn").click(function () {       
		//$(this).slideUp();     
		var search=$(this).attr('v');
		var str=$('#f_').attr('value');
		if(str=='')
			str='all';
		$('#s_').attr('value',search);
		renderTable('summaryTag?t='+new Date().getTime()+'&value='+str+'&search='+search);
    	renderChart("Pie3D","chartTag",str,search);
	});
	$("#search").click(function () {       
		//$(this).slideUp();     
		var f_date1=$('#f_date1').attr('value');
		var f_date2=$('#f_date2').attr('value');
		var str=$('#f_').attr('value');
		if(str=='')
			str='all';
		$('#s_').attr('value','4');
		if(f_date1!=''&&f_date2!='')
			$('#time_').attr('value',f_date1+','+f_date2);
		var time_=$('#time_').attr('value');
		
		renderTable('summaryTag?t='+new Date().getTime()+'&value='+str+'&search=4&time_='+time_);
    	renderChart("Pie3D","chartTag",str,'4');
	});
}
$(document).ready( function() {
	renderFamily();
	renderTable('summaryTag?t='+new Date().getTime()+'&value=all&search=2');
	renderChart("Pie3D","chartTag",'all','2');
	initEvent();
});
</script> 
<form id='chart'>
<input type="hidden" id="time_" value=','/>
<input type="hidden" id="s_" value='2'/>
<input type="hidden" id="f_" value='all'/>
<div id="main" style="position:relative;padding:0px;margin:0px;">
	<div id="select" style="position:relative;padding:0px;margin:0px;width:80px;">

	</div>
	<div style="position:relative;padding:0px;margin:0px;width:100%">
		<div id="tag" style="position:relative;padding:0px;margin:0px;float:left;width:500px">
		</div>
		<div id="list" style="position:relative;padding:0px;margin:0px;float:left;width:300px">

		</div>
	</div>
	<div id="period" style="position:relative;padding:0px;margin:0px;width:600px">
		<input size="15" id="f_date1" /><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/calendar.gif" id="f_btn1"/>
		—— <input size="15" id="f_date2" /><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/calendar.gif" id="f_btn2"/>
		
		<img style="cursor:hand;"  src="<?php echo Yii::app()->request->baseUrl; ?>/images/search.png" width="32px" height="32px" id="search"/>
		
		<div style="position:relative;padding:0px;margin:0px;float:right;">
			<input type="button" value="Week" v="1" class="btn"/>
			<input type="button" value="Month" v="2" class="btn" id="Month"/>
			<input type="button" value="Year" v="3" class="btn"/>
		</div>
		<script type="text/javascript">//<![CDATA[

	      var cal = Calendar.setup({
	          onSelect: function(cal) { cal.hide() },
	          showTime: true
	      });
	      cal.manageFields("f_btn1", "f_date1", "%Y/%m/%d");
	      cal.manageFields("f_btn2", "f_date2", "%Y/%m/%d");
	    //]]></script>
	</div>
</div>
</form>