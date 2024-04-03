<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>

<jsp:useBean id="boarddao" class="my.board.BoardDAO" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty name="boarddao" property="pool" value="<%=pool%>" />

<jsp:useBean id="boarddto" class="my.board.BoardDTO" />
<jsp:setProperty property="*" name="boarddto" />

<% int num = Integer.parseInt(request.getParameter("num")); int res =
boarddao.deleteBoard(num, boarddto.getPasswd()); if (res > 0){%>
<script type="text/javascript">
  alert("삭제 성공 : 게시판으로 돌아갑니다");
  location.href = "list.jsp";
</script>
<% }else {%>
<script type="text/javascript">
  alert("삭제 실패 : 비밀번호를 다시 입력해 주세요");
  location.href = "list.jsp";
</script>
<% } %>
