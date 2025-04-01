<%@page import="user.UserVO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String email = request.getParameter("email");
	String nick = request.getParameter("nickname");
	
	System.out.println(id);
	System.out.println(pw);
	System.out.println(email);
	System.out.println(nick);
	if(id == null || pw == null || email ==null || nick == null ) {
		response.sendRedirect("signup.jsp");
		return;
	}
	
	if(id.isEmpty() || pw.isEmpty() || email.isEmpty() || nick.isEmpty()){
		response.sendRedirect("signup.jsp");
		return;
	}
	
	UserDAO dao = new UserDAO();
	UserVO vo = new UserVO();
	vo.setId(id);
	vo.setPw(pw);
	vo.setEmail(email);
	vo.setNick(nick);
	
	dao.join(vo);
	
	response.sendRedirect("login.jsp");
%>