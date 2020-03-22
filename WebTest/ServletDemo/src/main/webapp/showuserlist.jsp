<%@page import="java.util.List"%>
<%@page import="org.lz.entity.User"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户</title>
</head>

<body>
    <p>
        <div style="margin:0 auto;margin-top: 40px;">
            <table width="40%" ; border="1" ; bgcolor="#FFFFC6">
                <caption style="margin-bottom: 20px">
                    MySQL数据表内容
                </caption>
                <tr>
                    <th>username</th>
                    <th>password</th>
                </tr>       
        <!-- Object obj = request.getAttribute("userlist"); -->
        <%
        Object obj = session.getAttribute("userlist");
	    List<User> userList = null;
	    if(obj instanceof List){
		    userList = (List<User>)obj;
	    }
	    if(userList!=null){
		    for(User user:userList){
			    String userinfo = user.getUsername()+"---"+user.getPassword();
		        %>
                <tr>
                    <td><%=user.getUsername()%></td>
                    <td><%=user.getPassword()%></td>
                </tr>
                <%
            }
        }
        %>
            </table>
        </div>
    </p>
    <textarea name="description" id="description" /></textarea>
</body>

</html>
<!--
<script src="ckeditor/ckeditor.js"></script>
<script type="text/javascript">
    window.onload = function () {
        CKEDITOR.replace('description');
    };
</script>
-->