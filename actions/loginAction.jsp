<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!-- jsp에서 라이브러리 import하는 방법 -->
<%@ page import="java.sql.DriverManager" %>     <!-- 데이터베이스 탐색 라이브러리 -->
<%@ page import="java.sql.Connection" %>        <!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %> <!-- 데이터베이스 SQL 전송 라이브러리 -->
<%@ page import="java.sql.ResultSet" %>          <!-- 데이터베이스에서 값 받아오기 라이브러리 -->

<%
    request.setCharacterEncoding("utf-8");

    String idValue = request.getParameter("id_value");
    String pwValue = request.getParameter("pw_value");

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/stageus", "JKE", "1234");

    //String dbURL = "jdbc:mysql://localhost/stageus";
    //String dbID = "JKE";
    //String dbPW = "1234";
    //Connection connect = DriverManager.getConnection(dbURL, dbID, dbPW);

    String sql = "SELECT * FROM account WHERE id = ? AND password = ?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, idValue);
    query.setString(2, pwValue);

    ResultSet result = query.executeQuery();    // 테이블을 읽어와

    // result.next();      // 가져온 테이블의 한 줄을 읽는다

    if (result.next()) {                        // 테이블을 읽을 수 있다면(==존재한다는 뜻임)
        session.setAttribute("idx", result.getString(1));
        session.setAttribute("id", result.getString(2));
        session.setAttribute("name", result.getString(3));
        session.setAttribute("password", result.getString(4));
        session.setAttribute("email", result.getString(5));
        session.setAttribute("birthday", result.getString(6));
        session.setAttribute("phoneNumber", result.getString(7));
        response.sendRedirect("../index.jsp");
    }
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인하기</title>
</head>
<body>
    <script>
        console.log(<%=idValue%>)
        console.log(<%=pwValue%>)

        alert("회원정보가 없습니다.");
        location.href="../pages/loginPage.jsp";
    </script>
</body>
