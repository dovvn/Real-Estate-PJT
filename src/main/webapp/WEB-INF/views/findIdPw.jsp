<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous">
    </script>
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/style.css" />
    <script src="https://kit.fontawesome.com/5d2954c3f8.js" crossorigin="anonymous"></script>
    <title>Document</title>
</head>

<body>
    <!-- Header -->
    <jsp:include page="header.jsp" />

    <!-- 비밀번호 찾기 컨테이너 -->
    <div class="container-fluid bg-secondary w-100 d-flex align-items-center" style="height: 80vh;">
    	<%-- 비밀번호 수정 --%>
    	<c:if test="${not empty user}">
    		<div class="container bg-light rounded" style="width: 700px;">
	            <h1 class="m-md-3">${user.userid}님의 비밀번호 수정</h1>
	            <form action="${root}/member/modifyPw.do" method="post" class="m-md-3 py-md-3">
	            	<input type="hidden" name="userid" value="${user.userid}">
	                <div class="form-group row">
	                    <label for="newPw" class="col-md-2 col-form-label text-right">새 비밀번호</label>
	                    <div class="col-md-10">
	                    	<input id="userpwd" name="userpw" type="password" class="form-control" placeholder="비밀번호 입력" required>
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label for="newPw_check" class="col-md-2 col-form-label text-right">새 비밀번호 확인</label>
	                    <div class="col-md-10">
	                        <input id="newPw_check" name="newPw_check" type="password" class="form-control" placeholder="비밀번호 확인" required>
	                    </div>
	                </div>
	                <div class="form-group row justify-content-center">
	                    <button class="btn" style="background-color: #1abc9c; color:white;">비밀번호 수정</button>
	                </div>
	            </form>
	        </div>
	        <script type="text/javascript">
	        	$('form').submit(function(){ 
	        		if($('#userpwd').val() == $('#newPw_check').val()){
	        			return true;
	        		} else {
	        			alert('비밀번호가 다릅니다. 다시 입력해주세요');
	        			return false;
	        		}
	        	});
	        </script>
    	</c:if>
    	
        <!-- 비밀번호 찾기 내용 -->
        <c:if test="${empty user}">
        	<c:if test="${findResult eq 'fail'}">
        		<script type="text/javascript">alert("입력한 정보에 해당하는 사용자가 없습니다. 다시 입력해주세요");</script>
        	</c:if>
	        <div class="container bg-light rounded" style="width: 700px;">
	            <h1 class="m-md-3">비밀번호 찾기</h1>
	            <form action="${root}/member/findpw.do" method="post" class="m-md-3 py-md-3">
	                <div class="form-group row">
	                    <label for="username" class="col-md-2 col-form-label text-right">이름</label>
	                    <div class="col-md-10">
	                        <input name="username" type="text" class="form-control" placeholder="이름" required>
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label for="userid" class="col-md-2 col-form-label text-right">아이디</label>
	                    <div class="col-md-10">
	                        <input name="userid" type="text" class="form-control" placeholder="아이디" required>
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label for="userphone" class="col-md-2 col-form-label text-right">전화번호</label>
	                    <div class="col-md-10">
	                        <input name="userphone" type="tel" class="form-control" placeholder="010-xxxx-xxxx" required>
	                    </div>
	                </div>
	                <div class="form-group row justify-content-center">
	                    <button class="btn" style="background-color: #1abc9c; color:white;">비밀번호 찾기</button>
	                </div>
	            </form>
	        </div>
        </c:if>
    </div>

    <!-- Footer -->
    <jsp:include page="footer.jsp" />
</body>

</html>