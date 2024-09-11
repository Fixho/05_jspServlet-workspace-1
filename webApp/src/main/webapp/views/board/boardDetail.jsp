<%@ page import="java.util.Map" %>
<%@ page import="com.br.web.board.model.vo.Board" %>
<%@ page import="com.br.web.board.model.vo.Attachment" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, Object> map = (Map<String, Object>)request.getAttribute("map");
	Board b = (Board)map.get("b"); // 게시글번호, 카테고리명, 제목, 내용, 작성자아이디
	Attachment at = (Attachment)map.get("at"); // null(첨부파일이 없을경우) | 파일번호,원본명,수정명,저장경로 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#reply-area span{
		color: gray;
		cursor: pointer;
	}
</style>
</head>
<body>
	<div class="container p-3">

    <!-- Header, Nav start -->
    <%@ include file="/views/common/header.jsp" %>
    <!-- Header, Nav end -->

    <!-- Section start -->
    <section class="row m-3" style="min-height: 500px;">
      <div class="container border m-4 p-5 rounded">

        <h2 class="m-4">일반게시글 상세조회</h2>

        <div class="d-flex justify-content-end">
          <% if(loginUser != null && loginUser.getUserId().equals(b.getBoardWriter())) { %>
          <a href="<%= contextPath %>/modify.bo?no=<%= b.getBoardNo() %>" class="btn btn-secondary btn-sm">수정하기 페이지로</a> &nbsp;
          <button type="button" class="btn btn-danger btn-sm">삭제하기</button> &nbsp;
          <% } %>
          <a href="<%= contextPath %>/list.bo" class="btn btn-warning btn-sm">목록가기</a>
        </div>

				<br>
        <table class="table">
          <tr>
            <th width="100px">카테고리</th>
            <td><%= b.getCategory() %></td>
          </tr>
          <tr>
            <th>제목</th>
            <td><%= b.getBoardTitle() %></td>
          </tr>
          <tr>
            <th>내용</th>
            <td><p style="min-height:200px; white-space:pre;"><%= b.getBoardContent() %></p></td>
          </tr>
          <tr>
            <th>첨부파일</th>
            <td>
            	<% if(at == null) { %>
	              <!-- case1. 첨부파일이 존재하지 않을 경우 -->
	              첨부파일이 없음
              <% }else { %>
	              <!-- case2. 첨부파일이 존재할 경우 -->
	              <a download="<%= at.getOriginName() %>" href="<%= contextPath + at.getFilePath() + at.getChangeName() %>" style="color: black"><%= at.getOriginName() %></a>
              <% } %>
            </td>
          </tr>
        </table>
        <br><br>
        
        <table id="reply-area" class="table">
        	<thead>
        		<tr>
        			<th style="vertical-align:middle">댓글작성</th>
        			<th width="650px"><textarea rows="3" class="form-control" style="resize:none;"></textarea></th>
        			<th style="vertical-align:middle"><button class="btn btn-secondary">댓글등록</button></th>
        		</tr>
        	</thead>
        	<tbody>
        		<!-- case1. 댓글이 없을 경우 
        		<tr>
        			<td colspan="3">존재하는 댓글이 없습니다.</td>
        		</tr>
        		-->
        		
        		<!-- case2. 댓글이 존재할 경우 -->
        		<tr>
        			<th>user01</th>
        			<td>댓글내용입니다~~~ <span>x</span></td>
        			<td>24/08/21 10:00</td>
        		</tr>
        		<tr>
        			<th>user01</th>
        			<td>댓글내용입니다~~~</td>
        			<td>24/08/21 10:00</td>
        		</tr>
        		<tr>
        			<th>user01</th>
        			<td>댓글내용입니다~~~</td>
        			<td>24/08/21 10:00</td>
        		</tr>
        	</tbody>
        </table>
        
        <script>
        	
        	// 현재 게시글의 댓글 목록 조회용 함수
        	function fnReplyList() {
        		
        		$.ajax({
        			url: '<%=contextPath%>/list.re',
        			data: {no: <%=b.getBoardNo()%>},
        			success: function(res){
        				console.log(res);
        			},
        			error: function(){
        				console.log('댓글 목록 조회용 ajax 통신 실패');
        			}
        		})
        		
        	}
        </script>
        

      </div>
    </section>
    <!-- Section end -->

    <!-- Footer start -->
    <%@ include file="/views/common/footer.jsp" %>
    <!-- Footer end -->

  </div>
</body>
</html>