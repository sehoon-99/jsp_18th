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
    <title>processAddNews</title>
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

    // 제목과 내용 카테고리 처리
    String title = multi.getParameter("title");
    String text = multi.getParameter("text");
    String category = multi.getParameter("category");

    // 업로드된 파일 처리 (각 파일명 변수)
    String img = multi.getFilesystemName("img");
    
    

    // 파일명이 null이면 null 처리
    if (img == null) img = null;


    // DB에 저장
     String sql="insert into newsDB values(n_id.nextval,? ,? ,? ,? ,sysdate)";
     pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, text);
    pstmt.setString(3, img);
    pstmt.setString(4, category);


    pstmt.executeUpdate();

    // 자원 해제
    if (pstmt != null) pstmt.close();
    if (conn != null) conn.close();

    // 리다이렉트
    response.sendRedirect("./new.jsp");
%>

</body>
</html>
