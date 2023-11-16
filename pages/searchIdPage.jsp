<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="../style/account.css">
    <link rel="icon" href="../imgs/stageus.png">
</head>

<body>
    <form id="stageus_login" action="../actions/searchIdAction.jsp">
        <a href="../index.jsp">
            <img id="logo" src="../imgs/stageus_logo_white.png">
        </a> 
        
        <div class="input_container">
            <div>이름</div>
            <input class="inputs" name="name_value" type="text">
            <div>이메일</div>
            <input class="inputs" name="email_value" type="email">
            <div>생년월일</div>
            <input class="inputs" name="birthday_value" type="date" min="1990-01-01" max="2023-12-31" >
            <div>휴대전화번호</div>
            <input class="inputs" name="phoneNumber_value" type="tel">
        </div>
        
        <input class="confirm_btn" type="submit" value="아이디 찾기">
    </form>
</body>
