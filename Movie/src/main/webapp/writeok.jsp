<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
	dao.write(vo);
	
	vo.getTitle();
	vo.getContent();
	vo.getAuthor();
	vo.getBoardType();
	
%>