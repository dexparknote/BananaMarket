<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.dongnelife {
		width: 70%;
		margin:auto;
		height:1050px;
		padding-top:150px;
		padding-bottom:5%;	
		margin-bottom:100px;
	}
	.dl_title {
		border-bottom:4px solid #FEE500;
	}
	.dl_title h1 {
		font-size:28px;
		margin-left:20px;
	}
	.dl_content1 {
		margin-top:20px;
		text-align:center;
	}
	.dl_content1 hr{
		margin:auto;
		width:70%;
	}
	.dl_content1 a{
		text-decoration:none;
	}
	.dl_content1 img{
		width:50px;
		height:50px;
		border-radius:50%;
     	border:3px solid #fff;
      	box-shadow: 0 0 16px rgb(221,221,221);
	}
	.dl_content1 label{
		color: rgb(98,71,24);
		font-size: 17px;
		font-weight:550;
		margin-left:30px;
		position: relative;
        top: -17px;
	}
	.dl_content1 button {
		all:unset;
		font-size: 16px;
		margin-left:30px;
		position: relative;
        top: -11px;
     	color:  #FEE500;
        text-shadow: -1px 0 rgb(98,71,24), 0 1px rgb(98,71,24),  1px 0 rgb(98,71,24), 0 -1px rgb(98,71,24);
	}
	.dl_content1 button:hover{
		color:rgb(98,71,24);
        text-shadow: -0.5px 0 #FEE500, 0 0.5px #FEE500,  0.5px 0 #FEE500, 0 -0.5px #FEE500;
	}
	div.dongnelife section.sub_section{		
		height:900px;
		overflow:auto;
	}
	.dl_content2 {
		width: 60%;
		height:285px;
		margin:auto;
		background-color: rgb(251,247,242); 
		box-shadow: 0 0 16px rgb(221,221,221);
		margin-bottom:30px;
	}
	.dl_content2 ul{
		list-style-type:none;
	}
	.dl_content2 ul li {
		margin: 15px 0 0 35px;
	}
	.dl_content2 ul li:first-child {
		padding-top: 20px;
	}
	.dl_content2 ul li:first-child label:first-child{
		padding: 3px 30px;
		color: rgb(98,71,24);
		background-color:rgb(255,249,176);
	}
	.dl_content2 ul li:first-child label:nth-child(2){
		color: rgb(98,71,24);
		font-size:14px;
		float:right;
		margin-right:20px;
	}
	.dl_content2 ul li:nth-child(2) img{
		width:35px;
		height:35px;
		margin-left:5px;
		border-radius:50%;
     	border:2px solid #fff;
      	box-shadow: 0 0 16px rgb(221,221,221);
	}
	.dl_content2 ul li:nth-child(2) label{
		position: relative;
        top: -11px;
        color: rgb(98,71,24);
        font-weight:550;
	}
	.dl_content2 ul li:nth-child(2) label:last-child{
        margin-left:6px;
        font-size:12px;
        font-weight:500;
	}
	.dl_content2 ul li:nth-child(3) {
		width:92%;
		height:90px;
		overflow:hidden;
      	text-overflow:ellipsis;
      	display: -webkit-box;
   	 	-webkit-line-clamp: 5; /* 라인수 */
        -webkit-box-orient: vertical;
        word-wrap:break-word; 
        line-height: 1.2em;
        height: 6em;
	}
	.dl_content2 ul li a img{
		width:20px;
		height:20px;
	}
	.dl_content2 ul li button{
		all:unset;
		margin-right:10px;
		position: relative;
        top: -4px;
	}
	.dl_content2 ul li button:hover{
		all:unset;
		margin-right:10px;
		position: relative;
        top: -4px;
		color: #FEE500;
		text-shadow: -1px 0 rgb(98,71,24), 0 1px rgb(98,71,24),  1px 0 rgb(98,71,24), 0 -1px rgb(98,71,24);
        
	}
	div.dl_content2:hover {
		cursor:pointer;
		box-shadow: 0 0 22px #FEE500;
	}
	
	
</style>
<body>
	<jsp:include page="../header.jsp"/>
	<div class="dongnelife">
		<section class="section1">
			<div class="dl_title">
				<h1>동네 생활</h1>
			</div>
			<c:if test="${svo.mid ne null }">
			<div class="dl_content1">
				<img src="http://localhost:9000/banana/resources/upload/${ svo.msfile }"><label>${svo.nickname }님 오늘 이의동의 이야기를 들려주세요!</label><br><br>
				<a href="dongneLife_write.do"><button type="button"> 동네생활 글쓰기</button></a><hr>
			</div>
			</c:if>	
			<section class="sub_section">
			<c:forEach var="vo" items="${list }">
			<div class="dl_content2" onclick="location.href='dongneLife_content.do?bid=${vo.bid}'">
				<ul>	
					<li>
						<label>${vo.btitle }</label>
						<label>${vo.bdate }</label>
					</li>
					<li>
						<img src="http://localhost:9000/banana/resources/upload/${ vo.msfile }">
						<label>${vo.nickname }</label>
						<label>${vo.maddr }</label>
					</li>	
					<li><pre><c:out value="${vo.btopic}" /></pre></li>
					<li>
						<!-- <img src="images/smile.png"><button type="button">공감하기</button> -->
						<a href="dongneLife_content.do?bid=${ vo.bid }" style="text-decoration:none;"><img src="images/messenger.png"><button type="button">&nbsp; 댓글 쓰기</button></a>
					</li>
				</ul>
			</div>
			</c:forEach>
			</section>
			</section>
			
	</div>
	<jsp:include page="../footer.jsp"/>
</body>
</html>