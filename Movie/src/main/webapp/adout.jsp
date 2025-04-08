<%@page import="ad.AdDAO"%>
<%@page import="ad.AdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String adnum = request.getParameter("adnum");
	System.out.println(adnum);
	int adnum2 = Integer.parseInt(adnum);
	AdDAO dao = new AdDAO();
	dao.adDelete(adnum2);
	out.print("success");
%>