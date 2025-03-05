<%@page import="java.util.ArrayList"%>
<%@page import="dao.ReportRepository"%>
<%@page import="dto.Report"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
    <title>채널 A 게시판</title>
    <link rel="shortcut icon" href="https://www.ichannela.com/favicon.ico">

    <script>
        // 삭제 확인 함수
        function confirmDelete(url) {
            if (confirm("정말로 삭제하시겠습니까?")) {
                window.location.href = url; // 확인 시 삭제 페이지로 이동
            }
        }

        // 수정 확인 함수
        function confirmUpdate(url) {
            if (confirm("정말로 수정하시겠습니까?")) {
                window.location.href = url; // 확인 시 수정 페이지로 이동
            }
        }
    </script>
</head>

<body>
    <%@ include file="menu2.jsp" %>
    <%@ include file="dbconn.jsp" %>
    <div class="container-fluid px-0">
        <div class="row">
            <div class="offset-xl-2 col-5 mr-auto my-3 pl-4">TV 홈 > 뉴스 > <span class="font-weight-bold">게시판</span>
            </div>
            <div class="col-xl-8 offset-xl-2 px-0">
                <img src="http://image.ichannela.com/images/news/report_titleimg_n01.png" class="img-fluid w-100" alt="">
            </div>
        </div>
        <div class="row">
            <div class="offset-xl-2 col-xl-8 col-12 pt-4 border-bottom">
                <h3 class="font-weight-bolder" href="">게시판</h3>
            </div>
        </div>

        <div class="row mb-5">

            <sql:setDataSource var="dataSource" url="jdbc:oracle:thin:@localhost:1521:xe" driver="oracle.jdbc.driver.OracleDriver" user="C##dbexam" password="m1234" />
            <sql:query var="rs" dataSource="${dataSource }">
                select * from reportsDB order by updatetime desc
            </sql:query>
            <c:forEach var="row" items="${rs.rows }" varStatus="status">

                <div class="offset-xl-2 col-xl-8 col-12 py-3 border border-top-0 reports-item"<c:if test="${status.index >= 10}">
                    style="display:none;"
                </c:if>>
                    <span class="h3 ml-3">${row.id }</span>
                    <a class="h4 ml-5" href="./Report.jsp?id=${row.id }">${row.title }</a>
                    <c:choose>
                        <c:when test="${sessionId eq 'admin'}">
                            <!-- 삭제 버튼에 확인 함수 연결 -->
                            <a class="btn btn-primary ml-2 float-right" href="javascript:void(0);" onclick="confirmDelete('deleteReport.jsp?id=${row.id }')">삭제</a>
                            <!-- 수정 버튼에 확인 함수 연결 -->
                            <a class="btn btn-primary float-right" href="javascript:void(0);" onclick="confirmUpdate('updateReport.jsp?id=${row.id }')">수정</a>
                        </c:when>
                    </c:choose>
                    <span class="h6 float-right mr-3 text-dark mt-2">${row.updatetime }</span>
                </div>

            </c:forEach>
            <div class="col-12 my-4 text-center ReportsAddBtn">
                <button class="btn btn-outline-primary more-btn" onclick="showMore()">더보기</button>
            </div>
        </div>

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
        white-space: nowrap;
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
let visibleCount = 5; // 처음에 5개의 아이템만 보이도록 설정

function showMore() {
    var items = document.querySelectorAll('.reports-item');
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
    var remainingItems = document.querySelectorAll('.reports-item');
    var hiddenItemCount = Array.from(remainingItems).filter(function(item) {
        return item.style.display === "none";
    }).length;

    // 더 이상 숨겨진 항목이 없으면 더보기 버튼 숨김
    if (hiddenItemCount === 0) {
        document.querySelector(".ReportsAddBtn").style.display = "none";
    }
}

// 페이지 로딩 시 초기 5개 아이템만 보이게 하고, 나머지는 숨김
document.addEventListener('DOMContentLoaded', function () {
    var articles = document.querySelectorAll('.reports-item');
    if (articles.length <= 5) {
        document.querySelector(".ReportsAddBtn").style.display = "none";  // 아이템이 5개 이하이면 더보기 버튼 숨김
    }

    // 처음에 5개를 제외한 뉴스 아이템을 숨김
    var items = document.querySelectorAll('.reports-item');
    for (let i = 5; i < items.length; i++) {
        items[i].style.display = 'none';
    }
});


   
</script>

</html>
