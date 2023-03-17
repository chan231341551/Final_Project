<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<security:authentication property="principal.realMember" var="authMember"/>



<style>
	
	.list-group-item list-group-item-action{
	background-color:#d2d2d2;
	}

</style>


<main class="content" style="padding-top:0px;">

<div class="container-fluid p-0">
	<div class="row">
		<!--====================== 위키 상단 바 ======================-->
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="d-flex flex-row justify-content-between">
						<h3>프로젝트</h3>
					</div>
					<hr>
					<div class="d-flex flex-column justify-content-between">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb" style="margin: 0px;">
								<li class="breadcrumb-item"><a href="#">프로젝트 </a></li>
								<li class="breadcrumb-item active">위키</li>
							</ol>
						</nav>
						
						<div role="tablist" class="d-flex flex-row justify-content-end">
						
							<a id='dropdownMenuButton' class="nav-link dropdown-toggle"	href="#" role="button" data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-list align-middle me-2"><line x1="8" y1="6" x2="21" y2="6"></line><line x1="8" y1="12" x2="21" y2="12"></line><line x1="8" y1="18" x2="21" y2="18"></line><line x1="3" y1="6" x2="3.01" y2="6">
							</line><line x1="3" y1="12" x2="3.01" y2="12"></line><line x1="3" y1="18" x2="3.01" y2="18"></line></svg>조건별 정렬 </a>
							
							
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item" onclick="wikiList()" target="_blank">최신순</a>
								<a class="dropdown-item" target="_blank">분류별</a> 
								<a class="dropdown-item" onclick="f_WC001()" target="_blank">　＞지식</a>
								<a class="dropdown-item" onclick="f_WC002()"target="_blank">　＞참고자료</a>
								<a class="dropdown-item"onclick="f_WC003()" target="_blank">　＞기타</a>
							</div>
							<button type="button" id="createBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#wikiModal">위키작성</button>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
<div class="col-12" id="projectwikiListView" style="display: block;">
		<div class="card">
			<div class="card-header">
				<div class="row">
					<div class="col-sm-12 col-md-7">
						<div class="d-flex justify-content-start"></div>
						<h4>위키게시판 이용시 필독</h4>
						
						<div class="alert-message">
							<p style="color: #cc0000">
							<br>
								● 제목은 간결하고 정확하게 입력해주세요.<br>
								● 검색 후, 글을 작성해주세요.<br>
								● 부정확한 글은 통보 없이 삭제될 수 있습니다. 
							</p>
						</div>
					</div>
					<div class="col-sm-12 col-md-5">
						<div id="searchUI" class="d-flex justify-content-end">
							<select name="searchOption" class="form-control" style="width: 20%;">
							<!-- 동적으로 값을 불러와야해   -->
								<option value="total">전체</option>
								<option value="title">제목</option>
								<option value="writer">분류</option>
							</select>
							<input class="bg-light" type="text" name="searchWord" placeholder="검색어를입력" /> 
							<input class="btn btn-primary" type="button" value="검색" id="searchProjectBtn" />
						</div>
					</div>
				</div>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-12  col-md-10" id="wikiSelect"></div>
					
						<div class="col-md-2" id="listSelect" style="background-color:#d2d2d2; padding:1rem;">
								<div id="goto" class="list-group list-group-flush" role="tablist">
									 <strong>
									 <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right-circle align-middle me-2">
									 <circle cx="12" cy="12" r="10"></circle>
									 
									 <polyline points="12 16 16 12 12 8"></polyline>
									 <line x1="8" y1="12" x2="16" y2="12"></line></svg>바로가기
									 </strong>
									 
									<a class="list-group-item list-group-item-action" href="http://www.google.com" target="_blank" role="tab" aria-selected="false" >
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chrome align-middle me-2">
										<circle cx="12" cy="12" r="10"></circle>
										<circle cx="12" cy="12" r="4"></circle><line x1="21.17" y1="8" x2="12" y2="8"></line><line x1="3.95" y1="6.06" x2="8.54" y2="14">
										</line>
										</svg>
										Chrome
									</a>
									
									<a class="list-group-item list-group-item-action"  href="http://www.github.com" target="_blank" role="tab" aria-selected="false" tabindex="-1">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-github align-middle me-2">
										<path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22">
										</path></svg>
										Github
									</a>
									
									<a class="list-group-item list-group-item-action" href="https://twitter.com/" target="_blank" role="tab" aria-selected="false" tabindex="-1">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-twitter align-middle me-2">
									<path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path></svg>
										Twitter
									</a>
									
									<a class="list-group-item list-group-item-action" href="https://www.google.com/intl/ko/gmail/about/" target="_blank" role="tab" aria-selected="false" tabindex="-1">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail align-middle me-2">
									<path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
										Mail							
									</a>
								</div>
							</div>
							
							
						</div>
					</div>
					
				</div>
			</div>
			<!-- 
			<div class="card-footer">
				<div id="proTotalDisp" class="row"></div>
				<div class="row" id="projectWikiListPagingDisp" style="display: block;">
					<div class="col-sm-12 col-md-12">
						<div class="pagingArea d-flex justify-content-center"></div>
					</div>
					<form id="searchForm">
						<input type="text" name="page" />
						<security:csrfInput/>
					</form>
				</div>
			</div>
			 -->
			
		</div>
	</div>
</div>	
</main>

<!------------------ 위키 작성 모달창 ---------------------------------> 
<div class="modal fade" id="wikiModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog  modal-lg">

		<div class="modal-content" id="wikiwrite">
			<div class="modal-header">

				<h1 class="modal-title fs-5" id="exampleModalLabel">위키 추가</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			
				<form id="wikiForm" enctype="multipart/form-data">
					<div class="form-group">
					
						<label for="wiki-title-input" class="col-form-label">위키 제목</label>
						<input type="text" class="form-control" name="wikiTitle" required>
					</div>
					<div>
					<label for="news-title-input" class="col-form-controle">위키 분류</label>
					</div>
					<td>
						<select name="wikiClsCd" class="form-select" id="modiwikiClsCd" required>
							<option value="WC000">선택안함</option>
							<option value="WC001">지식</option>
							<option value="WC002">참고자료</option>
							<option value="WC003">기타</option>
						</select>
					</td>
					<div class="form-group">
						<input type="hidden" value="${authMember.memEmail }" name="memEmail">
					</div>

					<div class="form-group">
						<input type="hidden" value="${project.proCode }" name="proCode">
					</div>

					<th>위키내용</th>
					<td>
						<textarea type="text" name="wikiCont" id="wikieditor" cssClass="form-control" required></textarea>
					</td>
					<script>
				   			CKEDITOR.replace('wikieditor');
					</script>
				
					<!------ modal-footer ---------->
					<div class="modal-footer">
						<input type="file" name="files" accept="image/*">
					</div>
					<button id="wikiSaveBtn" type="submit" class="btn btn-success">저장</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<security:csrfInput />
				</form>
			</div>
		</div>
	</div>
</div>
<!------------------ 위키 답글 모달창 ---------------------------------> 
<div class="modal fade" id="wikiCommModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog  modal-lg">

		<div class="modal-content" id="wikiwrite">
			<div class="modal-header">

				<h1 class="modal-title fs-5" id="exampleModalLabel">답글 작성</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			
				<form id="wikiCommForm" enctype="multipart/form-data">
					<div class="form-group">
						<label for="wiki-title-input" class="col-form-label">위키 제목</label>
						<input type="text" class="form-control" name="wikiTitle">
					</div>
					<div>
					<label for="news-title-input" class="col-form-label">위키 분류</label>
					</div>
					<td>
						<select name="wikiClsCd" class="form-select" id="modiwikiClsCd" required>
							<option value="WC000">선택안함</option>
							<option value="WC001">지식</option>
							<option value="WC002">참고자료</option>
							<option value="WC003">기타</option>
						</select>
					</td>
					<div class="form-group">
						<input type="hidden" value="${authMember.memEmail }" name="memEmail">
					</div>

					<div class="form-group">
						<input type="hidden" value="${project.proCode }" name="proCode">
					</div>

					<th>위키내용</th>
					<td>
						<textarea type="text" name="wikiCont" id="wikieditor2" cssClass="form-control"></textarea>
					</td>
					<script>
				   			CKEDITOR.replace('wikieditor2');
					</script>
			
					<!------ modal-footer ---------->
					<div class="modal-footer">
						<input type="file" name="files" accept="image/*">
					</div>
					<button id="wikiCommBtn" type="submit" class="btn btn-success">답글저장</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<security:csrfInput />
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

	let wikiSelect = $("#wikiSelect");
	let proTotalDisp = $("#proTotalDisp");
	
///// 위키가 없는경우 html
	   let NotHtml = function(){
	      let ListHtml = "";
	      ListHtml += `
	      <div class="col-12 col-md-6 col-lg-4">
	         <div class="card">
	            <p><h3>해당 게시물이 없습니다</h3></p>
	         </div>
	      </div>`;
	      return ListHtml;
	   }

	   // paging html
	   let pagingArea = $(".pagingArea").on("click", "a.paging", function(event){
	      console.log("페이징1");
	      event.preventDefault();
	      let page = $(this).data("page");
	      console.log("page",page);
	      if(!page) return false;
	      searchForm.find("[name=page]").val(page);
	      searchForm.submit();
	      return false; 
	   });



/////위키html 	
	let makeWikiHtml = function(wikiList){
		let wikiHtml = "";
			wikiHtml += `
			<div class="row" >
				<table class="table">
					<thead>
						<tr style="text-align:center;">
							<th style="width:5%">순번</th>
							<th style="width: 15%;">분류</th> 
							<th style="width: 25%;"style="text-align:center;">제목</th>
							<th style="width: 15%;">등록일</th>
							<th style="width: 15%">작성자</th>
						</tr>
						
						
					</thead>
			`;
				for(let i=0; i<wikiList.length; i++){
					wikiHtml+=`	<tr style="text-align:center;"> `;
						wikiHtml += `			
							<td>\${wikiList[i].rnum}</td>
							<td>\${wikiList[i].mcodeNm}</td>
							<td style="text-align:left;"><a href="#" onclick="f_detail(\${wikiList[i].wikiNo})">\${wikiList[i].wikiTitle}</a></td>
							<td>\${wikiList[i].wikiDate}</td>
							<td>\${wikiList[i].memEmail}</td>
					</tr>`;
				}
					wikiHtml +=`
				</tbody>
				</table>
			</div>
					`;
		return  wikiHtml;
	} 
		
////////////////////위키목록 첫 UI/////////////////
	$.ajax({
		url : "${pageContext.request.contextPath}/project/project/wiki/${project.proCode}",
		method : "get",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success : function(resp) {
			console.log("위키ui만뿌릴꺼야!!");
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR,status,error);
		}
	});

/////////목록으로
	$(document).on("click","#GotoList",function(){ wikiList(); });


//목록 보여주기(최신순 정렬)	
	wikiList();
	function wikiList(wikiList){
		$.ajax({
			url : "${pageContext.request.contextPath }/project/project/wikiListView/${project.proCode}",
			method : "get",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success : function(resp) {
				if(resp.length>0){
					console.log("위키 목록(날짜별) :",resp);
					wikiSelect.html(makeWikiHtml(resp));
				}
				else{
					wikiSelect.html(NotHtml(resp));
				}
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	};
	
	
/////정렬 다르게 ()
 	function f_wikiClsList(wikiNo){
		$.ajax({
			url : "${pageContext.request.contextPath }/project/project/wikiListViewSort/${project.proCode}",
			method : "get",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success : function(resp) {
				console.log("위키목록(분류별)",resp);
				wikiSelect.html(makeWikiHtml(resp));
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR,status,error);
			}
		});
	};
	
	
/////WC001
 	function f_WC001(wikiNo){
		$.ajax({
			url : "${pageContext.request.contextPath }/project/project/wikiListOne/${project.proCode}",
			method : "get",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success : function(resp) {
				console.log("위키목록(지식)",resp);
				wikiSelect.html(makeWikiHtml(resp));
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR,status,error);
			}
		});
	}; 

/////WC002
 	function f_WC002(wikiNo){
		$.ajax({
			url : "${pageContext.request.contextPath }/project/project/wikiListTwo/${project.proCode}",
			method : "get",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success : function(resp) {
				console.log("위키목록(참고자료)",resp);
				wikiSelect.html(makeWikiHtml(resp));
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR,status,error);
			}
		});
	}; 
	
/////WC003
 	function f_WC003(wikiNo){
		$.ajax({
			url : "${pageContext.request.contextPath }/project/project/wikiListThree/${project.proCode}",
			method : "get",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success : function(resp) {
				console.log("위키목록(기타)",resp);
				wikiSelect.html(makeWikiHtml(resp));
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR,status,error);
			}
		});
	}; 	
	
///////자세히보기
	let makeWikiDetailHtml = function(wikiVo){
		let WikiDetailHtml = "";
			WikiDetailHtml += `
			<div class="row">
				<div class="col-12 col-md-12 col-lg-12">
						<div class="card">
								
								<div class="card-header px-4 pt-4">
								 
								<button id="GotoList" class="btn btn-primary" style="float: right;">목록으로 </button>
								
								<button id="WriteComm" class="btn btn-success" data-wiki-no="\${wikiVo.wikiNo}" data-bs-toggle="modal" data-bs-target="#wikiCommModal" style="float:right; margin-right:0.5rem;">답글쓰기 </button>
								
								<table class="table table-sm mt-2 mb-4">
									<tbody>
										<tr>
											<th>제목</th>
											<td>\${wikiVo.wikiTitle}</td>
										</tr>
										<tr>
											<th>분류</th>
											<td>\${wikiVo.mcodeNm}</td>
										</tr>
											<th>작성자</th>
											<td>\${wikiVo.memEmail}</td>
										</tr>
										
										<tr>
										
										
									</tbody>
								</table>
							</div>
							
							<div class="card-body px-4 pt-2">
							<p>\${wikiVo.wikiCont}</p>
							<hr>
						</div>
					</div>
					<div class="d-flex justify-content-end">
				
					<div>
					`
					if(wikiVo.memEmail == "${authMember.memEmail}"){
						
						WikiDetailHtml +="<button type='button' id='SelectwikiDeleteBtn' class='btn btn-outline-secondary' data-wiki-no='"+wikiVo.wikiNo+"' style='margin-right:0.5rem;'>삭제</button>"
						WikiDetailHtml +="<button type='button' id='updateWikiBtn' class='btn btn-outline-primary' data-bs-toggle='modal' data-bs-target='#wikiModal' data-wiki-no='"+wikiVo.wikiNo+"' style='margin-right:0.5rem;'>수정</button>"
						
					}
					if(wikiVo.fileName!=null){
					WikiDetailHtml += "<a href='#' id='saveFileBtn'><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-save align-middle me-2'><path d='M19 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11l5 5v11a2 2 0 0 1-2 2z'></path><polyline points='17 21 17 13 7 13 7 21'></polyline><polyline points='7 3 7 8 15 8'></polyline></svg>"+wikiVo.fileName+""	
					
					
					}
				WikiDetailHtml += `
					</div>
				</div>
				</div>
				
			</div>`;
		return WikiDetailHtml;
	}	
/////////////상세보기
	function f_detail(wikiNo){
		
	 	let data = { 
			wikiNo : wikiNo
		}
	 	console.log("글번호",data)
	 	
		$.ajax({
			url : "${pageContext.request.contextPath}/project/project/wikiDetail",
			method : "post",
			data :  JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success : function(resp) {
				console.log("상세보기"+resp);
				wikiSelect.html(makeWikiDetailHtml(resp));
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR,status,error);
			}
		});
	};
///////위키작성
	$("#wikiForm").on("submit", function(event){
		event.preventDefault();
		
	/* $("#createBtn").on("click", function(){
		console.log("등록누름"); */
		
			$("#wikieditor").val(CKEDITOR.instances.wikieditor.getData());
			
				let data = new FormData($("#wikiForm")[0]);
					for (let key of data.keys()) {
					   console.log(key, ":::::", data.get(key));
			}
		 		$.ajax({
					url : "${pageContext.request.contextPath }/project/project/wikiInsert",
					method : "post",
					data : data,
				    processData : false,
	     	        contentType : false,
	     	        beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                   xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	               },
	               success : function(resp) {
						console.log("등록성공!!!!!!!!!!!!!",resp);
						$("#wikiModal").modal("hide");
						location.href="${pageContext.request.contextPath}/project/project/wiki/${proCode}";
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR,status,error);
					}
				});
			});
///////답글쓰기

	//[답글쓰기] 버튼 누름 
	$("#wikiCommForm").on("submit", function(event){
		event.preventDefault();
		console.log("답글버튼누름");
		$("#exampleModalLabel").html("위키 답글 작성");
		
	//이게 부모번호로 들어가야해
		let wikiPntNo;
		wikiPntNo = $("#WriteComm")[0].dataset.wikiNo
			console.log("값:",wikiPntNo);
		
		//[내용세팅]
		$("#wikieditor2").val(CKEDITOR.instances.wikieditor2.getData());
		

		//[폼정보가져오고, wikiNo 갑 추가하기]
			let data = new FormData($("#wikiCommForm")[0]);
				data.append('wikiPntNo', wikiPntNo);
				
				for (let key of data.keys()) {
				   console.log(key, ":::::", data.get(key));
				}
				
				$.ajax({
					url : "${pageContext.request.contextPath}/project/project/wikiCommInsert",
					method : "post",
					data : data,
				    processData : false,
	     	        contentType : false,
	     	        beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                   xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                },
					success : function(resp) {
						console.log("답글등록성공");
						$("#wikiModal").modal("hide");
						location.href="${pageContext.request.contextPath}/project/project/wiki/${proCode}";
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR,status,error);
					}
				});
	});

	//[수정] 버튼 누름 
	$(document).on("click","#updateWikiBtn",function(){
		$("#exampleModalLabel").html("위키수정");
		$("#wikiSaveBtn").html("수정");
	 	let data = { 
			wikiNo : $("#updateWikiBtn")[0].dataset.wikiNo
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath}/project/project/wikiDetail",
			method : "post",
			data :  JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success : function(resp) {
				console.log("수정하려고상세보기"+resp.wikiNo);
				
				let wikiNo = $("input[name=wikiNo]").val(resp.wikiNo);
				let wikiTitle = $("input[name=wikiTitle]").val(resp.wikiTitle);
				let wikiClsCd = $("[name=modiwikiClsCd").val(resp.wikiClsCd);
				let wikiCont = CKEDITOR.instances.wikieditor.setData(resp.wikiCont);
				
				//location.href="${pageContext.request.contextPath}/project/project/wiki/${proCode}";
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR,status,error);
			}
		});
	});
	
//////////////삭제하기
	$(document).on("click","#SelectwikiDeleteBtn",function(){
			let data = {
					wikiNo : $("#updateWikiBtn")[0].dataset.wikiNo
			}
			console.log("위키번호 : ",data);
			
				Swal.fire({
				   title: '삭제 하시겠습니까?',
				   text: '다시 되돌릴 수 없습니다. 신중하세요.',
				   icon: 'warning',
				   
				   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				   confirmButtonText: '승인', // confirm 버튼 텍스트 지정
				   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
				   
				   reverseButtons: true, // 버튼 순서 거꾸로
				   
				}).then(result => {
				   // 만약 Promise리턴을 받으면,
				   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
						
						$.ajax({
							url : "${pageContext.request.contextPath}/project/project/deleteWiki",
							method : "post",
							data : JSON.stringify(data),
							contentType : "application/json;charset=utf-8",
							dataType : "text",
							beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
				                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				            },
							success : function(result) {
								console.log("삭제할꺼야",result);
								 location.reload();
							},
							error : function(jqXHR, status, error) {
								console.log(jqXHR,status,error);
							}
						});		
			   
		       Swal.fire('삭제 완료되었습니다.', 'success');
		   }
		   else{
			   Swal.fire('', '삭제 취소하였습니다.', "failed");
			   return;
		   }
		});
	});
	
	

 </script>




