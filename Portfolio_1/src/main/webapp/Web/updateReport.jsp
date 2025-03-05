<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>게시판 수정</title>
    <link rel="shortcut icon" href="https://www.ichannela.com/favicon.ico">
</head>

<body>
	<%@ include file="menu2.jsp"%>
	<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	%>
	<sql:setDataSource var="dataSource"
		url="jdbc:oracle:thin:@localhost:1521:xe"
		driver="oracle.jdbc.driver.OracleDriver" user="C##dbexam"
		password="m1234" />
		
		<sql:query var="rs" dataSource="${dataSource}">
			select * from reportsDB where id=?
			<sql:param value="<%=id %>" />
		</sql:query>
		<c:forEach var="row" items="${rs.rows }">
		<c:set value="${row.phone }" var="phone"/>
		<c:set value="${phone.split('-')[0] }" var="phone1"/>
		<c:set value="${phone.split('-')[1] }" var="phone2"/>
		<c:set value="${phone.split('-')[2] }" var="phone3"/>
		
	<div class="container-fluid">
		<form action="./processUpdateReport.jsp" method="post"
			enctype="multipart/form-data" name="newReport">
			<div class="row">
				<div class="offset-xl-2 col-4 mr-auto my-3">
					TV 홈 > 뉴스 > <span class="font-weight-bold">제보</span>
				</div>
				<div class="col-xl-8 offset-xl-2 px-0">
					<img src="http://image.ichannela.com/images/news/img_news_jebo.png"
						class="img-fluid w-100" alt="">
				</div>

			</div>
			<div id="info" class="row px-3">
				<div class="col-xl-2 col-4 offset-xl-2 ">
					<div class="row font-weight-bold ">
						<div class="col-12 my-3 ">
							<p class="pl-5">휴대전화번호</p>
						</div>
						<div class="col-12 mb-3">
							<p class="pl-5">제목</p>
						</div>
						<div class="col-12 mb-3">
							<p class="pl-5">내용</p>
						</div>
						<div class="col-12 mt-4 mb-5"></div>
						<div class="col-12 mt-4 mb-3">
							<p class="pl-5">파일첨부1</p>
						</div>
						<div class="col-12 mb-3">
							<p class="pl-5">파일첨부2</p>
						</div>
						<div class="col-12 mb-3">
							<p class="pl-5">파일첨부3</p>
						</div>
					</div>
				</div>
				<div class="col-xl-5 col-8 mt-1">

					<div class="row">
						<div class="col-12 my-3 ">
							<input type="tel" id="phone1" name="phone1" maxlength="3"
								class="phone-input bg-light rounded-lg" value="${phone1 }" required>- <input
								type="tel" id="phone2" name="phone2" value="${phone2 }" maxlength="4"
								class="phone-input bg-light rounded-lg" required>- <input
								type="tel" id="phone3" name="phone3" value="${phone3 }" maxlength="4"
								class=" phone-input bg-light round ed-lg" required>
						</div>
						<div class="col-12 mb-2 ">
							<input type="text" id="title" name="title"
								placeholder="제목을 입력해주세요." value="${row.title }" class="bg-light w-100 form-control"
								required>
								<input type="hidden" id="id" name="id"
								 value="${row.id }" class="bg-light w-100 form-control"
								required>
						</div>
						<div class="col-12 mb-3 mt-2 ">
							<textarea class="form-control bg-light" placeholder="내용을 입력해주세요."
								aria-label="With textarea" id="ReportText" name="ReportText"
								rows="5">${row.text }</textarea>
						</div>
						<div class="col-12 mb-3 mt-1">
							<input type="file" id="file1" name="file1" class="bg-light w-100">
						</div>
						<div class="col-12 mb-3">
							<input type="file" id="file2" name="file2" class="bg-light w-100">
						</div>
						<div class="col-12 mb-3">
							<input type="file" id="file3" name="file3" class="bg-light w-100">
						</div>
					</div>


				</div>
			</div>
			<div class="line"></div>
			<div class="row">
				<div class="offset-xl-2 col-xl-8 col-12 my-5">
					<h5 class="ml-4 font-weight-bold text-primary">개인정보 보호를 위한 이용자
						동의 사항</h5>
					<h6 class="ml-4 mb-5">자세한 내용은 사이트 하단 '개인정보 보호방침'을 확인하시기 바랍니다.</h6>
					<h6 class="ml-4 font-weight-bold">
						<span class="text-primary">1.</span> 개인정보의 수집·이용 항목
					</h6>
					<h6 class="ml-4 mb-5">
						<small>회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다. <br> [서비스 안내 및
							제보 내용에 관한 확인 및 처리 등의 업무 진행]
						</small>
					</h6>
					<h6 class="ml-4 font-weight-bold">
						<span class="text-primary">2.</span>수집하는 개인정보 항목
					</h6>
					<h6 class="ml-4 mb-5">
						<small>이름, 전화번호, 이메일, 주소 등 입력항목</small>
					</h6>
					<h6 class="ml-4 font-weight-bold">
						<span class="text-primary">3.</span>개인정보의 보유 및 이용기간
					</h6>
					<h6 class="ml-4 mb-3">
						<small>원칙적으로 개인정보의 수집 및 이용목적이 달성된 후에는 해당정보를 지체없이 파기합니다.</small>
					</h6>
				</div>
			</div>
			<div class="line"></div>
			<div class="row py-5">
				<div class="col-12 text-center">
					<p class="p-3 mr-1">
						개인정보 제공에 동의하시겠습니까? <input type="checkbox" required>동의함
					</p>
				</div>
				<div class="col-12 text-center">
					<input type="submit" class="btn btn-primary w-25 p-3 " value="수정하기"></input>
				</div>
			</div>
		</form>
	</div>

</c:forEach>
	<%@ include file="footer.jsp"%>

</body>
<style>
body {
	overflow-x: hidden;
}

#info p::before {
	content: " ";
	width: 3px;
	background-color: #196EFF;
	height: 20px;
	position: relative;
	top: 5px;
	display: inline-block;
	left: -15px;
}

.phone-input {
	width: 80px;
}

input {
	padding: 5px;
	margin-right: 5px;
	margin-bottom: 0;
	font-size: 1rem;
	font-weight: 400;
	color: #495057;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
}

input:focus {
	outline: 2px solid #196EFF;
	/* 포커스 상태에서 outline 색상 변경 */
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



</html>