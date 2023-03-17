<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!-- 폰트 어썸 cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>

<security:authentication property="principal.realMember" var="authMember"/>


<!-- 폰트 어썸 cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>

<security:authentication property="principal.realMember" var="authMember"/>

<main class="content">

	<div class="container-fluid p-0">
		<h1 class="h3 mb-3">내 프로젝트</h1>
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Pms</a></li>
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item active">내 프로젝트</li>
			</ol>
		</nav>
		<hr>
		
		<div class="card">
			<div class="card-header">
				<ul class="nav nav-pills card-header-pills pull-left" role="tablist">
					<li class="nav-item" role="presentation">
						<a id="proAll" class="nav-link active" data-bs-toggle="tab" href="#tab-1" aria-selected="true" role="tab">전체 프로젝트</a>
					</li>
					<li class="nav-item" role="presentation">
						<a id="proDelete" class="nav-link" data-bs-toggle="tab" href="#tab-2" aria-selected="false" role="tab" tabindex="-1">삭제 된 프로젝트</a>
					</li>
				</ul>
			</div>
		</div>
		
		
		<div class="card">
			<div class="card-body">
				<div class="tab-content">
					<!-- 모든 프로젝트 -->
					<div class="tab-pane fade active show" id="tab-1" role="tabpanel">
						<!-- 검색창 -->
						<div class="card-header">
							<div class="row">
								<div class="col-sm-12 col-md-7">
									<div class="d-flex justify-content-start"></div>
								</div>
								<div class="col-sm-12 col-md-5">
									<div id="searchUI" class="d-flex justify-content-end">
										<select name="searchOption" class="form-control" style="width:20%;">
											<option value="total">전체</option>
											<option value="title">제목</option>
											<option value="writer">생성자</option>
										</select>
											<input class="bg-light" type="text" name="searchWord" placeholder=""/>
										<input class="btn btn-primary" type="button" value="검색" id="searchProjectBtn"  /> 
									</div>
								</div>
							</div>
						</div>
						<hr>
						<div id="proTotalDisp" class="row"></div>
						<!-- paging -->
						<hr>
						<!-- 임시 확인용 -->
						<form id="searchForm" style="display:none;">
							<input type="text" name="page" />	
							<input type="text" name="searchOption" placeholder="선택"/>
							<input type="text" name="searchWord" placeholder="검색"/>
							<security:csrfInput/>
						</form>
					</div>
					<!-- 삭제 된 프로젝트 목록 -->
					<div class="tab-pane fade" id="tab-2" role="tabpanel">
						<!-- 검색창 -->
						<div class="card-header">
							<div class="row">
								<div class="col-sm-12 col-md-7">
									<div class="d-flex justify-content-start"></div>
								</div>
								<div class="col-sm-12 col-md-5">
									<div id="searchUI" class="d-flex justify-content-end">
										<select name="searchOption" class="form-control" style="width:20%;">
											<option value="total">전체</option>
											<option value="title">제목</option>
											<option value="writer">생성자</option>
										</select>
											<input class="bg-light" type="text" name="searchWord" placeholder=""/>
										<input class="btn btn-primary" type="button" value="검색" id="searchProjectBtn"  /> 
									</div>
								</div>
							</div>
						</div>
						<hr>
						<div id="deleteProTotalDisp" class="row"></div>
						<!-- paging -->
						<hr>
						<!-- <div class="row">
							<div class="col-sm-12 col-md-12">
								<div class="pagingArea d-flex justify-content-center"></div>
							</div>
						</div> -->
						<!-- 임시 확인용 -->
						<form id="searchForm" style="display:none;">
							<input type="text" name="page" />	
							<input type="text" name="searchOption" placeholder="선택"/>
							<input type="text" name="searchWord" placeholder="검색"/>
							<security:csrfInput/>
						</form>
					</div>
				</div>
			</div>
			
			<!-- 페이징 -->
			<div class="row">
				<div class="col-sm-12 col-md-12">
					<div class="pagingArea d-flex justify-content-center align-items-center"></div>
				</div>
			</div>
			<div class="card-footer">
			</div>	
		</div>
		
	</div>
	
</main>


<script type="text/javascript">

	/**************************** 내 프로젝트 전체 리스트 시작 ****************************/
	let proAll = $("#proAll");
	let proBefore = $("#proBefore");
	let proIng = $("#proIng");
	let proEnd = $("#proEnd");
	let proTotal = $("#proTotal");
		let proInvite = $("#proInvite")
		
		let participateAcceptBtn = $(".participateAcceptBtn");
	
	let proAllDisp = $("#proAllDisp");
	let proBeforeDisp = $("#proBeforeDisp");
	let proIngDisp = $("#proIngDisp");
	let proEndDisp = $("#proEndDisp");
	
	let proTotalDisp = $("#proTotalDisp");
	let proInviteListDisp = $("#proInviteListDisp");

	// 모든 프로젝트 목록 HTML ( 삭제 된 프로젝트 제외 )
 	let makeProjectListHtml = function(projectList){
		let myEmail = '${authMember.memEmail}';	
		
		let projectListHtml = "";
		for(let i=0; i < projectList.length; i++){
			
			projectListHtml += "";
	    	projectListHtml += "<div class='col-12 col-md-6 col-lg-3'>";
		    projectListHtml += "	<div class='card' style='position: relative; left:0; top:0;'>";
		    
		    projectListHtml += "		<a href='"+"${pageContext.request.contextPath}"+"/project/project/Home/"+projectList[i].proCode+"'>";
		    projectListHtml += "			<img class='card-img-top' id='proImgTag' src='"+projectList[i].proAttPath+"' alt='Project'>";
		    projectListHtml += "		</a>";
		    
		    projectListHtml += "<div class='card-header px-4 pt-4'>";
		    projectListHtml += "	<div class='card-actions float-end'>";
		    projectListHtml += "	</div>";
		    projectListHtml += "<h5 class='card-title mb-0'>"+projectList[i].proTitle+"</h5>";
		    
		    if(projectList[i].proClsCd == 'PC001'){
		    	projectListHtml += "<div class='badge bg-danger my-2'>디자인</div>"
		    }else if(projectList[i].proClsCd == 'PC002'){
		    	projectListHtml += "<div class='badge bg-success my-2'>마케팅</div>"	
		    }else if(projectList[i].proClsCd == 'PC003'){
		    	projectListHtml += "<div class='badge bg-info my-2'>엔지니어링</div>"	
		    }else if(projectList[i].proClsCd == 'PC004'){
		    	projectListHtml += "<div class='badge bg-primary my-2'>웹개발</div>"	
		    }else if(projectList[i].proClsCd == 'PC005'){
		    	projectListHtml += "<div class='badge bg-primary my-2'>앱개발</div>"	
		    }else if(projectList[i].proClsCd == 'PC006'){
		    	projectListHtml += "<div class='badge bg-secondary my-2'>기타</div>"	
		    }
		    
		    projectListHtml += "</div>";
		    projectListHtml += "<div class='card-body px-4 pt-2'>";
		    projectListHtml += "	<p>"+projectList[i].proDetail+"</p>";
		    projectListHtml += "	<img src='"+projectList[i].memAttPath+"' class='rounded-circle me-1' alt='Avatar' width='28' height='28'>";
		    projectListHtml += "</div>";
		    projectListHtml += "<ul class='list-group list-group-flush'>";
		    projectListHtml += "	<li class='list-group-item px-4 pb-4'>";
		    projectListHtml += "		<p class='mb-2 font-weight-bold'>Progress <span class='float-end'>"+projectList[i].proProgress+"%</span></p>";
		    projectListHtml += "		<div class='progress progress-sm'>";
		    projectListHtml += "			<div class='progress-bar' role='progressbar' aria-valuenow='"+projectList[i].proProgress+"' aria-valuemin='0' aria-valuemax='100' style='width: "+projectList[i].proProgress+"%;'>";
		    projectListHtml += "			</div>";
		    projectListHtml += "		</div>";
		    projectListHtml += "	</li>";
		    projectListHtml += "</ul>";
		    projectListHtml += "	</div>";
		    projectListHtml += "</div>";
		}
		return projectListHtml;
	}
	
	// 모든 프로젝트 목록 HTML ( 삭제 된 프로젝트 제외 )
 	let makeDeleteProjectListHtml = function(projectList){
		let myEmail = '${authMember.memEmail}';	
		
		let deleteProjectListHtml = "";
		for(let i=0; i < projectList.length; i++){
			
			deleteProjectListHtml += "";
			deleteProjectListHtml += "<div class='col-12 col-md-6 col-lg-3'>";
			deleteProjectListHtml += "	<div class='card' style='position: relative; left:0; top:0;'>";
		    
			deleteProjectListHtml += "		<a href='"+"${pageContext.request.contextPath}"+"/project/project/Home/"+projectList[i].proCode+"'>";
			deleteProjectListHtml += "			<img class='card-img-top' id='proImgTag' src='"+projectList[i].proAttPath+"' alt='Project'>";
			deleteProjectListHtml += "		</a>";
		    
			deleteProjectListHtml += "<div class='card-header px-4 pt-4'>";
			deleteProjectListHtml += "	<div class='card-actions float-end'>";
			deleteProjectListHtml += "	</div>";
			deleteProjectListHtml += "<h5 class='card-title mb-0'>"+projectList[i].proTitle+"</h5>";
		    
		    if(projectList[i].proClsCd == 'PC001'){
		    	deleteProjectListHtml += "<div class='badge bg-danger my-2'>디자인</div>"
		    }else if(projectList[i].proClsCd == 'PC002'){
		    	deleteProjectListHtml += "<div class='badge bg-success my-2'>마케팅</div>"	
		    }else if(projectList[i].proClsCd == 'PC003'){
		    	deleteProjectListHtml += "<div class='badge bg-info my-2'>엔지니어링</div>"	
		    }else if(projectList[i].proClsCd == 'PC004'){
		    	deleteProjectListHtml += "<div class='badge bg-primary my-2'>웹개발</div>"	
		    }else if(projectList[i].proClsCd == 'PC005'){
		    	deleteProjectListHtml += "<div class='badge bg-primary my-2'>앱개발</div>"	
		    }else if(projectList[i].proClsCd == 'PC006'){
		    	deleteProjectListHtml += "<div class='badge bg-secondary my-2'>기타</div>"	
		    }
		    
		    deleteProjectListHtml += "</div>";
		    deleteProjectListHtml += "<div class='card-body px-4 pt-2'>";
		    deleteProjectListHtml += "	<p>"+projectList[i].proDetail+"</p>";
		    deleteProjectListHtml += "	<img src='"+projectList[i].memAttPath+"' class='rounded-circle me-1' alt='Avatar' width='28' height='28'>";
		    deleteProjectListHtml += "</div>";
		    deleteProjectListHtml += "<ul class='list-group list-group-flush'>";
		    deleteProjectListHtml += "	<li class='list-group-item px-4 pb-4'>";
		    deleteProjectListHtml += "		<p class='mb-2 font-weight-bold'>Progress <span class='float-end'>"+projectList[i].proProgress+"%</span></p>";
		    deleteProjectListHtml += "		<div class='progress progress-sm'>";
		    deleteProjectListHtml += "			<div class='progress-bar' role='progressbar' aria-valuenow='"+projectList[i].proProgress+"' aria-valuemin='0' aria-valuemax='100' style='width: "+projectList[i].proProgress+"%;'>";
		    deleteProjectListHtml += "			</div>";
		    deleteProjectListHtml += "		</div>";
		    deleteProjectListHtml += "	</li>";
		    deleteProjectListHtml += "</ul>";
		    deleteProjectListHtml += "<button type='button' data-pro-code='"+projectList[i].proCode+"' class='projectDeleteRecoverBtn btn btn-primary'>삭제 복구하기</button>";
		    deleteProjectListHtml += "	</div>";
		    deleteProjectListHtml += "</div>";
		}
		return deleteProjectListHtml;
	}

	// 프로젝트가 없는 경우 html
	let makeNoProjectHtml = function(){
		let projectHtml = "";
		projectHtml += `
		<div class="col-12 col-md-6 col-lg-3">
			<div class="card">
				<div class="card-body">
					<p>프로젝트가 없습니다.</p>
				</div>
			</div>
		</div>`;
		return projectHtml;
	}
	
	// 전체 프로젝트 목록 ( 삭제된 프로젝트 제외 )
	projectTotalList();
	function projectTotalList(){	
		$.ajax({
			url :"${pageContext.request.contextPath }/project/projectListAll",
			method : "get",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				console.log("관리자 전체프로젝트 : ",resp);

 				proTotalDisp.empty();
				pagingArea.empty();
				console.log(resp);
				let dataList = resp.pagingVO.dataList;
				let trTags = [];
				
				if(dataList){					
					proTotalDisp.html(makeProjectListHtml(dataList));
				}else{
					proTotalDisp.html(makeNoProjectHtml());
				}
				
				if(resp.pagingHTML)
					pagingArea.html(resp.pagingHTML); 
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	};	
	
	// 삭제된 프로젝트 목록
	deleteProjectTotalList();
	function deleteProjectTotalList(){	
		$.ajax({
			url :"${pageContext.request.contextPath }/project/deleteProjectListAll",
			method : "get",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				console.log("삭제된 프로젝트 : ",resp);

				$("#deleteProTotalDisp").empty();
				pagingArea.empty();
				console.log(resp);
				let dataList = resp.pagingVO.dataList;
				let trTags = [];
				
				if(dataList){					
					$("#deleteProTotalDisp").html(makeDeleteProjectListHtml(dataList));
				}else{
					$("#deleteProTotalDisp").html(makeNoProjectHtml());
				}
				
				if(resp.pagingHTML)
					pagingArea.html(resp.pagingHTML); 
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	};	
	
	// 삭제된 프로젝트 복구
	$(document).on("click",".projectDeleteRecoverBtn",function(){
		let proCode = $(this)[0].dataset.proCode;
		Swal.fire({
			   title: '프로젝트 복구 하시겠습니까?',
			   text: '다시 되돌릴 수 없습니다. 신중하세요.',
			   icon: 'warning',
			   
			   showCancelButton: true,
			   confirmButtonColor: '#3085d6',
			   cancelButtonColor: '#d33',
			   confirmButtonText: '수정',
			   cancelButtonText: '취소',
			   reverseButtons: true,
			}).then(result => {
			   if (result.isConfirmed) { 
					let data = {
						"proCode" : proCode
					}
					$.ajax({
						url : "${pageContext.request.contextPath}/project/project/deleteRecover",
						method : "post",
						data : JSON.stringify(data),
						contentType : "application/json;charset=utf-8",
						beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
				            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				        },
						success : function(resp) {
							console.log(resp);
							if(resp=="1"){
								Swal.fire('프로젝트 복구 완료되었습니다.', '화끈하시네요~!', 'success');
								location.reload();
							}else{
								console.log("프로젝트 복구 실패");
							}
						},
						error : function(jqXHR, status, error) {
							console.log(jqXHR);
							console.log(status);
							console.log(error);
						}
					});
			   }
			   else{
				   Swal.fire('', '프로젝트 복구 취소하였습니다.', "failed");
				   return;
			   }
		});
		
	});

	// paging html
	let pagingArea = $(".pagingArea").on("click", "a.paging", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(!page) return false;
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
		return false;
	});

	// 프로젝트 검색 ( 전체 프로젝트 목록 )
	let searchForm = $("#searchForm").on("submit", function(event){
		event.preventDefault();
		
		let method = this.method;
		let queryString = $(this).serialize();
	
		$.ajax({
			
			url : "${pageContext.request.contextPath }/project/projectListAll",
			method : method,
			data : queryString ,
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				console.log("32323",resp);

 				proTotalDisp.empty();
				pagingArea.empty();
				console.log(resp);
				let dataList = resp.pagingVO.dataList;
				let trTags = [];
				
				if(dataList){					
					proTotalDisp.html(makeProjectListHtml(dataList));
				}else{
					proTotalDisp.html(makeNoProjectHtml());
				}
				
				if(resp.pagingHTML)
					pagingArea.html(resp.pagingHTML); 
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		return false;
	});

	// 검색 Form 보내기
	let searchUI = $("#searchUI").on("click", "#searchProjectBtn", function(){
		let inputs = searchUI.find(":input[name]");
		$.each(inputs, function(index, input){
			let name = this.name;
			let value = $(this).val();
			searchForm[0][name].value = value;
		});
		searchForm.submit();
	});
	



</script>