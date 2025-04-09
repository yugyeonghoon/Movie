<%@page import="ad.AdVO"%>
<%@page import="ad.AdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String category = request.getParameter("category");
	String img = request.getParameter("img");
	String link = request.getParameter("link");
	String endDate = request.getParameter("endDate");
	String startDate = request.getParameter("startDate");
	
	if(title == null || img == null || category == null || link == null || startDate == null || endDate == null){
		response.sendRedirect("ad_update.jsp");
		return;
	}
	
	if(title.isEmpty() || img.isEmpty() || category.isEmpty() || link.isEmpty() || startDate.isEmpty() || endDate.isEmpty()){
		response.sendRedirect("ad_update.jsp");
		return;
	}
	
	
	AdDAO dao = new AdDAO();
	AdVO vo = new AdVO();
	
	vo.setAdTitle(title);
	vo.setAdCat(category);
	vo.setAdImg(img);
	vo.setAdLink(link);
	vo.setEndDate(endDate);
	dao.addAd(vo);
	response.sendRedirect("advertisement.jsp");
%>