<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ include file="dbconn.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>processAddReport</title>
</head>
<body>

<%
    // 폼 데이터 처리
    request.setCharacterEncoding("utf-8");

    // 업로드할 파일 저장 경로
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

    // DB에 저장
     String sql="insert into reportsDB values(r_id.nextval,? ,? ,? ,? ,? ,? ,sysdate)";
     pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, phoneNumber);
    pstmt.setString(2, title);
    pstmt.setString(3, reportText);
    pstmt.setString(4, filename1);
    pstmt.setString(5, filename2);
    pstmt.setString(6, filename3);

    pstmt.executeUpdate();

    // 자원 해제
    if (pstmt != null) pstmt.close();
    if (conn != null) conn.close();

    // 리다이렉트
    response.sendRedirect("./Reports.jsp");
%>

</body>
</html>
