<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<%
	request.setCharacterEncoding("utf-8");	
	
	String id = request.getParameter("id");

	if(id == null){
		response.sendRedirect("user_management.jsp");
		return;
	}
	
	if(id.isEmpty()){
		response.sendRedirect("user_management.jsp");
		return;
	}
	
	UserDAO dao = new UserDAO();
	UserVO vo = new UserVO();
	
	vo.setId(id);
	
	UserVO uvo = dao.getOneUser(id);

%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 정보 수정(관리자 전용)</title>
		<style>
			body {
				font-family : 'Source Sans Pro', sans-serif; 
				background: white;
				margin: 0;
				padding: 0;
				color: #333;
			}
			.profile-container{
				padding: 20px;
				max-width: 600px;
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
				font-size: 27px
			}
			.profile-field{
				margin-bottom:15px;
			}
			.profile-field label{
				font-weight: bold;
				margin-bottom: 5px;
				display: block;
				color: black;
			}
			.profile-field input{
				width: 100%;
				padding: 8px;
				border: 1px solid black;
				box-shadow: 0 1px 10px rgb(30 88 139 / 20%);
				border-radius: 10px;
				box-sizing: border-box;
			}
			.profile-field select{
				width: 100%;
				padding: 8px;
				border: 1px solid black;
				box-shadow: 0 1px 10px rgb(30 88 139 / 20%);
				border-radius: 10px;
				box-sizing: border-box;
			}
			.feedback{
				font-size: 0.9rem;
				color: red;
				margin-bottom: 10px;
			}
			.feedback.success{
				color: green;
			}
			.profile-actions button{
				background: #000000;
				color: #ffffff;
				border: none;
				padding: 10px 20px;
				border-radius: 10px;
				cursor: pointer;
				transition: background 0.3s ease;
				margin: 0 53px;
			}
			.profile-actions button:hover {
			        background: #000000;
			    }
		</style>
	</head>
	<body>
		<div class="profile-container">
			<h2>회원 관리</h2>
				<form action="userType_change.jsp">
					<div class="profile-field">
						<label for="username">아이디</label>
						<input type="text" id="id" name="id" value="<%= id %>" readonly>
					</div>
					<div class="profile-field">
						<label for="nick">닉네임</label>
						<input type="text" id="nick" name="nick" value="<%= uvo.getNick() %>" readonly>
					</div>
					<div class="profile-field">
						<label for="email">이메일</label>
						<input type="text" id="email" name="email" value="<%= uvo.getEmail() %>" readonly>
					</div>
					<div class="profile-field">
						<label for="user_type">타입</label>
						<%-- <input type="text" id="type" name="type" value="<%= uvo.getUserType() %>" readonly> --%>
						<select class="profile-field" name="changeType">				
							<option value="0" <%= uvo.getUserType() == 0 ? "selected" : "" %>>관리자</option>		
							<option value="1" <%= uvo.getUserType() == 1 ? "selected" : "" %>>일반</option>
							<option value="2" <%= uvo.getUserType() == 99 ? "selected" : "" %>>탈퇴</option>								
						</select>	
						<div class="profile-actions">
							<button type="submit">저장</button>
							<button type="button" onclick="location.href='user_management.jsp'">확인</button>
							<button type="button" onclick="location.href='user_management.jsp'">취소</button>							
						</div>						
					</div>				
				</form>
		</div>
	</body>
</html>