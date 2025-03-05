<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteNews</title>
</head>
<body>
	<%
		// request 인코딩 설정
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		
		if (id == null || id.isEmpty()) {
			out.println("잘못된 요청입니다.");
			return;
		}
	%>
	
	<sql:setDataSource var="dataSource"
		url="jdbc:oracle:thin:@localhost:1521:xe"
		driver="oracle.jdbc.driver.OracleDriver" user="C##dbexam"
		password="m1234" />
	
	<sql:update var="rs" dataSource="${dataSource}">
		DELETE FROM newsDB WHERE id = ?
		<sql:param value="<%=id %>"/>
	</sql:update>
	<c:set var="title" value="<%=title %>"/>
	
	<c:if test="${not empty title}">
			<form id="return" action="news.jsp" method="get">
    			<input type="hidden" id="title" name="title" value="<%=title%>">
		</form>
	</c:if>
	<c:if test="${empty title}">
			<c:redirect url="new.jsp"/>
	</c:if>


<script>
    // 페이지가 로드되면 자동으로 submit 실행
    window.onload = function() {
        document.getElementById("return").submit();
    };
</script>

</body>
</html>
