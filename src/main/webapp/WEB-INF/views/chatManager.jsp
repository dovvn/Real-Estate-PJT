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
<link rel="stylesheet" type="text/css" href="${root}/resources/css/chat.css" />
<script src="https://kit.fontawesome.com/5d2954c3f8.js" crossorigin="anonymous"></script>
<title>관리자용 채팅창</title>
</head>
<% //메신저 현재 시간 구하기
Date today = new Date();
SimpleDateFormat df = new SimpleDateFormat("hh:mm aa"); // Just the year, with 2 digits
String time = df.format(today);
%>
<body>
	<div id="chat_icon"></div>
	<div id="chat_content">
		<div class="chYXNL">
			<div data-ch-testid="back-button" class="pTkUZ">
				<div name="back3" size="18" class="kpjiFD"></div>
			</div>
			<div class="TmRQW">
				<div class="ifoTHc">
					<div class="jyCzTS">관리자 모드</div>
					<div name="offhours" size="22" width="22" height="22" class="fVdwuK"></div>
				</div>
				<div class="gLDehK">1:1 채팅 상담 메신저</div>
			</div>
			<div
				class="jOQCgr">
				<div class="ePYepb">
					<div name="close2" size="18" width="30" height="30" class="closeBtn"></div>
				</div>
			</div>
		</div>
		
		<!-- 채팅방 -->
		<div id="chatRoom" class="cxfUhJB">
			<div data-ch-testid="user-chat"
				class="UserChatstyled__Wrapper-sc-1to4g9-0 jlSJnZ">
				<div class="UserChatstyled__Body-sc-1to4g9-1 eXGIrr">
					<div class="Messengerstyled__Wrapper-sc-1e1ufgm-2 gEPVqv">
						<div class="MessageStreamstyled__Wrapper-sc-1hff8rl-7 eEnBHd">
							<div id="chatList" class="iwuPmL kWDOaK">
								<!-- 상대방 -->
								<!-- 상대방 -->
								
								<!-- 나 -->
								<!-- 나 -->
							</div>
						</div>
						<div class="MessengerFooterstyled__Wrapper-i9sssu-0 hZzROU">
							<div class="MessengerFooterstyled__Dropzone-i9sssu-1 drHBgO"
								aria-disabled="false" style="position: relative;">
								<input type="file" multiple="" autocomplete="off"
									style="position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; opacity: 1e-05; pointer-events: none;">
							</div>
							<div class="MessengerFooterstyled__Emoji-i9sssu-2 iNHUFb"></div>
							<textarea id="chatContent" data-ch-testid="messenger-footer-text-area"
								placeholder="메시지를 입력해주세요."
								class="MessengerFooterstyled__TextArea-i9sssu-4 fDjmca"
								style="height: 56px;"></textarea>
							<div data-ch-test onclick="submitFunction();" class="giExZC"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 채팅방 -->
		

		<!-- 채팅방 목록 -->
		<div id="roomList" class="fiwphP">
			<!-- 채팅방 하나 -->
			
			<!-- 채팅방 하나 -->
		</div>
		<!-- 채팅방 리스트 -->
	</div>
	
	<c:if test="${not empty loginInfo}">
		<script>
			$(function(){
				loadRoomList(); //기존 채팅방 목록
			})
			
			//아이콘 이벤트
			$('#chat_icon').click(function() {
				$('#chat_content').css("display", "block");
				$('#chat_icon').css("display", "none");
				
				//채팅창 보이고 방 목록 안보이게
				$('#chatRoom').css("display","none");
				$('#roomList').css("display","block");
				$('.kpjiFD').css("display", "none"); //뒤로 가기 버튼
				getInfiniteRoomList(); //새로운 채팅방 확인
			})
			
			//채팅 접기
			$('.closeBtn').click(function(){
				$('#chat_content').css("display", "none");
				$('#chat_icon').css("display", "block");
				
				//채팅창 안보이고 방 목록 보이게
				$('#chatRoom').css("display","none");
				$('#roomList').css("display","block");
				$('.kpjiFD').css("display", "none"); //뒤로 가기 버튼
				
				$('#chatList *').remove(); //채팅방 비워주기
				
				//채팅방 목록, 메시지 갱신 중지
				clearInterval(setNewMessage);
				clearInterval(setNewRoom);
				
			})
			
			var lastRoomID = 0;
			
			//1. 전체 채팅방 리스트 조회
			function loadRoomList(){
				$.ajax({
					url : '${root}/chat',
					method : 'get',
					success: function(result){
						if(result == ""){
							addRoomNull();
						}
						for(var i=0; i<result.length; i++){
							addRoomList(result[i]["userID"]);
							if(i == result.length-1) lastRoomID = result[i]["roomID"]; //마지막 채팅방 번호
						}
						//채팅창 안보이고 방 목록 보이게
						$('#chatRoom').css("display","none");
						$('#roomList').css("display","block");
						$('.kpjiFD').css("display", "none"); //뒤로 가기 버튼
					},
					error: function(error){
						console.log(error);
					}
				});
			}
			
			//2. 채팅방 목록 만들기
			function addRoomList(userID){
				userID = userID;
				$('#roomList').append('<div class="iBmKCq">' +
					'<div class="iMwzAU">'+
					'<div class="iIghyK"><div size="34" class="jSVhCe"></div></div>'+
					'<div class="WeNVhtT"><div class="giWeYY">'+userID+'님이</div>'+
					'<div class="dtIHNN">1:1 채팅 상담을 요청했습니다.<br></div></div></div>'+
					'<div class="dMDwgI"><div data-ch-testid="new-chat-button" class="chatBtn dMDtzc" id='+userID+'>'+
					'<div name="new-chat" width="16" height="16" size="16" class="fefFpu"></div>'+
					'채팅방 바로가기</div></div></div>'
				);
			}
			
			//채팅방 목록이 없는 경우
			function addRoomNull(){
				$('#roomList').append('<div id="roomNull" class="iBmKCq">' +
					'<div class="iMwzAU">'+
					'<div class="WeNVhtT"><div class="giWeYY"></div>'+
					'<div class="dtIHNN" style="padding: 15px 10px;">아직 도착한 메시지가 없습니다.<br></div></div></div></div>'
				);
			}
			
			var lastID = 0; //가장 마지막에 받은 메시지 아이디
			var userID = null;
			
			//3. 각 채팅방 바로가기
			$(document).on('click', '.chatBtn', function(){
				userID = this.id;
				//기존 채팅목록 가져오기
				$.ajax({
					url:'${root}/chat/ssafy/' + userID,
					method: 'GET',
					success : function(result){
						if(result == "") return;
						for(var i=0; i<result.length; i++){
							if(result == "") return;
							for(var i=0; i<result.length; i++){
								if(result[i]["fromID"] == "${loginInfo.userid}"){ //내가 쓴거
									addMyMessage(result[i]["fromID"], result[i]["chatContent"], result[i]["chatTime"])
								}
								else{ //상대방이 쓴거
									addYourMessage(result[i]["fromID"], result[i]["chatContent"], result[i]["chatTime"])
								}
								if(i == result.length-1) lastID = result[i]["chatID"]; //마지막 메시지번호
							}
						}
					},
					error: function(error){
						console.log(error);
					}
				})
				
				//채팅창 보이고 방 목록 안보이게
				$('#chatRoom').css("display","block");
				$('#roomList').css("display","none");
				$('.kpjiFD').css("display", "block"); //뒤로 가기 버튼
				
				//채팅 메시지 갱신
				getInfiniteChat(userID);
			})
			
			//채팅방에서 뒤로가기 버튼
			$('.kpjiFD').on('click', function(){
				//채팅창 안보이고 방 목록 보이게
				$('#chatRoom').css("display","none");
				$('#roomList').css("display","block");
				$('.kpjiFD').css("display", "none"); //뒤로 가기 버튼
				
				$('#chatList *').remove(); //채팅방 비워주기
				clearInterval(setNewMessage); //채팅방 갱신 중단
			})
			
			function addMyMessage(fromID, chatContent, chatTime){ 
				$('#chatList').append('<div class="me kZiNZK">' + 
						'<div class="hzdYcJ">'+
						'<div class="me_ttl">'+
						'<div class="brWGXU">해피하우스</div>'+
						'<div class="cQwzqb">'+chatTime+'</div>'+
						'</div>'+
						'<div class="me_content">'+
						'<div class="me_inner">'+
						'<div class="bWMjYC">'+
						'<div>'+
						'<div class="kHnNft gETHTV">'+chatContent+'</div>'+
						'</div></div></div></div></div>'+
						'<div class="krXYna"><div size="24" class="iPebcS"></div></div></div>'
				);
			}
			
			function addYourMessage(fromID, chatContent, chatTime){ 
				$('#chatList').append('<div class="kZiNZK dWAxCX">'+
						'<div class="krXYna">'+
						'<div size="24" class="user_profile"></div>'+
						'</div><div class="hzdYcJ"><div class="dQDbhd"><div class="your_brWGXU">'+fromID+'</div>'+
						'<div class="cQwzqb">'+chatTime+
						'</div></div><div class="gDLhWw"><div class="iJraMc">'+
						'<div class="bWMjYC"><div><div lass="kHnNft gETHTV">' +chatContent+
						'<br></div></div></div></div></div></div></div>'
				);
			}
			
			//새로운 메시지 전송
			//엔터 한번 칠 때마다 실행
			function submitFunction(){ 
				var chatContent = $('#chatContent').val();
				
				$.ajax({
					url: "${root}/chat",
					type: "POST",
					contentType: "application/json",
					data: JSON.stringify({
						fromID: "${loginInfo.userid}",
						toID: userID,
						chatContent: chatContent,
					}),
					success: function(result){
						console.log("전송 완료");
					},
					error: function(error){
						console.log(error);
					}
				});
				$('#chatContent').val('');
			}
			
			//새롭게 생성된 채팅방이 있는지
			function chatLoadNewRoom(){
				$.ajax({
					url : '${root}/chat/'+lastRoomID,
					method : 'get',
					success: function(result){
						if(result == "") return;
						$('#roomNull').remove();
						for(var i=0; i<result.length; i++){
							console.log("=============새로운 채팅방 생성: "+result[i]["userID"]);
							addRoomList(result[i]["userID"]);
							if(i == result.length-1) lastRoomID = result[i]["roomID"]; //마지막 채팅방 번호
						}
					},
					error: function(error){
						console.log(error);
					}
				});
			}
			
			
			//새롭게 작성한 메시지가 있는지
			function chatLoadNewMessage(userID){
				$.ajax({
					url : '${root}/chat/'+lastID+'/${loginInfo.userid}/'+userID,
					method : 'get',
					success: function(result){
						if(result == "") return;
						for(var i=0; i<result.length; i++){
							if(result[i]["fromID"] == "${loginInfo.userid}"){ //내가 쓴거
								addMyMessage(result[i]["fromID"], result[i]["chatContent"], result[i]["chatTime"])
							}
							else{ //상대방이 쓴거
								addYourMessage(result[i]["fromID"], result[i]["chatContent"], result[i]["chatTime"])
							}
							if(i == result.length-1) lastID = result[i]["chatID"]; //마지막 메시지번호
						}
					},
					error: function(error){
						console.log(error);
					}
				});
			}
			

			var setNewRoom;
			var setNewMessage;
			
			//3초마다 새로운 채팅방이 생겼는지 확인
			function getInfiniteRoomList(){
				setNewRoom = setInterval(function(){
				console.log("=============새로운 채팅방이 있나 3초마다 확인");
					chatLoadNewRoom();
				}, 3000);
			}
			
			//3초마다 새로운 메시지가 있는지 확인
			function getInfiniteChat(userID){
				setNewMessage = setInterval(function(){
				console.log("=============새로운 메시지 있나 3초마다 확인:    현재 채팅 고객 "+userID);
					chatLoadNewMessage(userID);
				}, 3000);
			}
		</script>
	</c:if>
</body>

</html>