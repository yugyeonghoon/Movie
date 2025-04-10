<%@page import="java.util.List"%>
<%@page import="ad.AdDAO"%>
<%@page import="ad.AdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%
	AdDAO dao = new AdDAO();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 추가</title>
<style>
	body {
		font-family : 'Source Sans Pro', sans-serif; 
		background: white;
		margin: 0;
		padding: 0;
		color: #333;
	}
	.update-container{
		padding: 20px;
		max-width: 1200px;
		margin: 40px auto;
		background: #ffffff;
		border-radius: 10px;
		box-shadow: 0 2px 10px rgb(30 88 139 / 20%);
		border: 2px solid #a9a9a9;
	}
	h2{
		color: #000000;
		text-align: center;
		margin-bottom: 20px;
		font-size: 27px;
	}
	.update-field{
		margin-bottom:15px;
	}
	.update-field label{
		font-weight: bold;
		margin-bottom: 5px;
		display: block;
		color: black;
		font-size: 17px;
	}
	.update-field input{
		width: 95%;
		padding: 8px;
		border: 1px solid black;
	    height: 20px;
	    font-size: 15px;
	    padding-left: 10px;
	    box-shadow: 0 1px 10px rgb(30 88 139 / 20%);
		border-radius: 12px;
		border-style: hidden;
	}
	.feedback{
		font-size: 0.9rem;
		color: red;
		margin-bottom: 10px;
	}
	.feedback.success{
		color: green;
	}
	.update-actions {
		display: flex;
 		justify-content: space-between;
	}
	.update-actions button{
		background: #000000;
		color: #ffffff;
		border: none;
		padding: 10px 20px;
		border-radius: 5px;
		cursor: pointer;
		transition: background 0.3s ease;
		margin: 0 64px;
		font-size: 14px;
		font-weight: bold;
	}
	.update-actions button:hover {
	        background: #1a5fc4;
	}
	.feedback{
		font-size: 1rem;
		color: red;
		margin-bottom: 10px;
		display : none;
	}
	.feedback.success{
		color: green;
	}
</style>
</head>
<body>
	<div class="update-container">
		<h2>광고 추가</h2>
			<form method="post" action="adAddok.jsp" onsubmit="return formCheck()">
				<div class="update-field">
					<label for="title">광고 제목</label>
					<input type="text" id="title" name="title" placeholder="광고 제목" >
				</div>
				<div class="update-field">
					<label for="category">카테고리</label>
					<input type="text" id="category" name="category" placeholder="카테고리" >
				</div>
				<div class="update-field">
					<label for="img">광고 이미지</label>
					<input type="text" id="img" name="img" placeholder="이미지">
				</div>
				<div class="update-field">
					<label for="link">링크주소</label>
					<input type="text" id="link" name="link" placeholder="링크주소" >
				</div>
				<div class="update-field">
					<label for="startDate">광고 시작일</label>
					<input type="text" id="startDate" name="startDate" placeholder="광고 시작일">
				</div>
				<div class="update-field">
					<label for="endDate">광고 종료일</label>
					<input type="text" id="endDate" name="endDate" placeholder="광고 종료일">
				</div>
				<div class="update-actions">
					<button type="submit">등록</button>
					<button type="button" onclick="location.href='adventisement.jsp'">취소</button>
				</div>
			</form>
	</div>
</body>
</html>