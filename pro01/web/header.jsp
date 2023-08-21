<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path2 = request.getContextPath();
%>
<div class="hd_wrap">
    <nav class="tnb"> <!-- .hd_wrap:first-child  -->
        <ul class="menu">
            <% if(sid!=null) { %>
            <li>안녕하세요,  <%=sname%>님</li> <!-- 로그인 한 회원의 이름 -->
            <li><a href=<%=path2%>"/member/mypage.jsp">마이페이지</a></li>
            <li><a href=<%=path2%>"/member/logout.jsp">로그아웃</a></li>
            <li><a href=<%=path2%>"/help/help.jsp">고객센터</a></li>
                <% if(sid.equals("admin")) {%>
                <li><a href=<%=path2%>"/admin/boardList.jsp">관리자페이지</a></li>
                <% } %>
            <% } else {%>
            <li><a href=<%=path2%>"/member/login.jsp">로그인</a></li>
            <li><a href=<%=path2%>"/member/term.jsp">회원가입</a></li>
            <li><a href=<%=path2%>"/help/help.jsp">고객센터</a></li>
            <% } %>
        </ul>
    </nav>
</div>

<div class="hd_wrap"> <!-- .hd_wrap:first-child  -->
    <a href=<%=path2%>"/index.jsp" class="logo">
        <img src=<%=path2%>"/img/logo.png" alt="">
    </a>
    <nav class="gnb">
        <ul class="menu">
            <li class="item1">
                <a href="" class="dp1">소개</a>
                <ul class="sub">
                    <li><a class="move" href="/menu/company.jsp">소개</a></li>

                </ul>
            </li>
            <li class="item2">
                <a href="" class="dp1">정보</a>
                <ul class="sub">
                    <li><a class="move" href="/information_info/boardList.jsp">입시 정보</a></li>
                    <li><a class="move" href="/board_act/boardList.jsp">대외 활동 정보</a></li>
                    <li><a class="move" href="/file/boardList.jsp">자료실</a></li>
                </ul>
            </li>
            <li class="item3">
                <a href="" class="dp1">QnA</a>
                <ul class="sub">
                    <li><a class="move" href="/qna_problem/qnaList.jsp">문제 QnA</a></li>
                    <li><a class="move" href="/qna_career/qnaList.jsp">진로 상담</a></li>
                </ul>
            </li>
            <li class="item4">
            <a href="" class="dp1">커뮤니티</a>
            <ul class="sub">
                <li><a class="move" href="/board/boardList.jsp">자유 게시판</a></li>
                <li><a class="move" href="/board_stu/boardStuList.jsp">학생 게시판</a></li>
                <li><a class="move" href="/board_tea/boardTeaList.jsp">선생님 게시판</a></li>
            </ul>
        </li>
        </ul>
    </nav>
    <script src="/js/load.js"></script>
</div>