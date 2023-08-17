function invalidCheck(f){
    var id = f.getElementById("id").value;
    if(id.length>20){
        alert("아이디의 글자수는 20글자 이내입니다.");
        id.focus();
        return false;
    }

    // 특수문자 제한
    var regex = /^[a-zA-Z0-9]*$/; // 영문 대소문자와 숫자만 허용하는 정규표현식
    if (!regex.test(id)) {
        alert("아이디는 영문 대소문자와 숫자만 사용할 수 있습니다.");
        id.focus();
        return false;
    }

    return true;
}