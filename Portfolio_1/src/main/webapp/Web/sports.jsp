<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!doctype html>
    <html lang="ko">
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <title>sports</title>

    </head>

    <body>
        <%@ include file="menu.jsp" %>
        
            <div class="container-fluid bg-primary p-2">
                <ul class="nav nav-pills justify-content-center ">
                    <li class="nav-item">
                        <a class="nav-link text-white " href="index.jsp">전체기사</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white " href="politics.jsp">정치</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link text-white " href="social.jsp">사회</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white " href="economy.jsp">경제</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white " href="culture.jsp">생활문화</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white " href="international.jsp">국제</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active text-white " href="sports.jsp">스포츠</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white " href="new.jsp">최신</a>
                    </li>
                </ul>
            </div>
            <div class="container-fluid px-0 mb-4">
                <br>
                <div class="row">
                    <div class="col-xl-8 offset-xl-2 px-0">
                        <p class="title text-white">스포츠</p>
                        <img src="http://image.ichannela.com/images/news/newspart_top_n01.png"
                            class="rounded img-fluid w-100" alt="">
                    </div>
                </div>


                <div class="row p-3">
                
               <sql:setDataSource var="dataSource" url="jdbc:oracle:thin:@localhost:1521:xe" 
				driver="oracle.jdbc.driver.OracleDriver"
				user="C##dbexam"
				password="m1234"
				/>
                
                <sql:query var="rs" dataSource="${dataSource }">
                	select * from newsDB where Category='스포츠' order by updatetime desc
                </sql:query>
                
                <c:forEach var="row" items="${rs.rows }">
                
        		 
        		 <div class="col-12 offset-xl-2  col-xl-8 ">
                        <a class="text-decoration-none text-body" href="">
                            <div class="card mt-3 p-2">
                                <div class="row no-gutters">
                                    <div class="col-md-4">
                                        <img class="rounded-lg img-fluid w-100"
                                            src="${row.img }"
                                            alt="...">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h3 class="card-title">
                                                ${row.title }</h3>
                                            <hr>
                                            <p class="card-text text-dark pr-5">
                                               ${row.text }</p>
                                            <div class="row">
                                                <div class="col-8">
                                                    <h5 class="card-text text-light mt-5"><small
                                                            class="text-muted">${row.updatetime }</small></h5>
                                                </div>
                                                <div class="col-4 ">
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
                        </a>
                    </div>
                    
                </c:forEach>
                    <div class="col-12 offset-xl-2  col-xl-8 ">
                        <a class="text-decoration-none text-body" href="">
                            <div class="card mt-3 p-2">
                                <div class="row no-gutters">
                                    <div class="col-md-4">
                                        <img class="rounded-lg img-fluid w-100"
                                            src="http://image.ichannela.com/images/channela/2025/02/06/000002671761/00000267176120250206113925164.jpg"
                                            alt="...">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h3 class="card-title">
                                                손흥민의 토트넘, 내일 새벽 리그컵 결승행 도전</h3>
                                            <hr>
                                            <p class="card-text text-dark pr-5">
                                                사진=뉴시스/AP 영국 무대에서 뛰며 이른바 '월드 클래스'로 성장한 손흥민이 내일 새벽 리그컵(카라바오컵) 대회 결승행을
                                                결정지을 승부에 나섭니다.손흥민이 주장 완장을 찬 토트넘은 한국 시각으로 내일 새벽 5시 영국 리버풀의 안필드에서
                                                2024-2025 잉글랜드 리그컵 준결승 2차전 원정 경기를 치릅니다.</p>
                                            <div class="row">
                                                <div class="col-8">
                                                    <h5 class="card-text text-light mt-5"><small
                                                            class="text-muted">2025-02-05 16:36:36</small></h5>
                                                </div>
                                                <div class="col-4 ">
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
                        </a>
                    </div>
                    <div class="col-12 offset-xl-2  col-xl-8 ">
                        <a class="text-decoration-none text-body" href="">
                            <div class="card mt-3 p-2">
                                <div class="row no-gutters">
                                    <div class="col-md-4">
                                        <img class="rounded-lg img-fluid w-100"
                                            src="http://image.ichannela.com/images/channela/2025/02/05/000002671139/00000267113920250205150700351.jpg"
                                            alt="...">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h3 class="card-title">
                                                감독들에 K리그 우승 후보 물었더니…“울산과 서울”</h3>
                                            <hr>
                                            <p class="card-text text-dark pr-5">2024-25 ACL 참가 K리그 4개팀 미디어데이 (사진=뉴스1)
                                                프로축구 K리그1 감독들이 울산HD와 FC서울 두 팀을 2025시즌 우승 후보로 꼽았습니다.오늘 서울 종로구 축구회관에서 열린
                                                미디어데이에서 사령탑들은 새 시즌 경쟁 구도를 예상해보라는 질문에 '울산과 서울의 2강 구도'가 펼쳐질 거라 답했습니다.</p>
                                            <div class="row">
                                                <div class="col-8">
                                                    <h5 class="card-text text-light mt-5"><small
                                                            class="text-muted">2025-02-05 15:59:23</small></h5>
                                                </div>
                                                <div class="col-4 ">
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
                        </a>
                    </div>
                    <div class="col-12 offset-xl-2  col-xl-8 ">
                        <a class="text-decoration-none text-body" href="">
                            <div class="card mt-3 p-2">
                                <div class="row no-gutters">
                                    <div class="col-md-4">
                                        <img class="rounded-lg img-fluid w-100"
                                            src=http://image.ichannela.com/images/channela/2025/02/04/000002670255/00000267025520250204160649714.jpg
                                            alt=" ...">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h3 class="card-title">
                                                동계아시안게임 대표단 본진 하얼빈으로</h3>
                                            <hr>
                                            <p class="card-text text-dark pr-5">동계아시안게임 대표단 본진이 4일 오전 인천국제공항에서 출국 전
                                                기념촬영을 하고 있다. (뉴스1) 동계 아시안게임에 출전하는 대표단 본진이 대회가 열리는 중국 하얼빈에 입성했습니다.</p>
                                            <div class="row">
                                                <div class="col-8">
                                                    <h5 class="card-text text-light mt-5"><small
                                                            class="text-muted">2025-02-05 15:19:42</small></h5>
                                                </div>
                                                <div class="col-4 ">
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
                        </a>
                    </div>
                    <div class="col-12 offset-xl-2  col-xl-8 ">
                        <a class="text-decoration-none text-body" href="">
                            <div class="card mt-3 p-2">
                                <div class="row no-gutters">
                                    <div class="col-md-4">
                                        <img class="rounded-lg img-fluid w-100"
                                            src="http://image.ichannela.com/images/channela/2025/02/04/000002670234/00000267023420250204160304639.jpg"
                                            alt="...">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h3 class="card-title">
                                                탬파베이 김하성 “월드시리즈 우승 목표…이르면 4월 말 복귀”</h3>
                                            <hr>
                                            <p class="card-text text-dark pr-5">
                                                탬파베이 홈페이지 캡처미국프로야구 메이저리그 탬파베이 레이스로 이적한 김하성이 기자회견에서 월드시리즈 우승이라는 목표를
                                                밝혔습니다.김하성은 탬파베이와의 계약 발표 이후 진행된 원격 기자회견에서 “팀에 합류해 정말 기대된다. 부상에도 구단이 좋은
                                                계약을 해줘서 고맙다”고 말했습니다.
                                            </p>
                                            <div class="row">
                                                <div class="col-8">
                                                    <h5 class="card-text text-light mt-5"><small
                                                            class="text-muted">2025-02-05 14:41:24</small></h5>
                                                </div>
                                                <div class="col-4 ">
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
                        </a>
                    </div>
                    <div class="col-12 offset-xl-2  col-xl-8 ">
                        <a class="text-decoration-none text-body" href="">
                            <div class="card mt-3 p-2">
                                <div class="row no-gutters">
                                    <div class="col-md-4">
                                        <img class="rounded-lg img-fluid w-100"
                                            src=http://image.ichannela.com/images/channela/2025/02/03/000002669694/00000266969420250203195756588.jpg
                                            alt="...">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h3 class="card-title">
                                                또 코너킥 마술…원맨쇼 보여준 ‘SON’</h3>
                                            <hr>
                                            <p class="card-text text-dark pr-5">[앵커]손흥민이 또한번 벼랑 끝에 몰린 팀을 구해냈습니다. 그림같은
                                                코너킥이 상대팀의 자책골로 이어지는 장면 함께 보시죠. 김호영 기자입니다. [기자]토트넘의 해결사는 손흥민이었습니다. 전반 28분
                                                날카롭게 코너킥을 올렸는데 그대로 골라인을 넘어간 겁니다. </p>
                                            <div class="row">
                                                <div class="col-8">
                                                    <h5 class="card-text text-light mt-5"><small
                                                            class="text-muted">2025-02-05 14:13:02</small></h5>
                                                </div>
                                                <div class="col-4 ">
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
                        </a>
                    </div>
                    <div class="col-12 offset-xl-2  col-xl-8 ">
                        <a class="text-decoration-none text-body" href="">
                            <div class="card mt-3 p-2">
                                <div class="row no-gutters">
                                    <div class="col-md-4">
                                        <img class="rounded-lg img-fluid w-100"
                                            src=http://image.ichannela.com/images/channela/2025/02/02/000002668852/00000266885220250202194533888.jpeg
                                            alt="...">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h3 class="card-title">
                                                토트넘 왜 안 썼지?…양민혁, 강렬한 QPR 데뷔전</h3>
                                            <hr>
                                            <p class="card-text text-dark pr-5">
                                                토트넘 왜 안 썼지?…양민혁, 강렬한 QPR 데뷔전
                                                [앵커]잉글랜드 프로축구 토트넘에 합류하고도 한번도 경기에 투입되지 못 했던 양민혁 선수가 드디어 데뷔전을 치렀습니다. 지난달
                                                임대 영입된 퀸즈 파크 레인저스 소속으로 그라운드를 밟았는데, 깜짝 활약을 선보였습니다. 김호영 기자입니다.
                                            </p>
                                            <div class="row">
                                                <div class="col-8">
                                                    <h5 class="card-text text-light mt-5"><small
                                                            class="text-muted">2025-02-05 12:47:32</small></h5>
                                                </div>
                                                <div class="col-4 ">
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
                        </a>
                    </div>
                    <div class="col-12 my-4 text-center NewsAddBtn"><button class="btn btn-outline-primary more-btn">더보기</button>
                    </div>
                    <div class="col-12 offset-xl-2  col-xl-8 page2 d-none">
                        <a class="text-decoration-none text-body" href="">
                            <div class="card mt-3 p-2">
                                <div class="row no-gutters">
                                    <div class="col-md-4">
                                        <img class="rounded-lg img-fluid w-100"
                                            src=http://image.ichannela.com/images/channela/2025/01/31/000002667890/00000266789020250131200044516.jpeg
                                            alt="...">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h3 class="card-title">
                                                손흥민, 45분 뛰고 10번 돌파 ‘최초 기록’</h3>
                                            <hr>
                                            <p class="card-text text-dark pr-5">
                                                [앵커]손흥민이 골 없이도 최고 평점을 받았습니다. 전반 45분만 뛰고도 10번을 돌파하는 최초 기록을 세웠는데, 캡틴의 눈부신
                                                활약 함께 보시죠. 김재혁 기자입니다. [기자]스웨덴 엘프스보리와 맞붙은 토트넘. 경기 시작과 동시에 주장 손흥민이 슛으로 기선
                                                제압을 합니다.
                                            </p>
                                            <div class="row">
                                                <div class="col-8">
                                                    <h5 class="card-text text-light mt-5"><small
                                                            class="text-muted">2025-02-05 12:40:36</small></h5>
                                                </div>
                                                <div class="col-4 ">
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
                        </a>
                    </div>
                    <div class="col-12 offset-xl-2  col-xl-8 page2 d-none">
                        <a class="text-decoration-none text-body" href="">
                            <div class="card mt-3 p-2">
                                <div class="row no-gutters">
                                    <div class="col-md-4">
                                        <img class="rounded-lg img-fluid w-100"
                                            src=http://image.ichannela.com/images/channela/2025/01/31/000002667191/00000266719120250131110617921.jpg
                                            alt="...">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h3 class="card-title">
                                                이기흥 전 체육회장, 바흐 위원장 초청으로 IOC 총회 참석</h3>
                                            <hr>
                                            <p class="card-text text-dark pr-5">
                                                출처=뉴시스 이기흥 전 대한체육회장이 토마스 바흐 국제올림픽위원회(IOC) 위원장 초청으로 오는 3월 IOC 총회에 참석합니다.
                                                당초 이기흥 전 회장은 지난 13일 체육회장 선거에서 패한 뒤 IOC 위원직 사임 의사를 밝혔습니다.
                                            </p>
                                            <div class="row">
                                                <div class="col-8">
                                                    <h5 class="card-text text-light mt-5"><small
                                                            class="text-muted">2025-02-05 12:34:54</small></h5>
                                                </div>
                                                <div class="col-4 ">
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
                        </a>
                    </div>
                    <div class="col-12 offset-xl-2  col-xl-8 page2 d-none">
                        <a class="text-decoration-none text-body" href="">
                            <div class="card mt-3 p-2">
                                <div class="row no-gutters">
                                    <div class="col-md-4">
                                        <img class="rounded-lg img-fluid w-100"
                                            src=http://image.ichannela.com/images/channela/2025/01/31/000002667169/00000266716920250131105156431.jpg
                                            alt="...">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h3 class="card-title">
                                                손흥민 전반만 뛰고 최고평점…유로파 16강 직행</h3>
                                            <hr>
                                            <p class="card-text text-dark pr-5">
                                                [런던=AP/뉴시스] 토트넘 홋스퍼(영국)의 손흥민이 30일(현지 시간) 영국 런던의 토트넘 홋스퍼 스타디움에서 열린
                                                2024-25 유럽축구연맹 유로파리그(UEFA) 리그 페이즈 최종 8차전 엘프스보리(스웨덴)와 경기 중 공을 다투고 있다.
                                                토트넘(잉글랜드)이 유럽축구연맹(UEFA) 유로파리그 16강에 직행했습니다.
                                            </p>
                                            <div class="row">
                                                <div class="col-8">
                                                    <h5 class="card-text text-light mt-5"><small
                                                            class="text-muted">2025-02-05 12:28:09</small></h5>
                                                </div>
                                                <div class="col-4 ">
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
                        </a>
                    </div>
                    <div class="col-12 offset-xl-2  col-xl-8 page2 d-none">
                        <a class="text-decoration-none text-body" href="">
                            <div class="card mt-3 p-2">
                                <div class="row no-gutters">
                                    <div class="col-md-4">
                                        <img class="rounded-lg img-fluid w-100"
                                            src=http://image.ichannela.com/images/channela/2025/01/30/000002666984/00000266698420250130195201838.jpeg
                                            alt="...">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h3 class="card-title">
                                                김하성, 탬파베이에 새둥지…팀 최고연봉</h3>
                                            <hr>
                                            <p class="card-text text-dark pr-5">
                                                김하성, 탬파베이에 새둥지…팀 최고연봉
                                                [앵커]메이저리그에서 자유계약 FA 선언을 했던 김하성이 탬파베이에 새 둥지를 틀었습니다. 2년 연봉 420억 원으로, 구단에서
                                                제일 많습니다. 장치혁 기자입니다.[기자]김하성이 탬파베이로 이적합니다. 미국 현지 보도에 따르면 김하성은 2년간 우리 돈
                                                420억 원에 계약했습니다.
                                            </p>
                                            <div class="row">
                                                <div class="col-8">
                                                    <h5 class="card-text text-light mt-5"><small
                                                            class="text-muted">2025-02-05 12:27:37</small></h5>
                                                </div>
                                                <div class="col-4 ">
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
                        </a>
                    </div>
                    <div class="col-12 offset-xl-2  col-xl-8 page2 d-none">
                        <a class="text-decoration-none text-body" href="">
                            <div class="card mt-3 p-2">
                                <div class="row no-gutters">
                                    <div class="col-md-4">
                                        <img class="rounded-lg img-fluid w-100"
                                            src=http://image.ichannela.com/images/channela/2025/01/24/000002664600/00000266460020250124195719146.jpeg
                                            alt="...">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h3 class="card-title">
                                                두 골 몰아친 손흥민…‘쉿!’ 세리머니</h3>
                                            <hr>
                                            <p class="card-text text-dark pr-5">
                                                두 골 몰아친 손흥민…‘쉿!’ 세리머니
                                                [앵커]우리가 알던 손흥민이 돌아왔습니다.한 경기에 두 골을 몰아치며 팀을 승리로 이끌었습니다. 그동안 받아온부진 우려를 깨끗이
                                                씻어내려는 듯 특별한 골 세리머니도 선보였는데요, 장치혁 기자가 보도합니다.[기자]상대 공을 가로채 역습에 나선 토트넘의 전진
                                                패스가 손흥민에게 이어집니다.
                                            </p>
                                            <div class="row">
                                                <div class="col-8">
                                                    <h5 class="card-text text-light mt-5"><small
                                                            class="text-muted">2025-02-05 12:26:46</small></h5>
                                                </div>
                                                <div class="col-4 ">
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
                        </a>
                    </div>
                    <div class="col-12 offset-xl-2  col-xl-8 page2 d-none">
                        <a class="text-decoration-none text-body" href="">
                            <div class="card mt-3 p-2">
                                <div class="row no-gutters">
                                    <div class="col-md-4">
                                        <img class="rounded-lg img-fluid"
                                            src=http://image.ichannela.com/images/channela/2025/01/20/000002660797/00000266079720250120143500680.jpg
                                            alt="...">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h3 class="card-title">
                                                한화이글스 홈구장 명칭, ‘대전 한화생명 볼파크’로 결정</h3>
                                            <hr>
                                            <p class="card-text text-dark pr-5">
                                                 한화이글스가 이번 시즌부터 새롭게 사용할 홈구장의 이름이 ‘대전 한화생명 볼파크’로 결정됐습니다.한화 구단은 “대전 홈구장을 찾아주신 팬들게 보답한다는 의미로 ‘대전’을 넣었고, 야구장(ball)이라는 정체성을 명확히 전달할 수 있고, 복합문화공간(park)을 의미하는 측면에서 결정했다”고 선정 배경을 밝혔습니다.
                                            </p>
                                            <div class="row">
                                                <div class="col-8">
                                                    <h5 class="card-text text-light mt-5"><small
                                                            class="text-muted">2025-02-05 12:26:23</small></h5>
                                                </div>
                                                <div class="col-4 ">
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
                        </a>
                    </div>

                </div>
            </div>




            <%@ include file="footer.jsp" %>

    </body>
    </body>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .nav-pills .nav-link.active,
        .nav-pills .show>.nav-link {
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

        a:hover .arrow {
            border-color: #196EFF !important;
        }

        a:hover .card {
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15) !important;
        }

        img {
            max-height: 253px;
        }




        @media (max-width: 1200px) {

            .title {
                position: absolute;
                font-size: 2.5vw;
                left: 3%;
                top: 30%;
            }



        }

        @media (max-width: 992px) {

            .title {
                position: absolute;
                font-size: 2.5vw;
                left: 3%;
                top: 30%;
            }

            img {
                max-height: 100%;
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
        $(function(){
            var btn = $('.more-btn')
            var page2 = $('.page2')
            var NewsAddBtn =$('.NewsAddBtn')

            btn.click(function(){
                btn.addClass('d-none')
                NewsAddBtn.addClass('d-none')
                page2.removeClass('d-none')
                page2.addClass('d-block')
            })
        })
    </script>


    </html>