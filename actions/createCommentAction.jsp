<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%
    String idx = (String)session.getAttribute("idx");
    String id = (String)session.getAttribute("id");
%>

<!-- jsp에서 라이브러리 import하는 방법 -->
<%@ page import="java.sql.DriverManager" %>     <!-- 데이터베이스 탐색 라이브러리 -->
<%@ page import="java.sql.Connection" %>        <!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %> <!-- 데이터베이스 SQL 전송 라이브러리 -->


<!-- jsp 코드 -->
<%
    request.setCharacterEncoding("utf-8");

    String commentContentValue = request.getParameter("comment_content_value");

    Class.forName("com.mysql.jdbc.Driver");
    String dbUrl = "jdbc:mysql://localhost/stageus";
    String dbUser = "JKE";
    String dbPassword = "1234";
    Connection connect = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

    // 테이블에 데이터 저장
    String insertSQL = "INSERT INTO comment (content) VALUES (?)";
    PreparedStatement insertQUERY = connect.prepareStatement(insertSQL);
    insertQUERY.setString(1, commentContentValue);

    insertQUERY.executeUpdate();
    response.sendRedirect("../pages/readPostPage.jsp");
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>댓글 업로드(액션)</title>
</head>
<body>
    <script>
        alert("댓글 업로드에 오류가 발생했습니다.")
    </script>
</body>