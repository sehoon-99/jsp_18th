<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteReport</title>
</head>
<body>
		<%	
				request.setCharacterEncoding("utf-8");
				String id = request.getParameter("id");
				
				if (id == null || id.isEmpty()) {
					out.println("잘못된 요청입니다.");
					return;
				}
		%>
			 <sql:setDataSource var="dataSource"
				url="jdbc:oracle:thin:@localhost:1521:xe"
				driver="oracle.jdbc.driver.OracleDriver" user="C##dbexam"
				password="m1234" />
				<sql:update var="rs" dataSource="${dataSource }">
               		DELETE FROM reportsDB WHERE id = ?
               		<sql:param value="<%=id %>"/>
           		 </sql:update>
				
				<c:if test="${rs>=1 }">
					<c:redirect url="Reports.jsp"/>
				</c:if>
			
</body>
</html>