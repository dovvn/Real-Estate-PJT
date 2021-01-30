<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>공지 수정</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/5d2954c3f8.js" crossorigin="anonymous"></script>
    <!--CSS-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!--JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!--web font-->
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/style.css" />
    <script>

    </script>
</head>

<body>
    <jsp:include page="header.jsp" />

    <!--content-->
    <div class="container text-center mt-5">
        <h3>공지 수정</h3>
    </div>
    <!--contents-->
    <div class="container">
        <form class="pl-5 pr-5 form form-group" action="${root}/noticeUpdate.do" method="post"> <!-- 수정하기 -->
        	<input type="hidden" name="bnum" value="${dto.bnum}">
        	<div class="form-group">
                <label for="btitle">제목</label>
                <input type="text" id="btitle" class="form-control" name="btitle" value="${dto.btitle}">
            </div>
            <div class="form-group row">
            	<div class="col-sm-4">
            	 	<label for="userid">작성자 </label>
                	<input type="text" id="userid" class="form-control" name="userid" value="${dto.userid}" readonly>
            	</div>
            	<div class="col-sm-4">
                	<label for="bwritedate">작성날짜</label>
                	<input type="text" id="bwritedate" class="form-control" name="bwritedate" value="${dto.bwritedate}" readonly>
                </div>
                <div class="col-sm-4">
                	<label for="breadcnt">조회수</label>
                	<input type="text" id="breadcnt" class="form-control" name="breadcnt" value="${dto.breadcnt}" readonly>
                </div>
            </div>
            <div class="form-group">
                <label for="bcontent">내용</label>
                <textarea rows="10" style="height:100%;" name="bcontent" id="bcontent" class="form-control" name="bcontent">${dto.bcontent}</textarea>
            </div>
            <!--footer-->
            <div class="container row justify-content-center" style="margin-bottom:0">
                <c:if test="${loginInfo.userid eq dto.userid}"> <!-- 세션아이디랑 글쓴이가 같을때만 보여줌 -->
					<input type="submit" class="btn btn-outline-primary mr-1" value="수정하기">
                	<input type="button" class="btn btn-outline-danger mr-1" value="삭제하기" onclick="location.href='${root}/noticeDelete.do?bnum=${dto.bnum}'">
                </c:if>
                <input type="reset" class="btn mr-1 btn-outline-warning" value="초기화">
                <input type="button" class="btn btn-outline-secondary" value="목록" onclick="location.href='${root}/noticeList.do'">
            </div>
        </form>
    </div>
</body>

<!-- Footer -->
	<jsp:include page="footer.jsp" />
</body>

</html>