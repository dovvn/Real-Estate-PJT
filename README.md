<p align="center">
  <img width="600px;" src="https://user-images.githubusercontent.com/59414210/106365568-bee7ff80-6379-11eb-82ca-99c8b7d1c444.png" />
  <br/>부동산 매물 정보 사이트🏠
  <p align="center">
  <img src="https://img.shields.io/badge/Vue.js-v4.5.10-green?logo=vue.js" />
  <img src="https://img.shields.io/badge/BootStrap-v3.3.2-green?logo=bootstrap" />
  <img src="https://img.shields.io/badge/Spring%20Legacy-v3.9.15-blue?logo=spring" />
  <img src="https://img.shields.io/badge/AWS%20RDS----blue?logo=amazon" />
  <img src="https://img.shields.io/badge/MySQL-v8.0-blue?logo=mysql" />
  </p>
</p>  

> 프로젝트 기간: 11/19 - 11/26  
> [프로젝트 일정표 바로가기](https://www.notion.so/HAPPY-HOUSE-520ad8fe139b47db8c18fb1d4c90b9d8)     

![VueJS](https://img.shields.io/badge/Vue.js-v4.5.10-green?logo=vue.js)
![BootStrap](https://img.shields.io/badge/BootStrap-v3.3.2-green?logo=bootstrap) ![Java](https://img.shields.io/badge/Java-v1.8-blue?logo=java) ![Spring Legacy](https://img.shields.io/badge/Spring%20Legacy-v3.9.15-blue?logo=spring) ![AWS RDS](https://img.shields.io/badge/AWS%20RDS----blue?logo=amazon) ![MySQL](https://img.shields.io/badge/MySQL-v8.0-blue?logo=mysql)   


## 서비스 개요
거주하는 지역과 주거형태를 선택 후 검색하여 지도를 통해 매물 정보를 확인하고 근처 진료소,병원,근처 부동산,정류소 등의 생활시설 정보와 치안 안전 등급을 제공받아 보다 안전한 매물을 찾을 수 있도록 도와주는 부동산 서비스입니다.

## 역할 분담
| 이름   | 역할 | 내용 |
| ------ | ---- | ---- |
| 성진옥[팀장] | FE,BE,영상 | - Goolge Map/Naver/공공데이터 API<br/>- Rest API이용 Ajax 요청<br/>- QnA vue(CRUD) 구현<br/>- 찜하기 기능<br/>- UCC/Marker icon 제작 |
| 정다운[팀원] | FE,BE | - 구별 범죄데이터 파싱 및 치안 등급 시각화<br/>- 실시간 1:1 채팅 메신저<br/>- AWS와 MySQL 연동<br/>- 원페이지 스크롤 플러그인 적용<br/>- 소개페이지, 공지사항(CRUD) 제작  |  

## 주요 기능 
* **매물 정보 서비스**  
  > a. **아파트명별 매물**을 검색하여 결과 목록을 출력한다.
  >
  > b. **시/구/동별 매물**을 검색하여 결과 목록을 출력한다.
  > 
  > c. 해당 매물 선택시 **이미지,층,면적 등의 상세정보**를 제공한다.    
  >
  > d. 검색 결과를 **지도에서 마커**로 표시하고, 선택 시 **모달로 상세 정보**를 제공한다.
  >
  > e. 매물을 **찜하거나 취소**할 수 있다.

* **매물 주변 생활시설 서비스**
  > a. 검색한 매물 주변의 **코로나 선별 진료소** 위치를 마커로 표시하고, 상세 정보를 모달로 보여준다.
  >
  > b. 검색한 매물 주변의 **국민 안심 병원의 위치**를 마커로 표시하고, 상세 정보를 모달로 보여준다. 
  >
  > c. 검색한 매물 주변의 **부동산 위치**를 마커로 표시하고, 상세 정보를 모달로 보여준다.
  >
  > d.  검색한 매물 주변의 **버스정류소 위치**를 마커로 표시하고, 정류소 번호를 모달로 보여준다.
  >
  > e.  **구별 치안 안전 등급**을 시각화하여 지도에서 보여주고, 정류소 번호를 모달로 보여준다. 

* **이외 사용자 편의 서비스**
  > a. **마이페이지, 비밀번호 찾기**페이지에서 회원 정보 관리가 가능하다.  
  >
  > b. **공지사항, QnA게시판**에서 글작성/수정/삭제와 댓글or답변 작성/수정/삭제가 가능하다.  
  >
  > c. 사용자가 **찜한 매물 리스트**를 한눈에 관리할 수 있습니다.  
  > 
  > d. 관리자와 **실시간 1:1 채팅 상담**을 통해 문의 시간 단축해준다.
 

## 서비스 구성
### [1] 로그인 및 회원가입
![happyhouse_0](https://user-images.githubusercontent.com/59414210/106361368-e7afcb00-6360-11eb-9f25-b4e22196cb2b.png)
<b>회원가입→로그인</b> 후 전체 서비스를 이용할 수 있습니다. 회원가입 시 아이디 중복 체크를 통해 가입여부 확인 후 처리됩니다.  

### [2] 메인 화면  
![happyhouse_1](https://user-images.githubusercontent.com/59414210/106361239-327d1300-6360-11eb-8b8f-6b107b8e90bc.png)  
로그인 후 <b>검색창과 찜한 매물 목록</b>을 확인할 수 있습니다. 찜한 매물을 누르면 페이지에서 상세 정보를 확인할 수 있습니다.   

### [3] 매물 검색     
![happyhouse_2](https://user-images.githubusercontent.com/59414210/106361773-cb149280-6362-11eb-83a8-2be71b615581.png)   
공공데이터를 DB에 저장해두어 검색 결과에 따라 매물 리스트를 출력하였습니다. <b>매물명이나 시/도,구/군,동의 주소</b>를 선택해 매물 정보를 확인할 수 있고, 검색한 매물 위치를 지도에 표시해두었습니다. 매물 선택 시 사진/층/면적/날짜 등의 상세 정보를 확인할 수 있습니다.

### [4] 매물 주변 지역/시설 정보
![happyhouse_3](https://user-images.githubusercontent.com/59414210/106361774-cbad2900-6362-11eb-8702-f537312642bd.png)   
공공데이터를 데이터베이스에 저장해두었습니다. 매물 주변의 <b>국민 안심 병원</b> 위치를 마커로 보여주고,클릭 시 모달창에서 상세 정보를 확인할 수 있습니다.  

![happyhouse_4](https://user-images.githubusercontent.com/59414210/106361775-cc45bf80-6362-11eb-8b60-e37a4f1a42c6.png)    
공공데이터를 데이터베이스에 저장해두었습니다. 매물 주변의 <b>코로나 선별 진료소</b> 위치를 마커로 보여주고, 클릭 시 모달창에서 상세 정보를 확인할 수 있습니다.  

![happyhouse_5](https://user-images.githubusercontent.com/59414210/106361776-ccde5600-6362-11eb-847f-9b7eca59c765.png)   
<b>[네이버 검색 API](https://developers.naver.com/products/search/)</b>를 사용해 주소 근처의 부동산 목록을 가져와 활용했습니다. 매물 주변  <b>부동산</b> 위치를 마커로 보여주고, 클릭 시 모달창에서 주소 등의 상세 정보를 확인할 수 있습니다.  

![happyhouse_6](https://user-images.githubusercontent.com/59414210/106361778-ccde5600-6362-11eb-8ad3-3bc321295d4a.png)  
![happyhouse_7](https://user-images.githubusercontent.com/59414210/106361780-cd76ec80-6362-11eb-8c7e-8cbc3dd5c8b0.png)    
[서울 열린 데이터 광장](https://data.seoul.go.kr/)의 csv파일 정보를 활용해 구별 인구수를 계산하여 치안안정등급 5단계로 분류하였습니다. 매물 주변의 <b>구별 치안 안전 등급</b>을 보여주고, 클릭 시 모달창에서 구별 5대 범죄 발생 현황 수치를 확인할 수 있습니다.   

![happyhouse_8](https://user-images.githubusercontent.com/59414210/106361781-ce0f8300-6362-11eb-81f2-9c6f9ede7c96.png)    
공공 데이터 API를 활용하여 매물 주변의 <b>버스 정류소 위치</b> 보여주고, 클릭 시 모달창에서 정류장 번호를 확인할 수 있습니다.

### [5] 찜한 매물 페이지
![happyhouse_9](https://user-images.githubusercontent.com/59414210/106361782-ce0f8300-6362-11eb-85c2-836da2d69e27.png)  
![happyhouse_10](https://user-images.githubusercontent.com/59414210/106361783-cea81980-6362-11eb-94c0-f380e08125d1.png)  
매물 검색 결과 리스트에서 <b>찜한 매물</b>들을 한눈에 모아 확인할 수 있는 페이지입니다. 상세 클릭 시 모달창에서 내부 사진과 매매가, 층, 면적, 매물날짜가 보여집니다. 여기서 찜하기 취소를 하면 찜한 리스트에서 삭제됩니다.   

### [6] 공지사항  
![happyhouse_11](https://user-images.githubusercontent.com/59414210/106361785-cf40b000-6362-11eb-8ad5-af73ff771dfc.png)    
![happyhouse_22](https://user-images.githubusercontent.com/59414210/106362675-7889a500-6367-11eb-96e6-171874b86f3f.png)  
공지사항 목록을 확인할 수 있습니다. <b>관리자일 경우에만</b> 글쓰기,수정,삭제가 가능합니다. 회원은 제목/작성자/내용별로 키워드 검색 후 검색결과를 확인할 수 있습니다.  

![happyhouse_12](https://user-images.githubusercontent.com/59414210/106361786-cf40b000-6362-11eb-94a0-35647ad9a6d7.png)  
<b>공지 상세</b> 페이지에서는 제목/작성자/작성날짜/조회수/내용을 보여주고 작성자일 경우에만 글쓰기/수정/삭제가 가능합니다.  

![happyhouse_13](https://user-images.githubusercontent.com/59414210/106361763-c7810b80-6362-11eb-929e-a2cb27f8b7b9.png)  
게시글 아래에는 작성된 <b>댓글</b> 리스트가 보여지고 새로 작성이 가능하며, 댓글 작성자만 작성한 댓글을 수정/삭제할 수 있습니다.  

### [7] QnA  
![happyhouse_14](https://user-images.githubusercontent.com/59414210/106361764-c819a200-6362-11eb-9844-405b38b486b1.png)  
<b>QnA목록</b>을 확인할 수 있고, 누구나 질문을 남길 수 있습니다. 회원은 제목/작성자/내용별로 키워드 검색 후 검색결과를 확인할 수 있습니다.  

![happyhouse_15](https://user-images.githubusercontent.com/59414210/106361765-c8b23880-6362-11eb-8c23-c6afaf60a1c3.png)  
등록된 질문글 상세에서는 관리자가 등록한 <b>답변</b>을 확인할 수 있습니다.  

### [8] 마이페이지 
![happyhouse_16](https://user-images.githubusercontent.com/59414210/106361767-c94acf00-6362-11eb-90df-6971c6342488.png)  
마이페이지에서는 회원이 가입시 작성한 <b>정보를 확인</b>하고 이를 <b>수정</b>할 수 있습니다. <b>탈퇴</b>하기 탭에서는 회원 탈퇴가 가능합니다.  

### [9] QnA  
![happyhouse_17](https://user-images.githubusercontent.com/59414210/106361768-c94acf00-6362-11eb-9f07-52b5974e8111.png)  
![happyhouse_18](https://user-images.githubusercontent.com/59414210/106361769-c9e36580-6362-11eb-8a44-db217b93f156.png)  
회원검색 페이지는 관리자로 로그인한 경우에만 접근이 가능하며, 가입된 전체 회원 리스트를 확인할 수 있고 특정 회원을 선택해 <b>관리자</b>로 등록/해제할 수 있습니다.  

### [10] 실시간 1:1 채팅  
![happyhouse_19](https://user-images.githubusercontent.com/59414210/106361770-c9e36580-6362-11eb-88c9-6549ff2649d4.png)   
Ajax통신으로 <b>실시간 채팅 서비스</b>를 구현했습니다. 우측 하단 채팅아이콘을 눌러 회원은 관리자와 1:1 채팅을 진행할 수 있습니다. 첫 채팅 화면에서는 QnA에 등록된 <b>자주 묻는 질문</b> 목록을 보여주고 클릭 시 그 내용을 채팅으로 확인할 수 있습니다.   
![happyhouse_20](https://user-images.githubusercontent.com/59414210/106361771-ca7bfc00-6362-11eb-8d20-f61fbd097f4f.png)   
![happyhouse_21](https://user-images.githubusercontent.com/59414210/106361772-cb149280-6362-11eb-86d9-f7bc4b6e2fe7.png)   
사용자가 처음 메시지를 보내면 '관리자 채팅 화면'에서는 해당 회원과의 채팅방이 열리고 버튼 클릭 시 채팅이 시작됩니다.   


### Awards
-  🥇삼성청년SW아카데미 1학기 공통PJT 1등 수상
-  🥇삼성청년SW아카데미 UCC 1등 수상
