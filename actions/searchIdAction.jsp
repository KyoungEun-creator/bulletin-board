<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!-- jsp에서 라이브러리 import하는 방법 -->
<%@ page import="java.sql.DriverManager" %>     <!-- 데이터베이스 탐색 라이브러리 -->
<%@ page import="java.sql.Connection" %>        <!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %> <!-- 데이터베이스 SQL 전송 라이브러리 -->
<%@ page import="java.sql.ResultSet" %>          <!-- 데이터베이스에서 값 받아오기 라이브러리 -->


<%
    request.setCharacterEncoding("utf-8");

    String nameValue = request.getParameter("name_value");
    String emailValue = request.getParameter("email_value");
    String birthdayValue = request.getParameter("birthday_value");
    String phoneNumberValue = request.getParameter("phoneNumber_value");

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/stageus", "JKE", "1234");

    // String sql = "SELECT id FROM account WHERE (name, email, birthday, phone_number) VALUES (?, ?, ?, ?)";
    String sql = "SELECT id FROM account WHERE name = ? AND email = ? AND birthday = ? AND phone_number = ?";
    
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, nameValue);
    query.setString(2, emailValue);
    query.setString(3, birthdayValue);
    query.setString(4, phoneNumberValue);

    ResultSet result = query.executeQuery();

    String foundId = "";
    if (result.next()) {
        foundId = result.getString(1);
    } 
%>


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="../style/myProfile.css">
    <link rel="icon" href="../imgs/stageus.png">
</head>
<body>
    <script>
        var foundId = "<%=foundId%>"

        if (foundId !== "") {
            alert("찾은 아이디 : " + foundId);
            location.href = "../pages/loginPage.jsp";
        } else {
            alert("해당 정보가 없습니다.");
            location.href = "../pages/searchIdPage.jsp"
        }
    </script>

</body>
    
