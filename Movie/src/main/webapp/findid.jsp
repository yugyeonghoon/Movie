<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./jquery-3.7.1.js"></script>
<style>
	body{
		font-family: 'Source Sans Pro', sans-serif;
		background-color: white;
		padding: 0;
		margin: 0;
	}	
	.findid{
		margin: 0;
		top: 180px;
		left: 50%;
		position: absolute;
		text-align: center;
		transform: translateX(-50%);
		/* background-color: #b1dbe900; */
		background-color: #252525;
	  	/* opacity : 0.8; */
		border-radius: 9px;
		border-top: 2px solid gray;
		border-bottom: 2px solid gray;
		border-right: 2px solid gray;
		border-left:2px solid gray;
		width: 800px;
		height: 300px;
		/* box-shadow: 1px 1px 108.8px 19.2px rgb(25,31,53); */
	}
	.idform{
        font-size: 1rem;
        width: 50%;
        display: inline-block;
        color: #dfdeee;
      	}
	h1{
		text-align: center;
		margin-bottom: 20px;
		/* color: black; */
		color: #fff;
		font-family: 'Seoul 1980', sans-serif;
	}
	.btn{
		font-size: 0.8rem;
		cursor: pointer;
		margin-top: 10px;
		border: 0;
		/* background: #C2E9F3; */
		background: #1351f9;
		/* color: #000000; */
		color: #fff;
		border-radius: 60px;
		width: 50px;
		height: 35px;

	}	
	.btn1{
		font-size: 0.8rem;
		cursor: pointer;
		margin-top: 10px;
		margin-left: 15px;
		border: 0;
		/* background: #C2E9F3; */
		background: #1351f9;
		/* color: #000000; */
		color: #fff;
		border-radius: 100px;
		width: 130px;
		height: 35px;
	}
	.btn1Class{
		position: absolute;
			    top: 65%;
			    left: 4%;
			    right: 0px;
			    bottom: 0px;
	}
	input{
		margin: 10px auto;
		/* background: #C2E9F3; */
		background-color: #2f2f2f;
		border: 0;
		border-radius: 5px;
		outline: none;
		width: 250px;
		height: 35px;
		font-size: 0.9rem;
		color: #000000;
		      -webkit-transition: all .2s ease-out;
		    -moz-transition: all .2s ease-out;
		    -ms-transition: all .2s ease-out;
		    -o-transition: all .2s ease-out;
		    transition: all .2s ease-out;
	}
	input:focus{
		border: 1px solid #79A6FE;
		color: #000000;
	}
	.fi1{
		/* color: black; */
		color: #fff;
	}
	::-webkit-input-placeholder {
	  color: #000000;
	}
	.bounceInDown{
		width: 100%;
		height: 100%;
	}
	
	.bounceInDown::before{
		content: "";
		/* background-color: white; */
		background: url(./movie.jpg) no-repeat;
	    background-size: 100% 100%;
	    /* opacity: 0.5; */
	    opacity: 0.8;
	    position: absolute;
	    top: 0px;
	    left: 0px;
	    right: 0px;
	    bottom: 0px;
	}
	
	input::placeholder {
		color: #a5a5a5;
	}
	#email {
		color: #fff;
	}
</style>
</head>
<body>
	<div class="bounceInDown">
			<div class="findid">
				<h1>아이디 찾기</h1>
				<form class="idform" method="post" action="findidok.jsp" >
					<div class="fi1">이메일 :
						<input type="text" name="email" id="email" placeholder="email을 입력하세요" autocomplete="off">
						<button type="submit" class="btn" id="btn">찾기</button>
					</div>
				</form>
					<div class="btn1Class">
						<button onclick="location.href='login.jsp'" class="btn1">login</button>
						<button onclick="location.href='findpw.jsp'" class="btn1">비밀번호 찾기</button>
					</div>
				</div>
			</div>
</body>
<script>
	let email = $("#email");
	let check = "";
	$("#btn").click(function(){

		if(email.val().trim() == ""){
			email.focus();
			email.val("");
			confirm("이메일을 입력해주세요.");
			return false;
		}
</script>
</html>