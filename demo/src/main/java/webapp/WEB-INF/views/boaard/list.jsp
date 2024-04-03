<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.board.*"%>
    
<% request.setCharacterEncoding("EUC-KR"); %>

<%@ include file="../top.jsp"%>
<!-- login.jsp-->
<link rel="stylesheet" type="text/css" href="../style.css">
<!-- find.jsp -->
<jsp:useBean id="boarddao" class="my.board.BoardDAO"/>
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty name="boarddao" property="pool" value="<%=pool%>"/>
<%	
	// List<BoardDTO> list = boarddao.ListBoard();

	int pageSize = 5;
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null){
		pageNum = "1";
		
	}
	int currentPage= Integer.parseInt(pageNum);
	int startRow = (currentPage-1)*pageSize + 1;
	int endRow = startRow + pageSize -1;
	int count = boarddao.getCount();
	if (endRow > count) endRow = count;
	int co = count - startRow+1;
%>
<html>
<head>
	<title>글 목록</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>글 목 록</h2>
		<hr color="green" width="300">
		<table borde="0" width="100%" class="outline">
			<tr>
				
				<td class="m1" colspan="5"></td>
				<td class="m1" align="center"><a href="writeForm.jsp">글쓰기</a></td>
				
			</tr>
			<tr bgcolor="limegreen">
				<th class="m1" width="10%">번호</th>
				<th class="m1" width="30%">제목</th>
				<th class="m1" width="15%">작성자</th>
				<th class="m1" width="20%">작성일</th>
				<th class="m1" width="10%">조회</th>
				<th class="m1" width="20%">ip</th>
			</tr>
<%
	List<BoardDTO> list = boarddao.ListBoard(startRow, endRow);
	if (list == null || list.size() == 0){
%>
			<tr>
				<td colspan="6">글이 등록되어 있지 않습니다.</td>
			</tr>
<%
	}else { 
	for(BoardDTO dto : list){
		
%>
			<tr>
				<td align="center"><%=co--%></td>
			<td>
			<%	if (dto.getRe_level()>0){ %>
				<img src="../img/level.gif" width="<%=dto.getRe_level()*10%>"/>
				<img src="../img/re.gif">	
			<%	} %>
				<a href="content.jsp?num=<%=dto.getNum()%>&co=<%=co %>">
					<%=dto.getSubject()%>
				</a>
			<%	if (dto.getReadcount() > 10){ %>
				<img src="../img/hot.gif">
			<%	} %>	
			</td>
				<td align="center"><%=dto.getWriter()%></td>
				<td align="center"><%=dto.getReg_date()%></td>
				<td align="center"><%=dto.getReadcount()%></td>
				<td align="center"><%=dto.getIp()%></td>
			</tr>
<%			} 
		}%>					
		</table><br>
<%
	if (count>0) {
		int pageBlock=3;
		int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage + pageBlock - 1;
		if (endPage>pageCount) endPage= pageCount;
		if (startPage > pageBlock){%>
		<a href="list.jsp?pageNum=<%=startPage-3%>">[이전]</a>
<%		}
	for (int i=startPage; i<=endPage; ++i){%>
		<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
<%		}
	if (endPage < pageCount){%>
		<a href="list.jsp?pageNum=<%=startPage+3%>">[다음]</a>
<%		}%>	

<%
}
%>	
		
	</div>
</body>
</html>
<%@ include file="../bottom.jsp"%>