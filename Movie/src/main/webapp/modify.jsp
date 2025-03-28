<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		</style>
	</head>
	<body>
		<h2>글 수정</h2>
		<div class="write-container">
			<form action="writeok.jsp" method="post">
				<table class="t1" border="0">
					<tr>
						<td>
							<input class="title" name="title" type="text" placeholder="입력된 제목" autocomplete="off">
						</td>
					</tr>
				</table>
				<table class="t1" border="0">	
					<tr>
						<td>
							<textarea class="content" name="content" placeholder="입력된 내용" autocomplete="off"></textarea>
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