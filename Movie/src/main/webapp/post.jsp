<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<%
	String no = request.getParameter("no");
	
	if(no == null){
		response.sendRedirect("board.jsp");
		return;
	}
		
	BoardDAO dao = new BoardDAO();
	BoardVO vo = dao.view(no);
	String title = vo.getTitle();
	String author = vo.getAuthor();
	String content = vo.getContent();
	String createDate = vo.getCreateDate();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 상세보기</title>
		<style>
			body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to bottom, #ffffff, #ffffff);
            margin: 0;
            padding: 0;
            color: black;
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
		    width: 100%;
		    color: black;
		    font-size: 1rem; 
		    }
		    .content{
		    width: 100%;
		    margin: 0px;
		    resize: none;
		    height: 580px;
		    border-radius: 9px;
		    }
		    .btn1{
		    position: absolute;
		    margin-top: 30px;
		    margin-left: 57%;
		    background-color: white;
		    color: black;
		    width: 100px;
		    height: 30px;
		    border-radius: 9px;
		    }
		</style>
	</head>
	<body>
		<h2>글 상세보기</h2>
		<div class="write-container">
				<h4><%= title %></h4>
				 	<div>작성자 : <%= author %> | 작성일 : <%= createDate %></div>
				<div class="content-container">
					<p><%= content %></p>
				</div>
				<div>
					<button type="button" class="btn1" onclick="history.back();">목록으로</button>
				</div>
		</div>
	</body>
</html>