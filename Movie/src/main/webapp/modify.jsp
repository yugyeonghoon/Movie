<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no = request.getParameter("no");
		
	BoardDAO dao = new BoardDAO();
	BoardVO vo = dao.view(no);
	String title = vo.getTitle();
	String content = vo.getContent();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>글 수정</title>
		<style>
			body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to bottom, #ffffff, #ffffff);
            margin: 0;
            padding: 0;
            color: white;
	        }
			h2 {
            color: black;
            margin: 20px;
            text-align: center;
            font-size: 1.6rem;
	    	}
		    .write-container{
    		padding: 5px;
		    max-width: 1200px;
		    height: 60%;
		    margin: 0px auto;
		    background: white;
		    border-radius: 10px;
		    box-shadow: 0 3px 8px rgba(0, 0, 0, 0.15);		    	
		    }
		    .t1{		     
		     width: 100%;
		    }
		    .title{
		    width: 98%;
		    padding: 10px;
		    color: black; 
		    border-radius: 9px
		    }
		    .content{
		    width: 99%;
		    margin: 0px;
		    resize: none;
		    height: 580px;
		    border-radius: 9px;
		    }
		    .btn1{
		    position: absolute;
		    margin-top: 30px;
		    margin-left: 53%;
		    background-color: white;
		    color: black;
		    width: 70px;
		    height: 30px;
		    border-radius: 9px;
		    }
		    .btn2{
		    position: absolute;
		    margin-top: 30px;
		    margin-left: 58%;
		    background-color: white;
		    color: black;
		    width: 70px;
		    height: 30px;
		    border-radius: 9px;
		    }
		</style>
	</head>
	<body>
		<div class="write-container">
			<h2>글 수정</h2>
				<form action="modifyok.jsp" method="post">
					<input type="hidden" name="no" value="<%= no %>">
	        	
		            <label for="title">제목</label>
		            <input type="text" id="title" name="title" class="title" placeholder="제목을 입력하세요" value="<%= title %>">
		
		            <label for="content">내용</label>
		            <textarea id="content" name="content" class="content" placeholder="내용을 입력하세요"><%= content %></textarea>
		          
		            <div class="action">
		                <button class="btn1" type="submit">수정</button>
		                <button type="button" class="btn2" onclick="history.back()">취소</button>
		            </div>
			</form>	
		</div>
	</body>
</html>