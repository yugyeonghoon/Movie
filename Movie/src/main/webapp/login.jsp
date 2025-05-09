<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String error = request.getParameter("error");
	String cookie = "";
	
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null && cookies.length > 0){
		for(int i = 0; i < cookies.length; i++){
			if(cookies[i].getName().equals("id")){
				cookie = cookies[i].getValue();
			}
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오.영.추</title>
<script src="./jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400');

	body, html {
	  font-family: 'Source Sans Pro', sans-serif;
	  background-color: #ffffff;
	  padding: 0;
	  margin: 0;
	}
	
	#particles-js {
	  position: absolute;
	  width: 100%;
	  height: 100%;
	}
	
	.container{
	  margin: 0;
	  top: 250px;
	  left: 50%;
	  position: absolute;
	  text-align: center;
	  transform: translateX(-50%);
	  /* background-color: coral; */
	  background-color: #252525;
	  /* opacity : 0.8; */
	  border-radius: 9px;
	  border-top: 2px solid gray;
	  border-bottom: 2px solid gray;
	  border-right: 2px solid gray;
	  border-left:2px solid gray;
	  width: 400px;
	  height: 500px;
	  /* opacity : 0.8; */
	}
	
	.box h4 {
	  font-family: 'Source Sans Pro', sans-serif;
	  /* color: #000000; */
	  color: #fff;
	  font-size: 18px;
	  margin-top:94px;;
	}
	
	.box h4 span {
	  color: #dfdeee;
	  font-weight: lighter;
	}
	
	.box h5 {
	  font-family: 'Source Sans Pro', sans-serif;
	  font-size: 13px;
	  color: #a1a4ad;
	  letter-spacing: 1.5px;
	  margin-top: -15px;
	  margin-bottom: 70px;
	}
	
	.box input[type = "text"],.box input[type = "password"] {
	  display: block;
	  margin: 20px auto;
	  /* background: #C2E9F3; */
	  background-color: #2f2f2f;
	  border: 0;
	  border-radius: 5px;
	  padding: 14px 10px;
	  width: 320px;
	  outline: none;
	  color: #000000;
	      -webkit-transition: all .2s ease-out;
	    -moz-transition: all .2s ease-out;
	    -ms-transition: all .2s ease-out;
	    -o-transition: all .2s ease-out;
	    transition: all .2s ease-out;
	  
	}
	::-webkit-input-placeholder {
	  color: #000000;
	}
	
	.box input[type = "text"]:focus,.box input[type = "password"]:focus {
	  /* border: 1px solid #000000; */
	  
	}
	
	a{
	  /* color: #000000; */
	  color: #a5a5a5;
	  text-decoration: none;
	}
	
	a:hover {
	  text-decoration: underline;
	}
	
	 label input[type = "checkbox"] {
	  display: none; 
	}
	
	label span {
	  height: 13px;
	  width: 13px;
	  border: 2px solid #464d64;
	  border-radius: 2px;
	  display: inline-block;
	  position: relative;
	  cursor: pointer;
	  float: left;
	  left: 7.5%;
	}
	
	.btn1 {
	  border:0;
	  /* background: #C2E9F3; */
	  background: #1351f9;
	  /* color: #000000; */
	  color: #fff;
	  border-radius: 100px;
	  width: 340px;
	  height: 49px;
	  font-size: 16px;
	  position: absolute;
	  top: 79%;
	  left: 8%;
	  transition: 0.3s;
	  cursor: pointer;
	}
	
	.btn1:hover {
	 /* background: #C2E9F3; */
	}
	
	.rmb {
	  position: absolute;
	  margin-left: -20%;
	  margin-top: 0px;
	  /* color: #000000; */
	  color: #a5a5a5;
	  font-size: 13px;
	}
	
	.forgetpass {
	  position: relative;
	  float: right;
	  right: 28px;
	  font-size: 13px;
	}
	.forgetid {
	  position: relative;
	  right: -75px;
	  font-size: 13px;
	  top:-2px;
	}
	
	.dnthave{
	    position: absolute;
	    top: 92%;
	    left: 43%;
	}
	
	[type=checkbox]:checked + span:before {
	    font-family: FontAwesome;
	    font-size: 22px;
	    content: "v";
	    position: absolute;
	    top: -12px;
	    /* color: black; */
	    color: #fff;
	    left: -1px;
	    width: 15px;
	}
	
	.typcn {
	  position: absolute;
	  left: 339px;
	  top: 282px;
	  color: #3b476b;
	  font-size: 22px;
	  cursor: pointer;
	}      
	
	.typcn.active {
	  color: #7f60eb;
	}
	
	.error {
	  background: #ff3333;
	  text-align: center;
	  width: 337px;
	  height: 25px;
	  padding: 2px;
	  border: 0;
	  border-radius: 5px;
	  margin: 10px auto 10px;
	  position: absolute;
	  top: 25%;
	  left: 7.2%;
	  color: white;
	  display: none;
	}
	
	.footer {
	    position: relative;
	    left: 0;
	    bottom: 0;
	    top: 605px;
	    width: 100%;
	    color: #78797d;
	    font-size: 14px;
	    text-align: center;
	}
	
	.footer .fa {
	  color: #7f5feb;;
	}
	
	.bounceInDown{
		width: 100%;
		height: 100%;
	}
	
	.bounceInDown::before{
		content: "";
		/* background: #f5fffd; */
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
	#id {
		color: #fff;
	}
	#pw {
		color: #fff;
	}
	</style>
</head>
<body id="particles-js">
	<div class="animated bounceInDown">
		<div class="container">
			<span class="error animated tada" id="msg"></span>
			<form method="post" name="form1" class="box" onsubmit="return formCheckId()" action="loginok.jsp">
				<h4>로그인 페이지<span></span></h4>
				<h5></h5>
					<input type="text" id="id" value="<%= cookie %>" name="id" placeholder="Id" autocomplete="off">
						<i class="typcn typcn-eye" id="eye"></i>
					<input type="password" name="password" placeholder="Passsword" id="pw" autocomplete="off">
					<label>
						<input type="checkbox" <%= !cookie.equals("") ? "checked" : "" %> id="checkId" name="checkId" class="checkId">
						<span></span>
						<small class="rmb">아이디 저장</small>
					</label>
						<a href="findid.jsp" class="forgetid">아이디 찾기</a>
						<a href="findpw.jsp" class="forgetpass">비밀번호찾기</a>
						<input type="submit" value="로그인" class="btn1" >
			</form>
				<a href="signup.jsp" class="dnthave">회원가입</a>
		</div> 	
	</div>
</body>
<script>

$(document).ready(function(){
	console.log("html 로딩 완료")
	let error = "<%= error%>";
	if(error == "fail"){
		alert("아이디 또는 비밀번호가 일치하지 않습니다.");
	}
})

console.log("스크립트 로딩 완료")
function formCheckId(){
	let id = $("#id");
	let pw = $("#pw");
	
	if(id.val().trim() == ""){
		id.focus();
		id.val("");
		alert("아이디를 입력해주세요.")
		return false;
	}
	if(pw.val().trim() == ""){
		pw.focus();
		pw.val("");
		alert("비밀번호를 입력해주세요.")
		return false;
	}
}
</script>
</html>