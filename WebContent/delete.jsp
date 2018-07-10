<%@page import="cn.njucm.dao.DBUtil"%>
<%@page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>编辑</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int userId = Integer.valueOf(request.getParameter("userId")).intValue();
    boolean flag = DBUtil.deleteByUserId(userId);
    if (flag) {
	        System.out.println("删除成功！走你~");
    }
%>
</body>
</html>
