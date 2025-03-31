<%@page import="user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserVO user = (UserVO)session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	body {
	    margin: 0;
	    font-family: "Noto Sans KR", sans-serif;
	} 
	a {
	    text-decoration: none;
	    color: black;
	    padding : 50 px;
	}
	h1 {
		text-align: center;
		margin: 2px;
	}
	.navbar_logo{
		disply : center;
	}
	.navbar_logo{
	    font-size: 24px; 
	    color: black; 
	} 
	.navbar_logo i {
	    color: #9dbbbb
	}	 
	.navbar_menu {
	    display: flex;
	    justify-content: space-between;
	    list-style: none;
	    padding-left: 0;
	    position:relative;
	}
	.navbar_menu li {
	    padding: 8px 100px;
	}
	.navbar_icons {
	    color:black;
	    display: flex;
	}
	.navbar_icons li {
	    padding: 8px 12px;
	}
	ul {
		list-style: none;
	}
	input {
		height: inherit;
		padding: 4px 10px;
		border: 1px solid #ccc;
		box-sizing: border-box;
		border-radius: 5px;
		outline: none;
		background-color: #fff;
		color: #777;
		font-size: 12px;
		transition: width .4s;
	}
	.navbar_menu li:hover {
	    background-color: rgb(235 235 235);
	    border-radius: 5px; 
	}
	.btn-secondary {
	    color: #000000;
	    border: none;
	    background-color: white;
	}
	.btn-check:focus+.btn-secondary, .btn-secondary:focus {
	    color: #000000;
	    border: none;
	    background-color: white;
		box-shadow: 0 0 0 .25rem rgba(130, 138, 145, .5);
	 }
	 .btn-secondary:hover {
	    color: #000000;
	    background-color: white;
	    border: none;
	    font-family: "Noto Sans KR", sans-serif;
	}
	.dropdown {
		padding: 8px 20px;
	}
	.dropdown-menu.show {
		top: 100%;
		left: -60px;
	}
	@media screen and (max-width: 800px) {
    .navbar{
        flex-direction: column;
		padding: 8px 24px;
    }
    .navbar_menu {
        flex-direction: column;
        align-items:center;
        width: 100%;
    }
    .navbar_menu li {
        width: 100%;
        text-align : center;
    }
    .navbar__icons { 
		justify-content: center;
		width: 100%;
		display: flex;
	} 
</style>
<body>
	<div class="navbar_logo">
		<h1><a href="main.jsp"><span style="font-family: 'Gugi' !important;">오 . 영 . 추</span></a></h1>
	</div>
		<nav class="navbar">
		<ul class="navbar_menu">
			<div class="dropdown">
				<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">영화 장르</button>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					<li><a class="dropdown-item" href="genreaction.jsp">액션</a></li>
					<li><a class="dropdown-item" href="genreaction.jsp">범죄</a></li>
					<li><a class="dropdown-item" href="genreaction.jsp">SF</a></li>
					<li><a class="dropdown-item" href="genreaction.jsp">스릴러</a></li>
					<li><a class="dropdown-item" href="genreaction.jsp">범죄</a></li>
					<li><a class="dropdown-item" href="genreaction.jsp">코미디</a></li>
					<li><a class="dropdown-item" href="genreaction.jsp">멜로</a></li>
					<li><a class="dropdown-item" href="genreaction.jsp">공포</a></li>
				</ul>
			</div>
			<li><a href="movieBoard.jsp">영화 토론</a></li>
			<li><a href="board.jsp">자유 게시판</a></li>
		</ul>
			<input type="text" placeholder="검색어를 입력해주세요">
			<button>검색</button>
		<ul class="navbar_icons">
			<div class="dropdown">
				<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">목차</button>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					<li><a class="dropdown-item" href="login.jsp">로그인</a></li>
					<li><a class="dropdown-item" href="profile.jsp">마이페이지</a></li>
					<li><a class="dropdown-item" href="login.jsp">로그아웃</a></li>
					<li><a class="dropdown-item" href="user_management.jsp">회원관리</a></li>
				</ul>
			</div>
		</ul>
	</nav>
</body>
</html>