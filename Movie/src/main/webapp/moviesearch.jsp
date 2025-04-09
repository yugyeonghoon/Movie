<%@page import="movie.MovieVO"%>
<%@page import="java.util.List"%>
<%@page import="movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%
	String title = request.getParameter("movieKeyword");
	String actors = request.getParameter("movieKeyword");
	
	MovieDAO dao = new MovieDAO();
	List<MovieVO> list = dao.searchMovies(title, actors);

	if(title == null) {
		title = "";
	}
	if(actors == null) {
		actors = "";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.genre {
		margin-left: 9%;
	}
	
	#content {
		/* width: 1800px; */
    	margin-left: 0;
    	margin-right: auto;
	}
	
	.carousel-inner {
		padding: 2rem;
	}
	
	.title {
		/* margin-left: 8%; */
	}
	
	.first {
		/* float: left;
		margin-right: 10px;
		margin-left: 8%;
		width:15%; */
		}
		
	img {
		margin-right: 10px;
    	margin-bottom: 10px;
	}
</style>
</head>
<body>

<!-- 헤더 검색어에 키워드 클릭 시 관련된 영화 정보 리스트 나옴 
	ex) 해리포터 검색 시 해리포터 시리즈 영화 리스트가 나옴
		그 중 해리포터 비밀의 방 영화 클릭 시 영화 상세 정보가 나오도록
-->
<div id="content">
	<div class="genre">
		<div id="carouselExampleControlsNoTouchingfirst" class="carousel carousel-dark slide">
			  <div class="carousel-inner">
				<div class="title">
				  <h4>
				  	<span>영화</span>
				  </h4>
				</div>
			    <div class="carousel-item active">
			    <div class="first">
			    <%
				    for(int i = 0; i < list.size(); i++){
		    			MovieVO vo = list.get(i);
		    			String no = vo.getDocid();
		    			String poster = vo.getPoster();
			    %>
				    
				    	<a href="movieDetail.jsp?no=<%= no %>"><img src="<%=poster %>" alt="..."></a>
				    
				    <%
				    	}
				    %>
				 </div>
			    </div>
			  </div>
		</div>
	</div>
	<div class="advertising-container">
	    	<a class="linkfirst" href="https://www.netflix.com/kr/" target="_blank"><img alt="링크이미지1" src="netfilx1.jpg" style="max-width:100%;"></a>
	    </div>
</div>
</body>
</html>