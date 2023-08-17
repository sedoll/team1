<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.vo.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.chunjae.dto.Board" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QNA</title>
    <%@ include file="../head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 플러그인 연결-->
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- datatables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css">
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>

    <!-- 스타일 초기화 -->
    <link rel="stylesheet" href="../css/reset.css">
    <!-- 웹 폰트 -->
    <link rel="stylesheet" href="../css/font.css">

    <!-- css 모듈화 -->
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/hd.css">
    <link rel="stylesheet" href="../css/ft.css">
    <style>
        /* 본문 영역 스타일 */
        .contents {
            clear: both;
            min-height: 150vh;
            background-image: url("../img/login.jpg");
            background-repeat: no-repeat;
            background-position: center -250px;
        }
        .contents::after {
            content: "";
            clear: both;
            display: block;
            width: 100%;
        }

        .page {
            clear: both;
            width: 100vw;
            height: 100vh;
            position: relative;
        }
        .page::after {
            content: "";
            display: block;
            width: 100%;
            clear: both;
        }

        .page_wrap {
            clear: both;
            width: 1200px;
            height: auto;
            margin: 0 auto;

        }
        .page_tit {
            font-size: 48px;
            text-align: center;
            /*padding-top: 0.7em;*/
            color: #fff;
            padding-bottom: 1.3em;
        }

        .breadcrumb {
            clear: both;
            width: 1200px;
            margin: 0 auto;
            text-align: right;
            color: #fff;
            padding-top: 28px;
            padding-bottom: 28px;
        }
        .breadcrumb a {
            color: #fff;

        }

       /* ul */

        .list_university{
            width: 100%;
            margin: 10px auto;
        }

        .uni_info{
            float: left;
            width : 40%;
            height: 120px;
           /* border: 1px solid #b6bfc3;*/
            margin-bottom: 10px;
            margin-left: 5%;
            background-color: #e5edfa;
            box-sizing: border-box;
            box-shadow: 0 14px 28px rgba(0,0,0,0.20), 0 10px 10px rgba(0,0,0,0.15);
        }

        .uni_info .tit{
            color: #35383a;
            font-size: 35px;
            font-weight: bolder;
            margin-top: 40px;
            margin-left: 20px;
            margin-right: 10px;
            float: left;


        }

        .a_group{
            float: left;
            margin-top: 40px;

        }

        .a_tag2{

            display: inline;
            border: none;
            padding: 10px;
            background-color: #4092cd;
            color: whitesmoke;
            font-size: 18px;


        }



        .a_tag {
            box-shadow: 0px 10px 14px -7px #9fb4f2;
            background-color:#7892c2;
            border-radius:3px;
            display:inline-block;
            cursor:pointer;
            color:whitesmoke;
            font-size:18px;
            padding: 10px;
            text-decoration:none;

        }
        .a_tag:hover {
            background:linear-gradient(to bottom, #476e9e 5%, #7892c2 100%);
            background-color:#476e9e;
        }
        .a_tag:active {
            position:relative;
            top:1px;
        }



        /* 기타 버튼 스타일 */
        .inbtn {
            display: block;
            border-radius: 10px;
            min-width: 60px;
            padding-left: 24px;
            padding-right: 24px;
            text-align: center;
            line-height: 38px;
            background-color: #527AF2;
            color: #fff;
            font-size: 18px;
            float: right;
            cursor: pointer;
            transition: background-color 0.3s;

        }
        .inbtn:hover {
            background-color: #666666;
        }

        .btn_group {
            margin-top: -38px;
            z-index: 1000;
            position: relative;
        }
        .btn_group p {
            float: right;

        }




    </style>
</head>

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
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="/">HOME</a> &gt; <a href="/board/baordList.jsp">입시 정보</a></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">입시 정보</h2>



                <!-- board_list -->
                <div class="list_university">
                    <ul id="univListArea" class="list_uni pdAdd">
                        <li>
                            <div class="uni_info">
                                <div class="tit">
                                    <a href="http://www.kaya.ac.kr/Home/Main.mbz" class="name">
                                        가야대학교</a>
                                </div>
                                <div class="a_group">
                                    <a href="" class="a_tag" ><span>대학별 고사</span></a>
                                    <a href="" class="a_tag" ><span>목표대학 설정</span></a>
                                </div>
                            </div>
                        </li>


                        <li>
                            <div class="uni_info">
                                <div class="tit">
                                    <a href="http://www.kaya.ac.kr/Home/Main.mbz" class="name">
                                        가야대학교</a>
                                </div>
                                <div class="a_group">
                                    <a href="" class="a_tag" ><span>대학별 고사</span></a>
                                    <a href="" class="a_tag" ><span>목표대학 설정</span></a>
                                </div>
                            </div>
                        </li>


                        <li>
                            <div class="uni_info">
                                <div class="tit">
                                    <a href="http://www.kaya.ac.kr/Home/Main.mbz" class="name">
                                        가야대학교</a>
                                </div>
                                <div class="a_group">
                                    <a href="" class="a_tag" ><span>대학별 고사</span></a>
                                    <a href="" class="a_tag" ><span>목표대학 설정</span></a>
                                </div>
                            </div>
                        </li>


                        <li>
                            <div class="uni_info">
                                <div class="tit">
                                    <a href="http://www.kaya.ac.kr/Home/Main.mbz" class="name">
                                        가야대학교</a>
                                </div>
                                <div class="a_group">
                                    <a href="" class="a_tag" ><span>대학별 고사</span></a>
                                    <a href="" class="a_tag" ><span>목표대학 설정</span></a>
                                </div>
                            </div>
                        </li>

                        <li>
                            <div class="uni_info">
                                <div class="tit">
                                    <a href="http://www.kaya.ac.kr/Home/Main.mbz" class="name">
                                        가야대학교</a>
                                </div>
                                <div class="a_group">
                                    <a href="" class="a_tag" ><span>대학별 고사</span></a>
                                    <a href="" class="a_tag" ><span>목표대학 설정</span></a>
                                </div>
                            </div>
                        </li>

                        <li>
                            <div class="uni_info">
                                <div class="tit">
                                    <a href="http://www.kaya.ac.kr/Home/Main.mbz" class="name">
                                        가야대학교</a>
                                </div>
                                <div class="a_group">
                                    <a href="" class="a_tag" ><span>대학별 고사</span></a>
                                    <a href="" class="a_tag" ><span>목표대학 설정</span></a>
                                </div>
                            </div>
                        </li>

                        <li>
                            <div class="uni_info">
                                <div class="tit">
                                    <a href="http://www.kaya.ac.kr/Home/Main.mbz" class="name">
                                        가야대학교</a>
                                </div>
                                <div class="a_group">
                                    <a href="" class="a_tag" ><span>대학별 고사</span></a>
                                    <a href="" class="a_tag" ><span>목표대학 설정</span></a>
                                </div>
                            </div>
                        </li>

                        <li>
                            <div class="uni_info">
                                <div class="tit">
                                    <a href="http://www.kaya.ac.kr/Home/Main.mbz" class="name">
                                        가야대학교</a>
                                </div>
                                <div class="a_group">
                                    <a href="" class="a_tag" ><span>대학별 고사</span></a>
                                    <a href="" class="a_tag" ><span>목표대학 설정</span></a>
                                </div>
                            </div>
                        </li>


                    </ul>

                </div>



                <script>
                    $(document).ready( function () {
                        $('#myTable').DataTable({
                            order: [[0, 'desc']], // 0번째 컬럼을 기준으로 내림차순 정렬
                            info: false,
                            dom: 'lt<f>p'

                        });
                    } );
                    $(document).ready(function() {
                        $('.dataTables_paginate').css({
                            'textAlign':'left',
                            'float': 'none',
                            'margin-top':'10px',
                        });
                        $('.dataTables_filter').css({
                            'float': 'left',
                            'margin-top':'14px',
                            'margin-right':'280px'
                        });
                        $('#myTable_paginate').css({
                            'margin-right':'100px'
                        });

                    });



                </script>

            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>