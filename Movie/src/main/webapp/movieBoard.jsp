<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%
	String pageNum = request.getParameter("page");
	if(pageNum == null){
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	
	int startNum = (currentPage -1) * 10;
	
	int limitPerPage = 10;
	
	String searchType = request.getParameter("searchType");
	String keyword = request.getParameter("searchKeyword");
	
	BoardDAO dao = new BoardDAO();
	List<BoardVO> list = dao.listView(searchType, keyword, startNum, limitPerPage, 1);
	
	int totalCount = dao.getCount(searchType, keyword, 1);
	
	int pageGroupSize = 10;
	int startPage = ((currentPage - 1) / pageGroupSize) * pageGroupSize +1;
	
	int totalPage = 
			(int)Math.ceil(totalCount / (double)limitPerPage);
	
	int endPage = 
			Math.min(startPage + pageGroupSize -1, totalPage);
	
	if(searchType == null) {
		searchType = "";
	}
	if(keyword == null) {
		keyword = "";
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>영화 토론</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to bottom, #ffffff, #ffffff);
            margin: 0;
            padding: 0;
            color: white;
        }
        .board-container {    
	        padding: 5px;
		    max-width: 1200px;
		    margin: 0px auto;
		    background: white;
		    border-radius: 10px;
		    box-shadow: 0 3px 8px rgba(0, 0, 0, 0.15);
		}
        h2 {
            color: black;
            margin: 20px;
            text-align: center;
            font-size: 1.6rem;
        }
        .post-list {
            list-style: none;
            padding: 0;
        }
        .post-item {
            padding: 15px;
            /* margin-bottom: 400px; */
            background: white;
            border-radius: 5px;
            border: 1px solid #ddd;
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }
        .post-item:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            transform: translateY(-3px);
        }
        .post-item a {
            text-decoration: none;
            color: black;
            font-weight: bold;
            font-size: 1.2rem;
        }
        .post-item a:hover {
            text-decoration: underline;
        }
        .post-item .meta {
            font-size: 0.9rem;
            color: #777;
            margin-top: 10px;
        }
        .action {
            text-align: center;
            margin-top: 30px;
        }
        .action button {
            background: white;
            color: black;
            border: none;
            padding: 12px 30px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1rem;
            transition: background 0.3s ease, box-shadow 0.3s ease;
        }
        .action button:hover {
            background: rgb(223 223 223)
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
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
        .search-bar {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
        }
        .search-bar select, .search-bar input[type="text"], .search-bar button {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }
        .search-bar button {
            background: #2575fc;
            color: white;
            border: none;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        .search-bar button:hover {
            background: #1a5fc4;
        }
    </style>
</head>
<body>
	<h2>영화 토론</h2>
    <div class="board-container">
        <ul class="post-list">
        	<%
	        	for(int i = 0; i < list.size(); i++){
	    			BoardVO vo = list.get(i);
	    			int no = vo.getNo();
	    			String title = vo.getTitle();
	    			String author = vo.getAuthor();   		
	    			String createDate = vo.getCreateDate();
	    			int boardType = vo.getBoardType();
        	%>
				<li class="post-item" style="background:<%= boardType == 0 ? "lightgray" : "white" %>;">
					<a href="moviePost.jsp?no=<%= no %>"><%= title %></a>
					<div class="meta">작성자: <%= author %>| 작성일: <%= createDate %></div>
				</li>
			<%
	        	}
			%>
        </ul>
  		<%
        	if(user != null){
        		%>
  			<div class="action">
	            <button onclick="location.href='write.jsp'">글쓰기</button>
	        </div>
        		<%
        	}
        %>
        <div class="pagination">
		<%
       		if(currentPage > 1){
        	%>
			<a href="board.jsp?page=1<%= searchType != "" ? "&searchType="+searchType : "" %><%= keyword != "" ? "&searchKeyword="+keyword : "" %>">&lt;&lt;</a>
			<a href="board.jsp?page=<%= currentPage - 1 %><%= searchType != "" ? "&searchType="+searchType : "" %><%= keyword != "" ? "&searchKeyword="+keyword : "" %>">&lt;</a>
		<%
        	}
		%>
        <%
           	for(int i = startPage; i <= endPage; i ++){
           		if(i == currentPage){
           			%>
            			<a class="active" href="board.jsp?page=<%= i %><%= searchType != "" ? "&searchType="+searchType : "" %><%= keyword != "" ? "&searchKeyword="+keyword : "" %>"><%= i %></a>
            		<%
           		}else{
           			%>
            			<a href="board.jsp?page=<%= i %><%= searchType != "" ? "&searchType="+searchType : "" %><%= keyword != "" ? "&searchKeyword="+keyword : "" %>"><%= i %></a>
            		<%
           		}
           	}
         %>
         <%
          	if(currentPage < totalPage) {
         %>
            <a href="board.jsp?page=<%= currentPage + 1 %><%= searchType != "" ? "&searchType="+searchType : "" %><%= keyword != "" ? "&searchKeyword="+keyword : "" %>">&gt;</a>
            <a href="board.jsp?page=<%= totalPage %><%= searchType != "" ? "&searchType="+searchType : "" %><%= keyword != "" ? "&searchKeyword="+keyword : "" %>">&gt;&gt;</a>
         <%
          	}
          %>	
        </div>
        <div class="search-bar">
            <form action="movieBoard.jsp" method="get">
                <select name="searchType">
                    <option value="title" <%= searchType.equals("title") ? "seleted" : "" %>>제목</option>
                    <option value="content" <%= searchType.equals("content") ? "selected" : "" %>>본문</option>
                    <option value="author" <%= searchType.equals("author") ? "seleted" : "" %>>작성자</option>
                </select>
            	<input value="<%=keyword %>" type="text" name="searchKeyword" placeholder="검색어를 입력하세요">
                <button type="submit">검색</button>
            </form>
        </div>
    </div>
</body>
</html>