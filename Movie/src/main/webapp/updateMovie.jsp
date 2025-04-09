<%@page import="movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String docid = request.getParameter("no");
	int no = Integer.parseInt(request.getParameter("type"));
	
	MovieDAO dao = new MovieDAO();
	dao.updateMovieType(docid, no);
	response.sendRedirect("movie_management.jsp");
%>