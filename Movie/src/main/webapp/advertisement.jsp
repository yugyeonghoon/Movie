<%@page import="java.util.List"%>
<%@page import="ad.AdDAO"%>
<%@page import="ad.AdVO"%>
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

	AdDAO dao = new AdDAO();
	List<AdVO> list = dao.adList(searchType, keyword, startNum, limitPerPage);
	
	int totalCount = dao.getCount(searchType, keyword);
	
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
<title>광고 관리</title>
<style>
	body{
		font-family: 'Source Sans Pro', sans-serif;
		background: white;
		margin: 0;
		padding: 0;
		color: #333;
	}
	.user-container{
		padding: 3px;
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
		font-size: 14px;
		border-radius: 12px;
	}
	th{
		background-color:#edebeb;
		color: #3d3838;
		font-size: 16px;
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
		font-size: 14px;
		transition: background 0.3s;
		font-weight: bold;
		padding: 8px 8px;
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
	.add-button {
		background: #000000;
		color: white;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		font-size: 14px;
		transition: background 0.3s;
		font-weight: bold;
		padding: 8px 8px;
		position: fixed;
	    left: 1750px;
	    top: 180px;
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
	<div class="user-container">
		<h2>광고 관리</h2>
		<button class="add-button" onclick="location.href='adAdd.jsp'">광고추가</button>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>광고제목</th>
					<th>카테고리</th>
					<th>링크</th>
					<th>광고시작일</th>
					<th>광고종료일</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(int i = 0; i < list.size(); i++){
						AdVO vo = list.get(i);
						int adnum = vo.getAdnum();
						String title = vo.getAdTitle();
						String category = vo.getAdCat();
						String link = vo.getAdLink();
						String startDate = vo.getStartDate();
						String endDate = vo.getEndDate();
				%>
					<tr style="color: black">
						<td><%= adnum %></td>		
						<td><%= title %></td>
						<td><%= category %></td>
						<td><%= link %></td>
						<td><%= startDate %></td>
						<td><%= endDate %></td>
						<td class="action-buttons">
							<button onclick="location.href='ad_update.jsp?adnum=<%= adnum %>'">수정</button>
							<button id="delete-ad" class="delete" onclick="deleteAd('<%= adnum %>', this)">삭제</button>
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
			<a href="advertisement.jsp?page=1<%= searchType != "" ? "&searchType="+searchType : "" %><%= keyword != "" ? "&searchKeyword="+keyword : "" %>">&lt;&lt;</a>
			<a href="advertisement.jsp?page=<%= currentPage - 1 %><%= searchType != "" ? "&searchType="+searchType : "" %><%= keyword != "" ? "&searchKeyword="+keyword : "" %>">&lt;</a>
		<%
        	}
		%>
        <%
           	for(int i = startPage; i <= endPage; i ++){
           		if(i == currentPage){
           			%>
            			<a class="active" href="advertisement.jsp?page=<%= i %><%= searchType != "" ? "&searchType="+searchType : "" %><%= keyword != "" ? "&searchKeyword="+keyword : "" %>"><%= i %></a>
            		<%
           		}else{
           			%>
            			<a href="advertisement.jsp?page=<%= i %><%= searchType != "" ? "&searchType="+searchType : "" %><%= keyword != "" ? "&searchKeyword="+keyword : "" %>"><%= i %></a>
            		<%
           		}
           	}
         %>
         <%
          	if(currentPage < totalPage) {
         %>
            <a href="advertisement.jsp?page=<%= currentPage + 1 %><%= searchType != "" ? "&searchType="+searchType : "" %><%= keyword != "" ? "&searchKeyword="+keyword : "" %>">&gt;</a>
            <a href="advertisement.jsp?page=<%= totalPage %><%= searchType != "" ? "&searchType="+searchType : "" %><%= keyword != "" ? "&searchKeyword="+keyword : "" %>">&gt;&gt;</a>
         <%
          	}
          %>	
        </div>
        <div class="search-bar">
            <form action="advertisement.jsp" method="get">
                <select name="searchType">
                    <option value="advertisement_title" <%= searchType.equals("advertisement_title") ? "seleted" : "" %>>제목</option>
                    <option value="advertisement_cat" <%= searchType.equals("advertisement_cat") ? "selected" : "" %>>카테고리</option>
                    
                </select>
            	<input value="<%=keyword %>" type="text" name="searchKeyword" placeholder="검색어를 입력하세요">
                <button type="submit">검색</button>
            </form>
		</div>
	</div>
</body>
<script>
	function deleteAd(adnum, obj){
		let result = confirm("삭제하시겠습니까?")
		if(result == true){
			console.log(adnum)
			$.ajax({
				url : "adout.jsp",
				type : "post",
				data : {
					adnum : adnum
				},
				success : function(result){
					if(result.trim() == "success"){
						alert("광고를 삭제하셨습니다.");
						location.href = "advertisement.jsp"
					}
				},
				error : function(){
					console.log("error");
				}
			});
		}
	}
</script>
</html>