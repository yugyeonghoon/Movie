<%@page import="ad.AdBoardVO"%>
<%@page import="ad.AdDAO"%>
<%@page import="java.util.List"%>
<%@page import="reply.ReplyDAO"%>
<%@page import="reply.ReplyVO"%>
<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<%
	String menuid = "게시글 상세페이지";
	if (menuid != null) {
		   
	    IpDAO ipDao = new IpDAO();
	    IpVO ipVo = new IpVO();
	
	    ipVo.setIp(ip);
	    ipVo.setMenu_id(menuid);
	    ipDao.insert(ipVo);
	}
	String no = request.getParameter("no");
	
	if(no == null){
		response.sendRedirect("movieBoard.jsp");
		return;
	}
		
	BoardDAO dao = new BoardDAO();
	BoardVO vo = dao.view(no);
	String title = vo.getTitle();
	String author = vo.getAuthor();
	String content = vo.getContent();
	String createDate = vo.getCreateDate();
	
	AdDAO ado = new AdDAO();
	List<AdBoardVO> adlist = ado.ad(no);
	
	ReplyDAO rdao = new ReplyDAO();
	List<ReplyVO> list = rdao.select(no);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 상세보기</title>
		<script src="./jquery-3.7.1.js"></script>
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
			    background-color: white;
			    color: black;
			    width: 100px;
			    height: 30px;
			    border-radius: 9px;
		    }
		    .post-btn1{
		    	background-color: white;
		    	border-radius: 9px;
		    	margin-left: 82%;
		    }
		    .post-btn2{
		    	background-color: white;
		    	border-radius: 9px;
		    }	
		    .reply-container {
	            margin-top: 40px;
	            max-width: 1200px;
	            margin: 0px auto;
	        }
	        h4 {
	            color: black;
	            text-align: center;
	            font-size: 1.4rem;
	            margin-bottom: 20px;
	        }
	        h5 {
	            color: black;
	            /* text-align: center; */
	            font-size: 1.4rem;
	            margin-bottom: 20px;
	            margin-top: 10px;
	        }
	        .comment {
	            padding: 15px;
	            margin-bottom: 1px;
	            background: #ffffff;
	            border-radius: 10px;
	            border: 1px solid #ddd;
	            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.15);
	        }
	        .comment .meta {
	            font-size: 0.8rem;
	            color: #777;
	            margin-bottom: 5px;
	        }
	        .comment p {
	            font-size: 0.95rem;
	            line-height: 1.4;
	            color: #555;
	        }
	        .comment-actions {
	            margin-top: 10px;
	            text-align: right;
	        }
	        .comment-actions button {
	            background: none;
	            border: none;
	            color: black;
	            font-size: 0.9rem;
	            cursor: pointer;
	            margin-left: 10px;
	            transition: color 0.3s ease;
	        }
	        .comment-form {
	            margin-top: 100px;
	            display: flex;
	            max-width: 1200px;
	            margin: 1px auto;
	        }
	        .comment-form input {
	            flex: 1;
	            padding: 10px;
	            border: 1px solid #ddd;
	            border-radius: 5px;
	            font-size: 1rem;
	        }
	        .comment-form button {
	            background-color: white;
   				color: black;
	            border-radius: 9px;
	            cursor: pointer;
	            font-size: 1rem;
	        }
	        .dpnone{
	        	display : none;
	        }
	        .first-ad, .second-ad {
			    position: fixed;
			    top: 350px;
			    width: 250px;
			    z-index: 999;
			    text-align: center;
			}
			.first-ad {
			    left: 10px;
			}	
			.second-ad {
			    right: 10px;
			}
			.first-ad img, .second-ad img {
			    width: 100%;
			    height: auto;
			    object-fit: cover;
			    border-radius: 8px;
			    box-shadow: 0 3px 8px rgba(0,0,0,0.2);
			}
		</style>
	</head>
	<body>
		<h2>글 상세보기</h2>
		<div class="write-container">
				<h4><%= title %></h4>
				 	<div>작성자 : <%= author %> | 작성일 : <%= createDate %></div>
				<div class="content-container">
					<pre><%= content %></pre>
				</div>
				<%
		        	if(user != null && (user.getId().equals(author) || user.getUserType() == 0)){
		        		%>
		        <div class="post-actions">
		            <button class="post-btn1" onclick="location.href='modify.jsp?no=<%=no %>'">수정</button>
		            <button class="post-btn2" onclick="deletePost(<%=no %>)">삭제</button>
		            <button type="button" class="btn1" onclick="location.href='movieBoard.jsp'">목록으로</button>
		        </div>
		        		<%
		        	}
		        %>
		</div>
		<div class="ad">
		 	<div class="first-ad">
				<%
					if(adlist.size() > 0){
						AdBoardVO advo = adlist.get(0);
				%>
					<a href="view.jsp?no=<%= advo.getBoard_no() %>">
						<img src="<%= advo.getAdvertisement_img() %>" alt="왼쪽 광고">
					</a><br>
					<div class="adtitle"><%= advo.getAdvertisement_title() %></div>
				<%
					}
				%>
			</div>
			<div class="second-ad">
				<%
					if(adlist.size() > 1){
						AdBoardVO advo = adlist.get(1);
				%>
					<a href="view.jsp?no=<%= advo.getBoard_no() %>">
						<img src="<%= advo.getAdvertisement_img() %>" alt="오른쪽 광고">
					</a><br>
					<div class="adtitle"><%= advo.getAdvertisement_title() %></div>
				<%
					}
				%>
			</div>
		 </div>
        <div class="reply-container">
        <%
        	if(user != null){
        		%>
        		<h5>댓글</h5>
        			<div class="comment-form">
			            <input id="rcontent" type="text" placeholder="댓글을 입력하세요...">
			            <button class="reply-btn" type="button" id="replyBtn">댓글 작성</button>
			        </div>
        		<%
        	}
        %>
            <%
            for(int i = 0; i < list.size(); i ++){
        		ReplyVO rvo = list.get(i);
        		String rno = rvo.getReply_no();
        		String rcontent = rvo.getReply_content();
        		String rauthor = rvo.getReply_author();
        		String rcreateDate = rvo.getReply_create_date();
            		%>
          	<div class="comment">
                <div class="meta">작성자: <%= rauthor %> | 작성일: <%= rcreateDate %></div>
                <p><%= rcontent %></p>
                
                <%
                	if(user != null && (user.getId().equals(rauthor) || user.getUserType() == 0)){
                		%>
                			<div class="comment-actions">
			                    <button onclick="replyBtn(this)">수정</button>
			                    <input type="hidden">
			                    <button class="dpnone" onclick="modifyReply(<%= rno %>, this)">확인</button>
			                    <button class="dpnone" onclick="cancelBtn(this, '<%= rcontent %>')">취소</button>
			                    <button onclick="deleteReply(<%= rno %>, this)">삭제</button>
			                </div>
                		<%
                	}
                %>
            </div>
            	<%
            	}
            %>            
        </div>
	</body>
	<script>
	let userId = "<%= user != null ? user.getId() : "" %>";
	console.log(userId);
	
	function cancelBtn(obj, text){
		let input = $(obj).parent().parent().children("input");
		console.log(input);
		input.replaceWith("<p>"+text+"</p>");
		
		$(obj).prev().prev().prev().css("display", "inline");
		$(obj).parent().children(".dpnone").css("display", "none");
	}
	
	function replyBtn(obj){
		let el = $(".comment");
		for(let i = 0; i < el.length; i++){

			let value = el.eq(i).children().children("input").val();
			console.log(value);
			let input = el.eq(i).children("input");
			input.replaceWith("<p>"+value+"</p>")
			
			el.eq(i).children().children().eq(0).css("display", "inline");
			el.eq(i).children().children(".dpnone").css("display", "none");
		}
			
		let p = $(obj).parent().parent().children("p");
		$(obj).next().val(p.text());
		
		p.replaceWith("<input type='text' value='"+p.text()+"'>");
		
		$(obj).css("display", "none");
		$(obj).parent().children(".dpnone").css("display","inline");
	}
	
	$("#replyBtn").click(function(){
	    $.ajax({
	        url : "replyok.jsp",
	        type : "post",
	        data : {
	            no : "<%= no %>",
	            rauthor : userId,
	            rcontent : $("#rcontent").val()
	        },
	        success : function(result){
	            let time = getTime();
	            console.log(result);
	            if(result.trim() != "0"){
	                let rcontent = $("#rcontent");
	                
	                let html = "";
	                html += "<div class='comment'>";
	                html += 	"<div class='meta'>작성자: "+userId+" | 작성일: "+time+"</div>";
	                html += 	"<p>"+rcontent.val()+"</p>";
	                html += 	"<div class='comment-actions'>";
	                html += 		"<button onclick='replyBtn(this)'>수정</button>";
	                html +=			"<input type='hidden'>"
	                html +=			"<button class='dpnone' onclick='modifyReply("+result.trim()+", this)'>확인</button>"
	                html +=			"<button class='dpnone' onclick='cancelBtn(this, `"+rcontent.val()+"`)'>취소</button>"
	                html +=			"<button onclick='deleteReply("+result.trim()+", this)'>삭제</button>";
	                html += 	"</div>";
	                html += "</div>";
	                
	                $(".reply-container").append(html);
	                
	                rcontent.val("");
	            } else {
	                console.log("댓글 작성 실패");
	            }
	        },
	        error : function(){
	            console.log("에러 발생");
	        }
	    });
	});

	
	//댓글 수정
	function modifyReply(rno, obj){
		console.log(rno);
		let input = $(obj).parent().parent().children("input");
		
		
		let reply = input.val();
		if(reply != null && reply.trim() != ""){
			let cresult = confirm("댓글을 수정하시겠습니까?");
			//confirm("댓글을 수정하시겠습니까?");
			if(cresult == true){
				$.ajax({
					url : "replyModifyok.jsp",
					type : "post",
					data : {
						rno : rno,
						rcontent : reply
					},
					success : function(result){
						console.log(result);
						if(result.trim() == "success"){
							input.replaceWith("<p>"+reply+"</p>");
							$(obj).parent().children(".dpnone").css("display", "none");
							$(obj).prev().prev().css("display", "inline");
							$(obj).next().attr("onclick", "cancelBtn(this, '"+reply+"')");
						}
					},
					error : function(){
						console.log("에러 발생");
					}
				});
			}
		}		
	}
	
	//댓글 삭제
	function deleteReply(rno, obj){
		confirm("댓글을 삭제하시겠습니까?");
		$.ajax({
			url : "replyDeleteok.jsp",
			type : "post",
			data : {
				rno : rno
			},
			success : function(result){
				if(result.trim() == "success"){
					$(obj).parent().parent().remove();
				}
			},
			error : function(){
				console.log("에러 발생");
			}
		});
	}
	
	function getTime(){
		let date = new Date();
		console.log(date);
		
		let year = date.getFullYear();
		let month = (date.getMonth() + 1).toString().padStart(2,"0");
		let day = date.getDate().toString().padStart(2,"0");
		let hour = date.getHours().toString().padStart(2,"0");
		let minute = date.getMinutes().toString().padStart(2,"0");
		let second = date.getSeconds().toString().padStart(2,"0");
		
		let time = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second
		return time;
	}

	function deletePost(no){
		console.log(no);
		let result = confirm("삭제하시겠습니까?");
		if(result == true){
			location.href = "postDelete.jsp?no="+no;
		}
	}
	</script>
</html>