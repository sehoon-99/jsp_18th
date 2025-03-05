<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!doctype html>
    <html lang="ko">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
            integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
        <title>채널 A 회원가입</title>
            <link rel="shortcut icon" href="https://www.ichannela.com/favicon.ico">

    </head>

    <body>
    <script>
		function checkForm(){
			if(!document.newMember.id.value ){
				alert("아이디를 입력해주세요.")
				return false;
			}
			if(!document.newMember.password.value ){
				alert("비밀번호를 입력해주세요.")
				return false;
			}
			if(!document.newMember.name.value ){
				alert("이름을 입력해주세요.")
				return false;
			}
			if(!document.newMember.mail1.value ){
				alert("이메일을 입력해주세요.")
				return false;
			}
			if(document.newMember.password.value != document.newMember.password_confirm.value){
				alert("비밀번호를 동일하게 입력 해 주세요.")
				return false;
			}
			// 체크박스가 체크되지 않은 경우, 경고를 띄우고 폼 제출을 막음
		    if (!document.getElementById('agreeCheckbox').checked) {
		        alert("개인정보 주의사항에 동의하셔야 합니다.");
		        return false;
		    }
			document.newMember.submit();
		}

	</script>
        <%@ include file="menu2.jsp" %>
            <div class="container-fluid">
                <form action="./processAddMember.jsp" method="post" name="newMember">
                    <div class="row">
                        <div class="offset-xl-2 col-4 mr-auto my-3">TV 홈 > <span class="font-weight-bold">회원가입</span>
                        </div>
                        <div class="col-xl-8 offset-xl-2 px-0">
                            <img src="http://image.ichannela.com/images/news/img_news_jebo.png" class="img-fluid w-100"
                                alt="">
                        </div>

                    </div>
                    <div id="info" class="row px-3">
                        <div class="col-xl-2 col-4 offset-xl-2 ">
                            <div class="row font-weight-bold ">
                                <div class="col-12 my-3 ">
                                    <p class="pl-sm-5">아이디</p>
                                </div>
                                <div class="col-12 mb-3">
                                    <p class="pl-sm-5">비밀번호</p>
                                </div>
                                <div class="col-12 mb-3">
                                    <p class="pl-sm-5">비밀번호 확인</p>
                                </div>
                                <div class="col-12 mb-3">
                                    <p class="pl-sm-5">이름</p>
                                </div>
                                <div class="col-12 mb-3">
                                    <p class="pl-sm-5">성별</p>
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
                                    <input type="text" id="id" name="id" class="bg-light w-100 form-control" placeholder="아이디" required>
                                </div>
                                <div class="col-12 mb-3 ">
                                    <input type="password" id="password" name="password"
                                        class="bg-light w-100 form-control" placeholder="비밀번호" required>
                                </div>
                                <div class="col-12 mb-3 ">
                                    <input type="password" id="password_confirm" name="password_confirm"
                                        class="bg-light w-100 form-control" placeholder="비밀번호 확인"  required>
                                </div>
                                <div class="col-12 mb-3 ">
                                    <input type="text" id="name" name="name" placeholder="이름" class="bg-light w-100 form-control"
                                        required>
                                </div>
                                <div class="col-12 mt-3 mb-2">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gender_male"
                                            value="남성" required checked> <label class="form-check-label"
                                            for="gender_male">남성</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gender_female"
                                            value="여성" required> <label class="form-check-label"
                                            for="gender_female">여성</label>
                                    </div>
                                </div>
                                <div class="col-12 mt-4 mb-3">
                                    <div id="info_birth">
                                        <select class="form-control w-25 d-inline" id="birth-year" name="birthyy">
                                            <option disabled selected>출생년도</option>
                                        </select> <select class="form-control w-25 d-inline" id="birth-month"
                                            name="birthmm">
                                            <option disabled selected>월</option>
                                        </select> <select class="form-control w-25 d-inline" id="birth-day"
                                            name="birthdd">
                                            <option disabled selected>일</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 mb-1">
                                    <div class="form-group">
                                        <input class="form-control d-inline w-50" type="text" name="mail1" id="mail1"
                                            placeholder="이메일" required />
                                        @
                                        <select class="form-control d-inline w-25" name="mail2" id="mail2">
                                            <option>naver.com</option>
                                            <option>gmail.com</option>
                                            <option>nate.com</option>
                                            <option>daum.net</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 mb-3"><input type="text" class="form-control" id="phone" name="phone"
                                        placeholder="010-1234-4567" required>
                                </div>
                                <div class="col-12 mt-1 mb-3"><input type="text" class="form-control" id="address"
                                        name="address" placeholder="주소지">
                                </div>




                            </div>


                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="row">
                        <div class="offset-xl-2 col-xl-8 col-12 my-5">
                            <h5 class="ml-4 font-weight-bold text-primary">
                                개인정보 보호를 위한 이용자 동의 사항
                            </h5>
                            <h6 class="ml-4 mb-5">자세한 내용은 사이트 하단 '개인정보 보호방침'을 확인하시기 바랍니다.</h6>
                            <h6 class="ml-4 font-weight-bold">
                                <span class="text-primary">1.</span> 개인정보의 수집·이용 항목
                            </h6>
                            <h6 class="ml-4 mb-5">
                                <small>회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다. <br>
                                    [서비스 안내 및 제보 내용에 관한 확인 및 처리 등의 업무 진행]</small>
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
                            <p class="p-3 mr-1">개인정보 제공에 동의하시겠습니까? <input type="checkbox" id="agreeCheckbox" required>동의함</p>
                        </div>
                        <div class="col-12 text-center">
                            <input type="button" class="btn btn-primary w-25 p-3 " value="회원가입" onclick="checkForm()"></input>
                        </div>
                    </div>
                </form>
            </div>


            <%@ include file="footer.jsp" %>

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

        @media (max-width: 1200px) {
            body .line {
                width: 100%;
                left: 0%;
            }
        }
    </style>


    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
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
<script type="text/javascript">
if(document.newMember.password.value != document.newMember.password_confirm.value){
	alert("비밀번호를 동일하게 입력 해 주세요.")
	return false;
}
</script>


    </html>