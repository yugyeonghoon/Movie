<%@page import="movie.MovieVO"%>
<%@page import="java.util.List"%>
<%@page import="movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<%
	String genre = request.getParameter("genre");

	MovieDAO dao = new MovieDAO();
	List<MovieVO> list = dao.selectByGenre(genre);
	List<MovieVO> plist = dao.popularGenre(genre);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	<style>
		.side-banner {
			/* position: relative; */
		}
		.banner {
			position: absolute;
		    top: 50%;
		    right: 0;
		   	margin-right: 20px;
		    width: 300px;
		    background-size: contain;
	        transform: translate(0, -50%);
	        margin-left: auto;       
		}
		.genre {
			margin-left: 9%;
		}
		#content {
			width: 1500px;
			margin: auto;
		}
		.carousel-inner {
			padding: 2rem;
		}
		.title {
			margin-left: 8%;
		}
		.first {
			float: left;
			margin-right: 10px;
			/* margin-left: 8%; */
			width: 15%;
			align-content: center;
			}
		.second{
			float: left;
			margin-right: 10px;
			width:10%;
			box-sizing: border-box;	
			}
	
		.third{
			float: left;
			margin-right: 10px;
			width:10%;
			box-sizing: border-box;
			}

		.force {
			float: left;
			margin-right: 10px;
			width:10%;
			box-sizing: border-box;
		}
		.five {
			float: left;
			margin-right: 10px;
			width:10%;
			box-sizing: border-box;
		}
		.carousel-item{
			margin-left: 11%;
		}	
	</style>
	</head>
	<body>
	<!-- 사이드 광고 -->
	<div class="side-banner">
		<div class="banner">
			<!-- <a class="linkfirst"><img alt="링크이미지1" src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20241205_267%2F1733374268697UdIRv_JPEG%2Fmovie_image.jpg" style="max-width:100%"></a> -->
		</div>
	</div>
	
	<!-- 메인 -->
	<div id="content">
	<div class="genre">
		<div>
			<h2>
				<span><%= genre %></span>
			</h2>
		</div>
	</div>
		<div id="carouselExampleControlsNoTouchingfirst" class="carousel carousel-dark slide" data-bs-touch="false" data-bs-interval="false">
		  <div class="carousel-inner">
			<div class="title">
			  <h4>
			  	<span><%= genre %></span>
			  </h4>
			</div>
		   <%
					for(int idx = 0; idx < list.size(); idx += 5){
						int lastIndex = idx + 4  > list.size() ? list.size() - 1 : idx +  4;
					
				%>
				    <div class="carousel-item<%= idx == 0 ? " active" : "" %>" data-bs-interval="4000">
				    <%
				        	for(int i = idx; i <= lastIndex; i++){
				    			MovieVO vo = list.get(i);
				    			String no = vo.getDocid();
				    			String title = vo.getTitle();
				    			String poster = vo.getPoster();
			        	%>
							<div class="first">
					    		<a href="movieDetail.jsp?no=<%= no %>"><img src="<%= poster %>" style="max-width: 100%; height: auto;" class="d-block w-100" alt="..."></a>
					    	</div>
						<%
				        	}
						%>    
				    </div>
			    <%
			    }			    
			    %>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouchingfirst" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouchingfirst" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>	
		<div id="carouselExampleControlsNoTouchingsecond" class="carousel carousel-dark slide" data-bs-touch="false" data-bs-interval="false">
		  <div class="carousel-inner">
			<div class="title">
			  <h4>
			  	<span>인기 <%= genre %> 영화</span>
			  </h4>
			</div>
		    <%
					for(int idx = 0; idx < list.size(); idx += 5){
						int lastIndex = idx + 4  > list.size() ? list.size() - 1 : idx +  4;
					
				%>
				    <div class="carousel-item<%= idx == 0 ? " active" : "" %>" data-bs-interval="4000">
				    <%
				        	for(int i = idx; i <= lastIndex; i++){
				    			MovieVO vo = list.get(i);
				    			String no = vo.getDocid();
				    			String title = vo.getTitle();
				    			String poster = vo.getPoster();
			        	%>
							<div class="first">
					    		<a href="movieDetail.jsp?no=<%= no %>"><img src="<%= poster %>" style="max-width: 100%; height: auto;" class="d-block w-100" alt="..."></a>
					    	</div>
						<%
				        	}
						%>    
				    </div>
			    <%
			    }			    
			    %>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouchingsecond" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouchingsecond" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>	
		<div id="carouselExampleControlsNoTouchingthird" class="carousel carousel-dark slide" data-bs-touch="false" data-bs-interval="false">
		  <div class="carousel-inner">
			<div class="title">
			  <h4>
			  	<span>수상작 <%= genre %> 영화</span>
			  </h4>
			</div>
		    <%
					for(int idx = 0; idx < list.size(); idx += 5){
						int lastIndex = idx + 4  > list.size() ? list.size() - 1 : idx +  4;
					
				%>
				    <div class="carousel-item<%= idx == 0 ? " active" : "" %>" data-bs-interval="4000">
				    <%
				        	for(int i = idx; i <= lastIndex; i++){
				    			MovieVO vo = list.get(i);
				    			String no = vo.getDocid();
				    			String title = vo.getTitle();
				    			String poster = vo.getPoster();
			        	%>
							<div class="first">
					    		<a href="movieDetail.jsp?no=<%= no %>"><img src="<%= poster %>" style="max-width: 100%; height: auto;" class="d-block w-100" alt="..."></a>
					    	</div>
						<%
				        	}
						%>    
				    </div>
			    <%
			    }			    
			    %>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouchingthird" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouchingthird" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
	</div>
	</body>
</html>