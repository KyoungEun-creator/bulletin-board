<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%
    String idx = (String)session.getAttribute("idx");
    String id = (String)session.getAttribute("id");
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../style/createPost.css">
    <title>게시글 작성</title>
</head>
<body>
    <header>
        <a class="header_left" href="../index.jsp">
            <img id="logo" src="../imgs/stageus_logo_white.png">
        </a> 
    </header>

    <main id="create_post_container">

        <h1>게시글 작성</h1>
        <form action="../actions/createPostAction.jsp">
            <article id="create_post_article_container">
                <div id="create_post_label">제목</div>
                <input id="create_post_title_input" class="create_post_inputs" name="post_title_value" type="text">
            </article>
            
            <article id="create_post_article_container">
                <div id="create_post_label">내용</div>
                <textarea id="create_post_content_input" class="create_post_inputs" name="post_content_value" type="text"></textarea>
            </article>

            <input id="create_post_btn" type="submit" value="등록하기">
        </form>
    </main>

    <script>
        var id = "<%=id%>";
        console.log(`작성자는 ${id}입니다`);
    </script>
</body>