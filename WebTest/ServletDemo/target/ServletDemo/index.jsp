<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
</head>
<body>
    <p>请输入任意的username和password</p>
    <form action="demo?action=login" method="post">  
        Username:<input type="text" name="username" />  
        Password:<input type="password" name="password" />              
        <input type="submit" value="提交" />  
    </form>  
    <textarea name="description" id="description"/></textarea>
</body>
</html>