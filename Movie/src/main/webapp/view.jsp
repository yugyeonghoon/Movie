<%@page import="ad.MovieAdVO"%>
<%@page import="movie.AdMovieVO"%>
<%@page import="ad.AdBoardVO"%>
<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@page import="ad.AdVO"%>
<%@page import="ad.AdDAO"%>
<%@page import="java.util.List"%>
<%@page import="movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%	
	String no = request.getParameter("no");
	String docid = request.getParameter("docid");
	
	AdDAO adDao = new AdDAO();
	BoardDAO boardDao = new BoardDAO();
	MovieDAO movieDao = new MovieDAO();
	
	List<AdBoardVO> adlist = null;
	List<AdMovieVO> movielist = null;
	List<MovieAdVO> admovielist = null;

	// URL 값에 따라 분기
	if (no != null && !no.isEmpty()) {
	    // 게시물 유사도 비교
	    adlist = adDao.adSim(no);
	} else if (docid != null && !docid.isEmpty()) {
	    // 영화 유사도 비교
	    movielist = movieDao.simMovie(docid);
	    // 영화 광고 유사도 비교
	    admovielist = adDao.AdMovieSim(docid);
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
</style>
</head>
<body>
	<div class="user-container">
	
	<% if (no != null && !no.isEmpty()) { %>
		<h2>게시물 유사도 비교</h2>
		<table>
			<thead>
				<tr>
					<th>게시물 번호</th>
					<th>게시물 타이틀</th>
					<th>광고 타이틀</th>
					<th>광고 유사도</th>
				</tr>
			</thead>
			<tbody>
				<%
						for(int i = 0; i < adlist.size(); i++){
							AdBoardVO vo = adlist.get(i);
							String sim = vo.getAdvertisement_board_similarity();
							String title = vo.getBoard_title();
							int boardNo = vo.getBoard_no();
							String adTitle = vo.getAdvertisement_title();
					%>
						<tr>
							<td><%= boardNo %></td>
							<td><%= title %></td>		
							<td><%= adTitle %></td>
							<td><%= sim %></td>
						</tr>				
					<%
						}
				%>
			</tbody>
		</table>
	<% } %>
	<% if (docid != null && !docid.isEmpty()) { %>
		<h2>영화 유사도 비교</h2>
		<table>
			<thead>
				<tr>
					<th>영화 번호</th>
					<th>영화 타이틀</th>
					<th>추천 영화 타이틀</th>
					<th>영화 유사도</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(int i = 0; i < movielist.size(); i++){
						AdMovieVO vo = movielist.get(i);
						String baseMovie = vo.getBase_movie_docid();
						String sim = vo.getSimilarities_movies();
						String baseTitle = vo.getBase_movie_title();
						String targetTitle = vo.getTarget_movie_title();
				%>
					<tr>
						<td><%= baseMovie %></td>
						<td><%= baseTitle %></td>		
						<td><%= targetTitle %></td>
						<td><%= sim %></td>
					</tr>				
				<%
					}
				%>
			</tbody>
		</table>
		<br>
		<br>
		<br>
		<br>
		<h2>영화 광고 유사도 비교</h2>
		<table>
			<thead>
				<tr>
					<th>영화 번호</th>
					<th>영화 타이틀</th>
					<th>광고 타이틀</th>
					<th>영화 유사도</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(int i = 0; i < admovielist.size(); i++){
						MovieAdVO vo = admovielist.get(i);
						String adTitle = vo.getAdvertisement_title();
						String sim = vo.getMovie_advertisement_similarity();
						String baseTitle = vo.getBase_movie_title();
						String baseMovie = vo.getDocid();
				%>
					<tr>
						<td><%= baseMovie %></td>
						<td><%= baseTitle %></td>		
						<td><%= adTitle %></td>
						<td><%= sim %></td>
					</tr>				
				<%
					}
				%>
			</tbody>
		</table>
	<% } %>
			<br>
			<br>
			<br>
			<br>
			<p style="text-align: center; font-size: 25px; font-color : gray;">위 유사도는 1점 만점이며, 유사도가 높을 수록 영화 혹은 게시물이 광고와 유사성이 높습니다.</p>
	</div>
</body>
</html>
