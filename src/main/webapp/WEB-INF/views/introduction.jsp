<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/onepage-scroll.css" />
<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/introduct.css" media="all" />
<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/style.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous">
	
</script>
<script
	src="https://sta.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous">
	
</script>
<script src="https://kit.fontawesome.com/5d2954c3f8.js"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="${root}/resources/js/main.js"></script>
<script src="${root}/resources/js/scrolloverflow.min.js"></script>
<script src="${root}/resources/js/jquery.fullPage.min.js"></script>
<title>사이트 소개</title>
</head>
<body>
	<div id="wrap">
		<!-- Navbar -->
		<nav id="header"
			class="navbar navbar-expand-sm navbar-default py-3 border-bottom justify-content-between">
			<div class="navbar navbar__logo">
				<i class="fas fa-home logo pr-1"  style="color:#fff"></i> <a
					class="navbar-brand happy-font title" href="${root}/"
					style="color: #fff"><b>해피</b></a>
			</div>

			<%-- <div class="navbar navbar__menu">
				<ul class="navbar-nav menu mx-md-3">
					<li class="nav-item"><a href="${root}/noticeList.do"
						class="nav-link font-weight-bold text-light">공지사항</a></li>
					<li class="nav-item"><a href="${root}/qna"
						class="nav-link font-weight-bold text-light">QnA</a></li>
					<li class="nav-item"><a href="${root}/search"
						class="nav-link font-weight-bold text-light">실거래가 검색</a></li>
				</ul>
			</div> --%>
		</nav>

		<div id="fullpage">
			<div id="con01_slide" class="section">
				<div class="slider01_txt">
					<div class="slider_h01">
						<h1>
							Trusted Service<br>to Find your Home
						</h1>
					</div>
					<div class="slider_p01">
						<p>
							당신의 부동산 전문가,<br> 해피하우스
						</p>
					</div>
				</div>
				<!--마우스-->
				<div class="mouse_icon">
					<a href="#secondPage"> <marquee align="top" height="100"
							direction="down" behavior="alternate" scrollamount="4">
							<img src="${root}/resources/img/con01_mouse.png" alt="">
						</marquee>
					</a>
				</div>
			</div>
			<div id="con02_intro" class="section">
				<div class="con02_in">
					<div class="intro_ttl">
						<h3>서비스 소개</h3>
						<p>우리는 세상에 없던 부동산 서비스를 만들어 갑니다.
						<p>
					</div>
					<ul class="intro_box">
						<li class="intro_box00">
							<div id="box_active">
								<h4>매물 검색</h4>
								<p>SEARCH PROPERTY</p>
							</div>
							<div id="box_hover" style="display: none; margin-top: 35%;">
								<p>
									내가 사는 지역의 동별, 아파트별<br> 매물을 검색해보고 찜해보세요<br>
								</p>
							</div>
						</li>
						<li class="intro_box01">
							<div id="box_active">
								<h4>주변 상권</h4>
								<p>NEARBY AREAS</p>
							</div>
							<div id="box_hover" style="display: none; margin-top: 35%;">
								<p>
									관심 매물 주변에 위치한<br>병원, 진료소, 치안안전등급,<br>부동산, 버스정류소 등을 찾아보세요
								</p>
							</div>
						</li>
						<li class="intro_box02">
							<div id="box_active">
								<h4>채팅 상담</h4>
								<p>CAHT CONSULTATION</p>
							</div>
							<div id="box_hover" style="display: none; margin-top: 35%;">
								<p>
									상담원과 1:1 채팅 상담을 시작해보세요<br>자주 묻는 FAQ를 확인할 수 있어요 
								</p>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div id="con03_notice" class="section">
				<div class="con03_left">
					<div class="ttl">
						<h2>살기 좋은 아파트 찾기</h2>
						<p>
							관심있는 매물 주변의 범죄률을 지도에서 한눈에 파악해보세요<br>당신의 꼼꼼한 선택이 가족의 행복을
							지킵니다.
						</p>
					</div>
				</div>
				<div class="con03_right"></div>
				<ul class="box_ul">
					<li>
						<div class="img">
							<img src="${root}/resources/img/icon_1.png">
						</div>
						<h4>맞춤안전 지도</h4>
						<p>주요 5대 범죄 위험도 확인</p>
					</li>
					<li>
						<div class="img">
							<img src="${root}/resources/img/icon_2.png">
						</div>
						<h4>신뢰성있는 데이터</h4>
						<p>
							경찰청에서 제공받은 밀도분석 정보<br>
						</p>
					</li>
					<li>
						<div class="img">
							<img src="${root}/resources/img/icon_3.png">
						</div>
						<h4>범죄분포 시각화</h4>
						<p>치안 사고 발생현황을 5등급으로 분류</p>
					</li>
				</ul>
			</div>
			<div id="con04_end" class="section">
				<div class="con04_left">
					<div class="img">
						<img src="${root}/resources/img/web_img.png" />
					</div>
				</div>
				<div class="con04_right">
					<div class="ttl">
						<h2>주변 아파트 가격을 한눈에!</h2>
						<p>
							집에서도 쉽고 간편하게!<br>집 구할 때 꼭 필요한 정보 놓치지 마세요
						</p>
						<button class="btn" onclick="location.href='${root}/'">해피하우스 이용하기</button>
					</div>
				</div>
				<footer id="footer" class="footer bg-light py-3 my-md-3">
					<!-- 사이트 맵 -->
					<div class="row justify-content-end">
						<div class="col-3">
							<i class="fas fa-home logo pr-1 d-block"
								style="color: black; font-size: 48px;"></i> <small
								class="text-muted">© 2020</small>
						</div>
						<div class="col-3">
							<h4>Features</h4>
							<ul class="list-unstyled">
								<li><a href="${root}/noticeList.do" class="text-muted">공지사항</a></li>
								<li><a href="${root}/qna" class="text-muted">Qna</a></li>
							</ul>
						</div>
						<div class="col-3">
							<h4>About</h4>
							<ul class="list-unstyled">
								<li><a href="${root}/introduction.do" class="text-muted">소개</a></li>
							</ul>
						</div>
					</div>
					<!-- CopyRight -->
					<div class="container">
						<span class="text-muted float-right" style="font-size:14px;">Copyright 2020.
							성진옥정다운. ALL RIGHTS RESERVED</span>
					</div>
				</footer>
			</div>
		</div>
	</div>
	<div id="menu">
		<ul id="menu_circle">
			<a href="#firstPage">
				<li data-menuanchor="firstPage" class="active"></li>
			</a>
			<a href="#secondPage">
				<li data-menuanchor="secondPage"></li>
			</a>
			<a href="#3rdPage">
				<li data-menuanchor="3rdPage"></li>
			</a>
			<a href="#4thPage">
				<li data-menuanchor="4thPage"></li>
			</a>
		</ul>
	</div>
</body>
</html>