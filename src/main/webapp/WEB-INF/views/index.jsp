<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://sta.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/style.css" />
<script src="https://kit.fontawesome.com/5d2954c3f8.js" crossorigin="anonymous"></script>
<script>
	$(function() {
		// 시도 옵션 리스트 목록
		$.ajax({
			url : '${root}/map/sido',
			type : 'GET',
			contextType : 'application/json;charset=utf-8',
			dataType : 'json',
			success : function(result) {
				var optionList = '';
				for (let i = 0; i < result.length; i++) {
					optionList += '<option value="';
			optionList += result[i]["sidoCode"] + '">';
					optionList += result[i]["sidoName"]
					optionList += '</option>';
				}
				$("#sido").append(optionList);
			},
			error : function(xhr, status, msg) {
				console.log(status + " " + msg);
			}
		});

		// 시도에 따른 구군 옵션 리스트 목록
		$("#sido").change(
			function() {
				$.ajax({
					url : '${root}/map/gugun/'+ $("#sido").val(),
					type : 'GET',
					contextType : 'application/json;charset=utf-8',
					dataType : 'json',
					success : function(result) {
						$("#gugun").empty();
						$("#gugun").append("<option selected disabled>구/군</option>");
						var optionList = '';
						for (let i = 0; i < result.length; i++) {
							optionList += '<option value="';
							optionList += result[i]["gugunCode"] + '">';
							optionList += result[i]["gugunName"]
							optionList += '</option>';
						}
						$("#gugun").append(optionList);
					},
					error : function(xhr,status, msg) {
						console.log(status+ " "+ msg);
					}
				});
			});

		// 구군에 따른 동 옵션 리스트 목록
		$("#gugun").change(function() {
			$.ajax({
				url : '${root}/map/dong/'+ $("#gugun").val(),
				type : 'GET',
				contextType : 'application/json;charset=utf-8',
				dataType : 'json',
				success : function(result) {
					$("#dong").empty();
					$("#dong").append("<option selected disabled>동</option>");
					var optionList = '';
					for (let i = 0; i < result.length; i++) {
						optionList += '<option value="';
						optionList += result[i]["dong"] + '">';
						optionList += result[i]["dong"]
						optionList += '</option>';
					}
					$("#dong").append(optionList);
				},
				error : function(xhr,status, msg) {
					console.log(status+ " "+ msg);
				}
			});
		});
	});
</script>
<title>메인페이지</title>
<style type="text/css">
	.card-text {
		border-radius: 5px;
		background-color: rgb(255, 255, 255);
		margin-bottom: 0px;
	}
	
	h4 {
		margin-bottom: 0px;
	}
	
	#gotoInterDetail {
		float: right;
	}
	/* #chat{
		display:none;
	} */
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<!-- Chat -->
	<c:if test="${not empty loginInfo}">
		<c:choose>
			<c:when test="${loginInfo.userid eq 'ssafy'}">
				<jsp:include page="chatManager.jsp" /><!-- 관리자용 채팅 -->
			</c:when>
			<c:otherwise>
				<jsp:include page="chat.jsp" /><!-- 회원용 채팅 -->
			</c:otherwise>
		</c:choose>
	</c:if>
	<!-- Chat -->
	
	
	<!-- Contents -->
	<div class="container contents">
		<div class="jumbotron text-center bg-transparent pb-0">
			<h6 class="display-4">
				<span style="color: #1abc9c;">당신이 원하는 방</span><br>모두 여기 <span style="color: #1abc9c;">다~</span> 있다!
			</h6>
			<hr class="my-4">
			<div class="btn-group">
				<form action="${root}/search" method="post" class="form-inline">
					<div class="form-group mx-md-1">
						<select name="sido" id="sido" class="form-control">
							<option selected disabled>시/도</option>
						</select>
					</div>
					<div class="form-group mx-md-1">
						<select name="gugun" id="gugun" class="form-control">
							<option selected disabled>구/군</option>
						</select>
					</div>
					<div class="form-group">
						<select name="dong" id="dong" class="form-control">
							<option selected disabled>동</option>
						</select>
					</div>
					<div class="form-group mx-md-1">
						<select name="houseType" id="houseType" class="form-control">
							<option selected disabled>주거/매물형태</option>
							<option value="apt">아파트</option>
							<option value="houses">연립주택</option>
						</select>
					</div>
					<div class="form-group">
						<input name="aptName" type="text" class="form-control mx-md-1"
							placeholder="아파트(주택)명으로 검색하기">
						<button class="btn btn-success" type="submit"
							style="background-color: #1abc9c;">찾아보기</button>
					</div>
				</form>
			</div>
			<hr class="my-5" style="width: 70%">
		</div>
		<div class="container product-container" id="simpleInterestList" style="margin-left:100px;"></div>
	</div>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />
</body>

</html>