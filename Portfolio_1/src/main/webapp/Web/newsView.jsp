<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
<title>채널 A 뉴스</title>
<link rel="shortcut icon" href="https://www.ichannela.com/favicon.ico">
</head>

<body>
	<%@ include file="menu.jsp"%>
	<%
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String admin = request.getParameter("admin");
	request.setAttribute("id", id); // id 값을 request에 저장
	%>

	<sql:setDataSource var="dataSource"
		url="jdbc:oracle:thin:@localhost:1521:xe"
		driver="oracle.jdbc.driver.OracleDriver" user="C##dbexam"
		password="m1234" />
	<sql:query var="rs" dataSource="${dataSource}">
        select * from newsDB where id=<%=id%>
	</sql:query>
	<sql:query var="rs1" dataSource="${dataSource}">
       			 select * from newsDB where category='<%=title%>'AND id != <%= id %>
	</sql:query>
	<c:forEach var="row" items="${rs.rows }" varStatus="status">
		<c:set value="${row.updatetime}" var="updatetime" />

		<!-- 날짜 포맷 변환: updatetime을 'yyyy년MM월dd일'로 변환 -->
		<fmt:formatDate value="${updatetime}" pattern="yyyy-MM-dd"
			var="formattedDate" />


		<div class="container-fluid px-0 mt-n4 ">
			<br>
			<div class="row">
				<div class="col-xl-8 offset-xl-2 px-0">
					<p class="title text-white"><%=title%></p>
					<img
						src="http://image.ichannela.com/images/news/newspart_top_n01.png"
						class="rounded img-fluid w-100" alt="">
				</div>
			</div>

			<div class="row">
				<div class="offset-xl-2 col-xl-8 col-12 my-4 ">
					<h1 class="font-weight-bolder">${row.title }</h1>
				</div>
				<div class="offset-xl-2 col-xl-4 col-6 ">
					<h5>${formattedDate }
						<span class="small font-weight-bold"> [ ${row.Category } ]
						</span>
					</h5>
				</div>
				<div class="col-xl-4 col-6">
					<c:if test="${sessionId eq 'admin'}">
						<button
							class="btn btn-primary float-right ml-3 adminBtn_del"
							onclick="newsDelete(${row.id}, '<%=title%>')">기사 삭제</button>
						<button class="btn btn-primary float-right adminBtn_up"
							onclick="newsUpdate(${row.id}, '<%=title%>')">기사 수정</button>
					</c:if>
				</div>
			</div>

			<div class="row">
				<div class="offset-xl-2 col-xl-8 col-12 my-4 ">
					<img class="rounded-lg img-fluid w-100"
						src="../resources/images/${row.img }" alt="...">
				</div>

				<%
				pageContext.setAttribute("newLineChar", "<br>");
				%>
				<c:set value="${row.text}" var="text" />
				<c:set var="contentWords" value="${fn:split(text, newLineChar)}" />
				<!-- 텍스트를 '.' 기준으로 분리 -->


				<div class="offset-xl-2 col-xl-8 col-12 my-4 ">
					<c:forEach items="${contentWords}" var="word">
						<p class="display-6" style="white-space: pre-wrap"><c:out value="${word}" />
						</p>
					</c:forEach>
				</div>

			</div>
		</div>
	</c:forEach>



	<div class="container-fluid">

		<div class="col offset-xl-2 offset-lg-1 px-0">
			<h3 class="font-weight-bold mt-1 mb-1">같은 분야별 뉴스</h3>
		</div>
		<div class="row">

			<div class="col-xl-2 d-none d-xl-block"></div>
			<c:forEach var="row" items="${rs1.rows }" varStatus="status">

				<div class="col-xl-2 col-md-3 col-6 my-4 "
					
                  
                     <c:if test="${status.index >= 4}">
                         style="display:none;"
                     </c:if>
                     >
					<div class="card">
						<img src="../resources/images/${row.img }" style="height: 160px;"
							class="card-img-top img-fluid" alt="...">
						<div class="card-body">
							<h6 class="card-title text-truncate">${row.title }</h6>
							<p class="card-text text-truncate small">${row.text }.</p>
							<a href="./newsView.jsp?id=${row.id }&title=${row.category}"
								class="btn btn-primary btn-block">기사 보러가기</a>
						</div>
					</div>
				</div>

			</c:forEach>
		</div>




		<div class="row">
			<div class="col offset-xl-2 offset-lg-1 px-0">
				<h3 class="font-weight-bold mt-1 mb-3">뉴스 프로그램</h3>
			</div>
		</div>
		<div class="row mb-5">
			<div
				class="col-xl-2 col-lg-3 col-md-6 col-6 text-center offset-xl-2 mb-3">
				<img class="img-fluid rounded"
					src="http://image.ichannela.com/images/program/WPG2130032D/site_poster_img1_20241231093100260.jpg"
					alt="">
			</div>
			<div class="col-xl-2 col-lg-3 col-md-6 col-6 text-center mb-3">
				<img class="img-fluid rounded"
					src="http://image.ichannela.com/images/program/WPG2170144D/site_poster_img1_20240707091738762.jpg"
					alt="">
			</div>
			<div class="col-xl-2 col-lg-3 col-md-6 col-6 text-center mb-3">
				<img class="img-fluid rounded"
					src="http://image.ichannela.com/images/program/WPG2130137D/site_poster_img1_20240707091940356.jpg"
					alt="">
			</div>
			<div class="col-xl-2 col-lg-3 col-md-6 col-6 text-center mb-3">
				<img class="img-fluid rounded"
					src="http://image.ichannela.com/images/program/WPG2120219D/site_poster_img1_20240707092022007.jpg"
					alt="">
			</div>

		</div>
	</div>



	<%@ include file="footer.jsp"%>

</body>
<style>
body {
	overflow-x: hidden;
}

.title {
	position: absolute;
	font-size: 2.5vw;
	left: 3%;
	top: 20%;
}

body .line {
	position: relative;
	left: 17%;
	width: 66%;
	height: 1px;
	background-color: #a8a8a880;
}

@media ( max-width : 1200px) {
	body .line {
		width: 100%;
		left: 0%;
	}
}
</style>

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
	<script type="text/javascript">
	function newsDelete(id, title) {
	    if (confirm('정말로 이 기사를 삭제하시겠습니까?')) {
	        // id와 title을 URL 파라미터로 전달하여 deleteNews.jsp로 이동
	        window.location.href = 'deleteNews.jsp?id=' + id + '&title=' + title;
	    }
	}
	function newsUpdate(id, title) {
	    if (confirm('이 기사를 수정하시겠습니까?')) {
	        // id와 title을 URL 파라미터로 전달하여 deleteNews.jsp로 이동
	        window.location.href = 'updateNews.jsp?id=' + id;
	    }
	}</script>

</html>
