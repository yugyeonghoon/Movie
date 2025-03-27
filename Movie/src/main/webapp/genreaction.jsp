<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 더보기 기능이 필요할까? 스크롤 내리면서 다 영화 보이게 하는 것처럼?*/
	
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
		width: 2000px;
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
		width:10%;
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
	
	.six {
		float: left;
		margin-right: 10px;
		width:10%;
		box-sizing: border-box;
	}
	
	.seven {
		float: left;
		margin-right: 10px;
		width:10%;
		box-sizing: border-box;
	}
	
	
	.eight{
		float: left;
		margin-right: 10px;
		width:10%;
		box-sizing: border-box;
		}
</style>
</head>
<body>
<!-- 사이드 광고 -->
<div class="side-banner">
	<div class="banner">
		<a class="linkfirst"><img alt="링크이미지1" src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20241205_267%2F1733374268697UdIRv_JPEG%2Fmovie_image.jpg" style="max-width:100%"></a>
	</div>
</div>

<!-- 메인 -->
<div id="content">
<div class="genre">
	<div>
		<h2>
			<span>액션</span>
			<!-- ajax로 이름만 바꿔서 -->
		</h2>
	</div>
</div>
	<div id="carouselExampleControlsNoTouchingfirst" class="carousel carousel-dark slide" data-bs-touch="false" data-bs-interval="false">
	  <div class="carousel-inner">
		<div class="title">
		  <h4>
		  	<span>액션 영화 추천 컨텐츠</span>
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
	    	<div class="six">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250306_291%2F1741253580724VN1Fs_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
		    <div class="seven">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250227_3%2F1740637868597wLfiO_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
		    <div class="eight">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250312_294%2F1741759236040iv5Fx_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
	    </div>
	    <div class="carousel-item">
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
		    <div class="five">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250319_123%2F1742370056144UwYpI_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
		    <div class="six">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250310_156%2F174159345420275O5n_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
		    <div class="seven">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250304_132%2F1741064558179jh12a_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
		    <div class="eight">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250221_149%2F1740118679052Pi7wI_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
	    </div>
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
		  	<span>인기 액션 영화</span>
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
	    	<div class="six">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250306_291%2F1741253580724VN1Fs_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
		    <div class="seven">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250227_3%2F1740637868597wLfiO_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
		    <div class="eight">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250312_294%2F1741759236040iv5Fx_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
	    </div>
	    <div class="carousel-item">
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
		    <div class="five">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250319_123%2F1742370056144UwYpI_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
		    <div class="six">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250310_156%2F174159345420275O5n_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
		    <div class="seven">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250304_132%2F1741064558179jh12a_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
		    <div class="eight">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250221_149%2F1740118679052Pi7wI_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
	    </div>
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
		  	<span>수상작 액션 영화</span>
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
	    	<div class="six">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250306_291%2F1741253580724VN1Fs_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
		    <div class="seven">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250227_3%2F1740637868597wLfiO_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
		    <div class="eight">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250312_294%2F1741759236040iv5Fx_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
	    </div>
	    <div class="carousel-item">
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
		    <div class="five">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250319_123%2F1742370056144UwYpI_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
		    <div class="six">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250310_156%2F174159345420275O5n_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
		    <div class="seven">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250304_132%2F1741064558179jh12a_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
		    <div class="eight">
		    	<img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20250221_149%2F1740118679052Pi7wI_JPEG%2Fmovie_image.jpg" style="max-width: 100%; height: auto;" class="d-block w-100" alt="...">
		    </div>
	    </div>
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