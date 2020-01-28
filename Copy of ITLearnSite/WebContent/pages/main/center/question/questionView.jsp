<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%--JSTL CORE라이브러리 태그들 사용을 위한 선언 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<c:set var="email" value="${sessionScope.email}"></c:set>
<c:set var="ques_no" value="${requestScope.ques_no}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<%
	request.setCharacterEncoding("UTF-8");
	String email = (String)session.getAttribute("email"); 
%>

</head>
<body>

	<div class="site-section ftco-subscribe-1 site-blocks-cover pb-4" style="background-image: url('../images/bg_1.jpg')">
		<div class="container">
			<div class="row align-items-end justify-content-center text-center">
				<div class="col-lg-7">
					<h2 class="mb-0">고객센터</h2>
					<p>Customer Service Center</p>
				</div>
			</div>
		</div>
	</div>

	<div class="custom-breadcrumns border-bottom">
		<div class="container">
			<a href="${path}/index.do">Home</a> <span class="mx-3 icon-keyboard_arrow_right"></span> <span class="current">고객센터</span>
		</div>
	</div>


	<div class="container mt-5 mb-5">
		<h1>고객센터</h1>
		<form action="questionModify.ques" method="post">
			<table class="table table-striped" style="text-align: center;">
				<tr>
					<td>번호</td>
					<td><input type="text" name="ques_no" class="form-control" value="${qBean.ques_no}" readonly></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="ques_title" class="form-control" value="${qBean.ques_title}" readonly></td>
				</tr>
				<tr>
					<td>글쓴이</td>
					<td><input type="text" name="ques_email" class="form-control" value="${qBean.ques_email}" readonly></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><input type="text" name="ques_writedate" class="form-control" value="${qBean.ques_writedate}" readonly></td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="ques_content" class="form-control" readonly rows="10" cols="120">${qBean.ques_content}</textarea></td>
				</tr>
			</table>
			<div class="text-right">
				<input type="button" value="목록으로" class="btn btn-color1" onclick="location.href='questionList.ques'"> 
				
			<c:if test="${ email == qBean.ques_email }">
				<input type="submit" class="btn btn-color1" value="수정"> 
			</c:if>
			<c:if test="${ email == 'admin@admin.com' }">
				<input type="button" class="btn btn-color1" value="삭제" onclick="location.href='questionDelete.ques?ques_no=${qBean.ques_no}'">
				<input type="button" class="btn btn-color1" value="답글" onclick="location.href='questionReply.ques?ques_no=${qBean.ques_no}'">
			</c:if>
				
			</div>
		</form>
	</div>
	<script src="${path}/js/jquery-3.3.1.min.js"></script>
	<%-- <script src="${path}/js/makejs/resourceView.js"></script> --%>
</body>
</html>
