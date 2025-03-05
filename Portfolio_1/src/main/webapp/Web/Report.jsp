<%@page import="dto.Report"%>
<%@page import="dao.ReportRepository"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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
<title>채널 A 게시판</title>
    <link rel="shortcut icon" href="https://www.ichannela.com/favicon.ico">
</head>

<body>
	<%@ include file="menu2.jsp"%>
	<%@ include file="dbconn.jsp"%>




	<%-- <% String date = request.getParameter("date");
        	 ReportRepository dao = ReportRepository.getInstance();
        	 Report report = dao.getDate(date);
        
        %>
         --%>
	<div class="container-fluid px-0">
		<div class="row">
			<div class="offset-xl-2 col-5 mr-auto my-3 pl-4">
				TV 홈 > 뉴스 > <span class="font-weight-bold">게시판</span>
			</div>
			<div class="col-xl-8 offset-xl-2 px-0">
				<img
					src="http://image.ichannela.com/images/news/report_titleimg_n01.png"
					class="img-fluid w-100" alt="">
			</div>
		</div>
		<div class="row">
			<div class="offset-xl-2 col-xl-8 col-12 pt-4 ">
				<h3 class="font-weight-bolder" href="">게시판</h3>
			</div>
		</div>
		<%
		String id = request.getParameter("id");
		
		String sql = "select * from reportsDB where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		while (rs.next()) {
		%>
		<div class="row mb-3">
			<div class="offset-xl-2 col-xl-8 col-12 py-3 border bg-light">
				<h4 class="ml-3 font-weight-bold pt-2" href=""><%=rs.getString("title")%>
				<c:choose>
                        <c:when test="${sessionId eq 'admin'}">
                            <!-- 삭제 버튼에 확인 함수 연결 -->
                            <a class="btn btn-primary ml-2 float-right" href="javascript:void(0);" onclick="confirmDelete('deleteReport.jsp?id=<%=rs.getString("id")%>')">삭제</a>
                            <!-- 수정 버튼에 확인 함수 연결 -->
                            <a class="btn btn-primary float-right" href="javascript:void(0);" onclick="confirmUpdate('updateReport.jsp?id=<%=rs.getString("id")%>')">수정</a>
                        </c:when>
                    </c:choose>
				<span
						class="h6 float-right mr-3 text-dark mt-2"><%=rs.getString("updatetime")%></span>
				</h4>
			</div>
			<div class="offset-xl-2 col-xl-8 col-12 py-3 border border-top-0">
				<p class="ml-3"><%=rs.getString("text")%>

				</p>
				<div class="row">
					<div class="col-3 p-3 ">
						<img src="../resources/images/<%=rs.getString("filename_1")%>"
							class="img-fluid" alt="" />
					</div>
					<div class="col-3 p-3 ">
						<img src="../resources/images/<%=rs.getString("filename_2")%>"
							class="img-fluid" alt="" />
					</div>
					<div class="col-3 p-3 ">
						<img src="../resources/images/<%=rs.getString("filename_3")%>"
							class="img-fluid" alt="" />
					</div>
				</div>


			</div>

			<div
				class="offset-xl-2 col-xl-8 col-12 py-3 bg-light border border-top-0">
				<form action="">
					<div class="input-group ml-1">
						<textarea class="form-control" aria-label="With textarea"></textarea>
						<div class="input-group-append">
							<input type="submit" class="btn btn-primary text-center"
								value="댓글등록"></input>
						</div>
					</div>
				</form>

			</div>

		</div>
		<div class="row mb-5 ">
			<div class="offset-xl-2 col-xl-8 col-12 py-3 px-0">
				<a href="Reports.jsp"
					class="btn btn-block btn-outline-primary mx-auto">목록으로</a>
			</div>

		</div>
		<%
		} //반복문 닫기
		if (rs != null)
		rs.close();
		if (pstmt != null)
		pstmt.close();
		if (conn != null)
		conn.close();
		%>



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



</html>