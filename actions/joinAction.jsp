<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!-- jsp에서 라이브러리 import하는 방법 -->
<%@ page import="java.sql.DriverManager" %>     <!-- 데이터베이스 탐색 라이브러리 -->
<%@ page import="java.sql.Connection" %>        <!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %> <!-- 데이터베이스 SQL 전송 라이브러리 -->

<!-- jsp 코드 -->
<%
    request.setCharacterEncoding("utf-8");

    String idValue = request.getParameter("id_value");
    String pwValue = request.getParameter("pw_value");
    String nameValue = request.getParameter("name_value");
    String emailValue = request.getParameter("email_value");
    String birthdayValue = request.getParameter("birthday_value");
    String phoneNumberValue = request.getParameter("phoneNumber_value");

    // 빈 값인지 아닌지
    // 값 길이 확인
    // 이메일, 날짜의 표현식 확인(정규식 알아보기) -> 다 통과하면 아래 데이터베이스 통신한다

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/stageus","JKE","1234");

    String sql = "INSERT INTO account (id, password, name, email, birthday, phone_number) VALUES (?, ?, ?, ?, ?, ?)";

    PreparedStatement query = connect.prepareStatement(sql);

    query.setString(1, idValue);
    query.setString(2, pwValue);
    query.setString(3, nameValue);
    query.setString(4, emailValue);
    query.setString(5, birthdayValue);
    query.setString(6, phoneNumberValue);


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
    
    <script>
        alert("회원가입을 축하합니다");
        window.location.href = "../pages/myProfilePage.jsp"
    </script>
</body>