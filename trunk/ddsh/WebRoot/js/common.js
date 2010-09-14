var b=false;
var editHTML;
var editText;
var prefix;
function setEditHTML(value){
	editHTML = '<input type="text" class="text_half" value="'+value+'" />';
	editHTML += '&nbsp;<input type="image" onclick="ok(this)" src="../images/accept.gif" border="0" alt="确定" />';
	editHTML += '&nbsp;<input type="image" onclick="cancel(this)" src="../images/closs.gif" border="0" alt="关闭" />';
}
//取消
function cancel(cbtn){
	var $obj = $(cbtn).parent(); //'取消'按钮的上一级，即单元格td
	$obj.html($obj.data("oldtxt")); //将单元格内容设为原始数据，取消修改
	$obj.bind("dblclick",function(){ //重新绑定单元格双击事件
		editText = $(this).html();
		setEditHTML(editText);
		$(this).data("oldtxt",editText).html(editHTML).unbind("dblclick");
	});
}

//修改
function ok(obtn){
	var $obj = $(obtn).parent(); //'修改'按钮的上一级，即单元格td
	var tdid=$obj.attr("id");
	var trid = $obj.parent().attr("id"); //取得该行数据的ID，此例ID绑定在tr中
	var value = $obj.find("input:text")[0].value; //取得文本框的值，即新数据
	var param='trid='+trid+'&tdid='+tdid+'&value='+value+'&t='+new Date().getTime();
	//alert(tdid);
	//alert(trid);
	//alert(value);
	$.ajax({
		 	url: prefix+'!edit.zf',
		 	type: 'POST',
		 	dataType: 'json',
		 	data:param,
		 	error: function(){alert('error');},
		 	success: function(json){
				alert(json.info); 
				if(json.result==true){
					$obj.data("oldtxt",value); //设置此单元格缓存为新数据
					cancel(obtn); //调用'取消'方法，
					//在此应传'取消'按钮过去，
					//但在'取消'事件中没有用'取消'按钮这个对象,
					//用的只是它的上一级，即td，
					//固在此直接用'修改'按钮替代
				}else{
					cancel(obtn);
				}
				//load('');
		 	}
	}); 
}
function editbox()
{
	//绑定事件
	$(".editbox").each(function(){ //取得所有class为editbox的对像
		$(this).bind("dblclick",function(){ //给其绑定双击事件
			editText = $(this).html(); //取得表格单元格的文本
			setEditHTML(editText); //初始化控件
			$(this).data("oldtxt",editText) //将单元格原文本保存在其缓存中，便修改失败或取消时用
			.html(editHTML) //改变单元格内容为编辑状态
			.unbind("dblclick"); //删除单元格双击事件，避免多次双击
		});
	});
}
function ck()
{
	if(b)
		b=false;
	else
		b=true;
	var sel = document.getElementsByName("row");
    for (var i=0;i<sel.length;i++ )
    	sel[i].checked = b;  
}
function deletes()
{
	var str="";
	var sel = document.getElementsByName("row");
    for(var i=0;i<sel.length;i++)
    {
   		if(sel[i].checked==true)
   			str+=sel[i].value+",";
    }
	if(str==""){
		alert("请至少选择一条记录");
		return false;
	}
	if(window.confirm("确定要删除这些记录吗？")){
		$.ajax({
		 	url: prefix+'!del.zf?ids='+str+'&t='+new Date().getTime(),
		 	type: 'POST',
		 	dataType: 'json',
		 	error: function(){alert('error');},
		 	success: function(json){
			alert(json.info); 
			load('');
		 	}
		}); 
	}
}


function exports()
{
	window.open(prefix+'!export.zf?type=1&t='+new Date().getTime());
}