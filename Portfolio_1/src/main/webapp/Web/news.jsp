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
<title>채널 A 분야별뉴스</title>
    <link rel="shortcut icon" href="https://www.ichannela.com/favicon.ico">
</head>

<body>
	<%@ include file="menu.jsp"%>
	<%
	String title = request.getParameter("title");
	String admin = request.getParameter("admin");

	%>
	<div class="container-fluid bg-primary p-2">
		<ul class="nav nav-pills justify-content-center">
			<li class="nav-item"><a class="nav-link text-white "
				href="index.jsp">전체기사</a></li>
			<li class="nav-item"><a
				class="nav-link <%=(title != null && title.equals("정치")) ? "active" : ""%> text-white"
				href="news.jsp?title=정치">정치</a></li>
			<li class="nav-item"><a
				class="nav-link <%=(title != null && title.equals("사회")) ? "active" : ""%> text-white"
				href="news.jsp?title=사회">사회</a></li>
			<li class="nav-item"><a
				class="nav-link <%=(title != null && title.equals("경제")) ? "active" : ""%> text-white"
				href="news.jsp?title=경제">경제</a></li>
			<li class="nav-item"><a
				class="nav-link <%=(title != null && title.equals("생활문화")) ? "active" : ""%> text-white"
				href="news.jsp?title=생활문화">생활문화</a></li>
			<li class="nav-item"><a
				class="nav-link <%=(title != null && title.equals("국제")) ? "active" : ""%> text-white"
				href="news.jsp?title=국제">국제</a></li>
			<li class="nav-item"><a
				class="nav-link <%=(title != null && title.equals("스포츠")) ? "active" : ""%> text-white"
				href="news.jsp?title=스포츠">스포츠</a></li>
			<li class="nav-item"><a class="nav-link text-white "
				href="new.jsp">최신</a></li>
		</ul>
	</div>

	<div class="container-fluid px-0 mb-4">
		<br>
		<div class="row">
			<div class="col-xl-8 offset-xl-2 px-0">
				<p class="title text-white"><%=title%></p>
				<img
					src="http://image.ichannela.com/images/news/newspart_top_n01.png"
					class="rounded img-fluid w-100" alt="">
			</div>
		</div>




		<div class="row p-3">
			<sql:setDataSource var="dataSource"
				url="jdbc:oracle:thin:@localhost:1521:xe"
				driver="oracle.jdbc.driver.OracleDriver" user="C##dbexam"
				password="m1234" />
			<sql:query var="rs" dataSource="${dataSource }">
                select * from newsDB where Category='<%=title%>' order by updatetime desc
            </sql:query>

			<c:forEach var="row" items="${rs.rows }" varStatus="status">
				<!-- Use c:if to check the index and hide items after 5 -->
				<div class="col-12 offset-xl-2 col-xl-8 news-item"
					<c:if test="${status.index >= 5}">
                         style="display:none;"
                     </c:if> onclick="newsView(${row.id}, '${row.category}')">

						<div class="card mt-3 p-2">
							<div class="row no-gutters">
								<div class="col-md-4">
									<img class="rounded-lg img-fluid w-100" src="../resources/images/${row.img }"
										alt="..." >
								</div>
								<div class="col-md-8">
									<div class="card-body" >
										<h3 class="card-title">${row.title }</h3>	
										<hr>
										<p class="card-text text-dark pr-5 text-truncate" >${row.text }</p>
										<div class="row">
											<div class="col-6 mt-1">
												<h5 class="card-text text-light mt-5">
													<small class="text-muted">${row.updatetime }</small>
												</h5>
											</div>
									
											<div class="col-6 float-right">
												<svg xmlns="http://www.w3.org/2000/svg" height="50px"
															viewBox="0 -960 960 960"
															class="text-primary float-right pl-1 mt-4 mr-3 arrow border rounded-circle"
															width="50px" fill="#196EFF">
                                                    <path
																d="M504-480 320-664l56-56 240 240-240 240-56-56 184-184Z" />
                                                </svg>
											</div>

										</div>
									</div>
								
								</div>
								
							</div>
						</div>

				</div>
			</c:forEach>
			
			<div class="col-12 my-4 text-center NewsAddBtn">
				<button class="btn btn-outline-primary more-btn"
					onclick="showMore()">더보기</button>
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

.title {
	position: absolute;
	font-size: 2.5vw;
	left: 3%;
	top: 20%;
}
.card{
	cursor:pointer;
}

.card:hover .arrow {
	border-color: #196EFF !important;
}

.card:hover{
	box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15) !important;
}
.card img {
	height: 230px;
	object-fit: cover;
}
/* fix blank or flashing items on carousel */

.adminBtn_del{
	z-index: 9999 !important;
}
.adminBtn_up{
	z-index: 9999 !important;
}
@media ( max-width : 1200px) {
	.title {
		position: absolute;
		font-size: 3.5vw;
		left: 3%;
		top: 27%;
	}
	.card img {
	height: 100%;
	object-fit: cover;
	}
}

@media ( max-width : 992px) {
	.title {
		position: absolute;
		font-size: 3.5vw;
		left: 3%;
		top: 25%;
	}
	.card img {
	height: 100%;
	object-fit: cover;
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
let visibleCount = 5; // 처음에 5개의 아이템만 보이도록 설정

function showMore() {
    var items = document.querySelectorAll('.news-item');
    var hiddenItems = [];

    // 숨겨진 아이템들을 찾음
    items.forEach(function (item, index) {
        if (item.style.display === "none" && index < visibleCount + 5) {
            hiddenItems.push(item);
        }
    });

    // 숨겨진 아이템 중 5개를 보이게 함
    for (var i = 0; i < 5 && i < hiddenItems.length; i++) {
        hiddenItems[i].style.display = "block";
    }

    // visibleCount를 5개씩 증가시켜서 다음 배치를 보이게 함
    visibleCount += 5;

    // 더 이상 숨겨진 아이템이 없으면 "더보기" 버튼을 숨김
    var remainingItems = document.querySelectorAll('.news-item');
    var hiddenItemCount = Array.from(remainingItems).filter(function(item) {
        return item.style.display === "none";
    }).length;

    // 더 이상 숨겨진 항목이 없으면 더보기 버튼 숨김
    if (hiddenItemCount === 0) {
        document.querySelector(".NewsAddBtn").style.display = "none";
    }
}

// 페이지 로딩 시 초기 5개 아이템만 보이게 하고, 나머지는 숨김
document.addEventListener('DOMContentLoaded', function () {
    var articles = document.querySelectorAll('.news-item');
    if (articles.length <= 5) {
        document.querySelector(".NewsAddBtn").style.display = "none";  // 아이템이 5개 이하이면 더보기 버튼 숨김
    }

    // 처음에 5개를 제외한 뉴스 아이템을 숨김
    var items = document.querySelectorAll('.news-item');
    for (let i = 5; i < items.length; i++) {
        items[i].style.display = 'none';
    }
});
	
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
	}
	function newsView(id, title) {
		window.location.href = 'newsView.jsp?id='+ id +'&title=' + title;
	}


	
	
</script>


</html>