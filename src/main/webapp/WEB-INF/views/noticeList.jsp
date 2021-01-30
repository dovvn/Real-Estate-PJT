<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>공지사항 글목록</title>
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
</head>

<body>
    <jsp:include page="header.jsp" />
    
    <div class="container text-center mt-5" style="margin-bottom:0">
        <h3>공지사항</h3>
    </div>

    <nav class="container navbar navbar-expand-sm navbar-light">
    	<c:if test="${loginInfo.role eq 1}"><!-- 관리자일때만 -->
        	<button id="btnWrite" class="btn btn-outline-primary" onclick="location.href='${root}/noticeWrite.do'">글쓰기</button>
        </c:if>
        <form class="navbar-nav ml-auto" action="${root}/noticeSearch.do" method="post">
            <div class="form-group mr-1">
                <select class="form-control" name="search_type">
                    <option value="btitle">제목</option>
                    <option value="bcontent">내용</option>
                    <option value="userid">작성자</option>
                </select>
            </div>
            <div class="form-group mr-1">
                <input type="text" id="userId" class="form-control" name="keyword" placeholder="검색어 입력.">
            </div>
            <div class="form-group">
                <button id="btnWrite" class="btn btn-outline-primary">검색</button>
            </div>
        </form>
    </nav>

  <!--contents-->
  <div class="container my-3">
    <form role="form" method="get">
      <table class="table table-hover">
        <thead>
          <tr>
            <th width="15%">글번호</th>
            <th width="40%" class="text-center">제목</th>
            <th width="15%">작성자</th>
            <th width="15%">조회수</th>
            <th width="15%">작성일</th>
          </tr>
        </thead>
        <c:choose>
			<c:when test="${empty pageDto or empty pageDto.noticeList}">
				<tr><td colspan="5">작성된 게시글이 없습니다.</td></tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${pageDto.noticeList}" var="dto">
					<tr>
						<td>${dto.bnum}</td>
						<td id="title"><a href="${root}/noticeRead.do?bnum=${dto.bnum}">${dto.btitle} 
						<c:if test="${!empty dto.cmtCnt}">
							[${dto.cmtCnt}]
						</c:if>
						</a></td>
						<td>${dto.userid}</td>
						<td>${dto.breadcnt}</td>
						<td>${dto.bwritedate}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
      </table>
    </form>
  </div>

 
  <div class="container" style="margin-bottom:0">
    <ul class="pagination justify-content-center">
    <c:if test="${pageDto.startPage>1}">
		<a href="notice.do?action=listAll&page=${pageDto.startPage-1}">이전</a>
    </c:if>
    <c:forEach begin="${pageDto.startPage}" end="${pageDto.endPage}" var="i">
    	<li class="page-item">
			<a class="page-link" href="noticeList.do?pageStr=${i}">
				<c:if test="${i eq pageDto.curPage}">${i}</c:if>
				<c:if test="${i ne pageDto.curPage}">${i}</c:if>
			</a>
		</li>
	</c:forEach>
	<c:if test="${pageDto.endPage < pageDto.totalPage}">
		<a href="notice.do?action=listAll&page=${pageDto.endPage+1}">다음</a>
	</c:if>
    </ul>
  </div>

    <!-- Footer -->
	<jsp:include page="footer.jsp" />
</body>
</html>