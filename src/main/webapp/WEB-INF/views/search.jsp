<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/style.css" />
<script src="https://kit.fontawesome.com/5d2954c3f8.js" crossorigin="anonymous"></script> <!-- fontawesome -->
<style type="text/css">
    #map {
        width: 45%;
        height: 1000px;
    }
    
     .interest:hover{
    	cursor: pointer;
    }
</style>
<title>Document</title>
</head>

<body>
	<!-- Navbar -->
	<jsp:include page="header.jsp" />

	<!-- Contents -->
	<div class="container-fluid contents">
		<%-- 시/도, 구/군, 동 데이터 읽어와 갱신 --%>
		<script type="text/javascript">
			$(function(){
				// 시도 옵션 리스트 목록
				$.ajax({
					url:'${root}/map/sido',
					type : 'GET',
					contextType : 'application/json;charset=utf-8',
					dataType : 'json',
					success : function(result){
						var optionList = '';
						for(let i = 0; i < result.length; i++){
							optionList += '<option value="';
							optionList += result[i]["sidoCode"] + '">';
							optionList += result[i]["sidoName"]
							optionList += '</option>';
						}
						$("#sido").append(optionList);
					},
					error : function(xhr, status, msg){
						console.log(status + " " + msg);									
					}
				});
				
				// 시도에 따른 구군 옵션 리스트 목록
				$("#sido").change(function(){
					$.ajax({
						url:'${root}/map/gugun/'+$("#sido").val(),
						type : 'GET',
						contextType : 'application/json;charset=utf-8',
						dataType : 'json',
						success : function(result){
							$("#gugun").empty();
							$("#gugun").append("<option selected disabled>구/군</option>");
							var optionList = '';
							for(let i = 0; i < result.length; i++){
								optionList += '<option value="';
								optionList += result[i]["gugunCode"] + '">';
								optionList += result[i]["gugunName"]
								optionList += '</option>';
							}
							$("#gugun").append(optionList);
						},
						error : function(xhr, status, msg){
							console.log(status + " " + msg);									
						}
					});
				});
				
				// 구군에 따른 동 옵션 리스트 목록
				$("#gugun").change(function(){
					$.ajax({
						url:'${root}/map/dong/'+$("#gugun").val(),
						type : 'GET',
						contextType : 'application/json;charset=utf-8',
						dataType : 'json',
						success : function(result){
							$("#dong").empty();
							$("#dong").append("<option selected disabled>동</option>");
							var optionList = '';
							for(let i = 0; i < result.length; i++){
								optionList += '<option value="';
								optionList += result[i]["dong"] + '">';
								optionList += result[i]["dong"]
								optionList += '</option>';
							}
							$("#dong").append(optionList);
						},
						error : function(xhr, status, msg){
							console.log(status + " " + msg);									
						}
					});
				});
			});		        	 	
		</script>
		<!-- 매물 전체 검색화면 navbar -->
		<form action="${root}/search" method="post"
			class="form-inline justify-content-between mt-md-2">
			<div class="form-group">
				<input name="aptName" type="text" class="form-control mx-md-1"
					placeholder="아파트 이름 입력" style="border: 0; font-size: 24px">
				<button class="btn">
					<i class="fas fa-search" style="font-size: 24px; color: #1abc9c"></i>
				</button>
			</div>
			<div class="form-group">
				<div class="form-group mx-md-1">
					<select name="sido" id="sido" class="form-control" placeholder="시/도">
								<option selected disabled>시/도</option>
					</select>
				</div>
				<div class="form-group mx-md-1">
					<select name="gugun" id="gugun" class="form-control" placeholder="구/군">
								<option selected disabled>구/군</option>
					</select>
				</div>
				<div class="form-group">
					<select name="dong" id="dong" class="form-control" placeholder="동">
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
				<div class="form-group mx-md-1">
					<select name="sortType" id="sortType" class="form-control">
						<option selected disabled>정렬기준</option>
						<option value="price">가격순</option>
						<option value="area">면적순</option>
						<option value="floor">층별</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<button type="button" id="btn__safetyHospital"
					class="btn border btn-sm">주변 국민안심병원</button>
				<button type="button" id="btn__covidTestCenter"
					class="btn border btn-sm">주변 코로나 선별 진료소</button>
				<button type="button" id="btn__crime" 
					class="btn border btn-sm">치안안전등급</button>
				<button type="button" id="btn__land" 
					class="btn border btn-sm">주변 부동산</button>
				<button type="button" id="btn__busstop" 
					class="btn border btn-sm">주변 버스 정류소</button>
				<button id="reset_btn" class="btn" type="reset">
					<i class="fas fa-redo-alt" style="font-size: 24px; color: #1abc9c"></i>
				</button>
				<script>
					$('#reset_btn').click(function(){
						initMap(); //지도 초기화
						
						<c:forEach items="${dealList}" var="dto">
							$.get("https://maps.googleapis.com/maps/api/geocode/json"
								,{	key:'AIzaSyANeOokozcE3_hMbOff4NAU9aCNOYeC-uM'
									, address: "${dto.dong}" + "+" + "${dto.aptName}" + "+" + "${dto.jibun}"
								}
								, function(data, status) {
									tmpLat = data.results[0].geometry.location.lat;
									tmpLng = data.results[0].geometry.location.lng;
									addMarker({lat:tmpLat, lng:tmpLng, name:"${dto.aptName}", type:'house'}, null);
								}
								, "json"
							);//매물get
						</c:forEach>
					})
				</script>
			</div>
		</form>
		<hr>


		<!-- 검색화면 컨텐츠 -->
		<div class="container-fluid search-results w-100 pl-0">
			<!-- 주변 국민 안심병원, 코로나 선별 진료소 출력 -->
			<c:if test="${not empty dealList}">
				<script type="text/javascript">
        			$(function(){        	
        				//  지도에 표시
        				function markCoronaHospitalPlace(place, type){
        					$.get(
       							"https://maps.googleapis.com/maps/api/geocode/json"
								,{	key:'AIzaSyANeOokozcE3_hMbOff4NAU9aCNOYeC-uM'
									, address: place.address
								}
								, function(data, status) {
									tmpLat = data.results[0].geometry.location.lat;
									tmpLng = data.results[0].geometry.location.lng;
									addMarker({lat:tmpLat, lng:tmpLng, name:place["hospitalName"], type:type}, place);
								}
								, "json"
							);        		  
        				};
        				
        				//치안안전등급 지도에 표시
        				function markSafetyLevel(place, type){
        					$.get(
          						"https://maps.googleapis.com/maps/api/geocode/json"
   								,{	key:'AIzaSyANeOokozcE3_hMbOff4NAU9aCNOYeC-uM'
   									, address: "서울특별시 "+place.gu
   								}
   								, function(data, status) {
   									tmpLat = data.results[0].geometry.location.lat;
   									tmpLng = data.results[0].geometry.location.lng;
   									addSafetyMarker({lat:tmpLat, lng:tmpLng, name:place["gu"], type:type}, place);
   								}
   								, "json"
   							);
        				}
        				
        				//부동산 지도에 표시
        				function markLand(place, type){
        					$.get(
          						"https://maps.googleapis.com/maps/api/geocode/json"
   								,{	key:'AIzaSyANeOokozcE3_hMbOff4NAU9aCNOYeC-uM'
   									, address: place.address
   								}
   								, function(data, status) {
   									console.log("구글 맵" + data);
   									tmpLat = data.results[0].geometry.location.lat;
   									tmpLng = data.results[0].geometry.location.lng;
   									addLandMarker({lat:tmpLat, lng:tmpLng, name:place["title"], type:type}, place);
   								}
   								, "json"
   							);
        				}
			
        				// 병원 조회 버튼 눌렀을 때 : type hospital
        				$("#btn__safetyHospital").click(function(){
        					$.ajax({
        						url : '${root}/hospital/safety/${dealList[0].no}',
        						method : 'get',
        						success : function(hospitalList){
        							for(var i = 0; i < hospitalList.length; i++){
        								markCoronaHospitalPlace(hospitalList[i], "hospital");
        							}
        						},
        						error : function(xhr, status, msg){
									console.log(status + " " + msg);									
								}
        					});
        				});
        				
        				// 코로나 진료소 조회버튼 눌렀을 때 : type corona
        				$("#btn__covidTestCenter").click(function(){
        					$.ajax({
        						url : '${root}/hospital/covid/${dealList[0].no}',
        						method : 'get',
        						success : function(CoronaTestList){
        							for(var i = 0; i < CoronaTestList.length; i++){
        								markCoronaHospitalPlace(CoronaTestList[i], "corona");
        							}
        						},
        						error : function(xhr, status, msg){
									console.log(status + " " + msg);									
								}
        					});
        				});
        				
        				//치안안전등급 버튼 눌렀을 때
        				$("#btn__crime").click(function(){
        					$.ajax({
        						url : '${root}/crime',
        						method : 'get',
        						success : function(crimeList){
        							for(var i=0; i<crimeList.length; i++){
        								markSafetyLevel(crimeList[i], crimeList[i]["safety_level"]);
        							}
        						},
        						error : function(xhr, status, msg){
									console.log(status + " " + msg);									
								}
        					});
        				});
        				
        				//주변 부동산 버튼 눌렀을 떄
        				$("#btn__land").click(function(){
        					var sidoName = $("#sido option:selected").html();
        					var gugunName = $("#gugun option:selected").html();
        					var dongName = $("#dong option:selected").html();
        					
        					var keyword = '';
        					if(dongName != '동'){
        						keyword = sidoName + " " 
        								+ gugunName + " "
        								+ dongName + " 부동산";
        					}else if(gugunName != '구/군'){
        						keyword = sidoName + " " 
								+ gugunName + " 부동산";
							}else if(sidoName != '시/도'){
        						keyword = sidoName + " 부동산"; 
							}else{
								keyword = '부동산';
							}
        						
        					$.ajax({
        						url : '${root}/land',
        						method: 'post',
        						dataType: 'JSON',
        						contextType: 'application/json; charset:UTF-8;',
        						data : {'keyword' : keyword,},
        						success : function(landList){
        							var items = landList['items'];
        							for(var i = 0; i < items.length; i++){
        								console.log(items[i]);
	        							markLand(items[i], "land");
        							}
        						},
        						error : function(xhr, status, msg){
        							console.log(status + " " + msg);
        						}
        					});
        				});
        				
        				//버스 정류장 버튼 눌렀을 떄
        				$("#btn__busstop").click(function(){
        					<c:forEach items="${dealList}" var="deal">
        						$.ajax({
		       						url : '${root}/busstop/${deal.lat}/${deal.lng}',
		       						method: 'get',
		       						dataType: 'XML',
		       						contextType: 'application/xml; charset:UTF-8;',
		       						success : function(busstopList){
		       							var items = $(busstopList).find('item');
		       							for(var i = 0; i < items.length; i++){
		        							addBusstopMarker(items[i], "bus");
		       							}
		       						},
		       						error : function(xhr, status, msg){
 		       							console.log(status + " " + msg);
	       							}
	       						});
        					</c:forEach>
        				});
        			});
        		</script>
			</c:if>
			<!-- 매물 목록 -->
			<div id="item-list" class="d-inline-block w-50 overflow-auto float-left">
				<header >
					<h3>전체 방 ${fn:length(dealList)} 개</h3>
					<hr>
				</header>
				<c:choose>
					<c:when test="${not empty dealList}">
						
					
						<c:set var="itemIdx" value="0"></c:set>
						<%--매물 반복문 도는곳 --%>
						<c:forEach items="${dealList}" var="dto"> 
							<div id="item__${itemIdx}" class="card d-inline-block"
								style="position: relative 0 0; border: none; width: 160px; height: 100px;">
								<%--로그인 정보 있으면 찜한 매물은 꽉 찬 하트 --%>
								<c:if test="${not empty loginInfo}">
									<img class="heartIcon" id="interest${dto.no}" src="" width="20px" height="20px"/>
									<script>
										$(function(){
											$.ajax({
												url:'${root}/interest/chk/${dto.no}',
												method:'get',
												success:function(result){
													if(result == 'true'){
														$("#interest${dto.no}").attr('src', './resources/img/heart_fill.png');
													}else {
														$("#interest${dto.no}").attr('src', './resources/img/heart_empty.png');
													}
												},
											});
										})
									</script>
								</c:if>	
    							
    							<c:if test= "${dto.img eq null}">
									<img src="${root}/resources/img/room_sample.PNG" alt=""
										style="width: 140px; height: 100px;">
    							</c:if>
								<c:if test= "${dto.img ne null}">
									<img src="${root}/resources/img/houseimg/${dto.img}" alt=""
										style="width: 140px; height: 100px;">
    							</c:if>
    							
    							<div class="card-body p-md-1">
										<h5 style="overflow: hidden; width: 130px; height: 25px;" class="font-weight-bold">${dto.aptName}</h5>
										<h5><button class="btn btn-sm btn-primary disabled">아파트</button></h5>
									<p class="card-text font-weight-bold">매매
										${dto.dealAmount}만원</p>
									<p class="card-text">${dto.floor}층, ${dto.area}m</p><br>
								</div>
							</div>

							<script type="text/javascript">
		                        $.get("https://maps.googleapis.com/maps/api/geocode/json"
									,{	key:'AIzaSyANeOokozcE3_hMbOff4NAU9aCNOYeC-uM'
										, address: "${dto.dong}" + "+" + "${dto.aptName}" + "+" + "${dto.jibun}"
									}
									, function(data, status) {
										tmpLat = data.results[0].geometry.location.lat;
										tmpLng = data.results[0].geometry.location.lng;
										addHouseMarker({lat:tmpLat, lng:tmpLng, name:"${dto.aptName}", type:'house'}, null);
									}
									, "json"
								);//get
								
								
								$('#item__${itemIdx}').click( function(event) {
									var className = $(event.target).attr('class');
									var idName = $(event.target).attr('id');
									
									// 찜 등록 및 해제
									if(className == 'heartIcon'){
										if($("#"+idName).attr('src') == './resources/img/heart_fill.png'){
	                    	    			$.ajax({
												url:'${root}/interest/${dto.no}',
												method:'delete',
												success:function(){
													$("#"+idName).attr('src', './resources/img/heart_empty.png');
	                    	    					alert("찜 목록에서 해제 되었습니다.");
												}
											});
	                    	    		}else if($("#"+idName).attr('src') == './resources/img/heart_empty.png'){
											$.ajax({
												url:'${root}/interest/${dto.no}',
												method:'get',
												success:function(){
													$("#"+idName).attr('src', './resources/img/heart_fill.png');
	                    	    					alert("찜 목록에 등록이 되었습니다.");
												}
											});
	                    	    		}
									}
									// 매물 상세 정보 
									else{
										if("${loginInfo}" != null && "${loginInfo}" != "") {
											$('#item-list').empty();
											let str = '<header><h3><button id="back" class="btn"><i class="fas fa-arrow-left"></i></button>'
												+ "${dto.aptName}" + '</h3>'
												+ '<hr> </header><div class="item container w-100"><img src="${root}/resources/img/result_detail_sample.jpg" alt="" width="100%">'
												+ '<div class="item__content container px-md-5"><h1 class="font-weight-bold">'
						                    	+ "매매" + "${dto.dealAmount}만원" + '</h1>'
						                    	+ '<p>' + '확인 날짜 : ${dto.dealYear}-${dto.dealMonth}-${dto.dealDay}' + '<br>'
							                    + '<hr class="mb-md-3" style="border-color: orange;">'
							                    + '</p>'
							                    + '<table class="table">'
							                    + '<tr>'
							                    + '<th>전용 면적</th>'
							                    + '<td>' + '${dto.area}m' + '</td>'
												+ '</tr>'
												+ '<tr>'
												+ '<th>거래 구분</th>'
												+ '<td>아파트</td>'
												+ '</tr>'
												+ '<tr>'
												+ '<th>층</th>'
												+ '<td>' + '${dto.floor}층' + '</td>'
												+ '</tr>'
												+ '</table>'
												+ '</div></div>';
											$('#item-list').append(str);
											$('#back').click(function(){
												location.href = "${root}/search";
											});
											setCenterSelectedItem("${dto.lat}", "${dto.lng}");
										} else {
											alert("상세보기는 로그인 후 사용 가능합니다");
										}
									}
								});
	                        </script>
	                        <c:set var="itemIdx" value="${itemIdx + 1}"></c:set>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<h1>매물이 없습니다 ㅠㅠ</h1>
					</c:otherwise>
				</c:choose>
			</div>

			<!-- 지도 -->
			<div id="map" class="d-inline-block w-40 m-md-2">
				<script
					src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
				<script defer
					src="https://maps.googleapis.com/maps/api/js?key=AIzaSyANeOokozcE3_hMbOff4NAU9aCNOYeC-uM&callback=initMap"></script>
				<script type="text/javascript">
                    const labels = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
                    let labelIndex = 0;
                    
                    var map;
                    var start = {lat: 37.5665734, lng: 126.978179};
                    
                    const iconBase = "./resources/img/";
                    const icons = {
                      house: {
                        icon: iconBase + "marker_house.png",
                      },
                      hospital: {
                        icon: iconBase + "marker_hospital.png",
                      },
                      corona: {
                        icon: iconBase + "marker_corona.png",
                      },
                      bus: {
                        icon: iconBase + "marker_busstop.png",
                      },
                      land: {
                      	icon: iconBase + "marker_land.png",
                      },
                      1: {
                        icon: iconBase + "marker_safety01.png",  
                      },
                      2: {
                    	icon: iconBase + "marker_safety02.png",    
                      },
                      3: {
                    	icon: iconBase + "marker_safety03.png",    
                      },
                      4: {
                    	icon: iconBase + "marker_safety04.png",    
                      },
                      5: {
                    	icon: iconBase + "marker_safety05.png",  
                      }
                    };

                    // 맵 초기화
                    function initMap() {
                        map = new google.maps.Map(document.getElementById('map'), {
                            zoom: 14,
                            center: start
                        });
                    }
					
                    function setCenterSelectedItem(tmpLat, tmpLng){
                    	map.setZoom(17);
                    	map.setCenter({lat : tmpLat, lng:tmpLng});
                    }
                    
                 	// 매물 위치에 마커 표시 하기
                    function addHouseMarker(place, dto){   
                   		const marker = new google.maps.Marker({
                   			position: new google.maps.LatLng(parseFloat(place.lat),parseFloat(place.lng)),
                   			label: {
                   				color: 'black',
                   				fontWeight: 'bold',
                   				fontSize: '25px',
                   				text: place.name,
                   			},
   							title: place.name,
							icon: {
   								labelOrigin: new google.maps.Point(30, 80),
   							    url: icons[place.type].icon,
   							},
   							map: map,
                   		})
                   		
						marker.addListener('click', function() {
							map.setZoom(17);
							map.setCenter(marker.getPosition());
						});

						map.setZoom(14);
						marker.setMap(map);
						map.setCenter(marker.getPosition());
                    }
                    
                    // 종류별로 해당 위치에 마커 표시 하기
                    function addMarker(place, dto){   
                   		const marker = new google.maps.Marker({
                   			position: new google.maps.LatLng(parseFloat(place.lat),parseFloat(place.lng)),
							icon: {
   								labelOrigin: new google.maps.Point(30, 80),
   							    url: icons[place.type].icon,
   							},
   							map: map,
                   		})
                   		
                   		if(dto != null){
	                   		var info = dto.hospitalName+" 상세 정보<br>"
	                   		+ "<span style='color:#999; font-size:13px;'>"
	                   		+ dto.validDate
	                   		+ "</span><br><br>"
	                   		+ "주소 : "+dto.address+"<br>"
	                   		+ "전화번호 : "+dto.phone+"<br>";
	                   		
	                   		if(dto.weekTime){
	                   			info += "[운영 시간]<br>";
	                   			info += "주중 : " + dto.weekTime + '<br>';
	                   		}
	                   		if(dto.saturdayTime){
	                   			info += "토요일 : " + dto.saturdayTime + '<br>';
	                   		}
	                   		if(dto.hoildayTime){
	                   			info += "주말 : " + dto.holidayTime + '<br>';
	                   		}
	                   		attachInfo(marker, info);
                   		}
						marker.addListener('click', function() {
							map.setZoom(17);
							map.setCenter(marker.getPosition());
						});

						map.setZoom(14);
						marker.setMap(map);
						map.setCenter(marker.getPosition());
                    }
                    
                    //치안안전등급 마커 표시
                    function addSafetyMarker(place, dto){   
                   		const marker = new google.maps.Marker({
                   			position: new google.maps.LatLng(parseFloat(place.lat),parseFloat(place.lng)),
                   			label: {
                   				color: 'black',
                   				fontWeight: 'bold',
                   				fontSize: '18px',
                   				text: place.name,
                   			},
   							title: place.name,
   							icon: {
   								labelOrigin: new google.maps.Point(30, 80),
   							    url: icons[place.type].icon,
   							},
   							map: map,
                   		});
                   		
                   		var info = dto.gu+" 5대 범죄 발생현황<br>"
                   		+ "<span style='color:#999; font-size:13px;'>(2019년 기준)</span><br><br>"
                   		+ "살인: "+dto.murder+"건<br>"
                   		+ "강도: "+dto.robbery+"건<br>"
                   		+ "추행: "+dto.harassment+"건<br>"
                   		+ "절도: "+dto.theft+"건<br>"
                   		+ "폭력: "+dto.violence+"건<br>";

                   		attachInfo(marker, info);
                   		map.setZoom(13);
						marker.setMap(map);
                    }
                    
                 // 부동산 정보 마커 표시 하기
                    function addLandMarker(place, dto){   
                   		const marker = new google.maps.Marker({
                   			position: new google.maps.LatLng(parseFloat(place.lat),parseFloat(place.lng)),
   							icon: {
   								labelOrigin: new google.maps.Point(30, 80),
   							    url: icons[place.type].icon,
   							},
   							map: map,
                   		})
                   		
                   		var info = dto.title+" 상세 정보<br>"
                   		+ "<span style='color:#999; font-size:13px;'>"
                   		+ dto.category
                   		+ "</span><br><br>"
                   		+ "주소 : "+dto.roadAddress+"<br>"
                   		+ "( "+dto.address+" )<br>";
                   		
                   		attachInfo(marker, info);
                   		
						marker.addListener('click', function() {
							map.setZoom(17);
							map.setCenter(marker.getPosition());
						});

						map.setZoom(14);
						marker.setMap(map);
						map.setCenter(marker.getPosition());
                    }
                 
                 // 버스 정류장 정보 마커 표시 하기
                    function addBusstopMarker(place, type){   
                   		const marker = new google.maps.Marker({
                   			position: new google.maps.LatLng(parseFloat($(place).find('gpslati').text()),parseFloat($(place).find('gpslong').text())),
   							icon: {
   								labelOrigin: new google.maps.Point(30, 80),
   							    url: icons[type].icon,
   							},
   							map: map,
                   		})
                   		
                   		var info = $(place).find('nodeno').text()+" 정류장<br>";
//                    		+ "<span style='color:#999; font-size:13px;'> 정류장 번호 : "
//                    		+ $(place).find('nodeno').text()
//                    		+ "</span><br>";
                   		
                   		attachInfo(marker, info);
                   		
						marker.addListener('click', function() {
							map.setZoom(17);
							map.setCenter(marker.getPosition());
						});

						map.setZoom(14);
						marker.setMap(map);
						map.setCenter(marker.getPosition());
                    }
                    
                    function attachInfo(marker, info) {
                    	const infowindow = new google.maps.InfoWindow({
                    		content: info,
                    	});
                    	
                    	marker.addListener('click', function() { //클릭하면 상세정보 출력
                    		infowindow.open(marker.get("map"), marker);
						});
                    } 
                </script>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="footer.jsp" />
</body>

</html>