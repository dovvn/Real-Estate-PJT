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
<title>사용자용 채팅창</title>
</head>
<% //메신저 현재 시간 구하기
Date today = new Date();
SimpleDateFormat df = new SimpleDateFormat("hh:mm aa"); // Just the year, with 2 digits
String time = df.format(today);
%>
<body>
	<!-- Messenger -->
	<!--<div id="messenger" data-toggle="modal" data-target="#chat"></div>-->
	<div id="chat_icon"></div>
	<div id="chat_content">
		<!-- 헤더 -->
		<div class="chYXNL">
			<div data-ch-testid="back-button" class="pTkUZ">
				<div name="back3" size="18" class="kpjiFD"></div>
			</div>
			<div class="TmRQW">
				<div class="ifoTHc">
					<div class="jyCzTS">해피하우스</div>
					<div name="offhours" size="22" width="22" height="22" class="fVdwuK"></div>
				</div>
				<div class="gLDehK">상담원과 1:1 연결됩니다.</div>
			</div>
			<div
				class="jOQCgr">
				<div class="ePYepb">
					<div name="close2" size="18" width="30" height="30" class="closeBtn"></div>
				</div>
			</div>
		</div>
		<!-- 헤더 -->

		<!-- 채팅방 -->
		<div class="UserChatsstyled__Content-j27mpg-0 cxfUhJB">
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
							<div data-ch-testid="messenger-footer-send-button" onclick="submitFunction();" class="MessengerFooterstyled__Send-i9sssu-5 giExZC"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 채팅방 -->
	</div>

	<c:if test="${not empty loginInfo}">
		<script>
			$(function() {
				chatListFunction(); //기존 채팅방 목록
				
				$('#chat_icon').click(function() {
					$('#chat_content').css("display", "block");
					$('#chat_icon').css("display", "none");
					getInfiniteChat();//기존 채팅목록 갱신
				})
				
				$('.closeBtn').click(function(){ //닫기 버튼
					$('#chat_content').css("display", "none");
					$('#chat_icon').css("display", "block");
					
					//메시지 갱신 중지
					clearInterval(setNewMessage);
				})
				$('.kpjiFD').css("display", "none"); //뒤로 가기 버튼 안보이게
				
			})
			
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
						toID: "ssafy",
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
			var lastID = 0; //가장 마지막에 받은 메시지 아이디
			
			//기존에 주고받은 채팅 목록
			function chatListFunction(){ 
				$.ajax({
					url : '${root}/chat/${loginInfo.userid}/ssafy',
					method : 'get',
					success: function(result){
						if(result != ""){
							for(var i=0; i<result.length; i++){
								if(result[i]["fromID"] == "${loginInfo.userid}"){ //내가 쓴거
									addMyMessage(result[i]["fromID"], result[i]["chatContent"], result[i]["chatTime"])
								}
								else{ //상대방이 쓴거
									addYourMessage(result[i]["chatContent"], result[i]["chatTime"])
								}
								if(i == result.length-1) lastID = result[i]["chatID"]; //마지막 메시지번호
							}
						}
						var chatTime = '<%= time %>';
						addHelloMessage(chatTime); //첫 인사말 한번만
					},
					error: function(error){
						console.log(error);
					}
				});
			}
			
			//새로운 작성한 메시지가 있는지
			function chatLoadNewMessage(){
				$.ajax({
					url : '${root}/chat/'+lastID+'/${loginInfo.userid}/ssafy',
					method : 'get',
					success: function(result){
						if(result == "") return;
						for(var i=0; i<result.length; i++){
							if(result[i]["fromID"] == "${loginInfo.userid}"){ //내가 쓴거
								addMyMessage(result[i]["fromID"], result[i]["chatContent"], result[i]["chatTime"])
							}
							else{ //상대방이 쓴거
								addYourMessage(result[i]["chatContent"], result[i]["chatTime"])
							}
							lastID = result[i]["chatID"];
						}
						 //스크롤 자동 내림
						$('#chatList').scrollTop($('#chatList').scrollHeight);
					},
					error: function(error){
						console.log(error);
					}
				});
			}
			
			//화면에 보여줌 1.내 메시지
			function addMyMessage(fromID, chatContent, chatTime){ 
				$('#chatList').append('<div class="me kZiNZK">' + 
						'<div class="hzdYcJ">'+
						'<div class="me_ttl">'+
						'<div class="brWGXU">'+fromID+'</div>'+
						'<div class="cQwzqb">'+chatTime+'</div>'+
						'</div>'+
						'<div class="me_content">'+
						'<div class="me_inner">'+
						'<div class="bWMjYC">'+
						'<div>'+
						'<div class="kHnNft gETHTV">'+chatContent+'</div>'+
						'</div></div></div></div></div>'+
						'<div class="krXYna"><div size="24" class="user_profile"></div></div></div>'
				);
			}
			
			//화면에 보여줌 2. 상대방 메시지
			function addYourMessage(chatContent, chatTime){ 
				$('#chatList').append('<div class="kZiNZK dWAxCX">'+
						'<div class="krXYna">'+
						'<div size="24" class="iPebcS"></div>'+
						'</div><div class="hzdYcJ"><div class="dQDbhd"><div class="brWGXU">해피하우스</div>'+
						'<div class="cQwzqb">'+chatTime+
						'</div></div><div class="gDLhWw"><div class="iJraMc">'+
						'<div class="bWMjYC"><div><div lass="kHnNft gETHTV">' +chatContent+
						'<br></div></div></div></div></div></div></div>'
				);
			}
			
			//화면에 보여줌 3. 첫 인사말
			function addHelloMessage(chatTime){
				var faqList = [];
				//FAQ가져오기
				$.ajax({
					url : '${root}/qna/'+"faq",
					method : 'get',
					success: function(result){
						if(result == "") return;
						$('#chatList').append('<div class="DayDividerstyled__DayDivider-sc-1jh9g36-0 fhpiwB">오늘</div>'+
								'<div class="kZiNZK dWAxCX">'+
								'<div class="krXYna">'+
								'<div size="24" class="iPebcS"></div>'+
								'</div><div class="hzdYcJ"><div class="dQDbhd"><div class="brWGXU">해피하우스</div>'+
								'<div class="cQwzqb">'+chatTime+
								'</div></div><div class="gDLhWw"><div id="hello_msg" class="iJraMc">'+
								'<div class="bWMjYC"><div><div lass="kHnNft gETHTV">안녕하세요 방문해주셔서 감사합니다. 무엇을 도와드릴까요? :)</div></div></div></div></div></div></div>'
						);
						
						$('#hello_msg').append(
							'<div class="faq_list" style="margin-top: 15px; border-radius: 12px; padding: 10px; background-color: #fff;"><b>🔹 자주 묻는 질문🔹</b></div>'
						);
						
						for(var i=0; i<result.length; i++){
							$('.faq_list').append(
								'<p style="margin-bottom: 0px; font-size: 14px; color:#2e64fe;" class="qnaContent">Q. '+result[i]["btitle"]+'</p>'+
								'<p style="display:none;">'+result[i]["bcontent"]+'</p>'
							);
						}
					
					},
					error: function(error){
						console.log(error);
					}
				});
			}
			
			//faq제목 누르면 내용 답변으로 보여주기
			$(document).on('click', '.qnaContent', function(){
				var chatContent = $(this).next().text();
				var chatTime = '<%= time %>';
				addYourMessage(chatContent, chatTime);
			})
			
			$(document).on('mouseover', '.qnaContent', function(){
				$(this).css({"cursor":"pointer"});
				$(this).css({"text-decoration":"underline"});
				$(this).css({'color':'#2e64fe'});
			})
			
			$(document).on('mouseleave', '.qnaContent', function(){
				$(this).css({"text-decoration":"none"});
			})
			
			var setNewMessage;
			//3초마다 새로운 메시지가 있는지 확인
			function getInfiniteChat(){ 
				setNewMessage = setInterval(function(){
					chatLoadNewMessage();
				}, 3000);
			}
		</script>
	</c:if>
</body>

</html>