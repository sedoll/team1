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
  <title>고객센터</title>
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
      min-height: 100vh;
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

    /* 테이블 스타일 */
    .tb1 {
      width: 300px;
      margin: 50px auto;
      font-size: 20px;
      border-collapse: collapse;
    }
    .tb1 th {
      background-color: #527AF2;
      color: #fff;
      padding: 16px;
      border: 1px solid #527AF2;

    }
    .tb1 td {
      padding: 12px 16px;
      border: 1px solid #ddd;
      text-align: center;
      line-height: 24px;

    }
    .tb1 th:first-child {
      width: 40px;
    }

    .tb1 tbody {

    }

    .tb1 .item1 {
      width: 12%;
    }
    .tb1 .item2 {
      width: 58%;

      text-align: left;
    }
    .tb1 .item3 {
      width: 15%;
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


    .content {
      width: 900px;
      margin: 0 auto;
      margin-bottom: 80px;
    }
    .helpmenu {
      width: 250px;
      border-right: 1px solid #e0e0e0;
      padding: 20px 0;
      display: inline-block;
      float: left;
    }

    .helpmenu ul {
      list-style-type: none;
      padding-left: 0;
      margin: 0;
    }

    .helpmenu ul li {
      margin-bottom: 15px;
      line-height: 40px;
    }

    .helpmenu ul li a {
      display: block;
      text-decoration: none;
      padding-left: 30px;
      font-size: 22px;
      font-weight: bold;
    }

    #selectedmenu {
      background-color: #527AF2;

      border-radius: 5px;
    }
    #selectedmenu a {
      color: white;
    }


    .helpcontent {
      width: 600px;
      padding: 20px;
      background-color: #ffffff;
      border-left: 1px solid #e0e0e0;
      display: inline-block;
      float: left;
    }
  .faqlist {
    margin-left: 20px;
    margin-top: 20px;
  }
    .faqlist li{
      margin-bottom: 40px;
      padding-bottom: 20px;
      border-bottom: 1px solid gray;
    }
    .faqlist li:last-child{
      margin-bottom: 180px;
    }
    .ans {
      display: none;


    }
    .ans pre{
      width: 550px;
      margin-top: 20px;
      margin-left: 10px;
      white-space: pre-wrap;
    }
  .que{
    font-size: 20px;
    font-weight: bold;
    cursor: pointer;

  }



  </style>
  <script>
    $(document).ready(function() {
      $(".que").click(function() {
        // 현재 클릭된 .que 요소의 다음 .ans 요소를 토글
        $(this).next(".ans").toggle();
      });
    });
  </script>
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
      <p><a href="/">HOME</a> &gt; <a href="./help.jsp">고객센터</a></p>
    </div>
    <section class="page" id="page1">
      <div class="page_wrap">
        <h2 class="page_tit">고객센터</h2>

        <div class="content">
            <div class="helpmenu">
                <ul>
                  <li><a href="help.jsp">공지사항</a></li>
                  <li id="selectedmenu"><a href="./helpFAQ.jsp">FAQ</a></li>
                  <%-- <li><a href="helpQuestion.jsp">문의하기</a></li> --%>
                </ul>
            </div>
            <div class="helpcontent">
              <ul class="faqlist">
                <li>
                  <div class="que" >정보를 수정하고 싶어요.</div>
                  <div class="ans">
                  <pre>회원정보를 수정 하시려면,

로그인 후 '정보수정 > 개인정보수정' 메뉴를 통해 하실 수 있습니다.
                  </pre>
                  </div>
                </li>
                <li>
                  <div class="que" >이미 가입된 학습생이라고 나와요.</div>
                  <div class="ans">
                  <pre>우선 이전에 가입한 천재교육이나 밀크T 계정이 있는지 확인해 주세요.

가입이력이 다면 아래 밀크T 고객센터로 문의해 주시거나

1:1 친절 상담에 글을 남겨주시면 확인을 통해 해결 하실 수 있습니다
                  </pre>
                  </div>
                </li>
                <li>
                  <div class="que" >등록한 아이디를 변경 할 수 있을까요?</div>
                  <div class="ans">
                  <pre>최초 가입한 아이디는 변경하실 수 없습니다.

탈퇴 후 다시 가입을 할때 아이디를 변경하여 가입할 수는 있지만,

이전 아이디의 '나의 포인트/등급, 학습정보, 친구목록 등'이 모두 사라지게 됩니다
                  </pre>
                  </div>
                </li>
                <li>
                  <div class="que" >비밀번호를 변경하고 싶어요</div>
                  <div class="ans">
                  <pre>비밀번호를 변경 하시려면, 로그인 후

'정보수정 > 개인정보수정' 메뉴를 통해 하실 수 있습니다.
                  </pre>
                  </div>
                </li>
              </ul>

            </div>
        </div>



      </div>
    </section>
  </div>


  <footer class="ft" id="ft">
    <%@ include file="../footer.jsp" %>
  </footer>
</div>
</body>
</html>