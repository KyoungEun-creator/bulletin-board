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