<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%
    String idx = (String)session.getAttribute("idx");
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
    String password = (String)session.getAttribute("password");
    String email = (String)session.getAttribute("email");
    String birthday = (String)session.getAttribute("birthday");
    String phoneNumber = (String)session.getAttribute("phoneNumber");
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 수정하기</title>
    <link rel="stylesheet" href="../style/account.css">
    <link rel="icon" href="../imgs/stageus.png">
</head>
<body>
    <form id="stageus_login" action="../actions/editAccountAction.jsp"> 
        <a href="../index.jsp">
            <img id="logo" src="../imgs/stageus_logo_white.png">
        </a> 
        
        <div class="input_container">
            <div>ID</div>
            <input id="userId" class="inputs" name="id_changed_value" type="text" value="<%=id%>">
            <div>PW</div>
            <input id="userPw" class="inputs" name="pw_changed_value" type="password" value="<%=password%>">
            <div>이름</div>
            <input id="userName" class="inputs" name="name_changed_value" type="text" value="<%=name%>">
            <div>이메일</div>
            <input id="userEmail" class="inputs" name="email_changed_value" type="email" value="<%=email%>">
            <div>생년월일</div>
            <input id="userBirthday" class="inputs" name="birthday_changed_value" type="date" min="1990-01-01" max="2023-12-31" value="<%=birthday%>">
            <div>휴대전화번호</div>
            <input id="userPhoneNumber" class="inputs" name="phoneNumber_changed_value" type="tel" value="<%=phoneNumber%>">
        </div>
        
        <input class="confirm_btn" type="submit" value="수정하기">
    </form>
</body>