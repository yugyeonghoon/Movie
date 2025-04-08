<%@page import="java.util.List"%>
<%@page import="ad.AdDAO"%>
<%@page import="ad.AdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%
	AdDAO dao = new AdDAO();
	List<AdVO> list = dao.adList();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 관리</title>
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
		padding: 6px;
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

</style>
</head>
<body>
	<div class="user-container">
		<h2>광고 추가</h2>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>광고제목</th>
					<th>카테고리</th>
					<th>이미지</th>
					<th>링크</th>
					<th>광고기간</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(int i = 0; i < list.size(); i++){
						AdVO vo = list.get(i);
						int adnum = vo.getAdnum();
						String title = vo.getAdTitle();
						String category = vo.getAdCat();
						String img = vo.getAdImg();
						String link = vo.getAdLink();
				%>
					<tr style="color: black">
						<td><%=adnum %></td>		
						<td><%= title %></td>
						<td><%= category %></td>
						<td><%= img %></td>
						<td><%= link %></td>
						<td>2025-04-07 ~ 2025-05-08</td>
						<td class="action-buttons">
							<button onclick="location.href='ad_update.jsp?adnum=<%= adnum%>'">수정</button>
							<button id="delete-ad" class="delete" onclick="deleteAd('<%= adnum%>')">삭제</button>
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
				error : function(){
					console.log("error");
				}
			});
		}
	}
</script>
</html>