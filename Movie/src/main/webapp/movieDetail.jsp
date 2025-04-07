<%@page import="movie.MovieVO"%>
<%@page import="movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%
	String no = request.getParameter("no");

	MovieDAO dao = new MovieDAO();
	MovieVO vo = dao.view(no);
	
	String title = vo.getTitle();
	String director = vo.getDirectors();
	String actor = vo.getActors();
	String nation = vo.getNation();
	String genre = vo.getGenre();
	String plots = vo.getPlots();
	String reprisdate = vo.getRepRlsDate();
	String poster = vo.getPoster();
	int runtime = vo.getRuntime();
	String ratingGrade = vo.getRating_grade();
	int rating = vo.getRating();
	int ratingPeople = vo.getRating_people();
	
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>영화 상세정보</title>
	    <style>
	        body {
	            font-family: Arial, sans-serif;
	            margin: 20px;
	            background-color: white;
	        }
	        h3 {
	        	text-align: center;
	        }
	        .movie-container {
	            display: flex;
	            max-width: 900px;
	            margin: 0 auto;
	            padding: 20px;
	            background-color: white;
	            border-radius: 10px;
	            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	        }
	        .movie-poster {
	            flex: 1;
	            margin-right: 20px;
	        }
	        .movie-poster img {
	            max-width: 100%;
	            border-radius: 8px;
	        }
	        .movie-info {
	            flex: 2;
	        }
	        .movie-info h2 {
	            font-size: 28px;
	            color: #333;
	        }
	        .movie-info p {
	            font-size: 16px;
	            color: #555;
	        }
	        .movie-info .rating {
	            font-weight: bold;
	            font-size: 18px;
	        }
	        .movie-info .plot {
	            margin-top: 20px;
	        }
	        .poster{
	        	width: 100%;
	        	margin-top: 75px;
	        }
	        .advertising-container{
	        	margin-left: 45%;
	        }
	        .ratingPeople {
	        	color : gray;
	        }
	    </style>
	</head>
	<body>
	    <h3>영화 상세정보</h3>
	    <div class="movie-container">
	        <div class="movie-poster">
	            <img src="<%= poster %>" alt="포스터" id="posterImage" class="poster">
	        </div>
	        <div class="movie-info">
	            <h2 id="movieTitle"><%= title %></h2>
		            <p><strong>개봉일: </strong><span id="releaseDate" class="releaseDate"><%= reprisdate %></span></p>
		            <p><strong>시간:</strong><span id="genre" class="genre"><%= runtime %>분</span></p>
		            <p><strong>국가: </strong><span id="nation" class="nation"><%= nation %></span></p>
		            <p><strong>장르: </strong><span id="genre"><%= genre %></span></p>
		            <p><strong>연령: </strong><span id="age" class="age"><%= ratingGrade %></span></p>
		            <p><strong>감독: </strong><span id="director" class="director"><%= director %></span></p>
		            <p><strong>배우: </strong><span id="actors" class="actors"><%= actor %></span></p>
		            <p class="rating"><strong>평점:</strong><span id="rating"><%= rating %></span>/10 | <span class="ratingPeople"><%= ratingPeople %>명 참여</span></p>
	            <div class="plot">
	                <h3>줄거리</h3>
	                <p id="plot"><%= plots %></p>
	            </div>
	        </div>
	    </div>
	    <div class="advertising-container">
	    	<!-- <a class="linkfirst" href="https://www.netflix.com/kr/" target="_blank"><img alt="링크이미지1" src="netfilx1.jpg" style="max-width:100%;"></a> -->
	    </div>
	</body>
</html>