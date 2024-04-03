<!DOCTYPE html>
<html lang="ko">

<head>
    <title>회원가입 페이지</title>

    <link href="signup.css" rel="stylesheet" />
    <script src="signup.js"></script>

</head>

<body>
	<div>
    <div class="wrapper">
        <div class="title"><h1 style="font-size: 21px;">회원가입</h1></div>
        <div class="id">
            <input id="id" type="text" placeholder="아이디를 입력해 주세요.">
            <div id="idError" class="error"></div>
        </div>

		<!-- 패스워드 입력 -->
        <div class="password">
            <input id="password" type="password" placeholder="비밀번호를 입력해 주세요.">
            <div id="passwordError" class="error"></div>
        </div>

        <!-- 패스워드 확인 -->
        <div class="passwordCheck">
            <input id="passwordCheck" type="password" placeholder="비밀번호를 다시 입력해 주세요.">
            <div id="passwordCheckError" class="error"></div>
        </div>

		<!-- 이름 입력 -->        
        <div class="name">
            <input id="name"  type="text" placeholder="이름을 입력해 주세요.">
            <div id="nameError" class="error"></div>
        </div>

		<!-- 닉네임 입력 -->
        <div class="nickname">
            <input id="nickname"  type="text" placeholder="이름을 입력해 주세요.">
            <div id="nicknameError" class="error"></div>
        </div>

		<!-- 이메일 입력 -->
        <div class="email">
            <input id="email" type="text" placeholder="이메일을 입력해 주세요.">
            <div id="emailError" class="error"></div>
        </div>

		<!-- 연락처 입력 -->
        <div class="phone">
            <input id="phone1" type="text" size="1" maxlength="3" oninput="changePhone1()"> -
            <input id="phone2" type="text" size="3" maxlength="4" oninput="changePhone2()"> -
            <input id="phone3" type="text" size="3" maxlength="4" oninput="changePhone3()">

		<!-- 선호지역 선택 -->
        <div class="area">
            <select id="area">
                <option selected disabled>선호지역을 선택하세요.</option>
                <option>서울</option>
                <option>경기도</option>
                <option>강원도</option>
                <option>충청북도</option>
                <option>충청남도</option>
                <option>전라북도</option>
                <option>전라남도</option>
                <option>경상북도</option>
                <option>경상남도</option>
                <option>제주도</option>
            </select>
            <div id="areaError" class="error"></div>
        </div>
        
        <!-- 성별 입력 -->
        <div class="gender">
            <input id="gender_man" type="radio" name="gender">남성  
            <input id="gender_woman" type="radio" name="gender">여성
            <div id="genderError" class="error"></div>
        </div>
        
        <div class="line">
            <hr>
        </div>
        <div class="signUp">
            <button id="signUpButton" disabled onclick="signUpCheck()">가입완료</button>
            <button id="can" disabled onclick="signUpCheck()">가입완료</button>
        </div>
    </div>
</body>

</html>