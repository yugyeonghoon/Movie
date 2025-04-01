<%@page import="user.UserVO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String pw = request.getParameter("password");
	String id = request.getParameter("id");
	
	UserDAO dao = new UserDAO();
	UserVO vo = new UserVO();
	
	vo.setPw(pw);
	vo.setId(id);
	
	dao.changePw(vo);
	
	response.sendRedirect("login.jsp");
%>