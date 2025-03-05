<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
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
<title>채널 A 회원정보</title>
<link rel="shortcut icon" href="https://www.ichannela.com/favicon.ico">

</head>

<body>
<script>
		function checkForm(){
			if(!document.updateMember.id.value ){
				alert("아이디를 입력해주세요.")
				return false;
			}
			if(!document.updateMember.password.value ){
				alert("비밀번호를 입력해주세요.")
				return false;
			}
			if(!document.updateMember.name.value ){
				alert("이름을 입력해주세요.")
				return false;
			}
			if(!document.updateMember.mail1.value ){
				alert("이메일을 입력해주세요.")
				return false;
			}
			if(document.updateMember.password.value != document.updateMember.password_confirm.value){
				alert("비밀번호를 동일하게 입력 해 주세요.")
				return false;
			}
			// 체크박스가 체크되지 않은 경우, 경고를 띄우고 폼 제출을 막음
		    if (!document.getElementById('agreeCheckbox').checked) {
		        alert("개인정보 수정에 동의하셔야 합니다.");
		        return false;
		    }
			document.updateMember.submit();
		}

	</script>
	<%@ include file="menu2.jsp"%>
	<%
	String sessionId = (String) session.getAttribute("sessionId");
	%>
	<sql:setDataSource var="dataSource"
		url="jdbc:oracle:thin:@localhost:1521:xe"
		driver="oracle.jdbc.driver.OracleDriver" user="C##dbexam"
		password="m1234" />
	<sql:query var="rs" dataSource="${dataSource}">
	select * from p_memberDB where id=?
	<sql:param value="<%=sessionId%>" />
	</sql:query>
	<c:forEach var="row" items="${rs.rows }">
		<c:set value="${row.mail }" var="mail" />
		<c:set value="${mail.split('@')[0] }" var="mail1" />
		<c:set value="${mail.split('@')[1] }" var="mail2" />
		<c:set value="${row.birth }" var="birth" />
		<c:set value="${birth.split('-')[0] }" var="year" />
		<c:set value="${birth.split('-')[1] }" var="month" />
		<c:set value="${birth.split('-')[2] }" var="day" />

		<div class="container-fluid">
			<form action="./processUpdateMember.jsp" method="post" name="updateMember">
				<div class="row">
					<div class="offset-xl-2 col-4 mr-auto my-3">
						TV 홈 > <span class="font-weight-bold">회원정보</span>
					</div>
					<div class="col-xl-8 offset-xl-2 px-0">
						<img
							src="http://image.ichannela.com/images/news/img_news_jebo.png"
							class="img-fluid w-100" alt="">
					</div>

				</div>
				<div id="info" class="row px-3">
					<div class="col-xl-2 col-4 offset-xl-2 ">
						<div class="row font-weight-bold ">
							<div class="col-12 my-3 ">
								<p class="pl-sm-5">아이디</p>
							</div>
							<div class="col-12 mb-3">
								<p class="pl-sm-5">비밀번호 수정</p>
							</div>
							<div class="col-12 mb-3">
								<p class="pl-sm-5">비밀번호 수정 확인</p>
							</div>
							<div class="col-12 mb-3">
								<p class="pl-sm-5">이름</p>
							</div>
							<div class="col-12 mb-3">
								<p class="pl-sm-5">생년월일</p>
							</div>
							<div class="col-12 mb-3">
								<p class="pl-sm-5">이메일</p>
							</div>
							<div class="col-12 mb-3">
								<p class="pl-sm-5">연락처</p>
							</div>
							<div class="col-12 mb-3">
								<p class="pl-sm-5">주소</p>
							</div>




						</div>
					</div>
					<div class="col-xl-5 col-8">

						<div class="row">
							<div class="col-12 my-3 ">
								<input type="text" id="id" name="id"
									class="bg-light w-100 form-control" placeholder="아이디"
									value="${row.id }" readonly required>
							</div>
							<div class="col-12 mb-3 ">
								<input type="password" id="password" name="password"
									class="bg-light w-100 form-control" placeholder="비밀번호"
									 required>
							</div>
							<div class="col-12 mb-3 ">
								<input type="password" id="password_confirm"
									name="password_confirm" class="bg-light w-100 form-control"
									placeholder="비밀번호 확인" required>
							</div>
							<div class="col-12 mb-2 ">
								<input type="text" id="name" name="name" placeholder="이름"
									value="${row.name }" readonly class="bg-light w-100 form-control"
									required>
							</div>
							<div class="col-12 mt-3 mb-3">
								<div id="info_birth">
									<select class="form-control w-25 d-inline" id="birth-year"
										name="birthyy">
										<option selected>${year}</option>
									</select> <select class="form-control w-25 d-inline" id="birth-month"
										name="birthmm">
										<option selected>${month}</option>
									</select> <select class="form-control w-25 d-inline" id="birth-day"
										name="birthdd">
										<option selected>${day}</option>
									</select>
								</div>
							</div>
							<div class="col-12 mt-1 mb-1">
								<div class="form-group">
									<input class="form-control d-inline w-50" type="text"
										name="mail1" id="mail1" placeholder="이메일" value="${mail1 }"
										required /> @ <select class="form-control d-inline w-25"
										name="mail2" id="mail2">
										<option selected>${mail2}</option>
										<c:if test="${mail2 ne 'naver.com' }">
											<option>naver.com</option>
										</c:if>
										<c:if test="${mail2 ne 'gmail.com' }">
											<option>gmail.com</option>
										</c:if>
										<c:if test="${mail2 ne 'nate.com' }">
											<option>nate.com</option>
										</c:if>
										<c:if test="${mail2 ne 'daum.net' }">
											<option>daum.net</option>
										</c:if>
									</select>
								</div>
							</div>
							<div class="col-12 mb-3">
								<input type="text" class="form-control" id="phone" name="phone"
									placeholder="010-1234-4567" value="${row.phone }" required>
							</div>
							<div class="col-12 mt-1 mb-3">
								<input type="text" class="form-control" id="address"
									name="address" value="${row.address }" placeholder="주소지">
							</div>




						</div>


					</div>
				</div>
				<div class="line"></div>
				<div class="row py-5">
					<div class="col-12 text-center">
						<p class="p-3 mr-1">
							개인정보를 수정에 하시겠습니까? <input type="checkbox" id="agreeCheckbox" required>동의함
						</p>
					</div>
					<div class="col-12 text-center">
						<input type="button"  class="btn btn-primary w-25 p-3 "
							value="수정하기" onclick="checkForm()"></input>
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
<script>
	//출생년도 셀렉트 박스 option 목록 동적 생성

	const birthYearEl = document.querySelector('#birth-year')
	//옵션 목록 생성여부 확인
	isYearOptionExisted = false
	birthYearEl.addEventListener('focus', function() {
		if (!isYearOptionExisted) {
			isYearOptionExisted = true
			for (let i = 1900; i < 2026; i++) {
				const YearOption = document.createElement('option')
				YearOption.setAttribute('value', i)
				YearOption.innerText = i
				this.appendChild(YearOption)
			}
		}
	})

	//출생월 셀렉트 박스 option 목록 동적 생성

	const birthMonthEl = document.querySelector('#birth-month')
	//옵션 목록 생성여부 확인
	isMonthOptionExisted = false
	birthMonthEl.addEventListener('focus', function() {
		if (!isMonthOptionExisted) {
			isMonthOptionExisted = true
			for (let i = 1; i < 13; i++) {
				const MonthOption = document.createElement('option')
				if (i < 10) {
					MonthOption.setAttribute('value', '0' + i)
					MonthOption.innerText = '0' + i
				} else {
					MonthOption.setAttribute('value', i)
					MonthOption.innerText = i
				}
				this.appendChild(MonthOption)
			}
		}
	})

	//출생일 셀렉트 박스 option 목록 동적 생성

	const birthDayEl = document.querySelector('#birth-day')
	//옵션 목록 생성여부 확인
	isDayOptionExisted = false
	birthDayEl.addEventListener('focus', function() {
		if (!isDayOptionExisted) {
			isDayOptionExisted = true
			for (let i = 1; i < 32; i++) {
				const DayOption = document.createElement('option')
				if (i < 10) {
					DayOption.setAttribute('value', '0' + i)
					DayOption.innerText = '0' + i
				} else {
					DayOption.setAttribute('value', i)
					DayOption.innerText = i
				}
				this.appendChild(DayOption)
			}
		}
	})
</script>



</html>