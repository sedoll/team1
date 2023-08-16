function inform(frm){
    var ck_item = frm.ck_item;
    //var ck_item = document.getElementById("ck_item");
    if(ck_item.value!="yes"){
        alert("아이디 중복 검사를 진행하시기 바랍니다.");
        frm.id.focus();
        return false;
    }
    var pw = frm.pw.value;
    var pw2 = frm.pw2.value;

    // 비밀번호 특수문자 제한
    var regex = /^[a-zA-Z0-9]*$/; // 영문 대소문자와 숫자만 허용하는 정규표현식
    if (!regex.test(pw)) {
        alert("비밀번호는 영문 대소문자와 숫자만 사용할 수 있습니다.");
        return false;
    }

    if(pw!=pw2){
        alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
        return false;
    }
    
    // 약관 동의 확인
    if(!frm.ck_item1.checked) {
        alert("약관에 동의하지 않으셨습니다.");
        return false;
    }
}
function idcheck(){
    var child;
    var id = document.getElementById("id");
    if(id.value!="") {
        child = window.open("idcheck.jsp?id="+id.value, "child", "width=600, height=400");
        return false;
    } else {
        alert("아이디 입력란에 아이디를 입력하고, 진행하시기 바랍니다.");
        id.focus();
        return false;
    }
}