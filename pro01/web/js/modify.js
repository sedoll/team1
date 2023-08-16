function inform(frm) {
    var pw = frm.new_pw1.value;
    var pw2 = frm.new_pw2.value;

    // 비밀번호 특수문자 제한
    var regex = /^[a-zA-Z0-9]*$/; // 영문 대소문자와 숫자만 허용하는 정규표현식
    if (!regex.test(pw)) {
        alert("비밀번호는 영문 대소문자와 숫자만 사용할 수 있습니다.");
        return false;
    }

    if (pw != pw2) {
        alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
        return false;
    }
}