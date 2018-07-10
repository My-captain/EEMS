<%@page import="cn.njucm.po.User"%>
<%@page import="cn.njucm.dao.DBUtil"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>登录处理-响应请求</title>
</head>
<body>
<%--通过请求对象获取用户和密码：(借助变量)--%>
<%--输出前台传过来的值：--%>
<%--解决数据库问题：加-连-句-执-出-关 --%>
<%
	request.setCharacterEncoding("UTF-8");
	String username=request.getParameter("username");
    String password=request.getParameter("pwd");
    String confirmPwd = request.getParameter("confirm-pwd");
    if (password.equals(confirmPwd)) {
    	User user = new User();
    	user.setUsername(username);
    	user.setPassword(password);
		boolean flag = DBUtil.insertUser(user);
		if(flag){
			out.print("<script>alert('注册成功！'); window.location='./htmls/login.html'</script>");
			} else {
			out.print("<script>alert('注册失败！用户名可能已存在'); window.location='./htmls/login.html'</script>");
        }
    } else {
    	out.print("<script>alert('密码不一致！'); window.location='./htmls/login.html'</script>");
    }
%>
</body>
</html>
