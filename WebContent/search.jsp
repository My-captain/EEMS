<%@ page import="com.google.gson.Gson"%>
<%@ page import="cn.njucm.po.User"%>
<%@ page import="cn.njucm.dao.DBUtil"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
    String keyword = request.getParameter("keyword");
    ArrayList<User> users = DBUtil.selectByKeyword(keyword);
    if (users.size()==0) {
        response.getWriter().write("{'msg': 0}");
    } else {
        String resultJSON = new Gson().toJson(users);
        response.getWriter().write(resultJSON);
    }
%>