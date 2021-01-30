<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/5d2954c3f8.js"
	crossorigin="anonymous"></script>
<!--CSS-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!--JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!--web font-->
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/comment.css" />
<script type="text/javascript">
	//전체 댓글 목록
	function getCommentList(){
		$.ajax({
			url : '${root}/comment.do', // 요청할 서블릿
			data : {'bnum':'${dto.bnum}'}, // 보내는 파라미터
			method : 'get', // get or post
			contentType : "application/json; charset:UTF-8",
			success : function(result){
				console.log(result);
				if(result.length != 0){
					var cmtList = '';
					for(var i=0; i<result.length; i++){
						cmtList += '<div class="media-block">';
						cmtList += '<span class="media-left mr-1"><img class="img-circle img-sm" alt="Profile Picture" src="${root}/resources/img/chat_profile_user.png"></span>'
						cmtList += '<div class="media-body"><div class="mar-btm"><span class="btn-link text-semibold media-heading box-inline">';	
						cmtList += result[i]['cwriter'];
						cmtList += '</span> &nbsp;';
						if('${loginInfo.userid}' == result[i]['cwriter']){
							cmtList += '<span><a href="" class="delete" id=';
							cmtList += result[i]['cnum'] + '>(삭제)</a></span>';
						}
						cmtList += '<p class="text-muted text-sm"><i class="fa fa-date fa-lg"></i>';
						cmtList += result[i]['cwriteDate'];
						cmtList += '</p>';
						cmtList += '</div>';
						cmtList += '<p>';
						cmtList += result[i]['ccontent'];
						cmtList += '</p>';
						cmtList += '</div>';
						cmtList += '</div>';
					}
				}else{
					var cmtList = '<p>등록된 댓글이 아직 없습니다</p>';
				}
				$('#cmtList').html(cmtList);
			},
			error : function(){
				console.log('ajax error');
			}
		})
	}
	
	$(function(){
		//댓글 조회
		getCommentList();
		
		//댓글 등록
		$('#cmtBtn').click(function(){
			$.ajax({
				url:"${root}/comment.do",
				data:{'bnum':'${dto.bnum}', 'content':$('#cmt').val()},
				method:'post',
				success:function(result){
					if(result == 'success'){
						getCommentList();
						$('#cmt').val('');
					}else{
						alert('로그인이 필요합니다.');
						location.href = "${root}/";
					}
				},
				error:function(){
					console.log('ajax write error');
				}
			})
		})
		
		// 댓글 삭제
		$(document).on('click', '.delete', function(){
			$.ajax({
				url:'${root}/comment/' + this.id,
				method: 'delete',
				success : function(){
					getCommentList();
				},
			})			
		})
	})
</script>
<style>
.delete{
	color: red;
}
</style>
</head>

<body>
	<jsp:include page="header.jsp" />

	<!--content-->
	<div class="container mt-5">
		<h3 class="text-center">공지 상세보기</h3>

		<!-- 테이블 -->
		<div class="container">
			<form class="pl-5 pr-5 form form-group">
				<div class="form-group">
					<label for="btitle">제목</label> <input type="text" id="btitle"
						class="form-control" name="btitle" value="${dto.btitle}" readonly>
				</div>
				<div class="form-group row">
					<div class="col-sm-4">
						<label for="userid">작성자 </label> <input type="text" id="userid"
							class="form-control" name="userid" value="${dto.userid}" readonly>
					</div>
					<div class="col-sm-4">
						<label for="bwritedate">작성날짜</label> <input type="text"
							id="bwritedate" class="form-control" name="bwritedate"
							value="${dto.bwritedate}" readonly>
					</div>
					<div class="col-sm-4">
						<label for="breadcnt">조회수</label> <input type="text" id="breadcnt"
							class="form-control" name="breadcnt" value="${dto.breadcnt}"
							readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="bcontent">내용</label>
					<textarea rows="10" style="height: 100%;" name="bcontent"
						id="bcontent" class="form-control" name="bcontent" readonly>${dto.bcontent}</textarea>
				</div>
				<!--footer-->
				<div class="container row justify-content-center"
					style="margin-bottom: 0">
					<c:if test="${loginInfo.userid eq dto.userid}">
						<!-- 세션아이디랑 글쓴이가 같을때만 보여줌 -->
						<input type="button" class="btn btn-outline-primary mr-1"
							value="수정하기"
							onclick="location.href='${root}/noticeUpdate.do?bnum=${dto.bnum}'">
						<input type="button" class="btn btn-outline-danger mr-1"
							value="삭제하기"
							onclick="location.href='${root}/noticeDelete.do?bnum=${dto.bnum}'">
					</c:if>
					<input type="button" class="btn btn-outline-secondary" value="목록"
						onclick="location.href='${root}/noticeList.do'">
				</div>
			</form>
		</div>


		<!-- 댓글 -->
		<div class="container bootdey">
			<div class="col-md-12 bootstrap snippets">
				<div class="panel">
					<div class="panel-body">
						<h4>전체 댓글</h4>
						<hr>
						<div id="cmtList">
							<!-- 댓글  -->
							
							<!-- 댓글  -->
						</div>
					</div>
				</div>
				<div class="panel">
					<div class="panel-body">
						<textarea id="cmt" class="form-control" rows="2"
							placeholder="댓글을 입력하세요"></textarea>
						<div class="mar-top clearfix">
							<button id="cmtBtn"
								class="btn btn-sm btn-outline-primary pull-right justify-content-end">
								<i class="fa fa-pencil fa-fw"></i> 댓글 등록
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- Footer -->
	<jsp:include page="footer.jsp" />
</body>

</html>