<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR" import="java.util.*, my.board.*"%> <%@ include
file="../top.jsp"%>
<!-- login.jsp-->
<link rel="stylesheet" type="text/css" href="../style.css" />
<jsp:useBean id="boarddao" class="my.board.BoardDAO" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty name="boarddao" property="pool" value="<%=pool%>" />

<% int num = Integer.parseInt(request.getParameter("num")); // List<BoardDTO>
  list = boarddao.ListBoard(); %>
  <html>
    <head>
      <title>글 삭제</title>
    </head>
    <body>
      <form name="f" method="POST" action="deletePro.jsp?num=<%=num %>">
        <div align="center">
          <hr color="green" width="300" />
          <h2>글 삭제</h2>
          <hr color="green" width="300" />
          <table borde="0" width="100%" class="outline">
            <tr>
              <td align="center">비밀번호를 입력해 주세요</td>
            </tr>
            <tr>
              <td align="center">
                비밀번호 : <input type="password" name="passwd" />
              </td>
            </tr>
            <td align="center">
              <input type="submit" value="삭제" />
              <input
                type="button"
                value="글목록"
                onclick="window.location='list.jsp'"
              />
            </td>
          </table>
        </div>
      </form>
    </body>
  </html>
  <%@ include file="../bottom.jsp"%></BoardDTO
>
