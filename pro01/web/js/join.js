function inform(frm) {
    var ck_item = frm.getElementById("ck_item").value;
    console.log(ck_item);
    //var ck_item = document.getElementById("ck_item");
    if (ck_item != "yes") {
        alert("아이디 중복 검사를 진행하시기 바랍니다. [" + ck_item+"]");
        ck_item.focus();
        return false;
    }
    var pw = frm.getElementById("pw").value;
    var pw2 = frm.getElementById("pw2").value;

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

    // 약관 동의 확인
    if (!frm.getElementById("ck_item1").checked) {
        alert("약관에 동의하지 않으셨습니다.");
        return false;
    }
}