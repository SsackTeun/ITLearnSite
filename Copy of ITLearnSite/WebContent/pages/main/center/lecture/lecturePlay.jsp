<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="lecBean" value="${lec_DetailMap.lec_Detail }" />
<c:set var="lec_list" value="${lec_DetailMap.lec_list }" />
<c:set var="email" value="${sessionScope.email}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>4분할</title>
<style>
html, body {
	height: 100%;
	padding: 0;
	margin: 0;
}

.div {
	width: 49.7%;
	height: 49.7%;
	float: left;
	border: 1px solid red;
}
</style>
<%--${path }/pages/main/center/lecture/temp/${listBean.list_savefile} --%>
<script src="${path}/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	function play(list_no, lec_no, list_savefile) {
		
		document.getElementById("lecture").setAttribute("src", "${path }/pages/main/center/lecture/temp/" + list_savefile);
		document.getElementById("list_no").setAttribute("value", list_no );
		document.getElementById("lec_no").setAttribute("value", lec_no );
		cmtlist();	
		
	}
	
	function deleteComment(addr)
	{
		var question = confirm("댓글을 삭제 할까요?");
		if(question == true){
			/*네 삭제합니다*/
			$.ajax({
				type : "post",
				url : addr,
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				dataType : "text",
				success : function(getData) {
					if(getData == 0)
					{
						alert('본인 글만 지울수 있습니다');
					}
					cmtlist();
				},
				error : function(request,status,error){
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
					console.log(error);
				}
			});
		}
		/* 페이지 요청시 댓글을 불러온다.*/
	}
	function cmtlist()
	{
		var url = "commentsList.lec";
		var list_no = $("#list_no").val();
		var lec_no = $("#lec_no").val();
		var addr ="";
		
		var form_data = {
				list_no : list_no,
				lec_no : lec_no
		}
		
		$.ajax({
			type : "post",
			url : url,
			data : form_data,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			dataType : "json",
			success : function(getData) {
				var string ="";
				
				/* 
				<table class="table">
					<tbody id="cmt">

					</tbody>
				</table>
				 */
				 string = "<table class='table'><tbody id='cmt'>"
				for (var i = 0; i < getData.list.length; i++) {
					addr = "commentsDelete.lec?co_no="+getData.list[i].co_no;
					var comments = 
						"<tr>"
						+ 	"<td width='10%'>"+getData.list[i].co_email+"</td>"
						+		"<td width='60%'>"+getData.list[i].co_content+"</td>"
						+ 		"<td width='10%'>"+getData.list[i].co_date+"</td>"
						+		"<td width='17%'>" 
						+			"<button onclick='deleteComment("+'"'+addr+'"'+");'" +">삭제</button>" 
						+		"</td>"
						+ 	"</tr>";
					
					string = string + comments;
				}
				string += "</tbody></table><button onclick='cmtlist();'" +">새로고침</button>"
				$("#comments").html(string);
			},
			error : function(request,status,error){
				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				console.log(error);
			}
		});
		/* 페이지 요청시 댓글을 불러온다.*/
	}


	function comments(){
		
		var url = "commentsWrite.lec";
		
		var list_no = $("#list_no").val();
		var lec_no = $("#lec_no").val();
		var co_email = $("#co_email").val();
		var content = $("#content").val();
		
		var form_data = {				
				list_no : list_no,
				lec_no : lec_no,
				co_email : co_email,
				content : content,
		}
		$.ajax({
			type : "post",
			url : url,
			data : form_data,
			dataType : "text",
			success : function(getData) {
				if(getData == 1)
				{
					$("#content").val("");
					cmtlist();
				}
			}
		});
		
	}

</script>
</head>
<body>
	<div id="d1" class="div">
		<iframe frameborder="0" id="lecture" name="lecture"
			<%-- src="${path }/pages/main/center/lecture/temp/${lecBean.lec_spofile }" --%>
			style="width: 100%; height: 100%; background-color: black;"></iframe>
	</div>
	<div id="d2" class="div">
		<table class="table-striped">
			<thead>
				<tr class="tb_head">
					<td>번호</td>
					<td>목차</td>

				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${lec_list == null}">

						<tr align="center">
							<td colspan="4"><p>
									<b><span style="font-size: 9pt;">등록된 강의가 없습니다.</span></b>
								</p></td>
						</tr>
					</c:when>
					<c:when test="${lec_list != null}">
						<c:forEach var="listBean" items="${lec_list }">
							<tr align="center">
								<td width="30%">${listBean.list_no }</td>
								<%--${path }/pages/main/center/lecture/temp/${listBean.list_savefile} --%>
								<td width="70%"><a href="javascript:void(0);"
									onclick="play(${listBean.list_no }, ${listBean.lec_no }, '${listBean.list_savefile }');">${listBean.list_titleStr }</a></td>
							<tr>
						</c:forEach>
					</c:when>
				</c:choose>
				<tr class="tb_head" align="center">
					<td colspan="4">&nbsp;&nbsp;&nbsp;</td>
				</tr>
			</tbody>
		</table>

	</div>
	<div id="d3" class="div">
		강의명 : ${lecBean.lec_title }</br> 강의 내용 : ${lecBean.lec_content }
	</div>
	<div id="d4" class="div">

		<div>
			<span>
				<h5>댓글</h5>
			</span>
			<div class='row' id="comments">
				
			</div>
		</div>
		<hr>
		<form>
			<!-- co_no ? autoincrements? 로직 생각해보기-->
			<!-- 현재 글에 comments table을 조회해서 코멘트 순서 번호를 가져와야함 select  -->
			<input type="hidden" id="list_no" name="list_no" value=""/> <input
				type="hidden" id="lec_no" name="lec_no" value=""/> <input
				type="hidden" id="co_email" name="co_email" value="${email}"/>
			<textarea id="content" name="content" placeholder="바르고 고운말"
				cols="130" rows="3" style="resize: none"></textarea>
			<input type="button" id="commentWrite" name="commentWrite"
				value="댓글 작성" onclick="comments();">
		</form>

	</div>
</body>
</html>