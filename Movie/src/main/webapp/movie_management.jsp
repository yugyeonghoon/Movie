<%@page import="movie.MovieVO"%>
<%@page import="java.util.List"%>
<%@page import="movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<%
    String pageNum = request.getParameter("page");
    if (pageNum == null) pageNum = "1";
    int currentPage = Integer.parseInt(pageNum);

    int limitPerPage = 100; 
    int startNum = (currentPage - 1) * limitPerPage;

    String searchType = request.getParameter("searchType");
    String keyword = request.getParameter("searchKeyword");

    if (searchType == null) searchType = "";
    if (keyword == null) keyword = "";

    MovieDAO dao = new MovieDAO();
    List<MovieVO> list = dao.recommenMovie(searchType, keyword, startNum, limitPerPage);
    int totalCount = dao.getCount(searchType, keyword);

    int totalPage = (int)Math.ceil((double)totalCount / limitPerPage);
    int pageGroupSize = 10;
    int startPage = ((currentPage - 1) / pageGroupSize) * pageGroupSize + 1;
    int endPage = Math.min(startPage + pageGroupSize - 1, totalPage);
%>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>추천 영화 관리</title>
	    <style>
	        수<style>
        /* 기존 스타일 유지 (생략 가능) */
        body {
            font-family: 'Source Sans Pro', sans-serif;
            background: white;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .user-container {
            padding: 20px;
            max-width: 1200px;
            margin: 40px auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgb(30 88 139 / 20%);
            border: 2px solid #a9a9a9;
        }
        h2 {
            color: #000000;
            text-align: center;
            margin-bottom: 20px;
            font-size: 27px;
        }
        .insert {
            background: #000000;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 15px;
            transition: background 0.3s;
            font-weight: bold;
            padding: 10px 10px;
            position: absolute;
            margin-left: 1050px;
            margin-top: -60px;
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        th, td {
            text-align: center;
            padding: 6px;
            font-size: 17px;
            border-radius: 12px;
        }
        th {
            background-color: #edebeb;
            color: #3d3838;
            font-size: 19px;
        }
        .action-buttons button {
            background: #000000;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 15px;
            margin-right: 5px;
            transition: background 0.3s;
            font-weight: bold;
            padding: 10px 10px;
        }
        .action-buttons button:hover {
            background: #283552;
        }
        .action-buttons button.zero {
            background: #6192C0;
        }
        .action-buttons button.zero:hover {
            background: #6192C0;
        }
        .search-box {
            text-align: right;
            margin-bottom: 20px;
        }
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
       .pagination a {
            display: block;
            padding: 10px 15px;
            margin: 0 5px;
            text-decoration: none;
            color: #2575fc;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: background 0.3s ease, color 0.3s ease;
        }
        .pagination a:hover {
            background: #2575fc;
            color: white;
        }
        .pagination a.active {
            background: #2575fc;
            color: white;
            pointer-events: none;
        }
    </style>
	</head>
	<body>
	<div class="user-container">
	    <h2>추천 영화 관리</h2>
	    <button type="button" class="insert" onclick="location.href='movie_management.jsp'">목록으로</button>
	    <form method="get" action="movie_management.jsp" class="search-box">
	        <select name="searchType">
	            <option value="title" <%= "title".equals(searchType) ? "selected" : "" %>>제목</option>
	            <option value="genre" <%= "genre".equals(searchType) ? "selected" : "" %>>장르</option>
	        </select>
	        <input type="text" name="searchKeyword" value="<%= keyword %>" placeholder="검색어 입력">
	        <button type="submit">검색</button>
	    </form>
	    <table>
	        <thead>
	        <tr>
	            <th>번호</th>
	            <th>아이디</th>
	            <th>제목</th>
	            <th>장르</th>
	            <th>관리</th>
	            <th>상태</th>
	        </tr>
	        </thead>
	        <tbody>
	        <%
	            for (int i = 0; i < list.size(); i++) {
	                MovieVO vo = list.get(i);
	                String docid = vo.getDocid();
	                String title = vo.getTitle();
	                String genre = vo.getGenre();
	                int movieType = vo.getMovie_type();
	        %>
	        <tr <%= (movieType == 1 ? "style='background-color: gray;'" : "") %>>
	            <td><%= i + 1 + startNum %></td>
	            <td><a href="movieDetail.jsp?no=<%= docid %>"><%= docid %></a></td>
	            <input type="hidden" name="id" value="<%= docid %>">
	            <td><%= title %></td>
	            <td><%= genre %></td>
	            <td class="action-buttons">
	                <button class="one" onclick="return one('<%= docid %>')">등록</button>
	                <button class="zero" onclick="return zero('<%= docid %>')">제거</button>
	            </td>
	            <td><%= movieType == 1 ? "등록 중" : "등록 가능" %></td>
	        </tr>
	        <%
	            }
	        %>
	        </tbody>
	    </table>
	    <div class="pagination">
		    <%
		        if (currentPage > 1) {
		    %>
		        <a href="movie_management.jsp?page=1<%= searchType != "" ? "&searchType=" + searchType : "" %><%= keyword != "" ? "&searchKeyword=" + keyword : "" %>">&lt;&lt;</a>
		        <a href="movie_management.jsp?page=<%= currentPage - 1 %><%= searchType != "" ? "&searchType=" + searchType : "" %><%= keyword != "" ? "&searchKeyword=" + keyword : "" %>">&lt;</a>
		    <%
		        }
		        for (int i = startPage; i <= endPage; i++) {
		            if (i == currentPage) {
		    %>
		        <a class="active" href="movie_management.jsp?page=<%= i %><%= searchType != "" ? "&searchType=" + searchType : "" %><%= keyword != "" ? "&searchKeyword=" + keyword : "" %>"><%= i %></a>
		    <%
		            } else {
		    %>
		        <a href="movie_management.jsp?page=<%= i %><%= searchType != "" ? "&searchType=" + searchType : "" %><%= keyword != "" ? "&searchKeyword=" + keyword : "" %>"><%= i %></a>
		    <%
		            }
		        }
		        if (currentPage < totalPage) {
		    %>
		        <a href="movie_management.jsp?page=<%= currentPage + 1 %><%= searchType != "" ? "&searchType=" + searchType : "" %><%= keyword != "" ? "&searchKeyword=" + keyword : "" %>">&gt;</a>
		        <a href="movie_management.jsp?page=<%= totalPage %><%= searchType != "" ? "&searchType=" + searchType : "" %><%= keyword != "" ? "&searchKeyword=" + keyword : "" %>">&gt;&gt;</a>
		    <%
		        }
		    %>
		</div>
	</div>
	<script>
	    function one(docid) {
	        if (confirm("등록하시겠습니까?")) {
	            window.location.href = 'updateMovie.jsp?no=' + docid + '&type=1';
	        }
	    }
	
	    function zero(docid) {
	        if (confirm("제거하시겠습니까?")) {
	            window.location.href = 'updateMovie.jsp?no=' + docid + '&type=0';
	        }
	    }
	</script>
	</body>
</html>