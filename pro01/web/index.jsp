<%@ page import="com.chunjae.vo.Qna" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.chunjae.dto.Board" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.chunjae.db.DBC" %>
<%@ page import="com.chunjae.db.MariaDBCon" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="head.jsp"%> <%-- head 영역 호출 --%>
    <!-- 플러그인 연결-->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">
    <!-- 웹 폰트 -->
    <link rel="stylesheet" href="./css/font.css">

    <!-- css 모듈화 -->
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="./css/hd.css">
    <link rel="stylesheet" href="./css/ft.css">
    <link rel="stylesheet" href="./css/change_img.css">
    <link rel="stylesheet" href="./css/slidebox.css">

    <style>
        .img_box li.item1 .bg_box { background-image: url("./img/007.png");

        }
        .img_box li.item2 .bg_box { background-image: url("./img/008.png"); }


        .page {clear: both; width: 100vw; height: 100vh; position: relative;}
        .page::after {content: ""; display: block; width: 100vw; clear: both;}
        .page_wrap { clear: both; width: 1200px; height: auto; margin: 0 auto;}
        .page_tit {font-size: 48px; text-align: center; padding-top: 50px; padding-top: 0.5em;}

        #page2 {height: 400px; background-color: #f5f9fe; background-position: 15vw 75vh;
            background-repeat: no-repeat; padding-top: 100px;}

        .pic_lst {clear: both; width: 1200px; margin: 150px auto;}
        .pic_lst li {width: 280px; height: 400px; margin-left: 26px; float: left; background-repeat: no-repeat;
            background-position: center center; background-size: cover; filter: blur(1px) brightness(80%); box-shadow: 12px 12px 12px #999;}
        .pic_lst li a { display: block; width: 256px; height: 376px; margin: 11px;}
        .pic_lst li a:hover {border: 1px solid #fff; transition: 0.3s;}
        .pic_lst li:first-child {margin-left: 0;} /* 안쪽에만 마진이 있으므로 테두리 부분의 마진 제거*/
        .pic_lst li.item1 { background-image: url("./img/img_social_main01.jpg");}
        .pic_lst li.item2 { background-image: url("./img/img_social_main02.jpg");}
        .pic_lst li.item3 { background-image: url("./img/img_social_main03.jpg");}
        .pic_lst li.item4 { background-image: url("./img/img_social_main04.jpg");}
        .pic_lst li:hover { margin-top: -20px; transition: 0.5s; filter: brightness(105%); } /*호버 후 움직여서 밝기*/
        .pic_com {padding-left: 20px; padding-top: 20px; font-size: 14px;}
        .pic_tit {padding-left: 20px; padding-top: 20px; font-size: 18px;}
        .pic_arrow {display: block; width: 110px; height: 10px; border-bottom: 1px solid white; margin-left: -20px; margin-top: 20px;
            transition: 0.4s; position: relative;}
        .pic_lst li:hover .pic_arrow {margin-left: 20px;}
        .pic_arrow::after {content: ""; width: 10px; height: 10px; position: absolute; right: 0; top: 0; border-bottom: 1px solid white;
            display: block; clear: both; transform-origin: 100% 100%; transform: rotate(45deg); display: none;} /* 화살표 생성 */
        .pic_lst li:hover .pic_arrow::after {display: block;} /*처음엔 안보였다가 호버하면 화살표 생성 */


        .card_lst li.item2 .thumb_box {background-image: url("./img/t1.jpg");}
        .card_lst li.item3 .thumb_box {background-image: url("./img/t2.jpg");}
        .card_lst li.item4 .thumb_box {background-image: url("./img/t3.jpg");}
        .card_lst li.item5 .thumb_box {background-image: url("./img/t4.jpg");}
        .card_lst li.item6 .thumb_box {background-image: url("./img/t5.jpg");}
        .card_lst li.item7 .thumb_box {background-image: url("./img/t6.jpg");}


        .ico.item1 {background-position: -70px -60px;} /*네이버 블로그 아이콘*/
        .ico.item2 {background-position: -140px -120px;} /*인스타 그램 아이콘*/




        /*중간*/
        .board_tit {font-size: 38px; text-align: center;
            padding-top: 50px;
            padding-top: 0.5em;
            margin-bottom: 20px}

        .latest_board{
            width:1000px;
            margin: 0 auto;
        }
        .leftcontent {
            width: 500px;
            height: 700px;
            float: left;

        }
        .rightcontent {
            width: 500px;
            height: 700px;
            display: inline-block;

        }
        .rightcontent table{
            float: right;
        }
        .tb1 {
            font-size: 16px;
            width: 480px;
        }
        .tb1 th {
            font-weight: bold;
            background-color: #dae4f3;
            line-height: 40px;
            border-right: 1px solid white;

        }
        .tb1 td {
            line-height: 34px;
            border-bottom: 1px solid #d2d2d2;
        }
        .tb1 .item1 {
            width: 70%;
            text-align: left;
            padding-left: 20px;

        }
        .tb1 .item2 {
            width: 15%;
            text-align: center;
        }
        .tb1 .item3 {
            width: 15%;
            text-align: center;
        }




/*하단*/

        .flexset {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .boxes {
            width: 100%;
            display: flex;
            gap: 30px;
            justify-content: center;

                > div {
                    box-shadow: 8px 9px 25px 1px rgba(168, 166, 166, 0.75);
                    width: 300px;
                    border-radius: 20px;
                    overflow: hidden;

                    .top {
                        height: 200px;
                        position: relative;

                        .imgBox {
                            position: absolute;
                            bottom: 0;
                            left: 10px;
                            width: 90px;
                            height: 90px;
                        }
                    }

                    .bottom {
                        padding: 30px 20px;
                        display: flex;
                        flex-direction: column;
                        background-color: #ffffff;

                    .description {
                        margin: 10px 0;
                        display: flex;
                        flex-direction: column;
                        gap: 10px;
                    }

                    > button {
                        margin-top: 10px;
                        width: 100px;
                        height: 38px;
                        border: 1px solid #d6d5d6;
                        background: #fff;
                    }
                }

                    .first {
                        background-color: #f4eac0;
                    }

                    .second {
                        background-color: #e3d6ee;
                    }

                    .title {
                        font-size: 30px;
                        font-weight: bold;
                        z-index: 1;
                    }

                    .img {
                        position: absolute;
                        height: 100%;
                    }
                }

                .last {
                    background: #cadbef;
                    line-height: 1.3;
                    position: relative;

                .right {
                    text-align: right;
                    position: absolute;
                    top: 100px;
                }

                .friends {
                    position: absolute;
                    bottom: 0;
                    width: 100%;
                    height: 45%;
                }
            }
        }












    </style>
</head>
<body>
<header class="hd" id="hd">
    <%@include file="header.jsp"%>
</header>

<div class="contents">
    <figure class="vs">
        <ul class="img_box">
            <li class="item1 active">
                <input type="radio" name="vs_ra" id="vs_ra1" class="vs_ra" checked>
                <div class="bg_box"></div>
<%--                <h2 class="vs_tit">“나눔의 힘! 실천의 힘!”<br>--%>
<%--                    <strong>작은 따뜻함으로 세상을 <br>바꿉니다</strong>--%>
<%--                </h2>--%>
            </li>
            <li class="item2">
                <input type="radio" name="vs_ra" id="vs_ra2" class="vs_ra">
                <div class="bg_box"></div>
<%--                <h2 class="vs_tit">교육에 대한 끊임없는 도전<br>--%>
<%--                    <strong>행복한 내일을 함께 합니다</strong></h2>--%>
            </li>
        </ul>
        <ul class="btn_box">
            <li class="item1 active"><label for="vs_btn1" class="vs_btn"></label></li>
            <li class="item2"><label for="vs_btn2" class="vs_btn"></label></li>
        </ul>
        <button type="button" class="play_btn"></button>
    </figure>
    <script src="./js/rotation.js"></script>




    <%
        request.setCharacterEncoding("utf8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("utf8");

        List<Board> boardList = new ArrayList<>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DBC con = new MariaDBCon();
        conn = con.connect();
        if(conn != null){
            System.out.println("DB 연결 성공");
        }

        // 해당 회원의 정보를 db에서 가져옴
        try {
            String sql = "select * from board where lev=0 order by par desc";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Board board = new Board();
                board.setPar(rs.getInt("par"));
                board.setCnt(rs.getInt("cnt"));
                board.setTitle(rs.getString("title"));
                board.setAuthor(rs.getString("author"));
                board.setResdate(rs.getString("resdate"));
                boardList.add(board);
            }
        } catch(SQLException e) {
            System.out.println("SQL 구문이 처리되지 못했습니다.");
        } finally {
            con.close(rs, pstmt, conn);
        }
    %>
    <div class="page_wrap">
        <div class="latest_board">
            <div class="leftcontent">
                <h2 class="board_tit">자유게시판</h2>
                <table class="tb1" id="myTable">
                    <thead>
                    <tr>
                        <th class="item1" style="text-align: center">제목</th>
                        <th class="item2" style="text-align: center">작성자</th>
                        <th class="item3" style="text-align: center">작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        int tot = boardList.size();
                        SimpleDateFormat ymd = new SimpleDateFormat("yy-MM-dd");
                        int count = 0;
                        for(Board arr:boardList) {
                            if(count++ >= 15) break;
                            Date d = ymd.parse(arr.getResdate());  //날짜데이터로 변경
                            String date = ymd.format(d);    //형식을 포함한 문자열로 변경
                    %>
                    <tr>
                        <td class="item1"><a href="/board/getBoard.jsp?bno=<%=arr.getPar() %>"><%=arr.getTitle() %></a></td>
                        <td class="item2"><%=arr.getAuthor()%></td>
                        <td class="item3"><%=date %></td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>

            <%
                List<Qna> qnaList = new ArrayList<>();

                conn = con.connect();
                if(conn != null){
                    System.out.println("DB 연결 성공");
                }

                // 해당 회원의 정보를 db에서 가져옴
                try {
                    String sql = "select * from qna_problem where lev=0 order by par desc";
                    pstmt = conn.prepareStatement(sql);
                    rs = pstmt.executeQuery();
                    while(rs.next()){
                        Qna q = new Qna();
                        q.setPar(rs.getInt("par"));
                        q.setTitle(rs.getString("title"));
                        q.setAuthor(rs.getString("author"));
                        q.setResdate(rs.getString("resdate"));
                        qnaList.add(q);
                    }
                } catch(SQLException e) {
                    System.out.println("SQL 구문이 처리되지 못했습니다.");
                } finally {
                    con.close(rs, pstmt, conn);
                }
            %>

            <div class="rightcontent">
                <h2 class="board_tit">문제 QNA</h2>
                <table class="tb1">
                    <thead>
                    <tr>
                        <th class="item1" style="text-align: center">제목</th>
                        <th class="item2" style="text-align: center">작성자</th>
                        <th class="item3" style="text-align: center">작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%

                        count = 0;
                        for(Qna arr:qnaList) {
                            if(count++ >= 15) break;
                            Date d = ymd.parse(arr.getResdate());  //날짜데이터로 변경
                            String date = ymd.format(d);    //형식을 포함한 문자열로 변경
                    %>
                    <tr>
                        <td class="item1"><a href="getQna.jsp?qno=<%=arr.getPar() %>"><%=arr.getTitle() %></a></td>
                        <td class="item2"><%=arr.getAuthor()%></td>
                        <td class="item3"><%=date %></td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>

    </div>





    <section class="page" id="page2">
        <div class="page_wrap">
            <%--<h2 class="page_tit">페이지 제목2</h2>
            <p class="page_com">페이지 설명</p>--%>


            <div class="boxes">
                <div>
                    <div class="top first flexset">
                        <div class="imgBox">
                            <img src="./img/main_bottom_1.png" alt="" class="img" />
                        </div>
                        <a class="title"> 공지사항 </a>
                    </div>
                    <div class="bottom">
                        <ul class="description">
                            <li>테스트 중입니다 1</li>

                        </ul>
                        <button class="flexset" onclick="">자세히 보기 </button>
                    </div>
                </div>
                <div>
                    <div class="top second flexset">
                        <div class="imgBox">
                            <img src="./img/main_bottom_2.png" alt="" class="img" />
                        </div>
                        <a class="title"> 입시뉴스 </a>
                    </div>
                    <div class="bottom">
                        <ul class="description">
                            <li>테스트 중입니다 1</li>

                        </ul>
                        <button class="flexset" onclick="location.href=''">자세히 보기 </button>
                    </div>
                </div>
                <div class="last flexset">
                    <a href="./member/term.jsp" class="title right">
                        저희의 <br />
                        친구가 되어주세요!
                    </a>
                    <div class="friends flexset">
                        <img src="./img/main_bottom_3.png" alt=""class="img"  />
                    </div>
                </div>
            </div>




        </div>
    </section>
    <script src="./js/slidebox.js"></script>
</div>

<footer class="ft" id="ft">
    <%@include file="footer.jsp"%>
</footer>
<a href="#" class="totop">위</a>
</body>
</html>
