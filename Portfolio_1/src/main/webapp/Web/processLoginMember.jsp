<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>processLoginMember</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	%>
	<sql:setDataSource var="dataSource" url="jdbc:oracle:thin:@localhost:1521:xe" 
		driver="oracle.jdbc.driver.OracleDriver"
		user="C##dbexam"
		password="m1234"
		/>
		<sql:query var="rs" dataSource="${dataSource}">
			select * from p_memberDB where id=? and password=?
			<sql:param value="<%=id %>"/>
			<sql:param value="<%=password %>"/>
		</sql:query>
		
		<c:forEach items="${rs.rows  }" var="row" >
			<%
				session.setAttribute("sessionId", id);
			%>
			<c:redirect url="index.jsp"/>
		</c:forEach>
		
		<c:redirect url="index.jsp?msg=1"/>
		
		
</body>
</html>