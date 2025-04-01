<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%
	String search = request.getParameter("movieKeyword");
	System.out.println(search);

	if(search == null) {
		search = "";
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
		width: 1800px;
    	margin-left: 0;
    	margin-right: auto;
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
		margin-left: 8%;
		width:15%;
		}

	.second{
		float: left;
		margin-right: 10px;
		width: 15%;
		box-sizing: border-box;	
		}

	.third{
		float: left;
		margin-right: 10px;
		width: 15%;
		box-sizing: border-box;
		}
	
	.force {
		float: left;
		margin-right: 10px;
		width:15%;
		box-sizing: border-box;
	}
	
	.five {
		float: left;
		margin-right: 10px;
		width:15%;
		box-sizing: border-box;
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
				  	<span><%=search %> 검색 영화</span>
				  </h4>
				</div>
			    <div class="carousel-item active">
				    <div class="first">
				    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250319_123%2F1742370056144UwYpI_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
				    </div>
				    <div class="second">
				    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250310_156%2F174159345420275O5n_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
				    </div>
				    <div class="third">
				    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250304_132%2F1741064558179jh12a_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
				    </div>
				    <div class="force">
				    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250221_149%2F1740118679052Pi7wI_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
				    </div>
				    <div class="five">
			    		<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20210311_155%2F1615423409170FPnKV_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
			    	</div>
			    </div>
			  </div>
			</div>
	
		<div id="carouselExampleControlsNoTouchingfirst" class="carousel carousel-dark slide" data-bs-touch="false" data-bs-interval="false">
			  <div class="carousel-inner">
				<div class="title">
				  <h4>
				  	<span><%=search %> 검색어와 비슷한 영화 추천작</span>
				  </h4>
				</div>
			    <div class="carousel-item active">
				    <div class="first">
				    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250319_123%2F1742370056144UwYpI_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
				    </div>
				    <div class="second">
				    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250310_156%2F174159345420275O5n_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
				    </div>
				    <div class="third">
				    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250304_132%2F1741064558179jh12a_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
				    </div>
				    <div class="force">
				    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250221_149%2F1740118679052Pi7wI_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
				    </div>
				    <div class="five">
			    		<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20210311_155%2F1615423409170FPnKV_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
			    	</div>
			    </div>
			  </div>
			</div>
	</div>
</div>
</body>
</html>