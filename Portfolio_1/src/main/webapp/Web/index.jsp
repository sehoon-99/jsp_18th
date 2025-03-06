<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<title>채널 A</title>
<link rel="shortcut icon" href="https://www.ichannela.com/favicon.ico">

</head>

<body>
	<%@ include file="menu.jsp"%>
	<%
	String msg = request.getParameter("msg");

	// msg 값이 "1"일 경우, JavaScript alert 출력
	if (msg != null && msg.equals("1")) {
	%>
	<script type="text/javascript">
		alert("일치하는 회원 정보가 존재하지 않습니다. 다시 확인하여 입력해 주시길 바랍니다.");
	</script>
	<%
	} else if (msg != null && msg.equals("0")) {
	%>
	<script type="text/javascript">
		alert("회원가입이 정상적으로 처리 되었습니다.");
	</script>
	<%
	}
	%>
	<div class="container-fluid bg-primary p-2">
		<ul class="nav nav-pills justify-content-center ">
			<li class="nav-item"><a class="nav-link active text-white "
				href="index.jsp">전체기사</a></li>
			<li class="nav-item"><a class="nav-link text-white "
				href="news.jsp?title=정치">정치</a></li>
			<li class="nav-item "><a class="nav-link text-white "
				href="news.jsp?title=사회">사회</a></li>
			<li class="nav-item"><a class="nav-link text-white "
				href="news.jsp?title=경제">경제</a></li>
			<li class="nav-item"><a class="nav-link text-white "
				href="news.jsp?title=생활문화">생활문화</a></li>
			<li class="nav-item"><a class="nav-link text-white "
				href="news.jsp?title=국제">국제</a></li>
			<li class="nav-item"><a class="nav-link text-white "
				href="news.jsp?title=스포츠">스포츠</a></li>
			<li class="nav-item"><a class="nav-link text-white "
				href="new.jsp">최신</a></li>
		</ul>
	</div>


	<sql:setDataSource var="dataSource"
		url="jdbc:oracle:thin:@localhost:1521:xe"
		driver="oracle.jdbc.driver.OracleDriver" user="C##dbexam"
		password="m1234" />
	<sql:query var="recently" dataSource="${dataSource }">
                SELECT * FROM newsDB ORDER BY updatetime DESC FETCH FIRST 1 ROWS ONLY
            </sql:query>
	<sql:query var="recently2" dataSource="${dataSource }">
                SELECT * FROM (SELECT newsDB.*, ROW_NUMBER() OVER (ORDER BY updatetime DESC) AS row_num FROM newsDB) WHERE row_num BETWEEN 2 AND 4
            </sql:query>

	<div class="container-fluid">
		<div class="row">

			<!-- 가장 최근의 DB를 메인으로 -->
			<c:forEach var="row" items="${recently.rows }" varStatus="status">
				<div class="col-xl-4 col-md-6 col-sm-12 offset-xl-2 border ">
					<div class=" mt-5">
						<a class=" text-body"
							href="./newsView.jsp?id=${row.id }&title=${row.category}"> <img
							class="card-img-top img-fluid"
							src="../resources/images/${row.img }" alt="">
						</a> <a class=" text-body"
							href="./newsView.jsp?id=${row.id }&title=${row.category}">
							<div class="card-body">
								<h5 class="card-title font-weight-bolder px-2">${row.title }</h5>
								<p class="lead card-text text-truncate d-none d-xl-block"
									style="max-width: 550px;">${row.text }</p>
							</div>
						</a>
						<ul class="list-group list-group-flush d-block d-xl-none mb-2">
							<c:forEach var="row2" items="${recently2.rows }"
								varStatus="status">
								<a class=" text-body"
									href="./newsView.jsp?id=${row2.id }&title=${row2.category}">
									<li
									class="border-top font-weight-bold list-group-item border-left-0 border-right-0 border-bottom-0"">${row2.title }</li>
								</a>
							</c:forEach>

						</ul>

					</div>
				</div>
			</c:forEach>
			<sql:query var="recently3" dataSource="${dataSource }">
                SELECT * FROM (SELECT newsDB.*, ROW_NUMBER() OVER (ORDER BY updatetime DESC) AS row_num FROM newsDB) WHERE row_num BETWEEN 5 AND 6
            </sql:query>

			<div class="col-xl-4 col-md-6 border-right">
				<div class="row mb-1">
					<c:forEach var="row3" items="${recently3.rows }" varStatus="status">

						<div class="col-lg-6 col-md-6 mt-5 d-none d-md-block border-bottom">
							<a class=" text-body"
								href="./newsView.jsp?id=${row3.id }&title=${row3.category}">
								<img class="img-fluid rounded"
								src="../resources/images/${row3.img }" width="285" height="156"
								alt="">
							</a> <a class=" text-body"
								href="./newsView.jsp?id=${row3.id }&title=${row3.category}">
								<h6 class="font-weight-bold mt-3  article">${row3.title }</h6>
							</a>
						</div>

					</c:forEach>
				</div>

				<sql:query var="recently4" dataSource="${dataSource }">
                SELECT * FROM (SELECT newsDB.*, ROW_NUMBER() OVER (ORDER BY updatetime DESC) AS row_num FROM newsDB) WHERE row_num BETWEEN 7 AND 9
            </sql:query>

				<ul class="list-group list-group-flush mt- font-weight-bold ">
					<c:forEach var="row4" items="${recently4.rows }" varStatus="status">
						<a class=" text-body "
							href="./newsView.jsp?id=${row4.id }&title=${row4.category}">
							<li
							class="list-group-item border-left-0 border-right-0 border-top-0">
								<span class="text-danger">[단독]</span>${row4.title }
						</li>
						</a>
					</c:forEach>
				</ul>

			</div>
		</div>
	</div>
	<div class="container-fluid mb-3">

		<div class="row bg-dark text-white ">
			<div class="offset-xl-2 col-md-12">
				<h3 class="font-weight-bold my-5">인기 뉴스</h3>
				<sql:query var="hot" dataSource="${dataSource }">
                SELECT * FROM newsDB ORDER BY updatetime DESC FETCH FIRST 1 ROWS ONLY
            </sql:query>

				<div class="row">
					<c:forEach var="hotRow" items="${hot.rows }" varStatus="status">
						<div class=" col-xl-4 col-md-5 ">
							<a class=" text-body text-white text-decoration-none"
								href="./newsView.jsp?id=${hotRow.id }&title=${hotRow.category}">
								<img class="img-fluid rounded"
								src="../resources/images/${hotRow.img }" alt="">
						</div>

						<div class="col-xl-4 col-md-6">
							<a class=" text-white text-decoration-none"
								href="./newsView.jsp?id=${hotRow.id }&title=${hotRow.category}">
								<h3 class="font-weight-bolder mt-3 text-white">
									<span class="text-danger">[단독]</span>${hotRow.title }
								</h3>
								<h5 class="d-none d-xl-block text-truncate mt-5 text-white"
									style="max-width: 600px;">${hotRow.text }</h5>
							</a>
						</div>
					</c:forEach>
				</div>
				<div class="row mt-3">
					<sql:query var="recently5" dataSource="${dataSource }">
                SELECT * FROM (SELECT newsDB.*, ROW_NUMBER() OVER (ORDER BY updatetime DESC) AS row_num FROM newsDB) WHERE row_num BETWEEN 10 AND 13
            </sql:query>


					<c:forEach var="row5" items="${recently5.rows }" varStatus="status">

						<div class="col-xl-2 col-md-3 col-6">
							<a class=" text-body "
								href="./newsView.jsp?id=${row5.id }&title=${row5.category}">
								<img src="../resources/images/${row5.img }"
								style="max-height: 165px; width: 100%;"
								class="img-fluid rounded-lg" alt="">
							</a> <a class=" text-white text-decoration-none"
								href="./newsView.jsp?id=${row5.id }&title=${row5.category}">
								<h6 class="display-5 mt-3 mb-5 text-white">${row5.title }</h6>
							</a>
						</div>

					</c:forEach>



				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col offset-xl-2 offset-lg-1 px-0">
					<h3 class="font-weight-bold mt-5 mb-3"> 정치·사회·경제</h3>
				</div>
			</div>
		</div>



		<div class="container-fluid">
			<div class="row">
				<div class="offset-xl-2 offset-lg-1 col-xl-8 col-lg-10">
					<div class="owl-slider">
						<div id="carousel1" class="owl-carousel">

							<sql:query var="category_politics" dataSource="${dataSource }">
                SELECT * FROM newsDB WHERE Category = '정치' ORDER BY updatetime DESC FETCH FIRST 2 ROWS ONLY
            </sql:query>
							<c:forEach var="category_politics_Row"
								items="${category_politics.rows }" varStatus="status">

								<div class="item rounded">
									<a class="text-body text-decoration-none"
										href="./newsView.jsp?id=${category_politics_Row.id }&title=${category_politics_Row.category}">
										<img src="../resources/images/${category_politics_Row.img }" style="height:160px"
										class="img-fluid rounded">
										<h5 class="text-primary font-weight-bold mt-2 pl-1">${category_politics_Row.category }</h5>
										<p class="font-weight-bold pl-1 text-truncate">${category_politics_Row.title }</p>
									</a>
								</div>
							</c:forEach>

						<sql:query var="category_social" dataSource="${dataSource }">
                SELECT * FROM newsDB WHERE Category = '사회' ORDER BY updatetime DESC FETCH FIRST 2 ROWS ONLY
            </sql:query>
            

						<c:forEach var="category_social_Row" items="${category_social.rows }" varStatus="status">
							<div class="item rounded">
									<a class="text-body text-decoration-none"
										href="./newsView.jsp?id=${category_social_Row.id }&title=${category_social_Row.category}">
										<img src="../resources/images/${category_social_Row.img }" style="height:160px"
										class="img-fluid rounded">
										<h5 class="text-primary font-weight-bold mt-2 pl-1">${category_social_Row.category }</h5>
										<p class="font-weight-bold pl-1 text-truncate">${category_social_Row.title }</p>
									</a>
								</div>
							</c:forEach>
							
							<sql:query var="category_economy" dataSource="${dataSource }">
                SELECT * FROM newsDB WHERE Category = '경제' ORDER BY updatetime DESC FETCH FIRST 2 ROWS ONLY
            </sql:query>
            

						<c:forEach var="category_economy_Row" items="${category_economy.rows }" varStatus="status">
							<div class="item rounded">
									<a class="text-body text-decoration-none"
										href="./newsView.jsp?id=${category_economy_Row.id }&title=${category_economy_Row.category}">
										<img src="../resources/images/${category_economy_Row.img }" style="height:160px"
										class="img-fluid rounded">
										<h5 class="text-primary font-weight-bold mt-2 pl-1">${category_economy_Row.category }</h5>
										<p class="font-weight-bold pl-1 text-truncate">${category_economy_Row.title }</p>
									</a>
								</div>
							</c:forEach>
							
						
							
							
							
							
							
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container-fluid">
			<div class="row">
				<div class="col offset-xl-2 offset-lg-1 px-0">
					<h3 class="font-weight-bold mt-1 mb-3">생활문화·국제·스포츠 </h3>
				</div>
			</div>
		</div>

		<div class="container-fluid">
			<div class="row">
				<div class="offset-xl-2 offset-lg-1 col-xl-8 col-lg-10">
					<div class="owl-slider">
						<div id="carousel2" class="owl-carousel">
						
							<sql:query var="category_culture" dataSource="${dataSource }">
                SELECT * FROM newsDB WHERE Category = '생활문화' ORDER BY updatetime DESC FETCH FIRST 2 ROWS ONLY
            </sql:query>
            

						<c:forEach var="category_culture_Row" items="${category_culture.rows }" varStatus="status">
							<div class="item rounded">
									<a class="text-body text-decoration-none"
										href="./newsView.jsp?id=${category_culture_Row.id }&title=${category_culture_Row.category}">
										<img src="../resources/images/${category_culture_Row.img }" style="height:160px"
										class="img-fluid rounded">
										<h5 class="text-primary font-weight-bold mt-2 pl-1">${category_culture_Row.category }</h5>
										<p class="font-weight-bold pl-1 text-truncate">${category_culture_Row.title }</p>
									</a>
								</div>
							</c:forEach>
							
							
							<sql:query var="category_international" dataSource="${dataSource }">
                SELECT * FROM newsDB WHERE Category = '국제' ORDER BY updatetime DESC FETCH FIRST 2 ROWS ONLY
            </sql:query>
            

						<c:forEach var="category_international_Row" items="${category_international.rows }" varStatus="status">
							<div class="item rounded">
									<a class="text-body text-decoration-none"
										href="./newsView.jsp?id=${category_international_Row.id }&title=${category_international_Row.category}">
										<img src="../resources/images/${category_international_Row.img }" style="height:160px"
										class="img-fluid rounded">
										<h5 class="text-primary font-weight-bold mt-2 pl-1">${category_international_Row.category }</h5>
										<p class="font-weight-bold pl-1 text-truncate">${category_international_Row.title }</p>
									</a>
								</div>
							</c:forEach>
							
							<sql:query var="category_sports" dataSource="${dataSource }">
                SELECT * FROM newsDB WHERE Category = '스포츠' ORDER BY updatetime DESC FETCH FIRST 2 ROWS ONLY
            </sql:query>
            

						<c:forEach var="category_sports_Row" items="${category_sports.rows }" varStatus="status">
							<div class="item rounded">
									<a class="text-body text-decoration-none"
										href="./newsView.jsp?id=${category_sports_Row.id }&title=${category_sports_Row.category}">
										<img src="../resources/images/${category_sports_Row.img }" style="height:160px"
										class="img-fluid rounded">
										<h5 class="text-primary font-weight-bold mt-2 pl-1">${category_sports_Row.category }</h5>
										<h6 class="font-weight-bold pl-1 text-truncate">${category_sports_Row.title }</h6>
									</a>
								</div>
							</c:forEach>
							
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container-fluid">
			<div class="row">
				<div class="col offset-xl-2 offset-lg-1 px-0">
					<h3 class="font-weight-bold mt-3 mb-3">최신 뉴스</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-4 col-lg-5 offset-xl-2 offset-lg-1 col-md-6">

					<sql:query var="new1" dataSource="${dataSource }">
                SELECT * FROM newsDB ORDER BY updatetime DESC FETCH FIRST 4 ROWS ONLY
            </sql:query>
					<c:forEach var="news" items="${new1.rows }" varStatus="status">
						<a class=" text-body text-decoration-none"
							href="./newsView.jsp?id=${news.id }&title=${news.category}">
							<div class="card mb-3">
								<div class="row no-gutters">
									<div class="col-5">
										<img src="../resources/images/${news.img }" class="img-fluid"
											width="100%" style="height: 140px;" alt="...">
									</div>
									<div class="col-7">
										<div class="card-body">
											<h5 class="card-title text-truncate">${news.title }</h5>
											<p class="card-text">
												<small class="text-muted">${news.updatetime }</small>
											</p>
										</div>
									</div>
								</div>
							</div>
						</a>
					</c:forEach>
				</div>

				<div class="col-xl-4 col-lg-5 col-md-6">
					<sql:query var="new2" dataSource="${dataSource }">
                SELECT * FROM (SELECT newsDB.*, ROW_NUMBER() OVER (ORDER BY updatetime DESC) AS row_num FROM newsDB) WHERE row_num BETWEEN 5 AND 8
            </sql:query>
					<c:forEach var="news2" items="${new2.rows }" varStatus="status">
						<a class=" text-body text-decoration-none"
							href="./newsView.jsp?id=${news2.id }&title=${news2.category}">
							<div class="card mb-3">
								<div class="row no-gutters">
									<div class="col-5">
										<img src="../resources/images/${news2.img }" class="img-fluid"
											width="100%" style="height: 140px;" alt="...">
									</div>
									<div class="col-7">
										<div class="card-body">
											<h5 class="card-title text-truncate">${news2.title }</h5>
											<p class="card-text">
												<small class="text-muted">${news2.updatetime }</small>
											</p>
										</div>
									</div>
								</div>
							</div>
						</a>
					</c:forEach>
				</div>
			</div>
		</div>

		<div class="container-fluid">
			<div class="row">
				<div class="col offset-xl-2 offset-lg-1 px-0">
					<h3 class="font-weight-bold mt-1 mb-3">뉴스 프로그램</h3>
				</div>
			</div>
			<div class="row">
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










	</div>



	<%@ include file="footer.jsp"%>

</body>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	color: #196EFF !important;
	background-color: white;
}

body {
	overflow-x: hidden;
}

/* fix blank or flashing items on carousel */
img {
	height: 100%;
	object-fit: cover;
}

.owl-nav button {
	position: absolute;
	top: 50%;
	background-color: #000;
	color: #fff;
	margin: 0;
	transition: all 0.3s ease-in-out;
}

.owl-nav button.owl-prev {
	left: -7%;
}

.owl-nav button.owl-next {
	right: -7%;
}

.owl-nav button {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	/* background: rgba(255, 255, 255, 0.38) !important; */
}

#sub_news span {
	font-size: 70px;
	position: relative;
	top: -5px;
}

.owl-nav button:focus {
	outline: none;
}

.owl-item {
	/* Adjust this value as needed */
	display: flex;
}

.item {
	width: 100%;
	height: 50%;
}

.item h5 {
	font-size: 1.1vw;
}

.item h6 {
	font-size: 1vw;
}

@media ( max-width : 992px) {
	.owl-nav button.owl-prev {
		left: -5%;
	}
	.owl-nav button.owl-next {
		right: -5%;
	}
	.item h5 {
		font-size: 1.6vw;
	}
	.item h6 {
		font-size: 1.5vw;
	}
}

@media ( max-width : 768px) {
	.owl-nav button.owl-prev {
		left: -6.5%;
	}
	.owl-nav button.owl-next {
		right: -6.5%;
	}
	.item h5 {
		font-size: 2.1vw;
	}
	.item h6 {
		font-size: 2vw;
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
<script>
	jQuery("#carousel1")
			.owlCarousel(
					{
						autoplay : false,
						rewind : false, /* use rewind if you don't want loop */
						margin : 20,
						loop : true,
						/*
						animateOut: 'fadeOut',
						animateIn: 'fadeIn',
						 */
						responsiveClass : true,
						autoHeight : false,
						autoplayTimeout : 7000,
						smartSpeed : 800,
						nav : true,
						navText : [
								'<svg xmlns="http://www.w3.org/2000/svg" width="3em" height="13em" fill="currentColor" class="bi bi-chevron-compact-left" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M9.224 1.553a.5.5 0 0 1 .223.67L6.56 8l2.888 5.776a.5.5 0 1 1-.894.448l-3-6a.5.5 0 0 1 0-.448l3-6a.5.5 0 0 1 .67-.223"/></svg>',
								'<svg xmlns="http://www.w3.org/2000/svg" width="3em" height="3em" fill="currentColor" class="bi bi-chevron-compact-right" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671"/></svg>' ],
						responsive : {
							0 : {
								items : 2
							},

							768 : {
								items : 4
							},

							992 : {
								items : 4
							},
							1200 : {
								items : 4
							},

							1300 : {
								items : 4
							}
						}
					});
	jQuery("#carousel2")
			.owlCarousel(
					{
						autoplay : false,
						rewind : false, /* use rewind if you don't want loop */
						margin : 20,
						loop : true,
						/*
						animateOut: 'fadeOut',
						animateIn: 'fadeIn',
						 */
						responsiveClass : true,
						autoHeight : false,
						autoplayTimeout : 7000,
						smartSpeed : 800,
						nav : true,
						navText : [
								'<svg xmlns="http://www.w3.org/2000/svg" width="3em" height="13em" fill="currentColor" class="bi bi-chevron-compact-left" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M9.224 1.553a.5.5 0 0 1 .223.67L6.56 8l2.888 5.776a.5.5 0 1 1-.894.448l-3-6a.5.5 0 0 1 0-.448l3-6a.5.5 0 0 1 .67-.223"/></svg>',
								'<svg xmlns="http://www.w3.org/2000/svg" width="3em" height="3em" fill="currentColor" class="bi bi-chevron-compact-right" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671"/></svg>' ],
						responsive : {
							0 : {
								items : 2
							},

							768 : {
								items : 4
							},

							992 : {
								items : 4
							},
							1200 : {
								items : 4
							},

							1300 : {
								items : 4
							}
						}
					});
</script>


</html>