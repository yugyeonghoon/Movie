<%@page import="board.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>   
<%
	if(user == null || user.getUserType() != 0){
		response.sendRedirect("main.jsp");
		return;
	}

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
	List<BoardVO> list = dao.listAllView(searchType, keyword, startNum, limitPerPage);
	
	int totalCount = dao.getCountAll(searchType, keyword);
	
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
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
		body{
			font-family: 'Source Sans Pro', sans-serif;
			background: white;
			margin: 0;
			padding: 0;
			color: #333;
		}
		.user-container{
			padding: 20px;
		    max-width: 1200px;
		    margin: 40px auto;
		    background: white;
		    border-radius: 10px;
		    box-shadow: 0 2px 10px rgb(30 88 139 / 20%);
		    border: 2px solid #a9a9a9;
		   }
		h2{
			color: #000000;
			text-align: center;
			margin-bottom: 20px;
			font-size: 27px;
		}
		table{
			width: 100%;
			margin-top:20px;
			border-radius: 12px;
			border-style: hidden;
			border-collapse: collapse;
		}
		th,td {
			text-align: center;
			padding: 6px;
			font-size: 17px;
			border-radius: 12px;
		}
		th{
			background-color:#edebeb;
			color: #3d3838;
			font-size: 19px;
		}
		.action-buttons{
			text-align: center;
		}
		.action-buttons button{
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
			background:#283552;
		}
		.action-buttons button.delete {
			background: #ff1a1a;
		}
		.action-buttons button.delete:hover{
			background: #e60000;
		}
		.notice {
            background-color: #FF6B6B; /* Red for Notice */
            color: white;
        }
        .movie {
            background-color: #4D96FF; /* Blue for Movie Discussion */
            color: white;
        }
        .free {
            background-color: #66FF66; /* Green for Free Board */
            color: white;
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
		<h2>게시물 관리</h2>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>타입</th>
					<th>작성자</th>					
					<th>제목</th>
					<th>본문</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(int i = 0; i < list.size(); i++){
						BoardVO vo = list.get(i);
						int no = vo.getNo();
						String title = vo.getTitle();
						String content = vo.getContent();
						String author = vo.getAuthor();
						int boardType = vo.getBoardType();
						
						String boardTypeClass = ""; 
                        if (boardType == 0) {
                            boardTypeClass = "notice";
                        } else if (boardType == 1) {
                            boardTypeClass = "movie";
                        } else if (boardType == 2) {
                            boardTypeClass = "free";
                        }
				%>
				<tr style="color: black">
					<td><%= i + 1 %></td>
					  <td class="<%= boardTypeClass %>"><%= boardType == 0 ? "공지" : (boardType == 1 ? "영화 토론" : (boardType == 2 ? "자유 게시판" : "")) %></td>
					<td><%= author %></td>					
					<td><a href="post.jsp?no=<%= no %>"><%= title %></a></td>
					<td><%= content.length() > 20 ? content.substring(0, 20) + "..." : content %></td>
						<input type="hidden" name="no" value="">			
					<td class="action-buttons">
						<%-- <button onclick="location.href='board_update.jsp?no=<%= no %>'">수정</button> --%>
						<button id="delete-board" class="delete" onclick="deletePost(<%= no %>)">삭제</button>
					</td>
				</tr>	
				<%
					}
				%>			
			</tbody>
		</table>
		<div class="pagination">
		<%
       		if(currentPage > 1){
        	%>
			<a href="board_management.jsp?page=1<%= searchType != "" ? "&searchType="+searchType : "" %><%= keyword != "" ? "&searchKeyword="+keyword : "" %>">&lt;&lt;</a>
			<a href="board_management.jsp?page=<%= currentPage - 1 %><%= searchType != "" ? "&searchType="+searchType : "" %><%= keyword != "" ? "&searchKeyword="+keyword : "" %>">&lt;</a>
		<%
        	}
		%>
        <%
           	for(int i = startPage; i <= endPage; i ++){
           		if(i == currentPage){
           			%>
            			<a class="active" href="board_management.jsp?page=<%= i %><%= searchType != "" ? "&searchType="+searchType : "" %><%= keyword != "" ? "&searchKeyword="+keyword : "" %>"><%= i %></a>
            		<%
           		}else{
           			%>
            			<a href="board_management.jsp?page=<%= i %><%= searchType != "" ? "&searchType="+searchType : "" %><%= keyword != "" ? "&searchKeyword="+keyword : "" %>"><%= i %></a>
            		<%
           		}
           	}
         %>
         <%
          	if(currentPage < totalPage) {
         %>
            <a href="board_management.jsp?page=<%= currentPage + 1 %><%= searchType != "" ? "&searchType="+searchType : "" %><%= keyword != "" ? "&searchKeyword="+keyword : "" %>">&gt;</a>
            <a href="board_management.jsp?page=<%= totalPage %><%= searchType != "" ? "&searchType="+searchType : "" %><%= keyword != "" ? "&searchKeyword="+keyword : "" %>">&gt;&gt;</a>
         <%
          	}
          %>	
        </div>
	</div>
	</body>
	<script>
		function deletePost(no){
			confirm("삭제하시겠습니까?")
			location.href = "delete_managerment.jsp?no="+ no;
		}
	</script>
</html>