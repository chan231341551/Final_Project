<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>  

      
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<security:authentication property="principal.realMember" var="authMember"/>

<!-- <style>
	.js-load {
		display: none;
	}
	.js-load.active {
		display: table-row;
	}
	.js-load:after {
		display: none;
	}
	.btn-wrap {
		display: block;
	}
</style> -->


<main class="content" style="padding-top:0px;">

	<div class="container-fluid p-0">
	
		<div class="row">
			<!--====================== 작업 상단 바 ======================-->
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<div class="d-flex flex-row justify-content-between">
							<h3>작업목록</h3>
						</div>
						<hr>
						<div class="d-flex flex-column justify-content-between">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb" style="margin:0px;">
									<li class="breadcrumb-item"><a href="#">프로젝트 홈</a></li>
									<li class="breadcrumb-item"><a href="#">작업목록</a></li>
									<li class="breadcrumb-item active">전체 작업</li>
								</ol>
							</nav>
							<div role="tablist" class="d-flex flex-row justify-content-end">
			                     <button id='dropdownMenuButton' class="nav-link dropdown-toggle btn btn-primary" role="button" data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' style="margin-right:1rem;">분류 </button>
			                     <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			                        <a id="proWorkListBtn" class="dropdown-item" data-bs-toggle="tab" href="#tab-1" aria-selected="false" role="tab" tabindex="-1">전체 작업</a>
			                        <a id="proMyWorkListBtn" class="dropdown-item" data-bs-toggle="tab" href="#tab-3" aria-selected="false" role="tab" tabindex="-1">내 작업</a> 
			                     </div>
								<!-- <button id="proWorkListBtn" class="btn btn-primary" data-bs-toggle="tab" href="#tab-1" aria-selected="false" role="tab" tabindex="-1" style="margin-right:1rem;">전체 작업</button> -->
								<!-- <button id="proMyWorkListBtn" class="btn btn-primary" data-bs-toggle="tab" href="#tab-3" aria-selected="false" role="tab" tabindex="-1" style="margin-right:1rem;">내 작업</button> -->
								<button class="btn btn-primary projectWorkInsertBtn" data-bs-toggle="modal" data-bs-target="#projectWorkInsertModal" data-work-no="\${data.workNo}" style="margin-right:1rem;">작업 추가</button>
								<button type="button" class="btn btn-secondary projectWorkDeleteBtn">작업 삭제</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="tab-content">
						<!--====================== 작업 추가 Form ======================-->
						<div class="tab-pane fade" id="tab-2" role="tabpanel">
							<div class="card">
								<div id="projectWorkAddFormHTML" class="card-body"></div>
								<div class="card-footer">
								</div>
							</div>
						</div>
						
						<!--====================== 작업 목록 ======================-->
						<div class="tab-pane fade active show" id="tab-1" role="tabpanel">
							<div class="card">
								<div class="card-body">
									<table class="table table-bordered table-hover">
										<thead class="table-primary">
											<tr style="border-color:none;">
												<th style="width: 5%;">체크</th>
												<th style="width: 3%;"></th>
												<th style="width: 32%;">작업 이름</th>
												<th style="width: 20%;">담당자</th>
												<th style="width: 15%;">진행률</th>
												<th style="width: 5%;">시작날짜</th>
												<th style="width: 5%;">종료날짜</th>
												<th style="width: 7%;">우선순위</th>
												<!-- <th style="width: 8%;">상태</th> -->
											</tr>
										</thead>
										<tbody id="proWorkListDsip"></tbody>
									</table>
									<!-- <button type="button" class="btn btn-primary" id="js-btn-wrap" class="more" style="width:100%;">더보기</button> -->
								</div>
								<div class="card-footer d-flex justify-content-end align-items-center">
									<div>
										<!-- <button type="button" class="btn btn-secondary projectWorkDeleteBtn">삭제하기</button> -->
									</div>
								</div>
							</div>
						</div>
						
						<!--=================== 나에게 배정 된 작업 목록 ===================-->
						<div class="tab-pane fade" id="tab-3" role="tabpanel">
							<div class="card">
								<div class="card-body">
									<table class="table table-bordered table-hover">
										<thead class="table-primary">
											<tr style="border-color:none;">
												<th style="width: 5%;">체크</th>
												<th style="width: 3%;"></th>
												<th style="width: 32%;">작업 이름</th>
												<th style="width: 20%;">담당자</th>
												<th style="width: 15%;">진행률</th>
												<th style="width: 5%;">시작날짜</th>
												<th style="width: 5%;">종료날짜</th>
												<th style="width: 7%;">우선순위</th>
											</tr>
										</thead>
										<tbody id="proMyWorkListDsip"></tbody>
									</table>
								</div>
								<div class="card-footer d-flex justify-content-end align-items-center">
									<div>
										<!-- <button type="button" class="btn btn-secondary projectWorkDeleteBtn">삭제하기</button> -->
									</div>
								</div>
							</div>
						</div>
					
						
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<footer class="footer"></footer>


<script type="text/javascript">


	/**************************** 공통 시작 ****************************/
	let projectWorkMemberSelectBtn = $("#projectWorkMemberSelectBtn");
	let projectWorkMemberAddBtn = $("#projectWorkMemberAddBtn");
	let isWorkMemberRemoveBtn = $(".isWorkMemberRemoveBtn");

	let proWorkListBtn = $("#proWorkListBtn");
	let proMyWorkListBtn = $("#proMyWorkListBtn");
	let projectWorkDetailBtn = $("#projectWorkDetailBtn");
	let projectWorkPntNoSelectBtn = $("#projectWorkPntNoSelectBtn");
	let projectWorkPntNoAddBtn = $("#projectWorkPntNoAddBtn");
	let projectWorkDeleteBtn = $(".projectWorkDeleteBtn");
	let projectWorkUpdateFormBtn = $(".projectWorkUpdateFormBtn");
	let projectWorkUpdateBtn = $(".projectWorkUpdateBtn");
	let projectWorkAddBtn = $("#projectWorkAddBtn");
	
	let proWorkListDsip = $("#proWorkListDsip")
	let projectMemberListDisp = $("#projectMemberListDisp");
	let projectWorkMemberSelectListDisp = $("#projectWorkMemberSelectListDisp");
	let projectWorkSelectDetailDisp = $("#projectWorkSelectDetailDisp");
	let proMyWorkListDsip = $("#proMyWorkListDsip");
	let projectWorkPntNoDisp = $("#projectWorkPntNoDisp");
	let projectWorkPntNoSelectDisp = $("#projectWorkPntNoSelectDisp");
	let isWorkMember = $(".isWorkMember");
	
	let projectWorkDetailForm = $(".projectWorkDetailForm");
	
	// 공통 )
	// 프로젝트 하나 정보 가져오기
	function f_projectSelect(proCode){
		console.log(proCode);
		let result = null;
		$.ajax({
			url : "${pageContext.request.contextPath}/project/project/projectSelect/${project.proCode}",		
			dataType : "json",
			async: false,
	        beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				console.log(resp);
				result = resp;
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		return result;
	}
	
	// 공통 )
	// 더보기 버튼
/* 	$(window).on('load', function () {
		load('#proWorkListDsip', 10);
	 	$("#js-btn-wrap").on("click", function () {
			load('#proWorkListDsip', 3, '#js-btn-wrap');
		})
	});

	function load(id, cnt, btn) {
		// id안에 .js-load 클래수 중에 .active가 붙지 않은것
		var girls_list = id + " .js-load:not(.active)";
		var girls_length = $(girls_list).length;
		var girls_total_cnt;
		console.log("id",girls_list);
		console.log("id",girls_length);
		// 내가 지정한 갯수보다 데이터의 수가 많은 경우
		if (cnt < girls_length) {
			girls_total_cnt = cnt;
		// 내가 지정한 갯수보다 데이터의 수가 적은 경우
		} else {
			girls_total_cnt = girls_length;
			// 버튼을 숨긴다.
			$(btn).hide();
		}
		console.log("id",girls_total_cnt);
		console.log("button",$(btn));
		$(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
	} */
	/**************************** 공통 끝 ****************************/

	
	
	/**************************** 작업 목록  시작 ****************************/
	// 작업 목록 )
	// 프로젝트 목록 리스트 html
	let makeProjectWorkListHtml = function(work, a, projectManagement){
		let projectWorkListHtml = "";
		let progressWidth = 0;
		let myEmail = '${authMember.memEmail}';	
		
			if(a == "A"){
				projectWorkListHtml += "<tr class='js-load'>"			
			}else{
				projectWorkListHtml += "<tr>"					
			}
			projectWorkListHtml += `
				<td>`
				if(work.memEmail == myEmail || projectManagement == myEmail){	
			projectWorkListHtml +="<input class='form-check-input workNoUpCheck' data-work-no='"+work.workNo+"' type='checkbox' value=''>"				
				}
			projectWorkListHtml += `	
					</td>

					<td colspan="2">
						<a class="projectWorkDetailBtn" data-bs-toggle="modal" data-bs-target="#projectWorkDetailModal" data-work-no="\${work.workNo}">
							\${work.workTitle}
						</a>
					</td>
					<td>
			`					
					for (var j = 0; j < work.workChargerList.length; j++) {
						
					 progressWidth = progressWidth + work.workChargerList[j].workProgress;
			projectWorkListHtml += `
					<span>
						<img src="\${work.workChargerList[j].memAttPath}"
							width="48" height="48" class="rounded-circle me-2"
							alt="Avatar">
					</span>
					`
					}
					
			projectWorkListHtml +=`
					</td>
					<td>
						<div class="progress progress-sm">
							<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:\${progressWidth}%;"></div>
						</div>
						<small style="padding-left:0px;">\${progressWidth}%</small>
					</td>
					<td>
						<input type="date" name="workSdate" class="form-control" value="\${work.workSdate}" disabled/>
					</td>
					<td>
						<input type="date" name="workEdate" class="form-control" value="\${work.workEdate}" disabled/>
					</td>
					<td>`
					
					if(work.workOrderCd == "WO001"){
			projectWorkListHtml += "<button class='btn btn-square btn-secondary'>낮음</button>";									
					}else if(work.workOrderCd == "WO002"){
			projectWorkListHtml += "<button class='btn btn-square btn-primary'>보통</button>";									
					}else{
			projectWorkListHtml += "<button class='btn btn-square btn-danger'>높음</button>";
					}
						
			projectWorkListHtml +=`
					</td>
				</tr>
				`;
		
		return projectWorkListHtml;
	}
		
	// 작업 목록 )
	// 프로젝트 목록 리스트 html (상위 작업이 있는 경우)
	let makeProjectWorkFntNoListHtml = function(workList, b, projectManagement){
		let projectWorkFntNoListHtml = "";
		let myEmail = '${authMember.memEmail}';	
		
		let progressWidth = 0;
		for (var i = 0; i < workList.length; i++) {
			if(b == "B"){
				projectWorkFntNoListHtml += "<tr>"					
			}else{
				projectWorkFntNoListHtml += "<tr class='js-load'>"			
			}
			projectWorkFntNoListHtml += `
					<td>`
				if(workList[i].memEmail == myEmail || projectManagement == myEmail){	
			projectWorkFntNoListHtml +="<input class='form-check-input workNoDownCheck' data-work-no='"+workList[i].workNo+"' type='checkbox' value=''>"						
				}
			projectWorkFntNoListHtml += `
					</td>
					<td style="background-color:#f8f9fa;">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-corner-down-right align-middler"><polyline points="15 10 20 15 15 20"></polyline><path d="M4 4v7a4 4 0 0 0 4 4h12"></path></svg>
					</td>
					<td>
						<a class="projectWorkDetailBtn" data-bs-toggle="modal" data-bs-target="#projectWorkDetailModal" data-work-no="\${workList[i].workNo}">
							\${workList[i].workTitle}
						</a>
					</td>
					<td>
					`;
					
					for (var j = 0; j < workList[i].workChargerList.length; j++) {
					progressWidth = progressWidth + workList[i].workChargerList[j].workProgress;
			projectWorkFntNoListHtml += `
					<sapn>
						<img src="\${workList[i].workChargerList[j].memAttPath}"
						width="48" height="48" class="rounded-circle me-2"
						alt="Avatar">
					</span>`
					}
					
			let progressWidthBox = progressWidth;
			progressWidth = 0;
			projectWorkFntNoListHtml +=`
					</td>
					<td>
						<div class="progress progress-sm">
							<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:\${progressWidthBox/workList[i].workChargerList.length}%;"></div>
						</div>
						<small style="padding-left:0px;">\${progressWidthBox/workList[i].workChargerList.length}%</small>
					</td>
					<td>
						<input type="date" name="workSdate" class="form-control" value="\${workList[i].workSdate}" disabled/>
					</td>
					<td>
						<input type="date" name="workEdate" class="form-control" value="\${workList[i].workEdate}" disabled/>
					</td>
					<td>`
					
					if(workList[i].workOrderCd == "WO001"){
			projectWorkFntNoListHtml += "<button class='btn btn-square btn-secondary'>낮음</button>";									
					}else if(workList[i].workOrderCd == "WO002"){
			projectWorkFntNoListHtml += "<button class='btn btn-square btn-primary'>보통</button>";									
					}else{
			projectWorkFntNoListHtml += "<button class='btn btn-square btn-danger'>높음</button>";
					}
						
			projectWorkFntNoListHtml +=`
					</td>
				</tr>
				`
				
			}
		
		return projectWorkFntNoListHtml;
	}
	
	// 작업 목록 )
	// 프로젝트 작업 목록 가져오기, 내 작업 목록 가져오기, 처음에 보여주기
	projectWorkListUIData();
	projectMyWorkListUIData();
	
	// 작업 목록 )
	// 프로젝트 작업 목록 버튼 클릭 시 작업 리스트 가져오기
 	proWorkListBtn.on("click", function(){
 		$(".breadcrumb-item.active").text("전체 작업");
	});
	
 	proMyWorkListBtn.on("click", function(){
 		$("#tab-1").removeClass("active show");
 		$(".breadcrumb-item.active").text("내 작업");
		projectMyWorkListUIData();
	});
	
	// 작업 목록 )
	// 작업 없는 경우 html
	let makeNoWorkHtml = function(){
		let workHtml = "";
		workHtml += `
			<tr>
				<td colspan="8">
					작업이 없습니다.
				</td>
			</tr>`;
		return workHtml;
	}
	
	// 작업 목록 )
	// 프로젝트 전체 작업 목록 가져오는 함수
	function projectWorkListUIData(){
		$.ajax({
			url : "${pageContext.request.contextPath}/project/project/workListView/${project.proCode}",
			method : "get",
			dataType : "json",
	        beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				console.log("작업목록 : ",resp);
				if(resp.length <= 10){
					$("#js-btn-wrap").css('display','none');
				}
				if(resp.length == 0){
					proWorkListDsip.html(makeNoWorkHtml);
					return;
				}
				
				// 현재 프로젝트 관리자 Email 가져오기
				let projectDetail = f_projectSelect(resp[0].proCode);
				let projectManagement = projectDetail.memEmail;
				resp['projectManagement'] = projectManagement;
				console.log("insosososo",resp);
				proWorkListDsip.empty();
				let trTags = [];
				for(var i=0; i<resp.length; i++){
					let isWorkPntNo = [];
					console.log("no",resp[i].workNo);
					if(resp[i].workPntNo==0){
						trTags.push(makeProjectWorkListHtml(resp[i],"A", projectManagement));
					}					
					for(var j=0; j<resp.length; j++){
						if(resp[i].workNo==resp[j].workPntNo){		
							isWorkPntNo.push(resp[j]);
						}
					}
					console.log("isWorkPntNo",isWorkPntNo);
					trTags.push(makeProjectWorkFntNoListHtml(isWorkPntNo,"A", projectManagement));
					
				}
				proWorkListDsip.html(trTags);

			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}
	
	// 작업 목록 )
	// 프로젝트 나에게 담당된 작업 목록
	function projectMyWorkListUIData(){

		let data = {
				"memEmail" : "${authMember.memEmail }",
				"proCode" : "${project.proCode}"
		}
		$.ajax({
			url : "${pageContext.request.contextPath}/project/project/myWorkListView",
			method : "post",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			dataType : "json",
	         beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
			success : function(resp) {
				proMyWorkListDsip.empty();
				console.log("myWork",resp);

				if(resp.length == 0){
					proMyWorkListDsip.html(makeNoWorkHtml);
					return;
				}
				
				let trTags = [];
				for(var i=0; i<resp.length; i++){
					let isWorkPntNo = [];
					console.log("no",resp[i].workNo);
					if(resp[i].workPntNo==0){
						trTags.push(makeProjectWorkListHtml(resp[i],"B"));
					}					
					for(var j=0; j<resp.length; j++){
						if(resp[i].workNo==resp[j].workPntNo){		
							isWorkPntNo.push(resp[j]);
						}
					}
					trTags.push(makeProjectWorkFntNoListHtml(isWorkPntNo,"B"));
				}
				proMyWorkListDsip.html(trTags);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		console.log(data);
	};
	
	// 작업 목록 )
	// 작업 삭제
	projectWorkDeleteBtn.on('click', function(){
		Swal.fire({
		   title: '삭제 하시겠습니까?',
		   text: '',
		   icon: 'warning',
		   
		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		   confirmButtonText: '승인', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		   
		   reverseButtons: false, // 버튼 순서 거꾸로
		   
		}).then(result => {
		   // 만약 Promise리턴을 받으면,
		   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
			   
			    let workNoUpListData = []; 
				let workNoDownListData = []; 
				let workNoDownListDataObject = new Object();
				let inputUpTags = $(".workNoUpCheck").find("input").prevObject;
				let inputDownTags = $(".workNoDownCheck").find("input").prevObject;
				
			 	for(var i=0; i<inputUpTags.length; i++){
					if(inputUpTags[i].checked){
						workNoUpListData.push(inputUpTags[i].dataset.workNo);
					}
				}
				for(var i=0; i<inputDownTags.length; i++){
					if(inputDownTags[i].checked){
						let is_existed = Object.keys(workNoDownListDataObject).includes(inputDownTags[i].dataset.workPntNo);	
						if(!is_existed){
							workNoDownListData = [];
						}
						workNoDownListData.push(inputDownTags[i].dataset.workNo);
						workNoDownListDataObject[inputDownTags[i].dataset.workPntNo] = workNoDownListData;
					}
				}
				for(var i=0; i<workNoUpListData.length; i++){
					if(Object.keys(workNoDownListDataObject).includes(workNoUpListData[i])){
						delete workNoDownListDataObject[workNoUpListData[i]];
					}
				}
				
				let lastWorkNoList = Object.values(workNoDownListDataObject);
				let lastWorkUpListObject = new Object();
				
				console.log("하위작업",lastWorkNoList);
				console.log("상위작업",workNoUpListData);
				console.log("",workNoDownListDataObject);
				
				lastWorkUpListObject
				
				let workVOList = [];
				let upWorkVOList = [];

		 		for(var i=0; i<lastWorkNoList.length; i++){
		 			for(var j=0; j<lastWorkNoList[i].length; j++){
			 			let data = {
								"workNo" : lastWorkNoList[i][j]
							};
			 			workVOList.push(data);
		 			}
				}
		 		
		 		for(var i=0; i<workNoUpListData.length; i++){
		 			let data = {
		 					"workNo" : workNoUpListData[i]
		 			};
		 			upWorkVOList.push(data);
		 		}
		 		
		 		console.log("upWorkVOList",upWorkVOList);
		 		console.log("마지막",workVOList)
		 		
		 		sessionStorage.setItem("upWorkVOList",upWorkVOList);
		 		
		 		let workDownResultDataList = projectWorkDownList(upWorkVOList);
		 		for(var i=0; i<workDownResultDataList.length; i++){
		 			for(var j=0; j<workDownResultDataList[i].length; j++){
		 				workVOList.push(workDownResultDataList[i][j]);
		 			}
		 		}
		 		
		 		$.ajax({
					url : "${pageContext.request.contextPath}/project/project/workDelete",
					method : "post",
					data : JSON.stringify(workVOList),
					async: false,
					contentType : "application/json;charset=utf-8",
					dataType : "json",
			         beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			            },
					success : function(resp) {
						console.log("성공",resp);
						console.log(JSON.parse(sessionStorage.getItem("workVOList")));
						
				 		if(upWorkVOList!=null){
				 	 		$.ajax({
				 				url : "${pageContext.request.contextPath}/project/project/workDelete",
				 				method : "post",
				 				data : JSON.stringify(upWorkVOList),
				 				async: false,
				 				contentType : "application/json;charset=utf-8",
				 				dataType : "json",
				 		         beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
				 	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				 	            },
				 				success : function(resp) {
									console.log(resp);
				 				},
				 				error : function(jqXHR, status, error) {
				 					console.log(jqXHR);
				 					console.log(status);
				 					console.log(error);
				 				}
				 			});
				 		}
				 		
						projectWorkListUIData();
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				});		
			   
		       Swal.fire('삭제 완료되었습니다.', '', 'success');
		   }
		   else{
			   Swal.fire('', '삭제 취소하였습니다.', "failed");
			   return;
		   }
		});
	});
	
	// 작업 목록 )
	// 현재 작업의 하위작업 목록 데이터 가져다줌
	function projectWorkDownList(workUpList){
		console.log("hi");
		console.log(workUpList);
		let resultData;
		$.ajax({
			url : "${pageContext.request.contextPath}/project/project/workDownList",
			method : "post",
			data : JSON.stringify(workUpList),
			async: false,
			contentType : "application/json;charset=utf-8;",
			dataType : "json",
	         beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
			success : function(resp) {
				console.log(resp);
				resultData = resp;
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		return resultData;
	}
	
	// 작업 목록 )
	// 작업 수정폼 버튼 클릭 시
	$(document).on("click", ".projectWorkUpdateFormBtn", function(){
		let formFind = $(this).parent().siblings().find("form");
		let find23 = formFind.find("input[name='workNo']");
		if($(".workUpdateReadonlyOn").attr('readonly') == undefined){
			$(".workUpdateReadonlyOn").attr("readonly",true); 
		}else{
			$(".workUpdateReadonlyOn").removeAttr("readonly"); 
		}
	});
	
	// 작업 목록 )
	// 작업 수정 버튼 클릭 시
	$(document).on("click", ".projectWorkUpdateBtn", function(){
		Swal.fire({
		   title: '작업 수정 하시겠습니까?',
		   text: '',
		   icon: 'warning',
		   
		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		   confirmButtonText: '승인', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		   
		   reverseButtons: false, // 버튼 순서 거꾸로
		   
		}).then(result => {
		   // 만약 Promise리턴을 받으면,
		   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
			   
			   let data = new Object();
				let cnt = 0;
				const formData2 = new FormData($(".projectWorkDetailForm")[0]);
				let entries = formData2.entries();
				for (const pair of entries) {
				    console.log(pair[0]+ ', ' + pair[1]); 
				}
				let dataObject = {};
				data = fn_seri(document.forms[1]);
				console.log("Data2",data);
				let workNoData = data.workNo;
				let workProgressList = data.workChargerListProgress;
				let workProgressMemEmail = data.workChargerListMemEmail;
				delete data.workChargerListProgress;
				delete data.workChargerListMemEmail;
				
				let workChargerList = [];
				for(let i=0; i<workProgressMemEmail.length; i++){
					let workChargerData = {};
					workChargerData['workNo'] = workNoData;
					workChargerData['memEmail'] = workProgressMemEmail[i];
					workChargerData['workProgress'] = workProgressList[i];
					workChargerList.push(workChargerData);
				}
				data['workChargerList'] = workChargerList;
				
				console.log("수정폼 data : ",data);
				
		 		$.ajax({
					url : "${pageContext.request.contextPath}/project/project/workUpdate",
					method : "post",
					data : JSON.stringify(data),
					contentType : "application/json;charset=utf-8;",
			         beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			            },
					success : function(resp) {
						console.log(resp);
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				});  
			   
		       Swal.fire('작업 수정 완료되었습니다.', '', 'success');
		      
		   }
		   else{
			   Swal.fire('', '작업 수정 취소하였습니다.', "failed");
			   return;
		   }
		});	
	});
	/**************************** 작업 목록 끝 ****************************/

</script>


