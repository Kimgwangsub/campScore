<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%> <% request.setCharacterEncoding("EUC-KR"); %>

<!-- content.jsp-->
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css" />

<jsp:useBean id="boarddao" class="my.board.BoardDAO" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty name="boarddao" property="pool" value="<%=pool%>" />

<jsp:useBean id="dto" class="my.board.BoardDTO" />
<jsp:setProperty property="*" name="dto" />

<% if (isLogin == false) {%>
<script type="text/javascript">
  alert("로그인 해 주세요");
  location.href = "list.jsp";
</script>
<% } int num = Integer.parseInt(request.getParameter("num")); dto =
boarddao.viewBoardPosts(num); int co =
Integer.parseInt(request.getParameter("co")); System.out.println(num + "번 글을
불러왔습니다."); System.out.println(co + "번 글을 불러왔습니다."); int res =
boarddao.updateReadcount(dto); if (res > 0){ System.out.println("조회수
업데이트"); }else { System.out.println("조회수 업데이트 실패"); } %>

<html>
  <head>
    <title>글 쓰기</title>
  </head>
  <body>
    <div align="center">
      <table border="1" width="90%">
        <tr bgcolor="lightgray">
          <td colspan="4" align="center">글 내용 보기</td>
        </tr>
        <tr>
          <td width="25%" align="center">글 번호</td>
          <td width="25%" align="center"><%= co+1 %></td>
          <td width="25%" align="center">조회수</td>
          <td width="25%" align="center"><%= dto.getReadcount() %></td>
        </tr>
        <tr>
          <td width="25%" align="center">작성자</td>
          <td width="25%" align="center"><%= dto.getWriter() %></td>
          <td width="25%" align="center">작성일</td>
          <td width="25%" align="center"><%= dto.getReg_date() %></td>
        </tr>
        <tr>
          <td width="25%" align="center">글 제목</td>
          <td colspan="3" align="center"><%= dto.getSubject() %></td>
        </tr>
        <tr>
          <td width="25%" align="center">글 내용</td>
          <td colspan="3" align="center"><%= dto.getContent() %></td>
        </tr>
        <tr>
          <td colspan="4" align="right">
            <input
              type="button"
              value="답글"
              onclick="window.location='writeForm.jsp?num=<%= dto.getNum() %>&re_step=<%=dto.getRe_step() %>&re_level=<%=dto.getRe_level() %>'"
            />&nbsp;&nbsp;&nbsp;
            <input
              type="button"
              value="수정"
              onclick="window.location='updateForm.jsp?num=<%= dto.getNum() %>'"
            />&nbsp;&nbsp;&nbsp;
            <input
              type="button"
              value="삭제"
              onclick="window.location='deleteForm.jsp?num=<%= dto.getNum() %>'"
            />&nbsp;&nbsp;&nbsp;
            <input
              type="button"
              value="목록"
              onclick="window.location='list.jsp'"
            />
          </td>
        </tr>
      </table>
    </div>
  </body>
</html>

<%@ include file="../bottom.jsp"%>
