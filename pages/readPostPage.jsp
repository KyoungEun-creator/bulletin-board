<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!-- jsp에서 라이브러리 import하는 방법 -->
<%@ page import="java.sql.DriverManager" %>     <!-- 데이터베이스 탐색 라이브러리 -->
<%@ page import="java.sql.Connection" %>        <!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %> <!-- 데이터베이스 SQL 전송 라이브러리 -->
<%@ page import="java.sql.ResultSet" %>          <!-- 데이터베이스에서 값 받아오기 라이브러리 -->

<%
    request.setCharacterEncoding("utf-8");

    String dbURL = "jdbc:mysql://localhost/stageus";
    String dbID = "JKE";
    String dbPW = "1234";
    Connection connect = DriverManager.getConnection(dbURL, dbID, dbPW);

%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../style/readPost.css">
    <title>게시글 보기</title>
</head>
<body>
    <header>
        <a class="header_left" href="../index.jsp">
            <img id="logo" src="../imgs/stageus_logo_white.png">
        </a> 
    </header>

    <main id="read_post_container">
        <h1 id="post_title"><%=postTitle%></h1>
        <div id="post_writer">게시물 작성자: <%=postWriter%></div>
        <div id="post_create_date">게시물 작성일: <%=postCreateDate%></div>
        <div id="post_content"><%=postContent%></div>
    </main>

    <form id="write_comment_container" action="../actions/createCommentAction.jsp">
        <h1 id="comment">댓글</h2>
        <div id="create_comment_content_container">
            <div id="comment_writer">댓글 작성자</div>
            <input id="comment_content" name="comment_content_value" type="text">
            <div id="create_comment_btn_container">
                <input id="create_comment_btn" type="submit" value="등록">
            </div>
        </div>   
    </form>
</body>
