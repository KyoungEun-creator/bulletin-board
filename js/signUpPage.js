const signUpBtn = document.querySelector('.confirm_btn');

const userId = document.querySelector('#userId').value;
const userPw = document.querySelector('#userPw').value;
const userName = document.querySelector('#userName').value;
const userEmail = document.querySelector('#userEmail').value;
const userBirthday = document.querySelector('#userBirthday').value;
const userPhoneNumber = document.querySelector('#userPhoneNumber').value;
const userAddress = document.querySelector('#userAddress').value;

// signUpBtn.addEventListener('click', function () {
//     if (!userId) {
//         alert('아이디를 입력하세요')
//         document.querySelector('#userId').focus();
//     } else if (!userPw) {
//         alert('비밀번호를 입력하세요')
//         document.querySelector('#userPW').focus();
//     }
//     else if (!userName) {
//         alert('이름(본명)을 입력하세요')
//         document.querySelector('#userName').focus();
//     }
//     else if (!userEmail) {
//         alert('이메일을 입력하세요')
//         document.querySelector('#userEmail').focus();
//     }
//     else if (!userBirthday) {
//         alert('생일을 입력하세요')
//         document.querySelector('#userBirthday').focus();
//     }
//     else if (!userPhoneNumber) {
//         alert('휴대폰 번호를 입력하세요')
//         document.querySelector('#userPhoneNumber').focus();
//     }
//     else if (!userAddress) {
//         alert('주소를 입력하세요')
//         document.querySelector('#userAddress').focus();
//     }
    
//     if (userPw.length < 6) {
//         alert('비밀번호는 최소 6자리 이상입니다')
//         userPw = '';
//         document.querySelector('#userPw').focus();
//         return;
//     }

//     let regEx = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
//     if (!regEx.test(userEmail)) {
//         alert('이메일이 형식에 맞지 않습니다');
//         userEmail = '';
//         document.querySelector('#userEmail').focus();
//     }

// })
