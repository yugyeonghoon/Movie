<%@page import="ad.AdDAO"%>
<%@page import="ad.AdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%
	String adnum = request.getParameter("adnum");
	if(adnum == null){
		response.sendRedirect("advertisement.jsp");
	}

	if(adnum.isEmpty()){
		response.sendRedirect("advertisement.jsp");
	}
	
	int adnum2 = Integer.parseInt(adnum);
	
	AdDAO dao = new AdDAO();
	AdVO vo = new AdVO();
	
	vo.setAdnum(adnum2);
	AdVO ad =dao.adView(adnum2);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 수정</title>
<style>
	body{
		font-family: 'Source Sans Pro', sans-serif;
		background: white;
		margin: 0;
		padding: 0;
		color: #333;
	}
	.user-container{
		padding: 10px;
	    margin: 40px auto;
	    max-width : 1800px;
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
		padding: 4px;
		font-size: 14px;
		border-radius: 12px;
	}
	th{
		background-color:#edebeb;
		color: #3d3838;
		font-size: 16px;
	}
	.action-buttons{
		text-align: center;
	}
	.action-buttons button{
		background: #000000;
		color: white;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		font-size: 14px;
		transition: background 0.3s;
		font-weight: bold;
		padding: 8px 8px;
	}
	.action-buttons button:hover {
		background:#283552;
	}
	.action-buttons button.delete {
		background: #ff1a1a;
	}
	.action-buttons button.delete:hover{
		background: #e60000;
	}
	#adnum {
		width : 50px;
	}
	#title {
		width : 200px;
	}
	#category {
		width : 300px;
	}
	#img {
		width : 300px;
	}
	#link {
		width : 350px;
	}
</style>
</head>
<body>
	<div class="user-container">
		<h2>광고 수정</h2>
		<table>
			<thead>
				<tr>
					<th id = "adnum">번호</th>
					<th id ="title">광고제목</th>
					<th id ="category">카테고리</th>
					<th id ="img">이미지</th>
					<th id ="link">링크</th>
					<th id = "startDate">광고시작일</th>
					<th id = "endDate">광고종료일</th>
					<th>관리</th>
				</tr>
			</thead>
		</table>
		<form action="ad_updateok.jsp">
			<input type="text" id = "adnum" name = "adnum" value="<%=ad.getAdnum() %>" readonly>	
			<input type="text" id ="title" name= "title" value="<%= ad.getAdTitle() %>">
			<input type="text" id ="category" name="category" value="<%= ad.getAdCat() %>" >
			<input type="text" id ="img"  name="img" value="<%= ad.getAdImg() %>" >
			<input type="text" id ="link" name="link" value="<%= ad.getAdLink() %>" >
			<input type="text" id = "startDate" name="startDate" value="<%= ad.getStartDate()%>">
			<input type="text" id = "endDate" name="endDate" value="<%= ad.getEndDate()%>">
			<label class="action-buttons">
				<button type="submit">수정</button>
				<button id="delete-ad" class="delete" onclick="deleteAd('<%= adnum%>')">삭제</button>
				<button type="button" onclick="location.href='advertisement.jsp'">취소</button>
			</label>
		</form>
	</div>
</body>
<script>
	function deleteAd(adnum){
		let result = confirm("삭제하시겠습니까?")
		if(result == true){
			$.ajax({
				url : "adout.jsp",
				type : "post",
				date : {
					adnum : adnum
				},
				success : function(result){
					if(result.trim() == "success"){
						alert("광고를 삭제하셨습니다.");
						location.href = "advertisement.jsp"
					}
				},
				error : funtion(){
					console.log("error");
				}
			});
		}
	}
</script>
</html>