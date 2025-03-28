<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>+
<%@ include file="header.jsp" %>
<%
	String referer = request.getHeader("Referer");
	//System.out.println(referer);
	String last = referer.substring(referer.lastIndexOf('/') + 1);
	//System.out.println(last);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>글 작성</title>
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
		    width: 100%;
		    padding: 10px;
		    color: black; 
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
		    .search-bar {
            display: flex;
            /* justify-content: space-around; */
            margin-bottom: 0px;
	        }
	        .search-bar select, .search-bar input[type="text"], .search-bar button {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
	        }
	        .search-bar button {
            background: #2575fc;
            color: white;
            border: none;
            cursor: pointer;
            transition: background 0.3s ease;
	        }
	        .search-bar button:hover {
            background: black;
	        }
		</style>
	</head>
	<body>
		<h2>글 쓰기</h2>
		<div class="write-container">
			<form action="writeok.jsp" method="post">
				<input type="hidden" name="refer" value="<%= last %>">
				<div class="search-bar">
	                <select name="boardType">
	                	<option>게시판 타입을 선택해주세요.</option>
	                    <option value="1">영화 토론</option>
	                    <option value="2">자유 게시판</option>
	                </select>
		        </div>
				<table class="t1" border="0">
					<tr>
						<td>
							<input class="title" name="title" type="text" placeholder="제목을 입력해주세요." autocomplete="off">
						</td>
					</tr>
				</table>
				<table class="t1" border="0">	
					<tr>
						<td>
							<textarea class="content" name="content" placeholder="내용을 입력해주세요." autocomplete="off"></textarea>
						</td>
					</tr>
				</table>
				<div>
					<button type="submit" class="btn1">확인</button>
					<button type="button" class="btn2" onclick="history.back();">취소</button>
				</div>
			</form>
		</div>
	</body>
</html>