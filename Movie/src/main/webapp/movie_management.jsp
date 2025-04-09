<%@page import="movie.MovieVO"%>
<%@page import="java.util.List"%>
<%@page import="movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>    
<%
	MovieDAO dao = new MovieDAO();
	List<MovieVO> list = dao.recommenMovie(null);
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
		body{
			font-family: 'Source Sans Pro', sans-serif;
			background: white;
			margin: 0;
			padding: 0;
			color: #333;
		}
		.user-container{
			padding: 20px;
		    max-width: 1200px;
		    margin: 40px auto;
		    background: white;
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
		table{
			width: 100%;
			margin-top:20px;
			border-radius: 12px;
			border-style: hidden;
			border-collapse: collapse;
		}
		th,td {
			text-align: center;
			padding: 6px;
			font-size: 17px;
			border-radius: 12px;
		}
		th{
			background-color:#edebeb;
			color: #3d3838;
			font-size: 19px;
		}
		.one{
			text-align: center;
		}
		.action-buttons button{
			background: #000000;
			color: white;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			font-size: 15px;
			margin-right: 5px;
			transition: background 0.3s;
			font-weight: bold;
			padding: 10px 10px;
		}
		.action-buttons button:hover {
			background: #283552;
		}
		.action-buttons button.zero {
			background: #6192C0;
		}
		.action-buttons button.zero:hover{
			background: #6192C0;
		}
		.insert{
			background: #000000;
			color: white;
			border: none;
			border-radius: 5px;
			font-size: 15px;
			transition: background 0.3s;
			font-weight: bold;
			padding: 10px 10px;
			position: absolute;
		    margin-left: 1050px;
		    margin-top: -60px;
		}
	</style>
	</head>
	<body>
		<div class="user-container">
		<h2>추천 영화 관리</h2>
			<button type="button" class="insert" onclick="insert()">추가</button>
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>제목</th>
						<th>장르</th>
						<th>관리</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<%
						for(int i = 0; i < list.size(); i++){
							MovieVO vo = list.get(i);
							String docid = vo.getDocid();
							String title = vo.getTitle();
							String genre = vo.getGenre();
							int rating = vo.getRating();
							int movieType = vo.getMovie_type();
					%>
						<tr  <%= (movieType == 1 ? "style='background-color: gray;'" : "") %>>
							<td><%= i+1 %></td>
							<td><a href="movieDetail.jsp?no=<%= docid %>"><%= docid %></a></td>	
								<input type="hidden" name="id" value="<%= docid %>">			
							<td><%= title %></td>
							<td><%= genre %></td>
							<td class="action-buttons">
								<button class="one" onclick="return one('<%= docid %>')">등록</button>
                   				<button class="zero" onclick="return zero('<%= docid %>')">제거</button>
							</td>
							<td>
		                        <% 
		                            if (movieType == 1) { 
		                        %>
		                            등록 중
		                        <% 
		                            } else { 
		                        %>
		                            등록 가능
		                        <% 
		                            }
		                        %>
	                    	</td>
						</tr>				
					<%
						}
				%>
				</tbody>
			</table>
		</div>
	</body>
	<script>
	function one(docid) {
	    if (confirm("등록하시겠습니까?")) {
	        window.location.href = 'updateMovie.jsp?no='+docid+'&type=1';
	    }
	}
	function zero(docid) {
	    if (confirm("제거하시겠습니까?")) {
	        window.location.href = 'updateMovie.jsp?no='+docid+'&type=0';
	    }
	}
	
	 function insert() {
	        let result = prompt('추가할 영화를 입력해주세요');
	        if (result && result.trim() !== '') {
	            $.ajax({
	                url: "insertMovie.jsp",
	                type: "POST",
	                data: {
	                    title: result.trim()
	                },
	                success: function(data) {
	                    if (data.trim() == "null") {
	                        alert("영화 제목을 확인해주세요.");
	                    } else {
	                        alert("영화가 추가되었습니다!");
	                        location.reload(); // Reload the page to show the updated movie list
	                    }
	                },
	                error: function() {
	                    console.log("에러발생");
	                    alert("영화 추가 중 오류가 발생했습니다.");
	                }
	            });
	        } else {
	           
	        }
	    }
	</script>
</html>