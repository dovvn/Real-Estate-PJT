<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/5d2954c3f8.js" crossorigin="anonymous"></script>
    <!--CSS-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!--JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!--web font-->
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/style.css" />
    <script>
        $(function () {
            $("#con1").css("display", "block");
            $(".mypageMenu").on("click", function () {
                let words = $(this).attr("id");
                var num = words.substr(3, 1);
                console.log(num);
                let currentCon = "con" + num;
                $("#" + currentCon).css("display", "block");
                
                let currentDiv = "tap" + num;
                $("#" + currentDiv).children('a').css("color", "#000");
                $("#" + currentDiv).children('a').css("font-weight", "bold");
                $("#" + currentDiv).css("border-bottom", "2px solid #000");

                //나머지 콘텐츠 숨기기
                for (let i = 1; i <= 2; i++) {
                    if (i == num) continue;
                    let hideCon = "con" + i;
                    $("#" + hideCon).css("display", "none");
                    
                    let hideDiv = "tap" + i;
                    $("#" + hideDiv).children('a').css("color", "#666");
                    $("#" + hideDiv).children('a').css("font-weight", "none");
                    $("#" + hideDiv).css("border-bottom", "1px solid #666");
                }

                return false;
            });
            
            // 탈퇴 확인 버튼누르면 탈퇴 진행
            $("#delMember").click(function(){
            	$.ajax({
            		url : '${root}/member/${loginInfo.userid}',
            		method: 'delete',
            		contentType: 'application/json; charset=utf-8',
            	    success:function(response){
            	    	if(response == 'success'){
	            	    	alert("탈퇴 하였습니다.");
							location.href="${root}";
            	    	}else{
            	    		alert("탈퇴에 실패하였습니다.");
            	    		location.href="${root}/member/mypage.do";
            	    	}
            	    },
            	    error : function(xhr, status, msg){
    					console.log(status + " " + msg);
    				}
            	});
            });  
            
            // 수정 버튼 누르면 수정 진행
            $("#modifyMember").click(function(){
            	var dto = {
					'userid' : $("#useridModify").val(),
					'userpw' : $("#userpwModify").val(),
					'username' : $("#usernameModify").val(),
					'useremail' : $("#useremailModify").val(),
					'userphone' : $("#userphoneModify").val(),
    	    	}
            	
            	$.ajax({
            		url : '${root}/member',
            		method: 'put',
            		contentType: 'application/json; charset=utf-8',
            		data: JSON.stringify(dto),
            	    success:function(response){
            	    	if(response == 'success'){
	            	    	alert("수정 하였습니다.");
            	    	}else{
            	    		alert("수정에 실패하였습니다.");
            	    	}
           	    		location.href="${root}/member/mypage.do";
            	    },
            	    error : function(xhr, status, msg){
    					console.log(status + " " + msg);
    				}
            	    
            	});
            });   
        });
    </script>
</head>

<body>
    <jsp:include page="header.jsp" />

    <!--content-->
    <div class="container text-center col-lg-12">
        <h2 class="pt-5 py-5"">마이 페이지</h2>
        <div class="col-md-12 py-3">
            <div id="tap1" style="border-bottom: 2px solid #000; font-weight:bold;" class="col-md-3 d-inline pr-5 pl-5 py-3 mypageMenu d-none">
            	<a style="color: #000;" href="#">내 정보</a></div>
            <div id="tap2" style="border-bottom: 1px solid #666; font-weight:light;" class="col-md-3 d-inline pr-5 pl-5 py-3 mypageMenu d-none">
            	<a style="color: #6c757d;" href="#">정보 수정</a></div>
            <div id="tap3" style="border-bottom: 1px solid #666; font-weight:light;" class="col-md-3 d-inline pr-5 pl-5 py-3 mypageMenu d-none">
            	<a style="color: #6c757d;" href="#" data-toggle="modal" data-target="#delete">탈퇴하기</a></div></div>
        </div>

        <!--내 정보-->
        <div id="con1" class="collapse mt-5 my-auto pt-5 pb-5">
            <div class="content container">

                <div class="form form-group">
                    <div class="form-group row justify-content-center col-md-11">
                        <label for="id" class="col-md-2 col-form-label text-right">아이디</label>
                        <div class="col-md-3">
                            <input type="text" class="bg-transparent form-control border-0" value="${loginInfo.userid}" readonly>
                        </div>
                    </div>
                    <div class="form-group row justify-content-center col-md-11">
                        <label for="id" class="col-md-2 col-form-label text-right">비밀번호<span
                                style="color: red;">*</span></label>
                        <div class="col-md-3">
                            <input type="text" class="bg-transparent form-control border-0" value="${loginInfo.userpw}" readonly>
                        </div>
                    </div>
                    <div class="form-group row justify-content-center col-md-11">
                        <label for="id" class="bg-transparent col-md-2 col-form-label text-right ">이름<span
                                style="color: red;">*</span></label>
                        <div class="col-md-3">
                            <input type="text" class="bg-transparent form-control border-0" value="${loginInfo.username}" readonly >
                        </div>
                    </div>
                    <div class="form-group row justify-content-center col-md-11">
                        <label for="id" class="col-md-2 col-form-label text-right">이메일<span
                                style="color: red;">*</span></label>
                        <div class="col-md-3">
                            <input type="email" class="bg-transparent form-control border-0" readonly
                                value="${loginInfo.useremail}">
                        </div>
                    </div>
                    <div class="form-group row justify-content-center col-md-11">
                        <label for="id" class="col-md-2 col-form-label text-right">전화번호<span
                                style="color: red;">*</span></label>
                        <div class="col-md-3">
                            <input type="tel" class="bg-transparent form-control border-0" value="${loginInfo.userphone}" readonly>
                        </div>
                    </div>
                </div>
            </div>
        </div>

       <!--정보수정-->
        <div id="con2" class="collapse mt-5 my-auto pt-5 pb-5">
          <div class="content container">

                <div class="form form-group">
                    <div class="form-group row justify-content-center col-md-11">
                        <label for="id" class="col-md-2 col-form-label text-right">아이디</label>
                        <div class="col-md-3">
                            <input type="text" id="useridModify" class="form-control" value="${loginInfo.userid}" readonly>
                        </div>
                    </div>
                    <div class="form-group row justify-content-center col-md-11">
                        <label for="id" class="col-md-2 col-form-label text-right">비밀번호<span
                                style="color: red;">*</span></label>
                        <div class="col-md-3">
                            <input type="text" id="userpwModify" class="form-control" value="${loginInfo.userpw}">
                        </div>
                    </div>
                    <div class="form-group row justify-content-center col-md-11">
                        <label for="id" class="col-md-2 col-form-label text-right">이름<span
                                style="color: red;">*</span></label>
                        <div class="col-md-3">
                            <input type="text" id="usernameModify" class="form-control" value="${loginInfo.username}">
                        </div>
                    </div>
                    <div class="form-group row justify-content-center col-md-11">
                        <label for="id" class="col-md-2 col-form-label text-right">이메일<span
                                style="color: red;">*</span></label>
                        <div class="col-md-3">
                            <input type="email" id="useremailModify" class="form-control"
                                value="${loginInfo.useremail}">
                        </div>
                    </div>
                    <div class="form-group row justify-content-center col-md-11">
                        <label for="id" class="col-md-2 col-form-label text-right">전화번호<span
                                style="color: red;">*</span></label>
                        <div class="col-md-3">
                            <input type="tel" id="userphoneModify" class="form-control" value="${loginInfo.userphone}">
                        </div>
                    </div>
                    <div class="row justify-content-center"><button id="modifyMember" class="btn btn-outline-primary col-md-3 mt-3 mb-5">수정완료</button></div>
                </div>
            </div>
        </div>  
    

    <!--modal-->
    <div class="modal" id="delete">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header justify-content-center">
                    <h4 class="modal-title text-center">탈퇴하기</h4>
                </div>

                <!-- Modal body -->
                <div class="modal-body text-center">
                    <p>정말 탈퇴하시겠습니까?</p>
                    <button class="btn btn-outline-primary" id="delMember">확인</button>
                    <button class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
    <!--modal-->
    <!--content-->

    <!-- Footer -->
	<jsp:include page="footer.jsp" />
</body>

</html>