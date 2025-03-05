<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>processUpdateReports</title>
</head>
<body>
		<%	
				request.setCharacterEncoding("utf-8");
				
				
				 String realFolder = application.getRealPath("/resources/images/");
				    File dir = new File(realFolder);
				    if (!dir.exists()) {
				        dir.mkdirs(); // 디렉토리가 없으면 생성
				    }

				    // 최대 파일 크기 (5MB)
				    String encType = "utf-8";
				    int maxsize = 5 * 1024 * 1024; // 5MB
				    MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize, encType, new DefaultFileRenamePolicy());
				
				
				// 전화번호 처리
				String phoneNumber1 = multi.getParameter("phone1");
			    String phoneNumber2 = multi.getParameter("phone2");
			    String phoneNumber3 = multi.getParameter("phone3");
			    String phoneNumber = phoneNumber1 + "-" + phoneNumber2 + "-" + phoneNumber3;
			    
			    // 제목과 내용 처리
			    String title = multi.getParameter("title");
			    String reportText = multi.getParameter("ReportText");
			    
			    // 업로드된 파일 처리 (각 파일명 변수)
			    String filename1 = multi.getFilesystemName("file1");
			    String filename2 = multi.getFilesystemName("file2");
			    String filename3 = multi.getFilesystemName("file3");

			    // 파일명이 null이면 null 처리
			    if (filename1 == null) filename1 = null;
			    if (filename2 == null) filename2 = null;
			    if (filename3 == null) filename3 = null;
			    
			    //아이디 처리
			    String id = multi.getParameter("id");
				
				
		%>
			 <sql:setDataSource var="dataSource"
				url="jdbc:oracle:thin:@localhost:1521:xe"
				driver="oracle.jdbc.driver.OracleDriver" user="C##dbexam"
				password="m1234" />
				<sql:update var="rs" dataSource="${dataSource }">
               		update reportsDB set phone=?,title=?,text=?,filename_1=?,filename_2=?,filename_3=?,updatetime=sysdate WHERE id = ?
               		<sql:param value="<%=phoneNumber %>"/>
               		<sql:param value="<%=title %>"/>
               		<sql:param value="<%=reportText %>"/>
               		<sql:param value="<%=filename1 %>"/>
               		<sql:param value="<%=filename2 %>"/>
               		<sql:param value="<%=filename3 %>"/>
               		<sql:param value="<%=id %>"/>
           		 </sql:update>
				
				<c:if test="${rs>=1 }">
					<c:redirect url="Reports.jsp"/>
				</c:if>
				
		
			
</body>
</html>