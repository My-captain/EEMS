<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cn.njucm.po.User"%>
<%@ page import="cn.njucm.dao.DBUtil"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
User user=new User();
user.setUsername(request.getParameter("username"));
user.setRealname(request.getParameter("realname"));
user.setAge(Integer.valueOf(request.getParameter("age")).intValue());
user.setSex(request.getParameter("sex"));
user.setBirthday(request.getParameter("birthday"));
user.setSalary(Double.parseDouble(request.getParameter("salary")));
String password=request.getParameter("password");
String spassword=request.getParameter("spassword");
if(!password.equals(spassword)){
	out.print("<script>alert('密码不一致！'); window.location='./index.jsp'</script>");
}else{
	user.setPassword(spassword);
	DBUtil.updateUser(user);
	out.print("<script>alert('修改成功！'); window.location='./index.jsp'</script>");
}
%>
</body>
</html>