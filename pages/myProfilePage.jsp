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
    <title>내 프로필</title>
    <link rel="stylesheet" href="../style/myProfile.css">
    <link rel="icon" href="../imgs/stageus.png">
</head>
<body>
    <div id="stageus_my_profile">
        <a href="../index.jsp">
            <img id="logo" src="../imgs/stageus_logo_white.png">
        </a> 

        <div class="info_container_top">
            <img id="profile_img" src="../imgs/user.png">
            <div id="id"><%=id%></div>
        </div>

        <div class="info_container_bottom">
            <div class="info_box">
                <div class="info_container_middle_left">
                    <img class="info_profile_icons" src="../imgs/user.png">
                    <div class="info_container_middle_right">
                        <div id="name"><%=name%></div>
                        <div id="email"><%=email%></div>
                    </div>
                </div>
            </div>

            <div class="info_box">
                <div class="info_container_middle_left">
                    <img class="info_icons" src="../imgs/smartphone.png">
                    <div><%=phoneNumber%></div>
                </div>
            </div>

            <div class="info_box">
                <div class="info_container_middle_left">
                    <img class="info_icons" src="../imgs/mail.png">
                    <div><%=email%></div>
                </div>
            </div>

            <div class="info_box">
                <div class="info_container_middle_left">
                    <img class="info_icons" src="../imgs/birthday-cake.png">
                    <div><%=birthday%></div>
                </div>
            </div>
        </div>
        <div id="account_setting_container">
            <div>
                <form action="../pages/editAccountPage.jsp">
                    <input id="edit_btn" class="account_setting_btn" type="submit" value="수정하기">
                </form>
            </div>
            <div>
                <form action="../actions/deleteAccountAction.jsp">
                    <input id="deleteAccount_btn" class="account_setting_btn" type="submit" value="탈퇴하기">
                </form>
            </div>
        </div>

    </div>

</body>