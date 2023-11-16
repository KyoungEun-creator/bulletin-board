<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="../style/account.css">
    <link rel="icon" href="../imgs/stageus.png">
</head>

<body>
    <form id="stageus_login" action="../actions/joinAction.jsp"> 
        <a href="../index.jsp">
            <img id="logo" src="../imgs/stageus_logo_white.png">
        </a> 
        
        <div class="input_container">
            <div>ID</div>
            <input id="userId" class="inputs" name="id_value" type="text">
            <div>PW</div>
            <input id="userPw" class="inputs" name="pw_value" type="password">
            <div>이름</div>
            <input id="userName" class="inputs" name="name_value" type="text">
            <div>이메일</div>
            <input id="userEmail" class="inputs" name="email_value" type="email">
            <div>생년월일</div>
            <input id="userBirthday" class="inputs" name="birthday_value" type="date" min="1990-01-01" max="2023-12-31" >
            <div>휴대전화번호</div>
            <input id="userPhoneNumber" class="inputs" name="phoneNumber_value" type="tel">
        </div>
        
        <input class="confirm_btn" type="submit" value="회원가입">
        <!-- 프론트에서의 예외처리: 인풋을 그냥 버튼으로 하고 이거 눌렀을 때 예외처리 해주고, form태그에 예외처리 하기 -->
    </form>

</body>