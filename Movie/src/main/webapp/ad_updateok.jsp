<%@page import="ad.AdVO"%>
<%@page import="ad.AdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String adnum = request.getParameter("adnum");
	String title = request.getParameter("title");
	String img = request.getParameter("img");
	String category = request.getParameter("category");
	String link = request.getParameter("link");
	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
	
	if(adnum == null || title == null || img == null || category == null || link == null || startDate == null || endDate == null){
		response.sendRedirect("ad_update.jsp");
		return;
	}
	
	if(adnum.isEmpty() || title.isEmpty() || img.isEmpty() || category.isEmpty() || link.isEmpty() || startDate.isEmpty() || endDate.isEmpty()){
		response.sendRedirect("ad_update.jsp");
		return;
	}
	
	int adnum2 = Integer.parseInt(adnum);
	AdDAO dao = new AdDAO();
	AdVO vo = new AdVO();
	
	vo.setAdnum(adnum2);
	vo.setAdTitle(title);
	vo.setAdLink(link);
	vo.setAdCat(category);
	vo.setAdImg(img);
	vo.setStartDate(startDate);
	vo.setEndDate(endDate);
	dao.adModify(vo);
	response.sendRedirect("advertisement.jsp");
%>