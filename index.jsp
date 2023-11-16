<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%
    // 로그인 정보
    String idx = (String)session.getAttribute("idx");
    String id = (String)session.getAttribute("id");
%>

<%@ page import="java.sql.DriverManager" %>     <!-- 데이터베이스 탐색 라이브러리 -->
<%@ page import="java.sql.Connection" %>        <!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %> <!-- 데이터베이스 SQL 전송 라이브러리 -->
<%@ page import="java.sql.ResultSet" %>          <!-- 데이터베이스에서 값 받아오기 라이브러리 -->
<%@ page import="java.util.ArrayList" %>         <!-- 리스트 라이브러리 -->

<%
    request.setCharacterEncoding("utf-8");

    Class.forName("com.mysql.jdbc.Driver");
    String dbUrl = "jdbc:mysql://localhost/stageus";
    String dbUser = "JKE";
    String dbPassword = "1234";
    Connection connect = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

    String selectSQL = "SELECT * FROM post";  
    PreparedStatement selectQUERY = connect.prepareStatement(selectSQL);
    ResultSet result = selectQUERY.executeQuery(); 

    ArrayList<String> postWriterList = new ArrayList<String>();
    ArrayList<String> postTitleList = new ArrayList<String>();
    ArrayList<String> postContentList = new ArrayList<String>();
    ArrayList<String> postCreateDateList = new ArrayList<String>();
    ArrayList<String> postWriterIdList = new ArrayList<String>();

    while(result.next()) {
        // result는 post 테이블 전체임
        String postWriter = result.getString(2);
        String postTitle = result.getString(3);
        String postContent = result.getString(4);
        String postCreateDate = result.getString(5);

        // 여기서 가져온 postWriter(idx)를 가지고 한 번더 SELECT를 해서 아이디 가져오기
        String idSelectSQL = "SELECT id FROM account WHERE idx = ?";
        PreparedStatement idSelectQUERY = connect.prepareStatement(idSelectSQL);
        idSelectQUERY.setString(1, postWriter);

        ResultSet idResult = idSelectQUERY.executeQuery(); 
        // idResult는 account 테이블에서 id만 가져온 일부 테이블임

        if(idResult.next()) {
            String postWriterId = idResult.getString(1);
            postWriterIdList.add("\"" + postWriterId + "\""); 
        }

        postWriterList.add("\"" + postWriter+ "\""); 
        postTitleList.add("\"" + postTitle + "\""); 
        postContentList.add("\"" + postContent + "\""); 
        postCreateDateList.add("\"" + postCreateDate + "\""); 
    }
%>


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../week7/style/index.css">
    <link rel="icon" href="../week7/imgs/stageus.png">
    <title>홈 게시판</title>
</head>
<body>
    <header>
        <a class="header_left" href="https://www.stageus.co.kr/">
            <img id="logo" src="imgs/stageus_logo_white.png">
        </a> 

        <div class="header_right">
            <a id="before_login" href="pages/loginPage.jsp">
                <input id="login_btn" type="button" value="STAGEUS 로그인">
            </a>
            <div id="after_login">
                <div id="profile_welcome"></div>
                <div id="profile_setting">
                    <a id="move_myProfile" href="pages/myProfilePage.jsp">
                        <input id="profile_btn" class="setting_btn" type="button" value="마이페이지">
                    </a>
                    <form action="actions/logoutAction.jsp">
                        <input id="logout_btn" class="setting_btn" type="submit" value="로그아웃">
                    </form>
                </div>
            </div>
        </div>
    </header>

    <h1>게시판</h1>
    <main>
        <table id="post_list">
            <tr>
                <th class="post_num">No</th>
                <th class="post_writer">작성자</th>
                <th class="post_title">제목</th>
                <th class="post_create_date">작성일</th>
            </tr>
        </table>
        <!-- 로그인 여부에 따라 보임 -->
        <a href="pages/createPostPage.jsp">
            <input id="move_create_post_btn" type="submit" value="게시글 작성">
        </a>
    </main>

    <script>
        var accountIdx = <%=idx%>;
        var accountId = "<%=id%>";
        console.log(accountId);

        if (accountIdx) {   // 로그인 돼있으면
            document.getElementById("before_login").style.display = 'none';
            document.getElementById("profile_welcome").innerHTML = accountId+'님 환영합니다';
            document.getElementById("logout_btn").style.display = 'block';               // 로그아웃 버튼 표시
            document.getElementById("move_create_post_btn").style.display = 'block';     // 게시글 작성 버튼 표시
        }
        else if (!accountIdx) {    // 로그인 안 돼있으면
            document.getElementById("after_login").style.display = 'none';
            document.getElementById("logout_btn").style.display = 'none';               // 로그아웃 버튼 숨김
            document.getElementById("move_create_post_btn").style.display = 'none';     // 게시글 작성 버튼 숨김
        }

        // 게시글 목록 보여주기
        var postWriterList = <%=postWriterList%>;
        console.log(postWriterList)
        var postTitleList = <%=postTitleList%>;
        console.log(postTitleList)
        var postContentList = <%=postContentList%>;
        console.log(postContentList)
        var postCreateDateList = <%=postCreateDateList%>;
        console.log(postCreateDateList)
        var postWriterIdList = <%=postWriterIdList%>;
        console.log(postWriterIdList)

        const postTable = document.getElementById("post_list");

        for (var i = 0; i < postWriterList.length; i++) {
            const postRow = document.createElement("tr");
            const postNum = document.createElement("td");
            const postWriter = document.createElement("td");
            const postTitle = document.createElement("td");
            const postCreateDate = document.createElement("td");
            const readPostLink = document.createElement("a");

            postNum.setAttribute("class", "post_num");
            postWriter.setAttribute("class", "post_writer");
            postTitle.setAttribute("class", "post_title");
            postCreateDate.setAttribute("class", "post_create_date");
            readPostLink.setAttribute("href", "../week7/pages/readPostPage.jsp");

            postNum.innerHTML = i+1;
            postWriter.innerHTML = postWriterIdList[i];
            postTitle.innerHTML = postTitleList[i];
            postCreateDate.innerHTML = postCreateDateList[i];

            postTable.appendChild(postRow);
            postRow.appendChild(postNum);
            postRow.appendChild(postWriter);
            postRow.appendChild(readPostLink);
            readPostLink.appendChild(postTitle);
            postRow.appendChild(postCreateDate);
        }
    </script>
</body>
