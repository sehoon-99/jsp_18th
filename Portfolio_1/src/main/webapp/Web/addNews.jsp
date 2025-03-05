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
<title>뉴스 등록</title>
    <link rel="shortcut icon" href="https://www.ichannela.com/favicon.ico">

</head>

<body>
	<%@ include file="menu2.jsp"%>
	<div class="container-fluid">
		<form action="./processAddNews.jsp" method="post"
			enctype="multipart/form-data" name="newReport">
			<div class="row">
				<div class="offset-xl-2 col-4 mr-auto my-3">
					TV 홈 > 뉴스 > <span class="font-weight-bold">등록</span>
				</div>
				<div class="col-xl-8 offset-xl-2 p-0 mb-3">
					<p class="title text-white">뉴스 등록</p>
					<img
						src="http://image.ichannela.com/images/news/newspart_top_n01.png"
						class="rounded img-fluid w-100" alt="">
				</div>
			</div>
			<div id="info" class="row px-3">
				<div class="col-xl-2 col-4 offset-xl-2 ">
					<div class="row font-weight-bold ">
						<div class="col-12 my-3">
							<p class="pl-5">제목</p>
						</div>
						<div class="col-12 mb-3">
							<p class="pl-5">내용</p>
						</div>
						<div class="col-12 mt-4 mb-5"></div>
						<div class="col-12 mt-4 mb-4">
							<p class="pl-5">이미지</p>
						</div>
						<div class="col-12 mt-2 mb-3">
							<p class="pl-5">카테고리</p>
						</div>
					</div>
				</div>
				<div class="col-xl-5 col-8 ">

					<div class="row">
						<div class="col-12 mt-3 mb-2">
							<input type="text" id="title" name="title"
								class="bg-light w-100 form-control" placeholder="제목을 입력해주세요." required>
						</div>
						<div class="col-12 mb-3 mt-2 ">
							<textarea class="form-control bg-light"
								aria-label="With textarea" id="text" name="text"
								rows="5" placeholder="내용을 입력해주세요." required></textarea>
						</div>
						<div class="col-12 mt-1 mb-3">
							<input type="file" accept = "image/*"  id="img" name="img" class="bg-light w-100" required>
						</div>
						<div class="col-12 mt-4 mb-2 input-group">
							<label for="category" class="form-label"></label> 
							<select id="category custom-select" name="category" class="form-select" required>
								<option disabled selected>카테고리를 선택하세요</option>
								<option value="정치">정치</option>
								<option value="사회">사회</option>
								<option value="경제">경제</option>
								<option value="생활문화">생활문화</option>
								<option value="국제">국제</option>
								<option value="스포츠">스포츠</option>
							</select>
						</div>

					</div>


				</div>
			</div>
			<div class="line"></div>
<div class="row">
    <div class="offset-xl-2 col-xl-8 col-12 my-5">
        <h5 class="ml-4 font-weight-bold text-primary">주의사항</h5>
        <h6 class="ml-4 mb-5">기사를 작성하기 전에 다음 사항들을 숙지하시고, 신중히 게시해 주세요.</h6>
        <h6 class="ml-4 font-weight-bold">
            <span class="text-primary">1.</span> 기사 내용의 정확성
        </h6>
        <h6 class="ml-4 mb-5">
            <small>기사는 사실에 기반하여 작성되어야 하며, 허위 정보나 부정확한 내용은 포함되어서는 안 됩니다.</small>
        </h6>
        <h6 class="ml-4 font-weight-bold">
            <span class="text-primary">2.</span> 타인의 권리 침해 금지
        </h6>
        <h6 class="ml-4 mb-5">
            <small>기사에 포함된 모든 내용은 타인의 저작권, 초상권, 명예훼손 등의 권리를 침해하지 않도록 주의해야 합니다.</small>
        </h6>
        <h6 class="ml-4 font-weight-bold">
            <span class="text-primary">3.</span> 객관성 유지
        </h6>
        <h6 class="ml-4 mb-5">
            <small>기사는 중립적인 시각을 유지하고, 개인적인 의견을 포함하지 않도록 해야 합니다.</small>
        </h6>
        <h6 class="ml-4 font-weight-bold">
            <span class="text-primary">4.</span> 게시 전 최종 확인
        </h6>
        <h6 class="ml-4 mb-3">
            <small>기사를 게시하기 전에 철저한 검토를 거쳐 오탈자나 문법 오류, 내용 상의 불일치 등이 없는지 다시 한번 확인해야 합니다.</small>
        </h6>
    </div>
</div>
<div class="line"></div>
			<div class="row py-5">
				<div class="col-12 text-center">
					<p class="p-3 mr-1">
						위의 내용들을 모두 숙지하였습니다. <input type="checkbox" required>
					</p>
				</div>
				<div class="col-12 text-center">
					 <input type="submit" class="btn btn-primary w-25 p-3" value="등록하기">
				</div>
			</div>
		</form>
	</div>


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

.title {
	position: absolute;
	font-size: 2.5vw;
	left: 3%;
	top: 20%;
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

@media ( max-width : 1200px) {
	.title {
		position: absolute;
		font-size: 3.5vw;
		left: 3%;
		top: 27%;
	}
}

@media ( max-width : 992px) {
	.title {
		position: absolute;
		font-size: 3.5vw;
		left: 3%;
		top: 25%;
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
<script type="text/javascript">
    function addNews() {
        // 제목, 내용, 이미지, 카테고리 입력 값 체크
        var title = document.getElementById('title').value;
        var text = document.getElementById('text').value;
        var img = document.getElementById('img').value;
        var category = document.getElementById('category').value;

        // 빈 값 체크
        if (title === "" || text === "" || img === "" || category === "") {
            alert("모든 필드를 작성해 주세요.");
            return false;  // 폼 제출을 중지
        }

        // 모든 항목이 올바르게 작성되었을 경우, 확인 창 표시
        if (confirm('정말로 기사를 게시하시겠습니까?')) {
            // 폼 제출
            document.newReport.submit();
        }
    }
</script>


</html>