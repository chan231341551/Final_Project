<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<main class="content" style="padding-top:0px;">

<div class="container-fluid p-0">
	<div class="row">
		<!--====================== 칸반보드 상단 바 ======================-->
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="d-flex flex-column justify-content-between">
						<h3>칸반보드</h3>
					</div>
					<hr>
					<div class="d-flex flex-column justify-content-between">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb" style="margin:0px;">
								<li class="breadcrumb-item"><a href="#">프로젝트 홈</a></li>
								<li class="breadcrumb-item active">자유게시판</li>
							</ol>
						</nav>
						<div role="tablist" class="d-flex flex-row justify-content-end">								
							<button id="boardInsert" class="btn btn-primary">글쓰기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

   <div class="row">
      <div class="col-md-8 col-xl-12">
         <!-- 자유게시판 -->
         <div class="card">
            <div class="card-header">
               <h5 class="card-title">자유게시판</h5>
                  <div id="searchUI" class="input-group" style="padding-top: 30px;width: 25%;float: right;">
                     <select id="searchBoardOption" style="" class="form-select"
                        aria-label="Default select example">
                        <option value="">기본</option>
                        <option value="boardTitle">제목</option>
                        <option value="boardCont">내용</option>
                     </select> <input id="searchBoardWord" type="text" class="form-control"
                        aria-label="Text input with segmented dropdown button"
                        style="width: 45%;"> <input type="button"
                        class="btn btn-outline-secondary" value="검색" id="searchBoardBtn">

                  </div>
               </div>
            <div class="card-body">
               <div class="alert alert-primary alert-outline alert-dismissible"
                  role="alert">
                  <button type="button" class="btn-close" data-bs-dismiss="alert"
                     aria-label="Close"></button>

                  <div class="alert-message">
                     <strong>인기글</strong> 최강1팀 보문산 화이팅
                  </div>
               </div>
               <table class="table">
                  <thead>
                     <tr>
                        <th style="width: 5%;">No</th>
                        <th style="width: 45%;">제목</th>
                        <th style="width: 15%">작성자</th>
                        <th style="width: 15%">날짜</th>
                        <th style="width: 10%">조회수</th>
                     </tr>
                  </thead>
                  <tbody id="boardTbody">
                     
                  </tbody>
               </table>
               <div class="d-flex justify-content-end">
                  <div>                     

                  </div>
                  <div>
                     <button id="boardInsert" class="btn btn-outline-primary">글쓰기</button>
<!--                      <button class="btn btn-outline-primary">삭제</button> -->
                  </div>
               </div>
<!--                <div class="d-flex justify-content-center"> -->
<!--                      <nav aria-label="Page navigation example "> -->
<!--                         <ul class="pagination pagination-sm"> -->
<!--                            <li class="page-item"><a class="page-link" href="#">Left<i class="fas fa-angle-left"></i></a></li> -->
<!--                            <li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!--                            <li class="page-item active"><a class="page-link" href="#">2</a></li> -->
<!--                            <li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!--                            <li class="page-item"><a class="page-link" href="#">4</a></li> -->
<!--                            <li class="page-item"><a class="page-link" href="#">5</a></li> -->
<!--                            <li class="page-item"><a class="page-link" href="#">Right<i class="fas fa-angle-right"></i></a></li> -->
<!--                         </ul> -->
<!--                      </nav> -->
<!--                </div> -->

            </div>

         </div>

      </div>

      
   </div>

</div>

</main>

<script>

// 게시판 목록가기(자유게시판 전체태그) 태그 만들기
let makeBackBoardTag = function(){
	let list = "";
	list += `
		<div class="container-fluid p-0">
		   <div class="row">
		      <div class="col-md-8 col-xl-12">
		         <!-- 자유게시판 -->
		         <div class="card">
		            <div class="card-header">
		               <h5 class="card-title">자유게시판</h5>
		                  <div id="searchUI" class="input-group" style="padding-top: 30px;width: 25%;float: right;">
		                     <select id="searchBoardOption" style="" class="form-select" aria-label="Default select example">
		                        <option value="">기본</option>
		                        <option value="boardTitle">제목</option>
		                        <option value="boardCont">내용</option>
		                     </select> <input id="searchBoardWord" type="text" class="form-control" aria-label="Text input with segmented dropdown button" style="width: 45%;"> <input type="button" class="btn btn-outline-secondary" value="검색" id="searchBoardBtn">

		                  </div>
		               </div>
		            <div class="card-body">
		               <div class="alert alert-primary alert-outline alert-dismissible" role="alert">
		                  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

		                  <div class="alert-message">
		                     <strong>인기글</strong> 최강1팀 보문산 화이팅
		                  </div>
		               </div>
		               <table class="table">
		                  <thead>
		                     <tr>
		                        <th style="width: 5%;">No</th>
		                        <th style="width: 45%;">제목</th>
		                        <th style="width: 15%">작성자</th>
		                        <th style="width: 15%">날짜</th>
		                        <th style="width: 10%">조회수</th>
		                     </tr>
		                  </thead>
		                  <tbody id="boardTbody"></tbody>
		               </table>
		               <div class="d-flex justify-content-end">
		                  <div>                     

		                  </div>
		                  <div>
		                     <button id="boardInsert" class="btn btn-outline-primary">글쓰기</button>

		           

		</a></div>
	`
	$(".content").html(list)
}

//목록가기 
let BackSelectBoardList = function(){
	$(".content").html("");
	makeBackBoardTag();
	selectBoardList();
}

//게시판 상세조회 태그만들기
function makeBoardDetailTag(data){
	console.log("데이터 왔다 :",data );
	let detail = "";
	detail += `
		<main class="content" style="padding-top:0px;padding-left: 0px;">

		<div class="container-fluid p-0">
			<div class="row">
				<div class="col-12 col-md-12 col-lg-12">
						<div class="card">
							<div class="card-header px-4 pt-4">

								<h5 class="card-title">자유게시판</h5>
								<table class="table table-sm mt-2 mb-4">
									<tbody>
										<tr>
											<th>제목</th>
											<td>\${data.boardTitle}</td>
										</tr>
										<tr>
											<th>No</th>
											<td>\${data.boardNo}</td>
										</tr>
										<tr>
											<th>작성자</th>
											<td>\${data.memName }</td>
										</tr>
										<tr>
											<th>작성일자</th>
											<td>\${data.boardDate }</td>
										</tr>
										<tr>
											<th>조회수</th>
											<td>\${data.hit}</td>
										</tr>
									</tbody>
								</table>
								
							</div>
							<div class="card-body px-4 pt-2">
								<p>\${data.boardCont}</p>
								<hr>
								<a class="btn btn-success" id="boardUpdate" href="#">수정</a>
								<a class="btn btn-danger" id="boardDelete" href="#">삭제</a>
								<input type="button" class="btn btn-secondary" value="목록으로" onclick="BackSelectBoardList()" ></input>
							</div>


							<!-- 댓글  -->
						<div class="card">
							<div class="card-header">
								<h5 class="card-title">댓글 작성</h5>
							</div>
							<div id="boardCommCont">
									
							</div>
							<div id="boardCommBody" class="card-body">
								<form id="boardCommForm">
									<input type="hidden" name="memEmail" value="\${data.memEmail}" />
									<input type="hidden" id="boardNo" name="boardNo" value="\${data.boardNo}" />
									<div class="row">
										<div class="col-md-12">
											<div class="mb-3">
												<label class="form-label" for="inputUsername">내용</label>
												<textarea rows="2" name="boardCommCont" class="form-control" id="boardComm" placeholder="내용을 입력해주세요"></textarea>
											</div>
										</div>
									</div>
									<button id="BoardCommButton" type="submit" class="btn btn-success">전송</button>
								<form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		</main>
	`
	$(".content").html(detail);
}

function makeBoardTag(board){
   console.log("board : ",board);
   let aTag = $("<a>").attr({
	   "href":"#",
	   "id" : "boardDetail",
	   "data-boardNo":board.boardNo
	   }).html(board.boardTitle);
   return $("<tr>").append(
      $("<td>").html(board.boardNo),
      $("<td>").attr({
    	  "id":"aTagClick"
      }).html(aTag),
      $("<td>").html(board.memName),
      $("<td>").html(board.boardDate),
      $("<td>").html(board.hit)
      
   )
   
}

// 게시판 리스트 조회 ajax
let selectBoardList = function(){
	$.ajax({
		url : "${pageContext.request.contextPath }/project/project/boardListData/${proCode}",
		method : "get",
		dataType : "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success : function(resp) {
			let boardTag = [];
	        if(resp){
	           $.each(resp,function(i,v){
	              boardTag.push(makeBoardTag(v));
	           })
	        }
	        else{
	           alert("검색결과없음");
	        }
	        $("#boardTbody").html("");
	        $("#boardTbody").html(boardTag);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}
selectBoardList();

 //검색 찾는 로직 구현 ajax
let searchBoard = function(){
    $("#searchBoardBtn").on("click", function(){
       searchBoardList();
    });
}
searchBoard();

searchBoardList = function (){
  let searchOption = $("#searchBoardOption option:selected").val();
  let searchWord = $("#searchBoardWord").val();
  console.log(searchOption);
  console.log(searchWord);
  
  
  let data = {
     searchOption:searchOption,
     searchWord:searchWord,
     proCode:"${proCode}"
  }
  console.log("data : " ,data);
  
  $.ajax({
     url : "${pageContext.request.contextPath }/project/boardSearch",
     method : "post",
     data : JSON.stringify(data),
     contentType : "application/json;charset=utf-8",
     dataType : "json",
     beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
     },
     success : function(result) { 
        console.log("result : ",result);
        let boardTag = [];
        if(result){
           $.each(result,function(i,v){
              boardTag.push(makeBoardTag(v));
           })
        }
        else{
           alert("검색결과없음");
        }
        $("#boardTbody").html("");
        $("#boardTbody").html(boardTag);
        
        
        
     },
     error : function(jqXHR, status, error) {
        console.log(jqXHR);
        console.log(status);
        console.log(error);
     }
  });
  
};

//게시판 상세조회 ajax
let boardDetail = function(){
	$(document).on("click","#boardDetail",function(){
		let boardNo = $(this).data("boardno");
		$.ajax({
			url : "${pageContext.request.contextPath }/project/project/boardDetail/"+boardNo,
			method : "get",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	     	},
			success : function(resp) {
				console.log("결과 : ",resp);
				$(".content").html("");
				makeBoardDetailTag(resp);
				
				let boardNo = resp.boardNo;
				//게시판 수정 ajax
				$("#boardUpdate").on("click",function(){
					$(".content").html("")
					makeUpdateBoardFormTag(resp);
					CKEDITOR.replace( 'editor1' );
					$("#updateForm").on("submit",function(event){
						event.preventDefault();
						$("#editor1").val(CKEDITOR.instances.editor1.getData());
						let formData = new FormData($("#updateForm")[0]);
						for (let key of formData.keys()) {
							   console.log(key, ":", formData.get(key));
						}
						$.ajax({
							url : "${pageContext.request.contextPath }/project/project/boardUpdate/"+boardNo,
							method : "post",
							data : formData,
							processData : false,
					        contentType : false,
							dataType : "json",
							beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
					            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					   		},
							success : function(resp) {
								console.log("결과 : ",resp);
								
			
							},
							error : function(jqXHR, status, error) {
								console.log(jqXHR);
								console.log(status);
								console.log(error);
							}
						});
						return false;
					})
				})
				
				$("#boardDelete").on("click",function(){
					console.log("체크");
					
					$.ajax({
						url : "${pageContext.request.contextPath }/project/project/boardDelete/"+boardNo,
						method : "post",
						dataType : "json",
						beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
				            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				   		},
						success : function(resp) {
							console.log("결과 : ",resp);
							if(resp > 0){
								$(".content").html("");
								makeBackBoardTag();
								selectBoardList();
							}
							else{
								alert("게시판 삭제 실패");
								return;
							}
							
		
						},
						error : function(jqXHR, status, error) {
							console.log(jqXHR);
							console.log(status);
							console.log(error);
						}
					});
				});
				
				boardCommCont
				
				// 게시판 댓글 리스트 ajax
				let BoardCommList = function(){
					let boardNo = $("#boardCommForm").children('input').eq(1).val();
					$.ajax({
						url : "${pageContext.request.contextPath }/project/project/boardCommList/"+boardNo,
						method : "get",
				        dataType : "json",
						beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
				            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				        },
						success : function(resp) {
							console.log("결과 : ",resp);
							let boardComm = [];
							$.each(resp,function(i,v){
								boardComm.push(makeBoardCommTag(v));
							})
							$("#boardCommCont").html(boardComm);
						},
						error : function(jqXHR, status, error) {
							console.log(jqXHR);
							console.log(status);
							console.log(error);
						}
					});
				}
				BoardCommList();
				
				// 게시판 댓글 등록 ajax
				$("#boardCommForm").on("submit",function(event){
					event.preventDefault();
					let boardNo = $("#boardCommForm").children('input').eq(1).val();
					let data = $("#boardCommForm").serialize();
					console.log("data : ",data);
					console.log("boardNo : ",boardNo);
					$.ajax({
						url : "${pageContext.request.contextPath }/project/project/boardCommInsert/"+boardNo,
						method : "post",
						data : JSON.stringify(data),
						contentType : "application/json;charset=utf-8",
				        dataType : "json",
						beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
				            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				        },
						success : function(resp) {
							console.log("결과 : ",resp);
							
						},
						error : function(jqXHR, status, error) {
							console.log(jqXHR);
							console.log(status);
							console.log(error);
						}
					});
					return false;
				})
				
				
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
	})
}
boardDetail();

// <div class="chat-message-left pb-4">
// 	<div>
// 		<img src="img/avatars/avatar-3.jpg" class="rounded-circle me-1" alt="Sharon Lessman" width="40" height="40">
// 		<div class="text-muted small text-nowrap mt-2">2:34 am</div>
// 	</div>
// 	<div class="flex-shrink-1 bg-light rounded py-2 px-3 ms-3">
// 		<div class="font-weight-bold mb-1">Sharon Lessman</div>
// 		<div class="font-weight-bold mb-2">내용</div>
// 	</div>
// </div>
//댓글 태그 만들기
let makeBoardCommTag = function(data){
	return $("<div>").attr({
		"class" : "chat-message-left pb-4",
		"style" : "padding-left: 24px;"
		}).append(
				$("<div>").append(
					$("<img>").attr({
						"src" : "#",
						"class" : "rounded-circle me-1",
						width : "40",
						height : "40"
					}),
					$("<div>").attr("class","text-muted small text-nowrap mt-2").html(data.boardCommDate)
				),
				$("<div>").attr("class","flex-shrink-1 bg-light rounded py-2 px-3 ms-3").append(
					$("<div>").attr("class","font-weight-bold mb-1").html(data.memEmail),
					$("<div>").attr("class","mb-2").html(data.boardCommCont)	
				)
			)
}

//게시판 수정 폼 태그 
let makeUpdateBoardFormTag = function(data){
	console.log("데이터 왔나? : ",data);
	let boardInsert = "";
	boardInsert += `
		<main class="content" style="padding-top:0px;">
		<div class="container-fluid p-0">
			<div class="row">
				<div class="col-md-8 col-xl-12">
					<!-- 게시판 작성 -->
					<div class="card">
						<div class="card-header">
							<h5 class="card-title"></h5>
						</div>
						<div class="card-body">
							<form id="updateForm">
								<input type="text" name="boardTitle" id="boardTitle" placeholder="제목을 입력해주세요." value="\${data.boardTitle}"/>
								<br>
								<br>
								<textarea name="boardCont" id="editor1" rows="10" cols="80">\${data.boardCont}</textarea>

								<button id="boardSubmitBtn" type="submit" class="btn btn-success">저장</button>
								<a class="btn btn-secondary" href="#" onclick="BackSelectBoardList()">취소</a>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		</main>
	`
	$(".content").html(boardInsert)
}

//게시판 글쓰기 폼태그
let makeboardFormTag = function(){
	let boardInsert = "";
	boardInsert += `
		<main class="content" style="padding-top:0px;">
		<div class="container-fluid p-0">
			<div class="row">
				<div class="col-md-8 col-xl-12">
					<!-- 게시판 작성 -->
					<div class="card">
						<div class="card-header">
							<h5 class="card-title"></h5>
						</div>
						<div class="card-body">
							<form id="insertForm">
								제목 : <input type="hidden" name="proCode" id="proCode"  value="${proCode}" />
								<input type="text" name="boardTitle" id="boardTitle" placeholder="제목을 입력해주세요." />
								<br>
								<br>
								<textarea name="boardCont" id="editor1" rows="10" cols="80"></textarea>

								<button id="boardSubmitBtn" type="submit" class="btn btn-success">저장</button>
								<a class="btn btn-secondary" href="#" onclick="BackSelectBoardList()">취소</a>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		</main>
	`
	$(".content").html(boardInsert)
}

// 게시판 글쓰기 ajax
	$(document).on("click","#boardInsert",function(){
		$(".content").html("")
		makeboardFormTag();
		CKEDITOR.replace( 'editor1' );
		
		$("#insertForm").on("submit",function(event){
			event.preventDefault();
			$("#editor1").val(CKEDITOR.instances.editor1.getData());
			let formData = new FormData($("#insertForm")[0]);
			$.ajax({
				url : "${pageContext.request.contextPath }/project/project/boardInsert",
				method : "post",
				data : formData,
		        dataType : "json",
		        processData : false,
		        contentType : false,
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
				success : function(resp) {
					console.log("결과 : ",resp);
					if(resp == '1'){
						$(".content").html("");
						makeBackBoardTag();
						selectBoardList();
					}
					else{
						alert("게시판 등록 실패");
					}
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			});
			return false;
		})
	})

	




</script>