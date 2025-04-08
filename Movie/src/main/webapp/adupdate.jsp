<%@page import="ad.AdVO"%>
<%@page import="ad.AdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String adnum = request.getParameter("adnum");
	String title = request.getParameter("title");
	String img = request.getParameter("img");
	String category = request.getParameter("category");
	String date = request.getParameter("date");
	String link = request.getParameter("link");
	
	if(adnum == null || title == null || img == null || category == null || link == null){
		response.sendRedirect("ad_update.jsp");
		return;
	}
	
	if(adnum.isEmpty() || title.isEmpty() || img.isEmpty() || category.isEmpty() || link.isEmpty()){
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
	dao.adModify(vo);
	response.sendRedirect("advertisement.jsp");
%>