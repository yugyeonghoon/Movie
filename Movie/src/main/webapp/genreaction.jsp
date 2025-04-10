<%@page import="ip.ip.IpUtil"%>
<%@page import="movie.MovieVO"%>
<%@page import="java.util.List"%>
<%@page import="movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<%	
	String menuid = request.getParameter("menuid");
	
	String genre = request.getParameter("genre");
	if(genre.equals("액션")){
		menuid = "장르 액션";
	}else if(genre.equals("범죄")){
		menuid = "장르 범죄";
	}else if(genre.equals("SF")){
		menuid = "장르 SF";
	}else if(genre.equals("스릴러")){
		menuid = "장르 스릴러";
	}else if(genre.equals("코미디")){
		menuid = "장르 코미디";
	}else if(genre.equals("멜로")){
		menuid = "장르 멜로";
	}else if(genre.equals("공포")){
		menuid = "장르 공포";
	}else if(genre.equals("뮤지컬")){
		menuid = "장르 뮤지컬";
	}else if(genre.equals("드라마")){
		menuid = "장르 드라마";
	};
	
    if (menuid != null) {
       
        IpDAO ipDao = new IpDAO();
        IpVO ipVo = new IpVO();

        ipVo.setIp(ip);
        ipVo.setMenu_id(menuid);
        ipDao.insert(ipVo);
    }
	

		
	
	MovieDAO dao = new MovieDAO();
	List<MovieVO> list = dao.selectByGenre(genre);
	List<MovieVO> plist = dao.popularGenre(genre);
	List<MovieVO> alist = dao.popularView(genre);

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
		.first, .item {
		    float: left;
		    margin-right: 10px;
		    width: 15%;
		    height: 360px;
		    text-align: center;
		    overflow: hidden;
		}
		.first img, .item {
		    width: 100%;
		    height: 360px;
		    object-fit: cover;
		    display: block;
		}
		.carousel-item, .item {
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
						int lastIndex = idx + 4  >= list.size() ? list.size() - 1 : idx +  4;
					
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
					    		<a href="movieDetail.jsp?no=<%= no %>"><img src="<%= poster %>" alt="..."></a>
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
					for(int idx = 0; idx < plist.size(); idx += 5){
						int lastIndex = idx + 4  >= plist.size() ? plist.size() - 1 : idx +  4;
					
				%>
				    <div class="carousel-item<%= idx == 0 ? " active" : "" %>" data-bs-interval="4000">
				    <%
				        	for(int i = idx; i <= lastIndex; i++){
				    			MovieVO vo = plist.get(i);
				    			String no = vo.getDocid();
				    			String title = vo.getTitle();
				    			String poster = vo.getPoster();
			        	%>
							<div class="first">
					    		<a href="movieDetail.jsp?no=<%= no %>"><img src="<%= poster %>" alt="..."></a>
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
			  	<span>추천 <%= genre %> 영화</span>
			  </h4>
			</div>
			   <div class="item">
				    <% 
				        for(int i = 0; i < Math.min(5, alist.size()); i++){
				            MovieVO vo = alist.get(i);
				            String no = vo.getDocid();
				            String title = vo.getTitle();
				            String poster = vo.getPoster();
				            int movieType = vo.getMovie_type();
				    %>
		                <div class="first">
		                    <a href="movieDetail.jsp?no=<%= no %>"><img src="<%= poster %>" alt="<%= title %>"></a>
		                </div>
				    <%
				        }
				    %>
				</div>
		  </div>
		</div>
	</div>
	</body>
</html>