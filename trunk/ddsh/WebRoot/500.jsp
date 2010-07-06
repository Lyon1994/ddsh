<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Throwable ex = null;
	if (exception != null)
		ex = exception;
	if (request.getAttribute("javax.servlet.error.exception") != null)
		ex = (Throwable) request.getAttribute("javax.servlet.error.exception");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>500 - 系统内部错误</title>

</head>

<body>

<div style="display:hidden">
<br/>由于会话id的丢失,产生这个的原因是由于服务器的宕机或者其他原因导致客户端和服务器端的cookie内保存的的会话id失效而引起的
<br/>请尝试重新登录,勾选记住cookie
<br/>或者重新刷新页面从服务器获取新的会话id
<br/>如果还不行的话,请清空浏览器的缓存试下
</div>
<div><a href="<c:url value="/"/>">返回首页</a>
<a href="#" onClick="window.location.reload();return false;">刷新</a>

</div>
</body>
</html>
