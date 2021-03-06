<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--JSTL CORE라이브러리 태그들 사용을 위한 선언 --%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>     
<c:set var="path" value="${pageContext.request.contextPath}"></c:set> 
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${path}/css/member.css" rel="stylesheet"> 
<link href="${path}/css/create.css" rel="stylesheet"> 
<title>회원관리</title>
</head>
<style>
 @font-face { font-family: 'NIXGONM-Vb'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/NIXGONM-Vb.woff') format('woff'); font-weight: normal; font-style: normal; }
h3{
font-family: 'NIXGONM-Vb';}
</style>

<div class="container">
	<div class="row align-items-end justify-content-center text-center">			
			<img src="${path }/images/admin2.png">			
	</div>
</div>

    <div class="custom-breadcrumns border-bottom">
      <div class="container">
        <a href="index.jsp">Home</a>
        <span class="mx-3 icon-keyboard_arrow_right"></span>
        <span class="current">관리자</span>
        <span class="mx-3 icon-keyboard_arrow_right"></span>
        <span class="current">주문 관리</span>
      </div>
    </div>
	
	
	<center>	
		<div class="pagemargin">
		<div class="content">
		<div class="row row_padding">
		<div class="check_left">
		<h3>결제 전</h3>
		<table class="table before">
			<c:set var="j" value="0"/>
			<c:forEach  var="paymentList"   items="${requestScope.paymentlist}"	>
			<c:if test="${paymentList.pay_option==0}">
			<tr class="tb_head">
				<td colspan="5">주문번호 : ${paymentList.pay_no}</td>
			</tr>
			<tr>
				<td colspan="5">${paymentList.pay_email}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${paymentList.pay_name}</td>
				<td>전화번호</td>
				<td colspan="2">${paymentList.pay_phonenumber}</td>	
			</tr>
			<tr>			
				<td>우편번호</td>
				<td colspan="4">${paymentList.pay_address}</td>
			</tr>
			<tr>	
				<td colspan="5">${paymentList.pay_address1}</td>
			</tr>
			<tr>
				<td colspan="5">${paymentList.pay_address2}</td>		
			</tr>			
			<tr>			
				<td>분류</td>
				<td>주문상품</td>
				<td>개수</td>					
				<td>가격</td>
				<td></td>
			</tr>
			<tr>
				<td>${paymentList.pay_pro1_sort}</td>
				<td>${paymentList.pay_pro1_name}</td>
				<td>${paymentList.pay_pro1_cnt}</td>
				<td>${paymentList.pay_pro1_price}</td>
				<td></td>				
			</tr>
			<c:if test="${paymentList.pay_pro2_cnt!=0}">
			<tr>
				<td>${paymentList.pay_pro2_sort}</td>
				<td>${paymentList.pay_pro2_name}</td>
				<td>${paymentList.pay_pro2_cnt}</td>
				<td>${paymentList.pay_pro2_price}</td>
				<td></td>
			</tr>
			</c:if>
			<c:if test="${paymentList.pay_pro3_cnt!=0}">
			<tr>
				<td>${paymentList.pay_pro3_sort}</td>
				<td>${paymentList.pay_pro3_name}</td>
				<td>${paymentList.pay_pro3_cnt}</td>
				<td>${paymentList.pay_pro3_price}</td>
				<td></td>
			</tr>
			</c:if>
			<c:if test="${paymentList.pay_pro4_cnt!=0}">
			<tr>
				<td>${paymentList.pay_pro4_sort}</td>
				<td>${paymentList.pay_pro4_name}</td>
				<td>${paymentList.pay_pro4_cnt}</td>
				<td>${paymentList.pay_pro4_price}</td>
				<td></td>
			</tr>
			</c:if>
			<c:if test="${paymentList.pay_pro5_cnt!=0}">
			<tr>
				<td>${paymentList.pay_pro5_sort}</td>
				<td>${paymentList.pay_pro5_name}</td>
				<td>${paymentList.pay_pro5_cnt}</td>
				<td>${paymentList.pay_pro5_price}</td>
				<td></td>
			</tr>
			</c:if>
		
			<tr>
				<td colspan="4">결제 금액</td>
				<td>${paymentList.pay_total}</td>
			</tr>
			<tr>	
				<td colspan="5" id="${paymentList.pay_no}">결제안함</td>			
			</tr>
		
			<tr>
            	<td colspan="4">
            		<form>
                	<input id="Before_payment" name="pay-option" type="radio" value="0" onclick="payment()">
                    <label>결제전</label>
                    <input id="After_payment" name="pay-option" type="radio" value="1" onclick="payment1()">
                    <label>결제완료</label>
                    </form> 
                    <input type="hidden" id="pay_option" name="pay_option">
                    <input type="hidden" id="pay_no" name="pay_no" value="${paymentList.pay_no}">
                </td>
                <td><button onclick="check()" class="btn btn-outline-dark">변경</button></td>      
          	</tr>
<script>
function payment(){
	document.getElementById("pay_option").value = "0";
}
function payment1(){
	document.getElementById("pay_option").value = "1";
}
function check(){
	/* document.getElementById('Before_payment').disabled = true;
	document.getElementById('After_payment').disabled = true; */
	var pay_option = document.getElementById("pay_option").value;
	var pay_no = document.getElementById("pay_no").value;
	document.getElementById("${paymentList.pay_no}").innerHTML = "결제안함";
	document.getElementById("${paymentList.pay_no}").innerHTML = "결제함";

	location.href="${path}/adminpaycheck.admin?pay_option="+pay_option+"&pay_no="+pay_no;
}
                    	
</script>
				<!-- j변수 값 1씩 증가 -->
				<c:set var="j" value="${j+1}" />			
			</c:if>
			</c:forEach> 
			<tr>
				<td colspan="5"></td>
			</tr>
		</table>
		</div>
		<div class="check_right">
		<h3>결제 후</h3>
		<table class="table after">
			<c:set var="j" value="0"/>
			<c:forEach  var="paymentList"   items="${requestScope.paymentlist}"	>		
			<c:if test="${paymentList.pay_option==1}">
			<tr class="tb_head">
				<td colspan="5">주문번호 : ${paymentList.pay_no}</td>
			</tr>
			<tr>
				<td colspan="5">${paymentList.pay_email}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${paymentList.pay_name}</td>
				<td>전화번호</td>
				<td colspan="2">${paymentList.pay_phonenumber}</td>		
			</tr>
			<tr>			
				<td>우편번호</td>
				<td colspan="4">${paymentList.pay_address}</td>
			</tr>
			<tr>	
				<td colspan="5">${paymentList.pay_address1}</td>
			</tr>
			<tr>
				<td colspan="5">${paymentList.pay_address2}</td>		
			</tr>			
			<tr>			
				<td>분류</td>
				<td>주문상품</td>
				<td>개수</td>					
				<td>가격</td>
				<td></td>
			</tr>
			<tr>
				<td>${paymentList.pay_pro1_sort}</td>
				<td>${paymentList.pay_pro1_name}</td>
				<td>${paymentList.pay_pro1_cnt}</td>
				<td>${paymentList.pay_pro1_price}</td>					
				<td></td>
			</tr>
			<c:if test="${paymentList.pay_pro2_cnt!=0}">
			<tr>
				<td>${paymentList.pay_pro2_sort}</td>
				<td>${paymentList.pay_pro2_name}</td>
				<td>${paymentList.pay_pro2_cnt}</td>
				<td>${paymentList.pay_pro2_price}</td>
				<td></td>
			</tr>
			</c:if>
			<c:if test="${paymentList.pay_pro3_cnt!=0}">
			<tr>
				<td>${paymentList.pay_pro3_sort}</td>
				<td>${paymentList.pay_pro3_name}</td>
				<td>${paymentList.pay_pro3_cnt}</td>
				<td>${paymentList.pay_pro3_price}</td>
				<td></td>
			</tr>
			</c:if>
			<c:if test="${paymentList.pay_pro4_cnt!=0}">
			<tr>
				<td>${paymentList.pay_pro4_sort}</td>
				<td>${paymentList.pay_pro4_name}</td>
				<td>${paymentList.pay_pro4_cnt}</td>
				<td>${paymentList.pay_pro4_price}</td>
				<td></td>
			</tr>
			</c:if>
			<c:if test="${paymentList.pay_pro5_cnt!=0}">
			<tr>
				<td>${paymentList.pay_pro5_sort}</td>
				<td>${paymentList.pay_pro5_name}</td>
				<td>${paymentList.pay_pro5_cnt}</td>
				<td>${paymentList.pay_pro5_price}</td>
				<td></td>
			</tr>
			</c:if>
		
			<tr>
				<td colspan="4">결제 금액</td>
				<td>${paymentList.pay_total}</td>
			</tr>
			<tr>
            	<td colspan="5">결제완료</td>               
          	</tr>
       	    
				
				<!-- j변수 값 1씩 증가 -->
				<c:set var="j" value="${j+1}" />			
			</c:if>
			</c:forEach> 
			<tr>
				<td colspan="5"></td>
			</tr>
		</table>
		</div>
		</div>
		</div>
		</div>
	</center>

	
</body>
</html>