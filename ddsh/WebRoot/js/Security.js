function key(){
	if(event.shiftKey){
		return false;
	}
	//禁止Shift
	if(event.altKey){
		return false;
	}
	//禁止Alt
	if(event.ctrlKey){
		return false;
	}
	//禁止Ctrl
	return false;
}
document.onkeydown=key;
if (window.Event)
	document.captureEvents(Event.MOUSEUP);
function nocontextmenu(){
	event.cancelBubble = true
	event.returnValue = false;
	return false;
}
function norightclick(e){
	if (window.Event){
		if (e.which == 2 || e.which == 3)
			return false;
	}
	else
		if (event.button == 2 || event.button == 3){
			event.cancelBubble = true
			event.returnValue = false;
			return false;
		}
}
//禁右键
document.oncontextmenu = nocontextmenu;  // for IE5+
document.onmousedown = norightclick;  // for all others