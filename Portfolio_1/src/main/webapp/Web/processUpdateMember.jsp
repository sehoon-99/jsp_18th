<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>processUpadateMember.jsp</title>
</head>
<body>
		<%
			request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			String pw = request.getParameter("password");
			String name = request.getParameter("name");
			String year = request.getParameter("birthyy");
			String month = request.getParameter("birthmm");
			String day = request.getParameter("birthdd");
			String birth = year+"-"+month+"-"+day;
			String mail1 = request.getParameter("mail1");
			String mail2 = request.getParameter("mail2");
			String mail = mail1+"@"+mail2;
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
		%>
		
		<sql:setDataSource var="dataSource" url="jdbc:oracle:thin:@localhost:1521:xe" 
		driver="oracle.jdbc.driver.OracleDriver"
		user="C##dbexam"
		password="m1234"
		/>
		<sql:update var="rs" dataSource="${dataSource }">
			update p_memberDB set name=?,password=?,birth=?,mail=?,phone=?,address=?,updatetime=sysdate where id=?
			<sql:param value="<%=name %>"/>
			<sql:param value="<%=pw %>"/>
			<sql:param value="<%=birth %>"/>
			<sql:param value="<%=mail %>"/>
			<sql:param value="<%=phone %>"/>
			<sql:param value="<%=address %>"/>
			<sql:param value="<%=id %>"/>
		</sql:update>
		
		<c:if test="${rs>=1 }">
			<c:redirect url="./index.jsp?msg=0"/>
		</c:if>
</body>
</html>