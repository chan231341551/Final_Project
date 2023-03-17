<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<security:authentication property="principal.realMember" var="authMember"/>

<main class="content" style="padding-top:0px;">

	<div class="container-fluid p-0">
	
		<div class="row">
			<!--====================== 칸반보드 상단 바 ======================-->
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<div class="d-flex flex-column justify-content-between">
							<h3>프로젝트 관리</h3>
						</div>
						<hr>
						<div class="d-flex flex-column justify-content-between">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb" style="margin:0px;">
									<li class="breadcrumb-item"><a href="#">프로젝트 홈</a></li>
									<li class="breadcrumb-item">프로젝트 관리</li>
								</ol>
							</nav>
							<div role="tablist" class="d-flex flex-row justify-content-end">							
								<div class="list-group list-group-flush d-flex flex-row justify-content-end" role="tablist">
	
									<button class="btn btn-primary projectNoticeInsertBtn" data-bs-toggle="modal" data-bs-target="#projectNoticeInsertModal" data-work-no="\${data.workNo}" style="margin-right:1rem;">
										공지 글쓰기
									</button>
									
									<button class="btn btn-primary active" id="proSettingBtn" data-proCode="${project.proCode }" data-bs-toggle="list" href="#tab-1" role="tab" aria-selected="true" style="margin-right:1rem;">
										프로젝트 관리
									</button>
									<button class="btn btn-primary" id="memManagementBtn" data-proCode="${project.proCode }" data-bs-toggle="list" href="#tab-2" role="tab" aria-selected="false" tabindex="-1" style="margin-right:1rem;">
										멤버 관리
									</button>
									<button type="button" class="btn btn-secondary" id="projectDeleteBtn">프로젝트 삭제</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	
	
	
		<!--====================== 왼쪽 컨텐츠 ======================-->
		<div class="col-12">
			<div class="tab-content">
			
				<!--====================== 프로젝트 관리 ======================-->
				<div class="tab-pane fade active show" id="tab-1" role="tabpanel">
					<div class="card">
						<!-- <div id="proSettingDisp"></div> -->
						
						<div class="card-header">
							<h5 class="card-title mb-0">프로젝트 정보</h5>
						</div>
						<div class="card-body">
							<div class="row">
							
								<div class="col-md-5 col-xl-5">
									<div class="card" style="position: relative; left: 0; top: 0;">
										<!-- src="/resources/images/pms/800.png" -->
										<img id="proImgTag" src="" class="card-img-top" alt="ProjectImg">
										<form id="proImgForm">
											<input type="hidden" name="proCode" value="${project.proCode }"/>
											<input type="file" id="proImgUpload" name="files" onChange="proImgTransmit();" style="display:none;" multiple="multiple" accept="image/*"/>
											<security:csrfInput/>
										</form>
										<button type="button" class="btn btn-primary" onclick="proUploadBtn();">사진 변경</button>
										<div class="card-header px-4 pt-4">
											<h5 id="cardProTitle" class="card-title mb-0"></h5>
											<div class="badge bg-warning my-2">웹개발</div>
										</div>
										<div class="card-body px-4 pt-2">
											<p id="cardProDetail"></p>
											<img src="/resources/images/pms/200.png" class="rounded-circle me-1" alt="Avatar" width="28" height="28">
										</div>
										<ul class="list-group list-group-flush">
											<li class="list-group-item px-4 pb-4">
												<p class="mb-2 font-weight-bold">Progress <span class="float-end" id="cardProProgress"></span></p>
												<div class="progress progress-sm">
													<div id="cardProProgressWith" class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
												</div>
											</li>
										</ul>
									</div>
								</div>

								<div class="col-md-7 col-xl-7">
									<!-- 공지사항 -->
									<div class="alert alert-primary alert-outline-coloured alert-dismissible" role="alert">
										<button type="button" class="btn-close" id="homeProjectNoticeDeleteBtn" aria-label="삭제"></button>
										<div id="homeProjectNotice" class="alert-message">
										</div>
									</div>
									<!--=========== 프로젝트 Detail Form  ==========-->
									<form>
										<table class="table table-bordered">
											<tr>
												<th>프로젝트 번호</th>
												<td>
													<input type="text" id="proCode" name="proCode" Class="form-control" value="" readonly="readonly"/>
												</td>
											</tr>
											<tr>
												<th>프로젝트 관리자</th>
												<td>
													<input type="text" id="proMemEmail" name="memEmail" Class="form-control" value="" readonly="readonly"/>
												</td>
											</tr>
											<tr>
												<th>프로젝트 제목</th>
												<td>
													<input type="text" id="proTitle" name="proTitle" Class="form-control" value="" readonly="readonly"/>
												</td>
											</tr>
											<tr>
												<th>프로젝트 분류</th>
												<td>
													<select id="proClsCd" name="proClsCd" class="form-control" disabled>
														<option value="PC001">디자인</option>
														<option value="PC002">마케팅</option>
														<option value="PC003">엔지니어링</option>
														<option value="PC004">웹개발</option>
														<option value="PC005">앱개발</option>
														<option value="PC006">기타</option>
													</select>
												</td>
											</tr>
											<tr>
												<th>프로젝트 진행률</th>
												<td>
													<select name="proProgress" id="proProgress" class="form-control" disabled>
														<option value="0">0%</option>
														<option value="10">10%</option>
														<option value="20">20%</option>
														<option value="30">30%</option>
														<option value="40">40%</option>
														<option value="50">50%</option>
														<option value="60">60%</option>
														<option value="70">70%</option>
														<option value="80">80%</option>
														<option value="90">90%</option>
														<option value="100">100%</option>
													</select>
												</td>
											</tr>
											<tr>
												<th>프로젝트 내용</th>
												<td>
													<input type="text" id="proDetail" name="proDetail" Class="form-control" value="" disabled/>
												</td>
											</tr>
											
											<tr>
												<th>프로젝트 생성 날짜</th>
												<td>
													<input type="date" id="proCdate" name="proCdate" value="" class="form-control" disabled/>
												</td>
											</tr>	
											<tr>
												<th>프로젝트 시작 날짜</th>
												<td>
													<input type="date" id="proSdate" name="proSdate" value="" class="form-control" disabled/>
												</td>
											</tr>	
											<tr>
												<th>프로젝트 종료 날짜</th>
												<td>
													<input type="date" id="proEdate" name="proEdate" value="" class="form-control" disabled/>
												</td>
											</tr>
											<tr>
												<th>프로젝트 상태</th>
												<td>
													<select id="proEndYn" name="proEndYn" class="form-control" disabled>
														<option value="N">진행중</option>
														<option value="Y">종료</option>
													</select>
												</td>
											</tr>
										</table>
										<security:csrfInput/>
									</form>
								</div>
							</div>
						</div>
						
						<div class="card-footer d-flex justify-content-end align-items-center">
							<div>
								<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#projectUpdateModal">수정하기</button>
							</div>
						</div>
					</div>
				</div>
					
					
					
				<!--====================== 멤버 관리 ======================-->
				<div class="tab-pane fade active fade" id="tab-2" role="tabpanel">
					<!-- 프로젝트 참여 멤버 -->
					<div class="card">
						<div class="card-header">
							<h2 class="card-title mb-0">프로젝트 팀원 목록</h2>
						</div>
						<div class="card-body" id="memManagementDisp1"></div>
						<!-- 멤버 초대하기 버튼 -->
						<div class="card-footer d-flex justify-content-between align-items-center">
							<div>
	                        	<input type="checkbox" class="selectAllBtn">
	                        	<label for="selectAll">전체선택</label>
	                        </div>
							<div>
								<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#participateModal">초대하기</button>
								<button type="button" class="btn btn-secondary participateCancelBtn">추방하기</button>
							</div>
						</div>
					</div>
				
					<!-- 초대 요청 보낸 멤버 -->
					<div class="card">
						<div class="card-header">
							<h2 class="card-title mb-0">초대 응답 대기 멤버</h2>
						</div>
						<div class="card-body" id="memManagementDisp0"></div>
						<div class="card-footer d-flex justify-content-between align-items-center">
							<div>
		                        <input type="checkbox" class="selectAllBtn">
		                        <label for="selectAll">전체선택</label>
							</div>
	                        <div>
		                        <button type="button" class="btn btn-secondary participateCancelBtn">초대 취소하기</button>
		                	</div>
	                    </div>
					</div>
					
					<!-- 초대 거절한 멤버 -->
					<div class="card">
						<div class="card-header">
							<h2 class="card-title mb-0">초대 거절 멤버</h2>
						</div>
						<div class="card-body" id="memManagementDisp2"></div>
						<div class="card-footer d-flex justify-content-between align-items-center">
							<div>
	                        	<input type="checkbox" class="selectAllBtn">
		                        <label for="selectAll">전체선택</label>
	                        </div>
	                    
	                        <div>
	                        	<button type="button" class="btn btn-primary" id="participateAgain">다시 초대하기</button>
	                        	<button type="button" class="btn btn-secondary participateCancelBtn">초대 취소하기</button>
	                        </div>
	                    </div>
					</div>
					
				</div>
			</div>
		</div>
	</div>

	<!--====================== 프로젝트 공지 추가 Form 모달창 ======================-->
	<div class="modal fade" id="projectNoticeInsertModal" tabindex="-1" style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
			<div class="modal-content" id="projectWorkSelectDetailDisp">
				<div class="modal-header">
					<h5 class="modal-title">공지 작성하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body row">
					<div class="col-md-12 col-xl-12">
						<!--=========== 프로젝트 공지 Form  ==========-->
						<form id="projectNoticeForm">
							<table class="table table-bordered">
								<tr>
									<th>
										공지사항
									</th>
									<td>
										<textarea type="text" name="newsTitle" Class="form-control"  rows="2"></textarea>
										<input type="hidden" name="proCode" Class="form-control" value="${project.proCode }" />
									</td>
								</tr>	
								<tr>
									<th>
										작성자
									</th>
									<td>
										<span style="padding:8px;">관리자(${authMember.memEmail })</span><input type="hidden" name="memEmail" Class="form-control" value="${authMember.memEmail }" />
									</td>
								</tr>
							</table>
							<div class="d-flex justify-content-end">
								<a id="projectNoticeAddBtn" class="btn btn-primary">공지 등록</a>
							</div>
							<security:csrfInput/>
						</form>
					</div>
	
				</div>
				<div class="modal-footer d-flex justify-content-end align-items-center">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	
	<!--==================== 모달 창 ( 프로젝트 수정하기 Form ) ====================-->
	<div class="modal fade" id="projectUpdateModal" tabindex="-1" style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">작업 자세히보기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body row">
					<div class="col-md-12 col-xl-12">
						<!--=========== 프로젝트수정 Form  ==========-->
						<form id="projectUpdateForm">
							<table class="table table-bordered">
								<tr>
									<th>프로젝트 번호</th>
									<td>
										<input type="text" id="ModalProCode" name="proCode" Class="form-control" value="" readonly="readonly"/>
									</td>
								</tr>
								<tr>
									<th>프로젝트 관리자</th>
									<td>
										<input type="text" id="ModalProMemEmail" name="memEmail" Class="form-control" value="" readonly="readonly"/>
									</td>
								</tr>
								<tr>
									<th>프로젝트 제목</th>
									<td>
										<input type="text" id="ModalProTitle" name="proTitle" Class="form-control" value=""/>
									</td>
								</tr>
								<tr>
									<th>프로젝트 분류</th>
									<td>
										<select id="ModalProClsCd" name="proClsCd" class="form-control">
											<option value="PC001">디자인</option>
											<option value="PC002">마케팅</option>
											<option value="PC003">엔지니어링</option>
											<option value="PC004">웹개발</option>
											<option value="PC005">앱개발</option>
											<option value="PC006">기타</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>프로젝트 진행률</th>
									<td>
										<select name="proProgress" id="ModalProProgress" class="form-control">
											<option value="0">0%</option>
											<option value="10">10%</option>
											<option value="20">20%</option>
											<option value="30">30%</option>
											<option value="40">40%</option>
											<option value="50">50%</option>
											<option value="60">60%</option>
											<option value="70">70%</option>
											<option value="80">80%</option>
											<option value="90">90%</option>
											<option value="100">100%</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>프로젝트 내용</th>
									<td>
										<input type="text" id="ModalProDetail" name="proDetail" Class="form-control" value=""/>
									</td>
								</tr>
								
								<tr>
									<th>프로젝트 생성 날짜</th>
									<td>
										<input type="date" id="ModalProCdate" name="proCdate" value="" class="form-control" disabled/>
									</td>
								</tr>	
								<tr>
									<th>프로젝트 시작 날짜</th>
									<td>
										<input type="date" id="ModalProSdate" name="proSdate" value="" class="form-control"/>
									</td>
								</tr>	
								<tr>
									<th>프로젝트 종료 날짜</th>
									<td>
										<input type="date" id="ModalProEdate" name="proEdate" value="" class="form-control"/>
									</td>
								</tr>
								<tr>
									<th>프로젝트 상태</th>
									<td>
										<select id="ModalProEndYn" name="proEndYn" class="form-control">
											<option value="N">진행중</option>
											<option value="Y">종료</option>
										</select>
									</td>
								</tr>
							</table>
							<security:csrfInput/>
						</form>
						<div class="modal-footer d-flex justify-content-end align-items-center">
							<button type="button" class="btn btn-primary" id="projectUpdateBtn">저장하기</button>
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<!--====================== 모달 창 ( 프로젝트 멤버 초대 ) ======================-->
	<div class="modal fade" id="participateModal" tabindex="-1" style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form id="projectParticipateForm">
					<div class="modal-header">
						<h5 class="modal-title">프로젝트 멤버 초대</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body m-3">
						<div class="mb-3">
							<label class="form-label">회원 Email</label> 
							<input type="text" class="form-control md-3" id="alarmMem" name="memEmail" value="">
							<input type="hidden" value="${project.proCode }" name="proCode">
						</div>
						<div class="mb-3">
							<label class="form-label">직책</label>
							<select name="proRoleCd" class="form-control">
								<option value="PR003" selected="">팀원</option>
								<option value="PR002">팀장</option>
							</select>
						</div>
					</div>
					<div class="modal-footer">
						<button id="projectParticipateBtn" type="button" class="btn btn-primary alarmSend" data-bs-dismiss="modal">초대하기</button>
						<button type="button" class="btn btn-secondary participateCancelBtn" data-bs-dismiss="modal">취소</button>
					</div>
					<security:csrfInput/>
				</form>
				<input type="hidden" id="alarmCd" value="AC001">
			</div>
		</div>
	</div>


</main>

<footer class="footer"> </footer>

<script type="text/javascript">
	let proSettingBtn = $("#proSettingBtn");
	let memManagementBtn = $("#memManagementBtn");
	/* let projectUpdateBtn = $("#projectUpdateBtn"); */
	let participateCancelBtn = $(".participateCancelBtn")
	let selectAllBtn = $(".selectAllBtn"); 
	let participateAgain = $("#participateAgain");
	
	let proSettingDisp = $("#proSettingDisp");
	let memManagementDisp0 = $("#memManagementDisp0");
	let memManagementDisp1 = $("#memManagementDisp1");
	let memManagementDisp2 = $("#memManagementDisp2");
	
	/**************************** 프로젝트 관리 시작 ****************************/
	projectSelectData();
	
	// 프로젝트 관리 )
	// 프로젝트 프로필 업로드
	function proUploadBtn(){
		$("#proImgUpload").click();
	}
	function proImgTransmit(){
		let formData = new FormData($("#proImgForm")[0]);
		$.ajax({
	          url : "${pageContext.request.contextPath }/project/project/proImgUpload"
	        , method : "POST"
	        , processData : false
	        , contentType : false
	        , data : formData
        	, beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        }
	        , success:function(resp) {
	            console.log("프로필 등록 성공 1 = ",resp);
	            
	            if(resp==0) return;
	            Swal.fire('사진 변경이 완료되었습니다.', '화끈하시네요~!', 'success');
 	            let file = formData.get("files");
	            let url = URL.createObjectURL(file);
	            $("#proImgTag").attr("src",url);
	        }
	    	, error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
	    });
	}
	
	// 프로젝트 관리 )
	// 프로젝트 Form에 원래 값 넣기
	function projectSelectData(){
		$.ajax({
			url : "${pageContext.request.contextPath}/project/project/projectSelect/${project.proCode}",
			method : "get",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				console.log(resp);
				// 프로젝트 정보 폼
				$("#proCode").val(resp.proCode);
				$("#proMemEmail").val(resp.memEmail);
				$("#proTitle").val(resp.proTitle);
				$("#proCdate").val(resp.proCdate);
				$("#proSdate").val(resp.proSdate);
				$("#proEdate").val(resp.proEdate);
				$("#proDetail").val(resp.proDetail);
				$("#proEndYn").val(resp.proEndYn);
				
				$("#cardProTitle").text(resp.proTitle);
				$("#proImgTag").attr("src", resp.proAttPath);
				$("#cardProDetail").text(resp.proDetail);
				$("#cardProProgress").text(resp.proProgress);
				$("#cardProProgressWith").css('width',resp.proProgress+'%');
				$("#proClsCd").val(resp.proClsCd).attr('selected','selected');
				$("#proProgress").val(resp.proProgress).attr('selected','selected');
				$("#proEndYn").val(resp.proEndYn).attr('selected','selected');
				
				// 프로젝트 수정 폼
				$("#ModalProCode").val(resp.proCode);
				$("#ModalProMemEmail").val(resp.memEmail);
				$("#ModalProTitle").val(resp.proTitle);
				$("#ModalProCdate").val(resp.proCdate);
				$("#ModalProSdate").val(resp.proSdate);
				$("#ModalProEdate").val(resp.proEdate);
				$("#ModalProDetail").val(resp.proDetail);
				$("#ModalProEndYn").val(resp.proEndYn);

				$("#ModalProClsCd").val(resp.proClsCd).attr('selected','selected');
				$("#ModalProProgress").val(resp.proProgress).attr('selected','selected');
				$("#ModalProEndYn").val(resp.proEndYn).attr('selected','selected');
				console.log("Resp",resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}
	
	// 프로젝트 관리 )
	// 프로젝트 수정하기 
	$("#projectUpdateBtn").on("click",function(event){
		Swal.fire({
			   title: '프로젝트 수정 하시겠습니까?',
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
			   
					let data =  $("#projectUpdateForm").serialize();
					console.log(data);
					
					$.ajax({
						url : "${pageContext.request.contextPath }/project/projectUpdate",
						method : "post",
						data : data,
						beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
				            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				        },
						success : function(resp) {
							console.log(resp);
							if(resp=="1"){
								Swal.fire('작업 등록 완료되었습니다.', '화끈하시네요~!', 'success');
								location.reload();
							}else{
								console.log("프로젝트 수정 실패");
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
				   Swal.fire('', '프로젝트 수정 취소하였습니다.', "failed");
				   return;
			   }
		});
	});
	
	
	// 프로젝트 관리 )
	// 프로젝트 삭제
	$("#projectDeleteBtn").on("click",function(){
		f_ProjectDelete();
	});
	
	function f_ProjectDelete(){
		
		Swal.fire({
			   title: '프로젝트 수정 하시겠습니까?',
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
							"proCode" : "${project.proCode}"
						}
						
					$.ajax({
						url : "${pageContext.request.contextPath}/project/project/delete",
						method : "post",
						data : JSON.stringify(data),
						contentType : "application/json;charset=utf-8",
						beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
				            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				        },
						success : function(resp) {
							console.log(resp);
							if(resp=="1"){
								Swal.fire('프로젝트 삭제 완료되었습니다.', '화끈하시네요~!', 'success');
								location.href = "${pageContext.request.contextPath}/project/myProject";
							}else{
								console.log("프로젝트 삭제 실패");
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
				   Swal.fire('', '프로젝트 수정 취소하였습니다.', "failed");
				   return;
			   }
		});
	}
	
	// 프로젝트 관리 )
	// 공지 등록
    $("#projectNoticeAddBtn").on("click", function(){
         
    	Swal.fire({
			   title: '공지 등록 하시겠습니까?',
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
			         let news = fn_seri($("#projectNoticeForm")[0]);
			          $.ajax({
			          url : "${pageContext.request.contextPath }/project/project/noticeInsert",
			          type : "post",
			          data : JSON.stringify(news),
			          dataType : "json",
			          contentType:"application/json;charset=utf-8",
			          beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
				            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				        },
			          success : function(resp) {
							console.log("notice",resp);
							Swal.fire('공지 등록이 완료되었습니다.', '화끈하시네요~!', 'success');
							location.reload();
			          },
			          error : function(jqXHR, status, error) {
			             console.log(jqXHR);
			             console.log(status);
			             console.log(error);
			          }
			       });
			   }
			   else{
				   Swal.fire('', '공지 등록 취소하였습니다.', "failed");
				   return;
			   }
		});
    });
	
    // 프로젝트 관리 )
    // 공지 리스트
    projectHomeNotice();
    function projectHomeNotice(){
    	let data = {
    			"proCode" : '${project.proCode}'
    	}
    	$.ajax({
    		url : "${pageContext.request.contextPath }/project/project/noticeList",
    		method : "post",
    		data : JSON.stringify(data),
    		contentType : "application/json;charset=utf-8",
    		dataType : "json",
    		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
    		success : function(resp) {
    			let noticeHtml = "";
    			if(resp.length>0){
    				noticeHtml += `
    					<strong>공지 : </strong> \${resp[0].newsTitle}
    					<input type="hidden" id="homeProNoticeNo" value="\${resp[0].newsNo}" />
    				`;
    				$("#homeProjectNotice").html(noticeHtml);
    				let newsNo = resp[0].newsNo;
    			}else{
    				noticeHtml += `
    					<strong>공지 : </strong> 공지사항이 없습니다. 
    				`;
    				$("#homeProjectNotice").html(noticeHtml);
    			}
    		},
    		error : function(jqXHR, status, error) {
    			console.log(jqXHR);
    			console.log(status);
    			console.log(error);
    		}
    	});
    }
    
    // 프로젝트 관리 )
    // 공지삭제
    $("#homeProjectNoticeDeleteBtn").on("click", function(){
    	Swal.fire({
    		   title: '공지 삭제 하시겠습니까?',
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
    				let newsNo = $("#homeProNoticeNo").val();
    				let data = {
    						"newsNo" : newsNo
    				}
    			 	$.ajax({
    					url : "${pageContext.request.contextPath }/project/project/deleteNotice",
    					method : "post",
    					data : JSON.stringify(data),
    					contentType : "application/json;charset=utf-8",
    					dataType : "json",
    					beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
    			            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    			        },
    					success : function(resp) {
    						console.log(resp);
    						if(resp>0){
    							Swal.fire('공지사항 삭제 완료했습니다.', '화끈하시네요~!', 'success');
    						}
    						projectHomeNotice();
    					},
    					error : function(jqXHR, status, error) {
    						console.log(jqXHR);
    						console.log(status);
    						console.log(error);
    					}
    				});
    		   }
    		   else{
    			   Swal.fire('', '공지 삭제 취소하였습니다.', "failed");
    			   return;
    		   }
    	});

    });


	
	/**************************** 프로젝트 관리 끝 ****************************/
	
	
	/***************************** 멤버관리 시작 *****************************/
	// 멤버관리 )
	// 멤버 관리 HTML 
	let makeMemManagementHtml = function(memberList){
		let memManagementHtml = "";
		memManagementHtml += `
		<div class="row">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th style="width: 10%">체크</th>
						<th style="width: 50%">멤버</th>
						<th style="width: 15%">직책</th>
						<th style="width: 15%">가입날짜</th>
						<th style="width: 10%">관리</th>
					</tr>
				</thead>
				<tbody>
		`;
		for(let i=0; i < memberList.length; i++){
			
		let mcodeNm = `\${memberList[i].mcodeNm}`;
		
		console.log("mcodeNm : " + mcodeNm);
		
		memManagementHtml += `
						<tr>
							<td>
								`;
		if(mcodeNm!="관리자"){
			memManagementHtml += `<input name="name" class="form-check-input" type="checkbox" data-mem-Email="\${memberList[i].memEmail}" value="">`;
		}
								
		memManagementHtml += `</td>
							<td><img
								src="\${memberList[i].participateMemAttPath}"
								width="48" height="48" class="rounded-circle me-2"
								alt="Avatar">\${memberList[i].memName} (\${memberList[i].memEmail})</td>
							<td>\${memberList[i].mcodeNm}</td>`
							
		if(memberList[i].partDate == null){
			memManagementHtml += "<td> </td>";
		}else{
			memManagementHtml += "<td>"+memberList[i].partDate+"</td>";	
		}
		memManagementHtml += `<td class="table-action">
								<a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2 align-middle"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg></a>
								<a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash align-middle"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg></a>
							</td>
						</tr>`; 
		}
		memManagementHtml += `
				</tbody>
			</table>
			
		</div>
		`;
		return memManagementHtml;
	}
	
	// 멤버관리 )
	// 초대 대기중인 회원이 없는 경우 html
	let makeNoMemberHtml0 = function(){
		let noMemberHtml = "";
		noMemberHtml += `
			<div class="card-body">
				<p>초대 보낸 회원이 없습니다.</p>
			</div>`;
		return noMemberHtml;
	}
	
	// 멤버관리 )
	// 초대 대기중인 회원이 없는 경우 html
	let makeNoMemberHtml2 = function(){
		let noMemberHtml = "";
		noMemberHtml += `
			<div class="card-body">
				<p>초대 거절한 회원이 없습니다.</p>
			</div>`;
		return noMemberHtml;
	}
	
	// 멤버관리 )
	// 프로젝트 멤버 관리 UI
	function memManagementUI(){
		$.ajax({
			url : "${pageContext.request.contextPath }/project/project/management/memberManagementList/${project.proCode }",
			method : "get",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				console.log("프로젝트 멤버 관리:",resp)
  				memManagementDisp0.empty();
  				memManagementDisp1.empty();
  				memManagementDisp2.empty();
				
 				if(resp.standBy.length == 0){
 					memManagementDisp0.html(makeNoMemberHtml0());
 				}else{ 					
	 				memManagementDisp0.html(makeMemManagementHtml(resp.standBy));
 				}
 				memManagementDisp1.html(makeMemManagementHtml(resp.yes));
 				if(resp.no.length == 0){ 					
	 				memManagementDisp2.html(makeNoMemberHtml2());
 				}else{
	 				memManagementDisp2.html(makeMemManagementHtml(resp.no));
 				}
				
				/* projectParticipateInsert();  */
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}
	
	// 멤버관리 )
	// 프로젝트 멤버 관리 버튼 클릭 시
	memManagementBtn.on('click' , function(){
		memManagementUI();
	})
	
	
	// 멤버관리 )
	// 프로젝트 초대하기
	$("#projectParticipateBtn").on("click",function(event){
		// 알림 데이터 세팅
		alCode = $("#alarmCd").val();
		mailList.push($("#alarmMem").val());
		
		let data =  $("#projectParticipateForm").serialize();
		console.log(data);
		$.ajax({
			url : "${pageContext.request.contextPath }/project/participateInsert",
			method : "post",
			data : data,
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				if(resp=="1"){
					console.log("성공1")
					Swal.fire('멤버 초대가 완료되었습니다.', '화끈하시네요~!', 'success');
					memManagementUI();
				}else{
					console.log("실패2");
					memManagementUI();
				}
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	})
	
	// 멤버관리 )
	// 프로젝트 초대 취소, 추방  
	participateCancelBtn.on("click", function(){
		let emailListData = []; 
		let checkfind = $(this).parent().parent().siblings()[1];
		let inputTags = $(checkfind).find("input");
		 for(var i=0; i<inputTags.length; i++){
			if(inputTags[i].checked){
				emailListData.push(inputTags[i].dataset.memEmail);
			}
		} 
		console.log(emailListData);
		console.log("${project.proCode}");
		let dataObject = {
			"proCode" : "${project.proCode}",
			"memEmail" : emailListData
		}

		console.log("dataObject",dataObject);
		
  		$.ajax({
			url : "${pageContext.request.contextPath }/project/participateDelete",
			method : "post",
			data : JSON.stringify(dataObject),
			contentType : "application/json;charset=utf-8",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				Swal.fire('멤버 강퇴했습니다.', '화끈하시네요~!', 'success');
				memManagementUI();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});  
	});
	
	// 멤버관리 )
	// 다시 초대하기
	participateAgain.on("click", function(){
		
		let emailListData = []; 
		let checkfind = $(this).parent().parent().siblings()[1];
		let inputTags = $(checkfind).find("input");
		 for(var i=0; i<inputTags.length; i++){
			if(inputTags[i].checked){
				emailListData.push(inputTags[i].dataset.memEmail);
			}
		} 
		console.log(emailListData);
		console.log("${project.proCode}");
		let dataObject = {
			"proCode" : "${project.proCode}",
			"memEmail" : emailListData
		}
		
		console.log(typeof(dataObject));
		console.log(typeof(JSON.stringify(dataObject)));

  		$.ajax({
			url : "${pageContext.request.contextPath }/project/participateAgain",
			method : "post",
			data : JSON.stringify(dataObject),
			contentType : "application/json;charset=utf-8",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				Swal.fire('다시 초대가 완료되었습니다.', '화끈하시네요~!', 'success');
				memManagementUI();
				console.log(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});  
	});
	
	// 멤버관리 )
	// 체크박스 전체 체크하기
	selectAllBtn.on("click", function(){
		let checkfind = $(this).parent().parent().siblings()[1];
		let inputTags = $(checkfind).find("input");
		
		if(inputTags.is(":checked")){
			inputTags.prop("checked", false);
		}else{
			inputTags.prop("checked", true);			
		}
	})
	/***************************** 멤버관리 종료 *****************************/
	


</script>


