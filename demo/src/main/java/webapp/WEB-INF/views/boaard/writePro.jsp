<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%> <% request.setCharacterEncoding("EUC-KR"); %>

<jsp:useBean id="boarddao" class="my.board.BoardDAO" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty name="boarddao" property="pool" value="<%=pool%>" />

<jsp:useBean id="boarddto" class="my.board.BoardDTO" />
<jsp:setProperty property="*" name="boarddto" />

<% if (boarddto.getWriter() == null || boarddto.getWriter().trim().equals("")){
response.sendRedirect("list.jsp"); return; } int res =
boarddao.UpdateBoard(boarddto); if (res > 0){%>
<script type="text/javascript">
  alert("업데이트 성공 :게시판으로 이동합니다");
  location.href = "list.jsp";
</script>
<% }else {%>
<script type="text/javascript">
  alert("업데이트 실패 : 다시 입력해 주세요");
  location.href = "writeForm.jsp";
</script>
<% } %>
