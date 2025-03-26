<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<style>
	.navbar {
	    display: flex;
	    justify-content: center;
	    align-items: center; 
	    background-color: white;
		padding:1px 30px;
		border-bottom :2px solid gray;
		position:relative;
	}
	#content {
		width: 1200px;
    	margin: auto;
	}
	
	.carousel-inner {
		padding: 2rem;
	}
	
	.title {
		margin-left: 10%;
	}
	
	.first {
		float: left;
		margin-right: 10px;
		margin-left: 9%;
		width:20%;
		}

	.second{
		float: left;
		margin-right: 10px;
		width:20%;
		box-sizing: border-box;	
		}

	.third{
		float: left;
		margin-right: 10px;
		width:20%;
		box-sizing: border-box;
		}
	
	.force{
		float: left;
		margin-right: 10px;
		width:20%;
		box-sizing: border-box;
		}
	
	 .banner1 {
		position: absolute;
	    top: 50%;
	    left: 0;
	    margin-left: 20px;
	    width: 250px;
	    background-size: contain;
        transform: translate(0, -50%);
	}
	
	.banner2 {
		position: absolute;
	    top: 50%;
	    right: 0;
	    margin-right: 20px;
	    width: 250px;
	    background-size: contain;
        transform: translate(0, -50%);
	}
</style>
</head>
<body>
<!-- 사이드 광고 -->
<div class="side-banner">
	<div class="banner1">
	<!-- 사이드 광고 위치 메인 쪽으로 옮겨야 할 것 같음 -->
		<a class="linkfirst"><img alt="링크이미지1" src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20241205_267%2F1733374268697UdIRv_JPEG%2Fmovie_image.jpg" style="max-width:100%"></a>
	</div>
	<div class="banner2">
		<a class="linksecond"><img alt="링크이미지2" src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20241204_208%2F1733292564893QALds_JPEG%2Fmovie_image.jpg" style="max-width:100%"></a>
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
	    <div class="carousel-item active" data-bs-interval="4000">
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
	    </div>
	    <div class="carousel-item" data-bs-interval="3000">
	    	<div class="first">
	    		<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20210311_155%2F1615423409170FPnKV_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
	    	</div>
	    	<div class="second">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250306_291%2F1741253580724VN1Fs_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
		    <div class="third">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250227_3%2F1740637868597wLfiO_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
		    <div class="force">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250312_294%2F1741759236040iv5Fx_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
	    </div>
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
		  	<span>관리자 추천 상영작</span>
		  </h4>
		</div>
	    <div class="carousel-item active" data-bs-interval="4000">
		    <div class="first">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250207_265%2F1738893336962Cn1Vd_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="w-100" alt="...">
		    </div>
		    <div class="second">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250207_54%2F1738893574907eM50e_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="w-100" alt="...">
		    </div>
		    <div class="third">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250207_215%2F1738893613942r5FGH_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="w-100" alt="...">
		    </div>
		    <div class="force">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250207_226%2F1738893645067Bx00O_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="w-100" alt="...">
		    </div>
	    </div>
	    <div class="carousel-item" data-bs-interval="3000">
	    	<div class="first">
	    		<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250207_292%2F17388936739007UfwO_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="w-100" alt="...">
	    	</div>
	    	<div class="second">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250207_153%2F1738893700249zY2Tx_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="w-100" alt="...">
		    </div>
		    <div class="third">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250207_128%2F1738893810941VaHoK_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="w-100" alt="...">
		    </div>
		    <div class="force">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250207_284%2F1738893847020VrF2c_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="w-100" alt="...">
		    </div>
	    </div>
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
	
	<div id="carouselExampleDarkthird" class="carousel carousel-dark slide" data-bs-ride="carousel">
	  <div class="carousel-inner">
		<div class="title">
		  <h4>
		  	<span>개봉 예정작</span>
		  </h4>
		</div>
	    <div class="carousel-item active" data-bs-interval="4000">
		    <div class="first">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250207_265%2F1738893336962Cn1Vd_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="w-100" alt="...">
		    </div>
		    <div class="second">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250207_54%2F1738893574907eM50e_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="w-100" alt="...">
		    </div>
		    <div class="third">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250207_215%2F1738893613942r5FGH_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="w-100" alt="...">
		    </div>
		    <div class="force">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250207_226%2F1738893645067Bx00O_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="w-100" alt="...">
		    </div>
	    </div>
	    <div class="carousel-item" data-bs-interval="3000">
	    	<div class="first">
	    		<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250207_292%2F17388936739007UfwO_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="w-100" alt="...">
	    	</div>
	    	<div class="second">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250207_153%2F1738893700249zY2Tx_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="w-100" alt="...">
		    </div>
		    <div class="third">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250207_128%2F1738893810941VaHoK_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="w-100" alt="...">
		    </div>
		    <div class="force">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250207_284%2F1738893847020VrF2c_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="w-100" alt="...">
		    </div>
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDarkthird" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDarkthird" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
</div>

</body>
</html></html>