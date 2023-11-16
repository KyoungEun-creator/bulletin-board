<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!-- jsp에서 라이브러리 import하는 방법 -->
<%@ page import="java.sql.DriverManager" %>     <!-- 데이터베이스 탐색 라이브러리 -->
<%@ page import="java.sql.Connection" %>        <!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %> <!-- 데이터베이스 SQL 전송 라이브러리 -->

<!-- jsp 코드 -->
<%
    request.setCharacterEncoding("utf-8");

    String postTitleValue = request.getParameter("post_title_value");
    String postContentValue = request.getParameter("post_content_value");

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/stageus","JKE","1234");

    String sql = "INSERT INTO post (writer, title, content) VALUES (?, ?, ?)";

    PreparedStatement query = connect.prepareStatement(sql);

    query.setString(1, jke);
    query.setString(2, postTitleValue);
    query.setString(3, postContentValue);

    // query 전송
    query.executeUpdate();
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 프로필</title>
    <link rel="stylesheet" href="../style/myProfile.css">
    <link rel="icon" href="../imgs/stageus.png">
</head>
<body>

    <h2>메인페이지임~</h2>
    <h3>제목: <%=postTitleValue%></h3>
    <h3>내용: <%=postContentValue%></h3>

<script>
    alert("게시물 업로드 성공!")
    window.location.href ="index.jsp" 
</script>
</body>