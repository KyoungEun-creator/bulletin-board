<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="../style/account.css">
    <link rel="icon" href="../imgs/stageus.png">
</head>

<body>
    <div id="stageus_login">
        <a href="../index.jsp">
            <img id="logo" src="../imgs/stageus_logo_white.png">
        </a> 
        
        <form class="input_container" action="../actions/loginAction.jsp">
            <div>ID</div>
            <input class="inputs" name="id_value" type="text" placeholder="아이디">
            <div>PW</div>
            <input class="inputs" name="pw_value" type="password" placeholder="비밀번호">

            <input class="confirm_btn" type="submit" value="로그인">
        </form>

        <div class="detail">
            <span>계정이 없으세요? &nbsp; 
                <a href="../pages/joinPage.jsp">회원가입</a>
            </span>
            <span>
                <a href="../pages/searchIdPage.jsp">아이디 찾기</a>
                <a href="../pages/searchPwPage.jsp">비밀번호 찾기</a>
            </span>
        </div>
    </div>
</body>