<%@page import="ip.ip.IpUtil"%>
<%@page import="java.util.List"%>
<%@page import="movie.MovieVO"%>
<%@page import="movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%
	MovieDAO dao = new MovieDAO();
	List<MovieVO> list = dao.listView();	
	List<MovieVO> plist = dao.popularView(null);	
	List<MovieVO> slist = dao.soonView();
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<style>
		h4{
		padding: 0.9rem;
		}
		.navbar {
		    display: flex;
		    justify-content: center;
		    align-items: center; 
		    background-color: white;
			padding:1px 30px;
			border-bottom :2px solid gray;
			/* position:relative; */
			position: sticky;
		}
		#content {
			width: 1500px;
	    	margin: auto;
		}
		
		.carousel-inner {
			padding: 2rem;
		}
		
		.title {
			margin-left: 10%;
		}
		
		.first, .second, .third {
			float: left;
			margin-right: 10px;
			height: 350px;
			width: 20%;
			align-content: center;
			}
		.banner1 {
			position: absolute;
		    top: 50%;
		    left: 0;
		    margin-left: 20px;
		    width: 300px;
		    background-size: contain;
	        /* transform: translate(0, -50%); */
		}	
		.banner2 {
			position: absolute;
		    top: 50%;
		    right: 0;
		    margin-right: 20px;
		    /* width: 300px; */
		    background-size: contain;
	        /* transform: translate(0, -50%); */
		}
		.carousel-item{
			margin-left: 9%;
		}
		img{
		    width: 100%;
		    height: 300px;
		    object-fit: cover;
		}
		.item{
			margin-left: 10.5%;
			width: 96.1%;
		    height: 300px;
		    object-fit: cover;
		}
		a img {
			transition: all 0.2s linear;
		}
		a:hover img {
			transform: scale(1.1);
		}
	</style>
	</head>
	<body>
	<!-- 사이드 광고 -->
		<div class="side-banner">
			<div class="banner1">
			<!-- 사이드 광고 위치 메인 쪽으로 옮겨야 할 것 같음 -->
				<a class="linkfirst" href="https://www.netflix.com/kr/" target="_blank"><img alt="링크이미지1" src="netfilx3.png" style="max-width:100%; width: 250px; height: 500px;"></a>
			</div>
			<div class="banner2">
				<a class="linkfirst" href="https://www.netflix.com/kr/" target="_blank"><img alt="링크이미지2" src="netfilx3.png" style="max-width:100%; width: 250px; height: 500px;"></a>
			</div>
		</div>
	<!-- 메인 -->
		<div id="content">
			<div id="carouselExampleDarkfirst" class="carousel carousel-dark slide" data-bs-ride="carousel">
			  <div class="carousel-inner">
				<div class="title">
				  <h4>
				  	<span>현재 상영작</span>
				  </h4>
				</div>
				<%
					for(int idx = 0; idx < list.size(); idx += 4){
						int lastIndex = idx + 3  >= list.size() ? list.size() - 1 : idx +  3;		
				%>
				    <div class="carousel-item<%= idx == 0 ? " active" : "" %>" data-bs-interval="4000">
				    <%
				        	for(int i = idx; i <= lastIndex; i++){
				    			MovieVO vo = list.get(i);
				    			String docid = vo.getDocid();
				    			String title = vo.getTitle();
				    			String poster = vo.getPoster();
			        	%>
							<div class="first">
					    		<a href="movieDetail.jsp?docid=<%= docid %>"><img src="<%= poster %>" style="max-width: 100%; height: auto;" class="d-block w-100" alt="..."></a>
					    	</div>
						<%
				        	}
						%>    
				    </div>
			    <%
			    }			    
			    %>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDarkfirst" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDarkfirst" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
			<div id="carouselExampleDarksecond" class="carousel carousel-dark slide" data-bs-ride="carousel">
			  <div class="carousel-inner">
				<div class="title">
				  <h4>
				  	<span>개봉 예정작</span>
				  </h4>
				</div>
			    	<%
						for(int idx = 0; idx < slist.size(); idx += 4){
							int lastIndex = idx + 3  >= slist.size() ? slist.size() - 1 : idx +  3;
						
					%>
					    <div class="carousel-item<%= idx == 0 ? " active" : "" %>" data-bs-interval="4000">
					    <%
					        	for(int i = idx; i <= lastIndex; i++){
					    			MovieVO vo = slist.get(i);
					    			String docid = vo.getDocid();
					    			String title = vo.getTitle();
					    			String poster = vo.getPoster();
				        	%>
								<div class="second">
						    		<a href="movieDetail.jsp?docid=<%= docid %>"><img src="<%= poster %>" class="img-fluid d-block w-100" style="height: auto; object-fit: cover;" alt="..."></a>
						    	</div>
							<%
					        	}
							%>    
					    </div>
				    <%
				    }			    
				    %>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDarksecond" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDarksecond" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
			<div id="carouselExampleDarkthird">
			  <div>
				<div class="title">
				  <h4>
				  	<span>관리자 추천작</span>
				  </h4>
				</div>
				    <div class="item">
				    <%
				        	for(int i = 0; i < Math.min(4, plist.size()); i++){
				    			MovieVO vo = plist.get(i);
				    			String docid = vo.getDocid();
				    			String title = vo.getTitle();
				    			String poster = vo.getPoster();
				    			int movieType = vo.getMovie_type();
			        	%>
							<div class="third">
					    		<a href="movieDetail.jsp?docid=<%= docid %>"><img src="<%= poster %>" style="max-width: 100%; height: auto;" class="d-block w-100" alt="..."></a>
					    	</div>
						<%
				        	}
						%>    
				    </div>
			  </div>
			  <!-- <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDarkthird" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDarkthird" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button> -->
			</div>
		</div>
	</body>
</html>