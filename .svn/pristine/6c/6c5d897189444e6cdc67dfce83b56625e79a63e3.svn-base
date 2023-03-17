<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet" />

<style>
@font-face {
    font-family: 'GoodNeighbors-Good-Neighbors-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/GoodNeighbors-Good-Neighbors-Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
* {
	 font-family: 'GoodNeighbors-Good-Neighbors-Bold';
}


/* 글 등록 모달 style */
.modal-body {
	padding: 30px 25px 20px;
}

/* qna 테이블 */
.qnaTable {
	border-collapse: collapse;
	width: 100%;	

}
.qnaTable th {
	padding: 10px;
	color: #004;
	border-bottom: 3px solid #47B2E4;
	text-align: center;
}
.qnaTable td {
	color: #004;
	padding: 10px;
	border-bottom: 1px solid #ddd;
	text-align: center;
}
.qnaTable tr:hover td {
	color: #004;
}

/* qna 상세조회 스타일 */
.detailQna {
	width: 100%;

}
.detailQna th {
	font-size: 25px;
	padding: 10px;
	color: #004;
	border-bottom: 3px solid #47B2E4;
}

.detailQna td {
	color: #004;
	padding: 10px;
	border-bottom: 1px solid #ddd;
}
/* QNA 답변 */
.detailAns {
	width: 100%;
	background: #fbfaf6;
	border-bottom: 1px solid #ddd;
}

.main-search-input {
    background: #fff;
    padding: 0 120px 0 0;
    border-radius: 2px;
    margin-top: 100px;
    box-shadow: 0px 0px 0px 6px rgba(255,255,255,0.3);
}

.main-search-input:before {
    content: '';
    position: absolute;
    bottom: -40px;
    width: 30px;
    height: 1px;
    background: rgba(255,255,255,0.41);
    left: 50%;
    margin-left: -25px;
}

.main-search-input-item {
    width: 100%;
    box-sizing: border-box;
    border-right: 1px solid #eee;
    height: 50px;
    position: relative;
}

.main-search-input-item input:first-child {
    border-radius: 100%;
}

.main-search-input-item input {
    float: left;
    border: none;
    width: 100%;
    height: 50px;
    padding-left: 20px;
}

.main-search-button{
	background: #4DB7FE;
}

.main-search-button {
    position: absolute;
    right: 0px;
    height: 50px;
    width: 120px;
    color: #fff;
    top: 0;
    border: none;
    border-top-right-radius: 0px;
    border-bottom-right-radius: 0px;
    cursor: pointer;
}

.main-search-input-item {
    width: 190px;
    border: 1px solid #eee;
    height: 30px;
    border: none;
    margin-bottom: 10px;
}

.main-search-input-item input {
    border-radius: 6px !important;
    background: #fff;
}

.main-search-button {
    position: relative;
    width: 60px;
    height: 31px;
    border-radius: 17px;
}

/* 공지사항 리스트 스타일 */
.noticeTable {
	border-collapse: collapse;
	width: 100%;
}  
.noticeTable th {
	padding: 10px;
	color: #004;
	border-bottom: 3px solid #47B2E4;
	text-align: center;
}
.noticeTable td {
	color: #004;
	padding: 10px;
	border-bottom: 1px solid #ddd;
}
.noticeTable tr:hover td {
	color: #004;
}

/* 공지사항 상세조회 스타일 */
.detailNotice th {
	font-size: 25px;
	padding: 10px;
	color: #004;
	border-bottom: 3px solid #47B2E4;
}

.detailNotice td {
	color: #004;
	padding: 10px;
	border-bottom: 1px solid #ddd;
	
}

/* 공지사항 작성 버튼 */
.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 10px 16px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}


.menuBtn {
	color: white;
	left: 250px;
	top: 150px;
	border-radius: 40px;
	
	/* 상자 디자인 큰틀*/
	margin-bottom: 40px;
	border: 0px;
	background-color: transparent;

	/* 글씨 */
	color: #333333;
	font-size: 18px;
	animation-name: keybtn-language;
	animation-duration: .2s;
	font-family: "Poppins", sans-serif;
	
}


.selectedBtn{
	color: #FFFFFF;
	background: #47B2E4;
	font-weight: bold;
    }

#noticeModal {
	position: fixed;
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,0.5);
	left: 0;
	top: 0;
	display: none;
	z-index:9999;
}

#mWrapper {
	margin: 100px auto;
	width: 70%;
	height: 75%;
	background-color:white;
	border-radius: 1%;
}

#deleteModal {
	position: fixed;
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,0.5);
	left: 0;
	top: 0;
    display: none; 
	z-index:9999;

}

#dWrapper {
	margin: 100px auto;
	width: 13%;
	height: 9%;
	background-color:white;
	border-radius: 15%;
	padding: 21px;
}


.searchBox {
	float: right;
	padding-bottom: 10px;
}

#searchOption {
  width: 80px; /* 원하는 너비설정 */
  padding: .3em .4em; /* 여백으로 높이 설정 */
  font-family: inherit;  /* 폰트 상속 */
  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */  
  border: none; 
  border-radius: 25px; /* iOS 둥근모서리 제거 */
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
  font-size: 16px;

}
.menuList {
	padding-bottom: 10px;
}

#qnaModal {
	position: fixed;
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,0.5);
	left: 0;
	top: 0;
	display: none;
	z-index:9999;

}

#wrapper {
	margin: 100px auto;
	width: 70%;
	height: 80%;
	background-color:white;
	border-radius: 20px;
}

#ansModal {
	position: fixed;
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,0.5);
	left: 0;
	top: 0;
	display: none;
	z-index:9999;
}

#aWrapper {
	margin: 100px auto;
	width: 70%;
	height: 70%;
	background-color:white;
	border-radius: 1%;
}

#faqModal {
	position: fixed;
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,0.5);
	left: 0;
	top: 0;
	display: none;
	z-index:9999;
}

#fWrapper {
	margin: 100px auto;
	width: 70%;
	height: 65%;
	background-color:white;
	border-radius: 20px; 
}

*{
  box-sizing: border-box; 
}
  
.que:first-child{
    border-top: 1px solid black;
  }
  
.que{
  position: relative;
  padding: 17px 0;
  cursor: pointer;
  font-size: 14px;
  border-bottom: 1px solid #dddddd;
  
}
  
.que::before{
  display: inline-block;
  content: 'Q';
  font-size: 14px;
  color: #006633;
  margin: 0 5px;
}

.que.on>span{
  font-weight: bold;
  color: #006633; 
}
  
.anw {
  display: none;
    overflow: hidden;
  font-size: 14px;
  background-color: #f4f4f2;
  padding: 27px 0;
}
  
.anw::before {
  display: inline-block;
  content: 'A';
  font-size: 14px;
  font-weight: bold;
  color: #666;
  margin: 0 5px;
}

.arrow-wrap {
  position: absolute;
  top:50%; right: 10px;
  transform: translate(0, -50%);
}

.que .arrow-top {
  display: none;
}
.que .arrow-bottom {
  display: block;
}
.que.on .arrow-bottom {
  display: none;
}
.que.on .arrow-top {
  display: block; 
}

.modalBtn {
	padding: 30px 25px 20px;
}

.mBtns {
	width: 100%;
	position: relative;
    border: none;
    display: inline-block;
    padding: 10px 16px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    text-decoration: none;
    font-weight: 600;
}
.inputs {
	position: relative;
    margin-bottom: 15px;
    padding: 8px 0;
    border: none;
    border-bottom: 1px solid #ccc;
    width: 100%;
    font-size: 17px;
}

.detailBtn {
	background-color:transparent;
	display:inline-block;
	cursor:pointer;
	color:#080608;
	font-size:17px;
	border: none;
}
.detailBtn:hover {
	background-color:transparent;
}
.detailBtn:active {
	position:relative;
	top:1px;
}

.noBtns {
	margin: auto;
}

#deleteBtn {
	width: 50%;
	position: relative;
    border: none;
    display: inline-block;
    padding: 10px 16px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    text-decoration: none;
    font-weight: 600;
}

#deleteCancle {
	width: 50%;
	position: relative;
    border: none;
    display: inline-block;
    padding: 10px 16px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    text-decoration: none;
    font-weight: 600;

}

.delBtn {
	display: flex;
}

.name {
	padding-top: 10px;
	padding-bottom: 10px;
}
</style>

<!-- 삭제 모달 -->
<div id="deleteModal">
	<div id="dWrapper">
		<form action="post">
			<div class="delBtn">
			<button type="button" id="deleteBtn">삭제</button>
			<button type="button" id="deleteCancle">취소</button>
			</div>
			<security:csrfInput/>
		</form>
	</div>
</div>

<!-- 공지사항 새글 작성, 수정 Modal (관리자용)-->
<div id="noticeModal">
	<div id="mWrapper">
		<form id="noticeForm" action="insertNotice" method="POST">
			<div class="modal-body">
				<!-- 공지사항 입력폼  -->
				<div class="form-row">
					<div class="value">
						<input class="inputs" type="hidden" name="noticeNo">
					</div>
				</div>
				<div class="form-row">
					<div class="noticeTitle"></div>
					<div class="value">
						<input class="inputs" type="text" name="noticeTitle" value="" placeholder="제목">
					</div>
				</div>
				<div class="form-row">
					<div class="value">
						<input type="hidden" name="noticeCont" id="noticeCont"/>
						<textarea name="noticeCont2" id="editor1" rows="20" cols="80"></textarea>
						<script>
								CKEDITOR.replace('noticeCont2',{
								filebrowserUploadUrl:'${pageContext.request.contextPath}/help/notice/noticeImage?${_csrf.parameterName}=${_csrf.token}&command=QuickUpload&type=Files&responseType=json'
										,height: 390
								 });
						</script>
					</div>
				</div>
				<div class="form-row">
					<div class="value">
						<div>상단 고정공지</div><input type="checkbox" name="noticeTopYn" value="Y"/>
					</div>
				</div>
				<div class="form-row">
					<div class="name" style="font-size: 15px">첨부파일</div>
					<div class="value">
						<div class="input-group js-input-file">
							<input class="input-file" type="file" multiple="multiple" name="files"> 
							<label class="label--file" for="file">Choose file</label>
						</div>
					</div>
				</div>
			</div>
			<div class="modalBtn">
				<button id="createBtn" class="mBtns">작성하기</button>
				<button id="closeBtn" type="button" class="mBtns">닫기</button>
			</div>
			<security:csrfInput/>
		</form>
	</div>
</div>

<!--1:1 게시판 글 작성(유저용) -->
<div id="qnaModal">
	<div id="wrapper">
		<form id="qnaForm" action="insertqna" method="POST">
				<div class="modal-body">
					<div class="form-row">
						<div class="value">
							<input class="inputs" type="hidden" name="qnaNo">
						</div>
					</div>
					<div class="form-row">
						<div class="value">
							<input class="inputs" type="text" name="qnaTitle" value="" placeholder="제목">
						</div>
					</div>
					<div class="form-row">
						<div class="value">
							<input type="hidden" name="qnaCont" id="qnaCont"/>
							<textarea name="qnaCont2" id="editor2" rows="10" cols="80">
						    </textarea>
							<script>
								CKEDITOR.replace('qnaCont2',{
								filebrowserUploadUrl:'${pageContext.request.contextPath}/help/qna/qnaImage?${_csrf.parameterName}=${_csrf.token}&command=QuickUpload&type=Files&responseType=json'
									, height: 390
								 });
							</script>
						</div>
					</div>
					<div class="form-row">
						<div class="name" style="font-size: 15px">파일 업로드</div>
						<div class="value">
							<div class="input-group js-input-file">
								<input class="input-file" type="file" multiple="multiple" name="files" id="qnaFiles"> 
								<label class="label--file" for="file">Choose file</label>
							</div>
						</div>
					</div>
				</div>
				<div class="modalBtn">
					<button id="createqna" class="mBtns">작성하기</button>
					<button id="closeqna" type="button" class="mBtns">닫기</button>
				</div>
				<security:csrfInput/>
		</form>
	</div>
</div>

<!-- 1대1문의 답변 작성 -->
<div id="ansModal">
		<div id="aWrapper">
			<form id="ansForm" action="createAns" method="POST">
				<div class="modal-body">
					<div class="form-row">
						<div>답변 내용</div>
						<div class="value">
							<input type="hidden" name="qnaNo" id="qnaNo"/>
							<input type="hidden" name="qnaAns" id="qnaAns"/>
							<textarea name="qnaAns2" id="editor3" rows="10" cols="80">
						    </textarea>
							<script>
								//CKEDITOR.replace('editor3',{filebrowserUploadUrl:'/help/qna/qnaImage'});
								CKEDITOR.replace('qnaAns2',{
								filebrowserUploadUrl:'${pageContext.request.contextPath}/help/qna/qnaImage?${_csrf.parameterName}=${_csrf.token}&command=QuickUpload&type=Files&responseType=json'
										, height: 390
								 });
							</script>
						</div>
					</div>
					<div class="form-row">
						<div class="name" style="font-size: 15px">파일 업로드</div>
						<div class="value">
							<div class="input-group js-input-file">
								<input class="input-file" type="file" multiple="multiple" name="files" id="ansFiles"> 
								<label class="label--file" for="file">Choose file</label>
							</div>
						</div>
					</div>
				</div>
				<div class="modalBtn">
					<button id="ansBtn" class="mBtns">작성하기</button>
					<button id="closeAns" type="button" class="mBtns">닫기</button>
				</div>
				<security:csrfInput/>
			</form>
		</div>
	</div>

<!-- 자주묻는 질문 등록 수정 모달 -->
<div id="faqModal">
		<div id="fWrapper">
			<form id="faqForm" action="createFaq" method="POST">
				<div class="modal-body">
					<div class="form-row">
						<div><input class="inputs" type="text" name="faqAsk" placeholder="자주 묻는 질문" />
							<input class="inputs" type="hidden" name="faqNo">
						</div>
						<div class="value">
							<textarea name="faqAns" id="editor4" rows="10" cols="80">
						    </textarea>
							<script>
									CKEDITOR.replace('editor4');
							</script>
						</div>
					</div>
					<div class="form-row">
						<div class="name" style="font-size: 15px">파일 업로드</div>
						<div class="value">
							<div class="input-group js-input-file">
								<input class="input-file" type="file" name="files"> <label
									class="label--file" for="file">Choose file</label>
							</div>
						</div>
					</div>
				</div>
				<div class="modalBtn">
					<button class="mBtns" id="fBtn">작성하기</button>
					<button class="mBtns" id="closeFaq" type="button">닫기</button>
				</div>
		<security:csrfInput/>
		</form>
	</div>
</div>

<section id="portfolio" class="portfolio" style="padding-top: 160px;">
	
	<div class="section-title">
		<h2>고객센터</h2>
	</div>
	<div class="menuList d-flex justify-content-center">
		<div id="menu">
			<button id="noticeList" class="menuBtn" style="margin-right: 20px">공지사항</button>
			<button id="faqList" class="menuBtn" style="margin-right: 20px">자주 묻는 질문</button>
			<button id="qnaList" class="menuBtn" style="margin-right: 20px">1 : 1 문의</button>
		</div>
	</div>

	<div class="content" >
		<div class="container" style="width: 1000px;">
			<div id="dataTable" class="table-responsive custom-table-responsive" style="padding-bottom: 20px;">
						
			</div>		
			<div class="row pagingRow">
				<div class="col-sm-12 col-md-12">
					<div class="pagingArea  justify-content-center"></div>
					<div class="qnaPagingArea  justify-content-center"></div>
				</div>
			</div>
<security:authorize access="hasRole('ROLE_ADMIN')">
			<button class="w-btn" id="newBtn" style="display: none;">공지사항 작성</button>
			<button class="w-btn" id="faqBtn" style="display: none;">FAQ 작성</button>
</security:authorize>
			<button class="w-btn" id="qnaBtn" style="display: none;">문의글 작성</button>
		</div>
		
	</div>
	<!-- 임시 확인용 -->
	<form name="searchForm" id ="searchForm">
		<input type="hidden" name="page" /> 
		<security:csrfInput/>
	</form>
	<form name="qnasearchForm" id ="qnasearchForm">
		<input type="hidden" name="page" /> 
	</form>
</section>

<script type="text/javascript">
	const csrfHeader = "${_csrf.headerName}" ;
	const csrfToken = "${_csrf.token}";

	const noticeModal = document.querySelector("#noticeModal");
	const deleteModal = document.querySelector("#deleteModal");
	const qnaModal = document.querySelector("#qnaModal");
	const faqToggle = document.querySelector("#faqToggle");
	console.log(faqToggle);

	let makeTrTag = function(notice){

		let aTag = $("<a>")
		.attr({
			"href" : "#",
			"class" : "noticeTitle",
			"data-notice-no" : `\${notice.noticeNo}`})
			.html(notice.noticeTitle);
		
		if(notice.noticeTopYn == "Y") {
			// Y 표시인 행 : 고정공지
			return $("<tr>").append(
					$("<td>").html(notice.rnum).css("background-color","#f4f4f2"),
					$("<td style='text-align: left;'>").html(aTag).css("background-color","#f4f4f2"),
					$("<td>").html(notice.noticeDate).css("background-color","#f4f4f2"),
					$("<td>").html(notice.noticeHit).css("background-color","#f4f4f2")
			);
		}
		return $("<tr>").append(
			$("<td>").html(notice.rnum),
			$("<td style='text-align: left;'>").html(aTag),
			$("<td>").html(notice.noticeDate),
			$("<td>").html(notice.noticeHit)
		);
	}
	
	/* 공지사항 전체리스트 */
 	$("#noticeList").on("click", function() {
	$("#newBtn").show();
 	$("#qnaBtn").hide();
 	$("#faqBtn").hide();
 	
		$.ajax({
			url : "/help/noticeListIn",
			type : "get",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
			success : function(data) {
				console.log(data);
				let dataList = data.pagingVO.dataList;
				let trTags = [];
				if(dataList){
					$.each(dataList, function(i, v){
						console.log("value : ", v);
						trTags.push(makeTrTag(v));
					});
				}
				else{
					let tr = $("<tr>").html(
						$("<td>").attr("colspan", "7")
								.html("조건에 맞는 게시글 없음.")
					);	
					trTags.push(tr);
				}
				
				let tableTg1 = `<table class="noticeTable" >
				
				<div class="searchBox">
				<select name="searchOption" id ="searchOption"> 
					<option>제목</option>
					<option>내용</option>
				</select> 
				<input type="text" class="main-search-input-item" placeholder="검색어를 입력하세요" name="searchWord" style="border-bottom: solid 1px #cacaca;">
				<input class="main-search-button" type="button" onclick="searchBtn()" value="검색" />
				</div>
				
				<thead style="text-align: center;">
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody id="noticeBody" style="text-align: center;">`;
				
				const tableTg2 =
					`</tbody>
					</table>
					<div class="pagingArea d-flex justify-content-center">
						
					</div>
					`;
					
				for(var i=0; i<trTags.length; i++){
					tableTg1 += "<tr>" + $(trTags[i]).html() + "</tr>";
				}
				tableTg1 += tableTg2;
				$("#dataTable").html(tableTg1);
				console.log("페이징 체크 : ", tableTg1);
				
				if(data.pagingHTML){
					console.log("페이징 들어감");
					console.log(data.pagingHTML);
					$(".pagingRow").attr("style","");
					$(".pagingArea").attr("style","");
					$(".qnaPagingArea").css("display","none");
					$(".qnaPagingArea").removeClass("d-flex");
					$("#portfolio > div.content > div > div.row.pagingRow > div > div.pagingArea.justify-content-center").addClass("d-flex");
					pagingArea.html(data.pagingHTML);
				}
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});

	});

 	/* 공지사항 페이징  */
 	let pagingArea = $(".pagingArea").on("click", "a.paging", function(event){
		event.preventDefault();
		console.log("페이징 버튼 들어감");
		let page = $(this).data("page");
		console.log(page);
		if(!page) return false;
		searchForm.find("[name=page]").val(page);

		searchForm.submit();
		
		return false;
	});

 	let searchForm = $("#searchForm").on("submit", function(event){
		event.preventDefault();
		
		let queryString = $(this).serialize();
		
		$.ajax({
			url : "/help/noticeListIn",
			method : "get",
			data : queryString,
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				console.log("resp : ",resp);
				pagingArea.empty();
				searchForm[0].page.value="";
				
				let pagingVO = resp.pagingVO;
				
				let dataList = pagingVO.dataList;
				let trTags = [];
				if(dataList){
					$.each(dataList, function(index, value){
						trTags.push(makeTrTag(value));
					});
				}else{
					let tr = $("<tr>").html(
						$("<td>").attr("colspan", "7")
								.html("조건에 맞는 상품 없음.")
					);	
					trTags.push(tr);
				}
				$("#noticeBody").html(trTags);
				pagingArea.html(resp.pagingHTML);
				pagingArea.addClass("d-flex");
				pagingArea.show();
				
				qnaPagingArea.removeClass("d-flex");
				qnaPagingArea.hide();
				console.log(resp.pagingHTML);
				
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		return false;
	}).submit();
	
 	/* 검색UI */
	let searchUI = $("#searchUI").on("click", "#searchBtn", function(){
		let inputs = searchUI.find(":input[name]");
		$.each(inputs, function(index, input){
			let name = this.name;
			let value = $(this).val();
			searchForm[0][name].value = value;
		});
		searchForm.submit();
	});

	/* 공지사항 상세조회 */
	// 공지사항 리스트에 <a>태그가 동적으로 생성되어서 동적바인딩해줌
	$(document).on("click",".noticeTitle",function(){
		console.log("공지사항 조회: ", this);
		let noticeNo = $(this).data("noticeNo");
		console.log("noticeNo : " + noticeNo);
		
		let str = "<table style='width:100%;' class='detailNotice'><thead>";
		
		$.ajax({
			url : "/help/noticeDetail/" + noticeNo,
			type : "get",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(result) {
				
				console.log("result : ", result);
				// 파일명하고, 확장자 읽어와야 함
				str += "<tr><th>"+result.noticeTitle+"</th></tr></thead><tbody>";
				str += "<tr><td>"+result.noticeDate+"</td></tr>";
				str += "<tr><td>"+result.noticeCont+"</td></tr>";
				if(result.noticeAttPath) {
					str += "<tr><td>첨부파일 | "+"<a href='"+result.noticeAttPath+"' download='" + result.attFilename+"'>"+result.attFilename+"</a></td></tr>";
				}else{
					str += "<tr><td><p>"+" "+"</p></td></tr>";
				}
				str += "</tbody></table>";
				
				str += "<div class='noBtns'><button class='detailBtn' id='toNoticeList' onclick=$('#noticeList').trigger('click')>목록으로</button>";
<security:authorize access="hasRole('ROLE_ADMIN')">					
				str += "<button class='detailBtn' id='noticeModify' >수정</button>";
				str += "<button class='detailBtn' id='noticedelete'>삭제</button></div>";
</security:authorize>
				
				$(".pagingArea").css("display","none");
				$("#newBtn").css("display","none");
				

				$("#dataTable").html(str);
				
				$("#noticeModify").on("click", function() {
					$("input[name=noticeNo]").val(result.noticeNo);
					$("input[name=noticeTitle]").val(result.noticeTitle);
					$("input[name=noticeDate]").val(result.noticeDate);
					CKEDITOR.instances.editor1.setData(result.noticeCont);
					
					$("#createBtn").html("수정하기");
					
					noticeModal.style.display = "block";
				});
				
				$("#noticedelete").on("click", function() {
					$("input[name=noticeNo]").val(result.noticeNo); 
					
					deleteModal.style.display = "block";
					console.log("무슨모달? :", deleteModal);
					
				});
				
				$(".qnaPagingArea").removeClass("d-flex");
				$(".qnaPagingArea").hide();
				$(".pagingArea").removeClass("d-flex");
				$(".pagingArea").hide();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});

	/* 글 작성 및 수정 모달 폼 열고 닫기*/
	
	$("#newBtn").on("click", function() {
		$("input[name=noticeTitle]").val("");
		$("input[name=noticeDate]").val("");
		CKEDITOR.instances.editor1.setData("");
		
		$("#createBtn").html("작성하기");
		
		noticeModal.style.display = "block";
	});
	
	$("#closeBtn").on("click", function(){
		noticeModal.style.display = "none";
	});
	
	/* 공지사항 작성 및 수정기능 수행 */
	$("#noticeForm").on("submit", function(event){
		event.preventDefault();
		$("#noticeCont").val(CKEDITOR.instances.editor1.getData());
		console.log("아무거나");
		let data = new FormData($("#noticeForm")[0]);
		for (let key of data.keys()) {
			   console.log(key, ":", data.get(key));
			}
		let create = $("#createBtn").html();
		
		if(create == "작성하기") {
			CKEDITOR.instances.editor1.setData("");
			$.ajax({
				url : "/help/insertNotice",
				method : "post",
				data : data,
				contentType : false,
				processData : false,
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
		           xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		        },
				success : function(resp) {
					console.log(resp);
					$("#noticeModal").hide();
	 				$("#noticeList").trigger("click"); 
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			}); 
		}else {
			/* 글 수정기능 수행 */
			console.log("수정내용확인 :" , data);
			$.ajax({
				url : "/help/modifyNotice",
				method : "post",
				data : data,
				contentType : false,
				processData : false,
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		        },
				success : function(resp) {
					console.log("수정왓나", resp);
					$("#noticeModal").hide();
	 				$("#noticeList").trigger("click"); 
					
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			});
		}
	});
	
	/* 삭제 취소버튼 닫기 */
	$("#deleteCancle").on("click", function() {
		deleteModal.style.display = "none";
	})
	
 	/* 글 삭제기능 수행 */
 	$("#deleteBtn").on("click", function (event) {
 		let data = $("input[name=noticeNo]").val(); 
 		alert(data + "번 글을 삭제하시겠습니까?");
 		
 		$.ajax({
			url : "/help/deleteNotice",
			method : "post",
			data : "noticeNo="+data,
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				console.log("삭제왔나", resp);
				document.querySelector("#deleteModal").style.display = "none";
 				$("#noticeList").trigger("click"); 
			},
			error : function(jqXHR, status) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
	 
	 
	 
	/* 검색기능  */
	function searchBtn() {
		let data1 =  $("input[name=searchWord]").val();
		let data2 =$("select[name='searchOption'] option:selected").text();
		let data3 = $("input[name=page]").val();
		console.log(data1);
		console.log(data2);
		console.log("data3 : ",data3);
		let data = {
			"searchOption" : data2 , 
			"searchWord" : data1	
		} 
		
		$.ajax({
			url : "/help/noticeListIn",
			method : "get",
			data : data ,
			contextType : "application/json;charset=utf-8",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	           xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(data) {
				
				console.log(data)
				let dataList = data.pagingVO.dataList;
				let trTags = [];
				if(dataList){
					$.each(dataList, function(i, v){
						console.log("value : ",v);
						trTags.push(makeTrTag(v));
					});
				}
				else{
					let tr = $("<tr>").html(
						$("<td>").attr("colspan", "7")
								.html("조건에 맞는 게시글 없음.")
					);	
					trTags.push(tr);
				}
				
				let tableTg1 = `<table class="table">
				<thead>
				</div>
				<div class="searchBox">
					<select name="searchOption" id ="searchOption"> 
						<option>제목</option>
						<option>내용</option>
					</select> 
					<input type="text" class="main-search-input-item" placeholder="검색어를 입력하세요" name="searchWord" style="border-bottom: solid 1px #cacaca;">
					<input class="main-search-button" type="button" onclick="searchBtn()" value="검색" />
				</div>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody id=noticeBody>`;
				
				const tableTg2 =
					`</tbody>
					</table>
					<div class="pagingArea d-flex justify-content-center">
					`;
					
				for(var i=0; i<trTags.length; i++){
					tableTg1 += "<tr>" + $(trTags[i]).html() + "</tr>";
					
				}
				tableTg1 += tableTg2;
				$("#dataTable").html(tableTg1);
				
				if(data.pagingHTML){
					console.log("페이징 들어감");
					$(".pagingRow").attr("style","");
					pagingArea.html(data.pagingHTML);	
				}
				 
			},
			error : function(jqXHR, status) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}
	
	/* qna 검색 버튼 */
	function searchBtn2() {
		let data1 =  $("input[name=searchWord]").val();
		let data2 =$("select[name='searchOption'] option:selected").text();
		let data3 = $("input[name=page]").val();
		console.log(data1);
		console.log(data2);
		console.log("data3 : ",data3);
		let data = {
			"searchOption" : data2 , 
			"searchWord" : data1	
		} 
		
		$.ajax({
			url : "/help/qnaList",
			method : "get",
			data : data ,
			contextType : "application/json;charset=utf-8",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	           xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(data) {
				console.log(data)
				let dataList = data.pagingVO.dataList;
				if(dataList){
					console.log("페이징 들어감");
					$(".pagingRow").attr("style","");
					qnaPagingArea.html(dataList.pagingHTML);	
				}
				console.log("dataList:",dataList);
				qnaTr(dataList);
			},
			error : function(jqXHR, status) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}

	/* qna 검색 및 페이징 */
	let qnaPagingArea = $(".qnaPagingArea").on("click", "a.paging", function(event){
		event.preventDefault();
		console.log("페이징 버튼 들어감");
		let page = $(this).data("page");
		if(!page) return false;
		qnasearchForm.find("[name=page]").val(page);
		console.log("pppp",qnasearchForm);
		qnasearchForm.submit(); // jQuery Form
		
		return false;
	});

 	let qnasearchForm = $("#qnasearchForm").on("submit", function(event){
 		console.log("qnaFormData : ",this);
		event.preventDefault();
		
		let queryString = $(this).serialize();
		
		$.ajax({
			url : "/help/qnaList",
			method : "get",
			data : queryString,
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	           xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				console.log("resp : ",resp);
				pagingArea.empty();
				qnasearchForm[0].page.value="";
				
				let pagingVO = resp.pagingVO;
				
				let dataList = pagingVO.dataList;
				let trTags = [];
				qnaTr(dataList);
				qnaPagingArea.html(resp.pagingHTML);
				qnaPagingArea.addClass("d-flex");
				qnaPagingArea.show();
				
				pagingArea.removeClass("d-flex");
				pagingArea.hide();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		return false;
	}).submit();
	
	/* QNA 페이지  시작 */
	
	/* QNA 리스트 테이블 출력  */
	
	const qnaTr = function (qnaList) { // 내용물 만들어주기.
		let str = `
		<div class="searchBox">
		<select name="searchOption" id ="searchOption"> 
			<option>제목</option>
			<option>내용</option>
		</select>
		<input type="text" class="main-search-input-item" placeholder="검색어를 입력하세요" name="searchWord" style="border-bottom: solid 1px #cacaca;">
		<input class="main-search-button" type="button" onclick="searchBtn2()" value="검색" />
		</div>
		<table class="qnaTable">
			<thead>
			  <tr>
			    <th>번호</th>
			    <th>제목</th>
			    <th>작성일</th>
			    <th>처리상태</th>
			  </tr>
			</thead>
			<tbody id="qnaBody">
			`;

		// 기본 for문이 먼저 이해가 되어야만 each나 foreach 간략 표현도 쓸 수 있음!
		for(let i=0; i< qnaList.length; i++){
			str += `
				<tr>
					<td>\${qnaList[i].rnum}<input type="hidden" name="qnaNo" value="\${qnaList[i].qnaNo}" /></td>
					<td style='text-align: left;'><a href="#" onclick="f_detail(\${qnaList[i].qnaNo})">\${qnaList[i].qnaTitle}</a></td>
					<td>\${qnaList[i].qnaDate}</td>
					<td>\${qnaList[i].isAns}</td>
				</tr>
			`
		  }
		str += "</tbody></table>";
		let searchArea = `
			<div class="qnaPagingArea d-flex justify-content-center">
				
				</div>
				<div class="searchBox">
				</div>
				`;
		  
		str += searchArea;
		  
		console.log("table문자열:",str);
		document.querySelector("#dataTable").innerHTML=str;
		  
	}

	/* 1:1 문의 게시판 클릭 시 ajax */
	//페이지 로딩 되자 마자 실행!
	
	$("#qnaList").on("click", function(qna) {
		$("#faqBtn").hide();
		$("#newBtn").hide();		
		$("#qnaBtn").show();
		$.ajax({
			url : "/help/qnaList",
			type : "get",
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	           xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				console.log("resp : " , resp);
				let dataList = resp.pagingVO.dataList;
				if(dataList){
					console.log("페이징 들어감");
					$(".pagingRow").attr("style","");
					$(".qnaPagingArea").attr("style","");
					$(".pagingArea").css("display","none");
					$("#portfolio > div.content > div > div.row.pagingRow > div > div.qnaPagingArea.justify-content-center").addClass("d-flex");
					$(".pagingArea").removeClass("d-flex");
					qnaPagingArea.html(dataList.pagingHTML);	
				}
				console.log("dataList:",dataList);
				qnaTr(dataList);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
		
	/* qna 글 작성 및 수정  */

	/* qna 작성 모달 클릭시 열고 닫기 */
	$("#qnaBtn").on("click", function(){
		<security:authorize access="!isAuthenticated()">
			alert("로그인 후 문의글을 작성해주세요!");
			location.href="/login";
			return;
		</security:authorize>
		
		qnaModal.style.display = "block";
		$("input[name=qnaTitle]").val("");
		$("input[name=qnaDate]").val("");
		$("input[name=files]").val("");
		
		$("#createqna").html("작성하기");
	});

	$("#closeqna").on("click", function(){
		qnaModal.style.display = "none";
	});
	/* qna 1:1 문의 글 작성 */
	$("#qnaForm").on("submit", function(event){
		event.preventDefault();
		console.log("qna입력");
		$("#qnaCont").val(CKEDITOR.instances.editor2.getData());
		let data = new FormData($("#qnaForm")[0]);
		for (let key of data.keys()) {
			   console.log(key, ":", data.get(key));
			}
		console.log("data : " , data);
		let create = $("#createqna").html();

			$.ajax({
				url : "/help/insertQNA",
				method : "post",
				data : data,
				contentType : false,
				processData : false,
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
		           xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		        },
				success : function(resp) {
					console.log(resp);
					alert("등록후에는 수정이 불가합니다.")
					$("#qnaModal").hide();
					$("#qnaList").trigger("click");
				},
				error : function(jqXHR, status) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			})
	});
	
	/* qna상세 조회 */
	function f_detail(qnaNo){
		console.log("qnaNo",qnaNo);
		let data = {
			qnaNo: qnaNo
		}
		console.log("data: ", data)
		let qna = "<table class='detailQna'>";
		$.ajax({
			url : "/help/qnaDetail",
			method : "get",
			data : data,
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	           xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				console.log("resp : " , resp);
					qna += "<tbody><tr><td id='qnaNo' style='display:none;'>"+resp.qnaNo+"</td></tr>";
					qna += "<tbody><tr><th>"+resp.qnaTitle+"</th></tr>";
					qna += "<tr><td>"+'작성일자 : '+resp.qnaDate+"</td></tr>";
					qna += "<tr><td>"+resp.qnaCont+"</td></tr>";
					if(resp.qnaAttPath) {
						qna += "<tr><td>첨부파일 | "+"<a href='"+resp.qnaAttPath+"' download='" + resp.qnaAttFilename+"'>"+resp.qnaAttFilename+"</a></td></tr>";
					}else{ 
						qna += "<tr><td><p>"+" "+"</p></td></tr>";
					}
				
					qna += "</tbody></table>";
					
					qna += "<tbody><table class='detailAns'>";
					if(resp.qnaAns.trim() != "") {
					qna += "<tr><td id='ansCont'>"+resp.qnaAns+"</td></tr>";
					if(resp.ansAttPath) {
						qna += "<tr><td>첨부파일 | "+"<a href='"+resp.ansAttPath+"' download='" + resp.ansAttFilename+"'>"+resp.ansAttFilename+"</a></td></tr>";
					}else{
						qna += "<tr><td><p>"+" "+"</p></td></tr>";
					}
					qna += "<tr><td id='ansDate'>"+'답변자: 관리자   답변일자: '+resp.ansDate+"</td></tr>";
					}
					qna += "</tbody></table>";
				
					qna += "<button class='detailBtn' id='toQnaList' onclick=$('#qnaList').trigger('click')>목록으로</button>";
<security:authorize access="hasRole('ROLE_ADMIN')">	
					qna += "<button class='detailBtn' id='qnaAnswer' onclick='ansInsert("+resp.qnaNo+")'>답변 등록</button>";
					qna += "<button class='detailBtn' id='qnaDelete' onclick='qnaDelete("+resp.qnaNo+")'>삭제</button>";
</security:authorize>
					$(".qnaPagingArea").css("display","none");
					$("#qnaBtn").css("display","none");
					
					
					$("#dataTable").html(qna);
					console.log($(".qnaPagingArea"))
					$(".qnaPagingArea").removeClass("d-flex");
					$(".qnaPagingArea").hide();
					$(".pagingArea").removeClass("d-flex");
					$(".pagingArea").hide();
			},
			error : function(jqXHR, status) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}
	
	/* 답변 입력기능 */
	const ansInsert = function (qnaNo) {
		ansModal.style.display = "block";
		$("#qnaAns").val("");
		$("#ansForm").on("submit", function(event){
			event.preventDefault();
			$("#qnaAns").val(CKEDITOR.instances.editor3.getData())
			$("#qnaNo").val(qnaNo);
			let data = new FormData($("#ansForm")[0]);
			for (let key of data.keys()) {
				   console.log("@@@ : ",key, ":", data.get(key));
				}
			console.log("답변등록 왔나 : " + JSON.stringify(data));
			$.ajax({
				url : "/help/createAns",
				method : "post",
				data : data,
				contentType : false,
				processData : false,
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
		           xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		        },
				success : function(resp) {
					console.log("답변 데이터 왔나", resp);
					alert("등록후에는 수정이 불가합니다.")
					$("#ansModal").hide();
	 				$("#qnaList").trigger("click");
				},
				error : function(jqXHR, status) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
					}
			});
		});
	}
	
	$("#closeAns").on("click", function(){
		ansModal.style.display = "none";
	});
	// 삭제 기능 수행
	var qnaDelete =function(qnaNo){
		console.log("qna삭제 버튼왔나")
		console.log("qnaNo : ", qnaNo);
		console.log("qnaNo : ", typeof(qnaNo));
		
		
		if(confirm(qnaNo + "번 글을 삭제하겠습니까?")==true) {
			$.ajax({
			url : "/help/deleteQna",
			method : "post",
			data : "qnaNo="+qnaNo,
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	           xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				console.log("qna 삭제 왔나", resp);
				document.querySelector("#deleteModal").style.display = "none";
				$("#qnaList").trigger("click");
			},
			error : function(jqXHR, status,error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		}else{
			return false;
		}
	};
	
	/* 자주묻는 질문 게시판 시작 */
	
	
	$("#faqList").on("click", function () {
		console.log("체크");
		$("#qnaBtn").hide();
		$(".pagingRow").hide();
		$("#newBtn").hide();
		$("#faqBtn").show();
		$.ajax({
			url : "/help/faqList",
			method : "get",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success : function(resp) {
				let faq = "";
				for(var i =0;i<resp.length;i++) {
				faq += "<div id='Accordion_wrap'><div class='que'><span id='ask"+resp[i].faqNo+"'>" + resp[i].faqAsk + "</span>";
				faq += "<input type='hidden' value='"+resp[i].faqNo+"' name='faqNo' />";
				faq += "<div class='arrow-wrap'><span class='arrow-top'>↑</span>";
				faq += "<span class='arrow-bottom'>↓</span></div></div><div class='anw'><span id='ans"+resp[i].faqNo+"'>"+resp[i].faqAns+"</span><span>";
<security:authorize access="hasRole('ROLE_ADMIN')">				
				faq += "<button class='detailBtn' id='modifyFaq' onclick='modifyFaq("+resp[i].faqNo+")'>수정</button></span><span><button class='detailBtn' onclick='deleteFaq("+resp[i].faqNo+")'>삭제</button>";
</security:authorize>
				faq += "</span></div></div>"
				}
				$("#dataTable").html(faq);
				
				$(".que").click(function() {
				  $(this).next(".anw").stop().slideToggle(300);
				  $(this).toggleClass('on').siblings().removeClass('on');
				  $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
				});
			},
			error : function(jqXHR, status) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
	let fBtn = $("#fBtn");
	
	/* 자주 묻는 질문 등록 및 수정 모달 */
	$("#faqBtn").on("click", function () {
		console.log("등록왔나");
		$("#faqModal").show();
		$("input[name=faqAsk]").val("");
		CKEDITOR.instances.editor4.setData("");
		fBtn.html("작성하기");
	});
	
	$("#faqForm").on("submit", function (event) {
		event.preventDefault();
		console.log("작성");
		let data = {
			faqAsk: $("input[name=faqAsk]").val(),
			faqAns: CKEDITOR.instances.editor4.getData()
		}
		let data2 = {
			faqNo:  $("input[name=faqNo]").val(),
			faqAsk: $("input[name=faqAsk]").val(),
			faqAns: CKEDITOR.instances.editor4.getData()
		}
		console.log(data2);
			$.ajax({
				url : "/help/insertFAQ",
				method : "post",
				data : JSON.stringify(data),
				contentType : "application/json;charset=utf-8",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
		           xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		        },
				success : function(resp) {
					$("#faqList").trigger("click");
					$("#faqModal").hide();
				},
				error : function(jqXHR, status) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			});
	});
	/* 수정 모달 보여주기 */
	function modifyFaq(faqNo) {
		console.log(faqNo);
		var span1 =$("#ask"+faqNo).text();
		console.log(span1);
		var span2 =$("#ans"+faqNo).text();
		console.log(span2);
		$("input[name=faqNo]").val(faqNo);
		$("input[name=faqAsk]").val(span1);
		CKEDITOR.instances.editor4.setData(span2);
		$("#faqModal").show();
		$("#fBtn").html("수정하기");
	}
	/* 수정 클릭시 수정 기능 수행 */
	$("#fBtn").on("click", function () {
		let data2 = {
			faqNo:  $("input[name=faqNo]").val(),
			faqAsk: $("input[name=faqAsk]").val(),
			faqAns: CKEDITOR.instances.editor4.getData()
		}
		console.log("데이터2 : ", data2);
	
		$.ajax({
			url : "/help/modifyFAQ",
			method : "post",
			data : JSON.stringify(data2),
			contentType : "application/json;charset=utf-8",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	           xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				$("#faqList").trigger("click"); 
				$("#faqModal").hide(); 
			},
			error : function(jqXHR, status) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			} 
		});  
	});
		
		
	$("#closeFaq").on("click", function() {
		$("#faqModal").hide();
	});
	
	/* 삭제 */
	function deleteFaq(faqNo) {
		let data = {
			"faqNo": faqNo 
		};
		if(confirm(faqNo + "번 글을 삭제하겠습니까?")==true) {
	 	    $.ajax({
				url : "/help/deleteFAQ",
				method : "post",
				data : "faqNo="+faqNo,
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
		           xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		        },
				success : function(resp) {
					alert("삭제 되었습니다.");
					$("#faqList").trigger("click");
				},
				error : function(jqXHR, status) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			});
		}else {
			return false;
		}
	}
	
	// window.onload , window.ondomcontentloaded 페이징 로딩이 끝나면 한번 실행.
	$(function(){ // help 누를 시 공지사항 먼저 보여준다.
		console.log("시작 체킁");
		$("#noticeList").trigger("click");
	});
	
	CKEDITOR.on('dialogDefinition', function (ev) {
        var dialogName = ev.data.name;
        var dialog = ev.data.definition.dialog;
        var dialogDefinition = ev.data.definition;
		$("#cke_Upload_443").css("display","block");
		
    });
	// 클릭한 버튼만 효과를 주고 다른 버튼의 스타일은 지우기.
	$(".menuBtn").on("click", function(){
		console.log("눌렀따")
		$(".menuBtn").removeClass("selectedBtn");
		$(this).addClass("selectedBtn");
	});
	
	
</script>