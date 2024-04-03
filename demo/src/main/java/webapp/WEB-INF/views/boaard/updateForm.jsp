<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR" import="java.util.*, my.board.*"%> <%@ include
file="../top.jsp"%> <% request.setCharacterEncoding("EUC-KR"); %>

<!-- login.jsp-->
<link rel="stylesheet" type="text/css" href="../style.css" />

<jsp:useBean id="boarddao" class="my.board.BoardDAO" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty name="boarddao" property="pool" value="<%=pool%>" />

<jsp:useBean id="dto" class="my.board.BoardDTO" />
<jsp:setProperty property="*" name="dto" />

<% int num = Integer.parseInt(request.getParameter("num")); dto =
boarddao.viewBoardPosts(num); %>

<script type="text/javascript">
  function check() {
    if (f.writer.value == "") {
      alert("이름을 입력해 주세요!!");
      f.writer.focus();
      return false;
    }
    if (f.subject.value == "") {
      alert("제목을 입력해 주세요!!");
      f.subject.focus();
      return false;
    }
    if (f.content.value == "") {
      alert("내용을 입력해 주세요!!");
      f.content.focus();
      return false;
    }
    if (f.passwd.value == "") {
      alert("비밀번호을 입력해 주세요!!");
      f.passwd.focus();
      return false;
    }
    return true;
  }
</script>

<% if (isLogin == false) {%>
<script type="text/javascript">
  alert("로그인 해 주세요");
  location.href = "list.jsp";
</script>
<% } %>

<html>
  <head>
    <title>글 쓰기</title>
  </head>
  <body>
    <form
      name="f"
      action="updatePro.jsp?num=<%= dto.getNum() %>"
      method="post"
      onsubmit="return check()"
    >
      <div align="center">
        <table border="1" width="90%">
          <tr bgcolor="lightgray">
            <td colspan="2" align="center">글쓰기</td>
          </tr>
          <tr>
            <td width="15%" align="center">이름</td>
            <td>
              <input
                type="text"
                name="writer"
                value="<%=id%>"
                tabindex="1"
                readOnly
              />
            </td>
          </tr>
          <tr>
            <td width="15%" align="center">제목</td>
            <td>
              <input
                type="text"
                name="subject"
                value="<%=dto.getSubject() %>"
                tabindex="2"
                style="width: 100%"
              />
            </td>
          </tr>
          <tr>
            <td width="15%" align="center">이메일</td>
            <td>
              <input
                type="text"
                name="email"
                value="<%=dto.getEmail() %>"
                tabindex="3"
                style="width: 100%"
              />
            </td>
          </tr>
          <tr>
            <td width="15%" align="center">내용</td>
            <td>
              <textarea
                name="content"
                tabindex="4"
                style="width: 100%"
                rows="15"
              >
<%=dto.getContent()%></textarea
              >
            </td>
          </tr>
          <tr>
            <td width="15%" align="center">비밀번호</td>
            <td>
              <input
                type="password"
                tabindex="5"
                value="<%=dto.getPasswd() %>"
                name="password"
                readOnly
              />
            </td>
          </tr>
          <tr>
            <td colspan="2" align="center">
              <input
                type="hidden"
                name="ip"
                value="<%=request.getRemoteAddr()%>"
              />

              <input type="submit" value="수정" />
              <input
                type="button"
                value="다시 하기"
                onclick="window.location='updateForm.jsp?num=<%= num %>'"
              />
              <input
                type="button"
                value="목록 보기"
                onclick="location.href='<%=request.getContextPath()%>/board/list.jsp';"
              />
            </td>
          </tr>
        </table>
      </div>
    </form>
  </body>
</html>

<%@ include file="../bottom.jsp"%>
