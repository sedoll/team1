function invalidCheck(f){
    var id = f.id.value;
    if(id.length>12){
        alert("아이디의 글자수는 12글자 이내입니다.");
        f.id.focus();
        return;
    }

    // 특수문자 제한
    var regex = /^[a-zA-Z0-9]*$/; // 영문 대소문자와 숫자만 허용하는 정규표현식
    if (!regex.test(id)) {
        alert("아이디는 영문 대소문자와 숫자만 사용할 수 있습니다.");
        f.id.focus();
        return false;
    }
}