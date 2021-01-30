<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>공지사항 글쓰기</title>
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
        <h3>글쓰기</h3>
    </div>
    <!--contents-->
    <div class="container">
        <form class="form form-group" action="${root}/noticeWrite.do" method="post">
            <div class="form-group">
                <label for="btitle">제목: </label>
                <input type="text" id="btitle" class="form-control" name="btitle" placeholder="제목을 입력하세요">
            </div>
            <div class="form-group">
                <label for="bcontent">내용: </label>
                <textarea rows="20" stype="height:100%;" id="bcontent" class="form-control" name="bcontent"
                    placeholder="내용을 입력하세요"></textarea>
            </div>
            <div class="form-group container row justify-content-center" style="margin-bottom:0">
                <input type="submit" class="btn btn-outline-primary mr-1" value="글작성">
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