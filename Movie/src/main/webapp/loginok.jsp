<%@page import="ip.IpVO"%>
<%@page import="ip.IpDAO"%>
<%@page import="ip.ip.IpUtil"%>
<%@page import="user.UserVO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	String check = request.getParameter("checkId");
	
	String ip = IpUtil.getClientIp(request);
    System.out.println(ip);
    String menuid = "로그인";
    IpDAO ipDao = new IpDAO();
    IpVO ipVo = new IpVO();
    System.out.println(menuid);
    ipVo.setIp(ip);
    ipVo.setMenu_id(menuid);
    ipDao.insert(ipVo);
	
	if(id == null || pw == null){
		response.sendRedirect("login.jsp");
		return;
	}
	
	if(id.isEmpty() || pw.isEmpty()){
		response.sendRedirect("login.jsp");
		return;
	}
	
	UserDAO dao = new UserDAO();
	UserVO vo = new UserVO();
	vo.setId(id);
	vo.setPw(pw);
	
	UserVO user = dao.login(vo);
	
	if(user == null){
		response.sendRedirect("login.jsp?error=fail");
		return;
	}
	Cookie cookie = new Cookie("id", id);
	cookie.setMaxAge(1 * 60 * 60 * 24 * 10);
	if (check != null){
		response.addCookie(cookie);
	}else{
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	}
	session.setAttribute("user", user);
	response.sendRedirect("main.jsp");
%>