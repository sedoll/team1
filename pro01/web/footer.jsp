<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<div class="ft_wrap">
    <nav class="ft_link">
        <ul class="fnb">
            <li class="ft_logo"></li>
            <li><a href="">제휴 문의</a></li>
            <li><a href="">이메일 무단 수집 거부</a></li>
        </ul>
        <ul class="snb">
            <li class="item1"><a href="">소셜1</a></li>
            <li class="item2"><a href="">소셜2</a></li>
            <li class="item3"><a href="">소셜3</a></li>
            <li class="item4"><a href="">소셜4</a></li>
            <li class="item5"><a href="">소셜5</a></li>
            <li class="locate">
                <select name="sel" id="sel" onchange="loc()">
                    <option value="">FAMILY LINK</option>
                    <option value="https://chunjaetext.co.kr/">천재교과서</option>
                    <option value="http://www.milkt.co.kr/Main/Main_new">밀크T</option>
                    <option value="http://www.prinpia.co.kr/">프린피아</option>
                    <option value="http://www.edumon.co.kr/intro/index.asp">에듀몬</option>
                </select>
            </li>
        </ul>
    </nav>
    <script>
        function loc(){
            var url = document.getElementById("sel").value;
            //location.href = url;  //현재 창에
            if(url!="") {
                var win = window.open(url); //새창에
            }
        }
    </script>
</div>
<div class="ft_wrap2">
    <p class="copyright">
        <span>(주)천재교육</span>
        <span>서울시 금천구 가산로9길 54</span>
        <span>대표자 강희철</span>
        <span>사업자등록번호 119-81-19350</span>
        <span>통신판매신고번호 제18-439호</span>
        <span class="end">부가통신사업신고 016712</span>
    </p>
    <p class="copyright">
        <span>천재교육 1577-0902</span>
        <span>리틀천재 1577-0218</span>
        <span>월간우등생학습 1577-6226</span>
        <span>밀크T초등 1577-1533</span>
        <span>밀크T중학 1522-5533</span>
        <span class="end">밀크T고등 1522-5533</span>
    </p>
    <p class="cp">COPYRIGHT 1981-2023 CHUNJAE EDUCATION INC. ALL RIGHTS RESERVED.</p>
</div>