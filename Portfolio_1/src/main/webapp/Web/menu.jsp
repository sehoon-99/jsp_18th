<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>menu</title>

</head>

<body>
	<div id="main_nav" class="container-fluid offset-xl-2 offset-xl-1 px-0">
		<nav class="navbar navbar-expand-lg navbar-light px-0 mt-2">
			<a class="navbar-brand mt-n3" href="index.jsp"> <img
				src="http://image.ichannela.com/images/common/logo_rebrand.png"
				width="180" height="auto" class="img-fluid ml-3" alt="">
			</a>
			<button class="navbar-toggler mr-3" type="button"
				data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse bg-white rounded-bottom"
				id="navbarSupportedContent">
				<div class="row">
					<div class="mr-5"></div>
					<ul class="navbar-nav">
						<li class="ml-1 nav-item"><p
								class="nav-link h5 font-weight-bold pt-3">온에어</p></li>
						<li class="ml-1 nav-item"><p
								class="nav-link h5 font-weight-bold pt-3">뉴스</p></li>
						<li class="ml-1 nav-item"><p
								class="nav-link h5 font-weight-bold pt-3">방송</p></li>

						<c:choose>
							<c:when test="${sessionId eq 'admin'}">
								<li class="ml-1 nav-item"><a
									class="nav-link h5 font-weight-bold pt-3" href="addNews.jsp">뉴스
										등록</a></li>
							</c:when>
						</c:choose>
						<li class="d-md-none d-lg-none d-xl-none d-block ml-1 nav-item"><a
							class="nav-link h5 font-weight-bold pt-3" href="addReport.jsp">제보</a></li>
						<li class="d-md-none d-lg-none d-xl-none d-block ml-1 nav-item"><a
							class="nav-link h5 font-weight-bold pt-3" href="Reports.jsp">게시판</a></li>
					</ul>
				</div>

				<div class="d-inline my-2 ml-auto">
					<ul class="navbar-nav ml-4 mr-auto">
						<c:choose>
							<c:when test="${empty sessionId }">
								<li class="nav-item "><a
									class="nav-link p font-weight pt-3 ml-1" data-toggle="modal"
									data-target="#login" href="#">로그인 </a></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item "><a
									class="nav-link p font-weight pt-3 ml-1" href="#"
									onclick="logout()">로그아웃 </a></li>
								<li class="nav-item "><a
									class="nav-link p font-weight pt-3 ml-1"
									href="updateMember.jsp">내 정보 </a></li>
							</c:otherwise>
						</c:choose>
						<div id="search" class="dropleft ml-1 mt-2">
							<button class="btn" type="button" data-toggle="dropdown"
								aria-expanded="false">
								<svg xmlns="http://www.w3.org/2000/svg" width="15" height="16"
									fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                <path
										d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
                            </svg>
							</button>

							<div class="dropdown-menu">
								<form action="searchNews.jsp" class="form-inline">
									<input class="form-control ml-1" name='search'
										placeholder="뉴스 검색" type="search" aria-label="Search">
									<button class="btn btn-primary" type="submit">검색</button>
								</form>

							</div>
						</div>

					</ul>
				</div>

				<div class="offset-xl-4 offset-xl-2">
					<div class="col mx-4 d-none d-xl-block d-lg-block"></div>
				</div>
			</div>

		</nav>
	</div>


	<div class="modal fade" id="login" tabindex="-1"
		aria-labelledby="login" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="login">회원 로그인</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./processLoginMember.jsp">
						<div class="form-group">
							<label for="id" class="col-form-label">아이디</label> <input
								type="text" class="form-control" id="id" name="id" required>
						</div>
						<div class="form-group">
							<label for="password" class="col-form-label">비밀번호:</label> <input
								type="password" class="form-control" id="password"
								name="password" required>
						</div>
						<input type="submit" class="btn btn-info" value="로그인">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<a class="btn btn-info" href="./addMember.jsp">회원가입</a>
				</div>
			</div>
		</div>
	</div>
	</div>
	<hr class="m-0 p-0" />
	<div class="container-fluid mb-2">
		<div class="row mt-2" id="second-menu">
			<div class="col-1 d-block d-md-none d-lg-none d-xl-none"></div>
			<div class="col-1 d-none d-sm-block d-md-none d-lg-none d-xl-none"></div>
			<nav class="offset-xl-2 offset-xl-1 nav mr-auto">
					<a class="nav-link" href="index.jsp">뉴스홈</a> <a
						class="nav-link ml-n3" href="./news.jsp?title=정치">분야별 뉴스</a> <a
						class="nav-link ml-n3" href="./new.jsp">최신뉴스</a>
			</nav>
			<nav id="community" class="nav ml-auto ">
				<a
					class="d-none d-xl-block d-lg-block d-md-block nav-link border mr-2"
					href="addReport.jsp">제보</a> <a
					class="d-none d-xl-block d-lg-block d-md-block nav-link border mr-1"
					href="Reports.jsp">게시판</a>
			</nav>
			<div
				class="offset-xl-1 offset-xl-1 mr-5 d-xl-block d-lg-block d-md-none ">
				<div class="col mx-5 d-none d-xl-block"></div>
			</div>
		</div>
	</div>
</body>
<style>
.navbar {
	height: 120px;
	/* navbar 높이 설정 */
}

#second-menu {
	font-weight: 700;
}

#second-menu a {
	color: black;
	text-decoration: none;
}

#second-menu a:hover {
	color: #196EFF;
}

#community a {
	font-size: 0.80em;
	border-radius: 20px;
	font-weight: 500;
}

#navbarSupportedContent {
	z-index: 99;
}

#search .dropdown-menu {
	width: 285px !important;
	top: -10px !important;
}

@media ( max-width : 768px) {
	#community {
		display: none;
	}
	#second-menu {
		margin-left: 20% !important;
	}
}
</style>
<script type="text/javascript">
	function logout() {
		// 로그아웃 여부 확인
		var userConfirmed = confirm("정말로 로그아웃 하시겠습니까?");

		// 사용자가 'OK'를 클릭한 경우
		if (userConfirmed) {
			// 로그아웃을 수행하는 코드 (예: 로그아웃 페이지로 이동)
			window.location.href = "./logoutMember.jsp"; // 로그아웃 처리 페이지로 리디렉션
		} else {
			// 사용자가 'Cancel'을 클릭한 경우 (아무 일도 하지 않음)
			alert("로그아웃이 취소되었습니다.");
		}
	}
</script>


<!-- Optional JavaScript; choose one of the two! -->

<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->



</html>