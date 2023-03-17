<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>  

<security:authentication property="principal.realMember" var="authMember"/>

<form class="projectWorkAddForm">
	<input type="hidden" name="proCode" value="${project.proCode }">
	<table class="table table-bordered">
		<tr>
			<th rowspan="2">
				상위 작업
			</th>
			<td>
				<button id="projectWorkPntNoSelectBtn" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#projectWorkPntNoModal">상위작업 선택</button>
			</td>
		</tr>	
		<tr>
			<td>
				<div id="projectWorkPntNoSelectDisp" class="d-flex justify-content-start align-items-center p-2">상위작업이 없습니다.</div>
			</td>
		<tr>
		<tr>
			<th>
				작업 제목
			</th>
			<td>
				<input type="text" name="workTitle" Class="form-control"  />
			</td>
		</tr>	
		<tr>
			<th>
				작업 작성자
			</th>
			<td>
				<span style="padding:8px;">${authMember.memEmail }</span><input type="hidden" name="memEmail" Class="form-control" value="${authMember.memEmail }" />
			</td>
		</tr>	
		<tr>
			<th rowspan="2">
				담당자 선택
			</th>
			<td>
				<button id="projectWorkMemberSelectBtn" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#projectWorkMemberAddModal">담당자 선택</button>
			</td>
		
		</tr>	
		<tr>
			<td>
				<div id="projectWorkMemberSelectListDisp" class="d-flex justify-content-start align-items-center p-2">담당자가 없습니다.</div>
			</td>
		<tr>
			<th>작업 시작 날짜</th>
			<td>
				<input type="date" name="workSdate" class="form-control"/>
			</td>
		</tr>
		<tr>
			<th>작업 상태</th>
			<td>
				<select name="workStateCd" class="form-control">
					<option value="WS001" selected>시작전</option>
					<option value="WS002">진행중</option>
					<option value="WS003">이슈발생</option>
					<option value="WS004">보류</option>
					<option value="WS005">종료</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>작업 우선순위</th>
			<td>
				<select name="workOrderCd" class="form-control">
					<option value="WO001" selected>낮음</option>
					<option value="WS002">보통</option>
					<option value="WS003">높음</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>작업 종료 날짜</th>
			<td>
				<input type="date" name="workEdate" class="form-control"/>
			</td>
		</tr>
		<tr>
			<th>작업 내용</th>
			<td>
			    <textarea name="workDetail" rows="10" cols="80"></textarea>
			</td>
		</tr>
	</table>
	<div class="d-flex justify-content-end">
		<a id="projectWorkAddBtn" class="btn btn-primary">작업 등록</a>
	</div>
	<security:csrfInput/>
</form>


<!--=================== 상위 작업 모달 창 ===================-->
<div class="modal fade" id="projectWorkPntNoModal" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content">
			<form id="projectWorkPntNoForm">
				<div class="modal-header">
					<h5 class="modal-title">작업 배정 멤버 선택</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
								<th style="width: 10%">체크</th>
								<th>작업 번호</th>
								<th>작업 제목</th>
							</tr>
						</thead>
						<tbody id="projectWorkPntNoDisp"></tbody>
					</table>
				</div>
				<div class="modal-footer d-flex justify-content-end align-items-center">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					<button id="projectWorkPntNoAddBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">Save changes</button>
				</div>
				<security:csrfInput/>
			</form>
		</div>
	</div>
</div>


<!--=================== 멤버 회원 등록 모달 창 ===================-->
<div class="modal fade" id="projectWorkMemberAddModal" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content">
			<form class="projectWorkAddForm">
				<div class="modal-header">
					<h5 class="modal-title">작업 배정 멤버 선택</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
								<th style="width: 10%">체크</th>
								<th>이메일</th>
								<th>직책</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody id="projectMemberListDisp"></tbody>
					</table>
				</div>
				<div class="modal-footer d-flex justify-content-end align-items-center">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					<button id="projectWorkMemberAddBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">Save changes</button>
				</div>
				<security:csrfInput/>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">

/**************************** 작업 추가 시작 ****************************/
// 작업 추가 )
// 프로젝트 참여 멤버 리스트 html, 이미 선택이 되어있다면 노출되지 않는다.
let makeProjectMemberListHtml = function(memberList){
	
	let isWorkMemberInputFind = $(".isWorkMember").find("input");
	let isWorkMembers = [];
	for(let i=0; i<isWorkMemberInputFind.length; i++){
		isWorkMembers.push(isWorkMemberInputFind[i].dataset.workIs);
	}
	
	let projectMemberListHtml = "";
	for(let i=0; i < memberList.length; i++){
		if(isWorkMembers.indexOf(memberList[i].memEmail) < 0){
			projectMemberListHtml += `
				<tr>
					<td>
						<input class="form-check-input" type="checkbox" data-mem-Email="\${memberList[i].memEmail}" value="">
					</td>
					<td>
						<img
						src="${pageContext.request.contextPath }/resources/images/pms/200.png"
						width="48" height="48" class="rounded-circle me-2" alt="Avatar">
						\${memberList[i].memEmail}
					</td>
					<td>\${memberList[i].mcodeNm}</td>
					<td>온라인</td>
				</tr>
			`;
		}
	};
	return projectMemberListHtml;
}

// 작업 추가 )
// 프로젝트 상위 작업 목록 List Disp Html
let makeProjectWorkPntNoListHtml = function(workList){
	let projectWorkPntNoListHtml = "";
		for(let i=0; i < workList.length; i++){
				projectWorkPntNoListHtml += `
					<tr>
						<td>
							<input name="workPntNo" class="form-check form-check-inline" type="radio" data-work-pnt-No="\${workList[i].workNo}" value="\${workList[i].workNo}">
						</td>
						<td>
							\${workList[i].workNo}
						</td>
						<td>
							\${workList[i].workTitle}
						</td>
					</tr>
				`;
			
		
		};
	return projectWorkPntNoListHtml;
}

// 작업 추가 )
// 프로젝트 상위 작업 선택한 Disp Html
let makeProjectWorkPntNoSelectHtml = function(pntNo){
	let projectWorkPntNoSelectHtml = "";
	projectWorkPntNoSelectHtml += `
				<div class="me-4 isWorkPntNo">
					<input name="workPntNo" type="hidden" value="\${pntNo}">
					<div class="btn btn-square btn-primary btn-sm isWorkPntNoRemoveBtn"><span>\${pntNo}</span></div>
					<div class="btn btn-secondary btn-sm isWorkRemoveBtn isWorkPntNoRemoveBtn"><span>X</span></div>
				</div>
			`;

	return projectWorkPntNoSelectHtml;
}

// 작업 추가 )
// 프로젝트 작업 담당자 Disp Html
let makeProjectWorkMemberSelectListHtml = function(memEmailList){
	let projectWorkMemberSelectListHtml = "";
		for(let i=0; i < memEmailList.length; i++){
			projectWorkMemberSelectListHtml += `
				<div class="me-4 isWorkMember">
					<input type="hidden" data-work-Is="\${memEmailList[i]}">
					<div class="btn btn-square btn-primary btn-sm isWorkMemberRemoveBtn"><span>\${memEmailList[i]}</span></div>
					<div class="btn btn-secondary btn-sm isWorkRemoveBtn isWorkMemberRemoveBtn"><span>X</span></div>
				</div>
			`;
		};
	return projectWorkMemberSelectListHtml;
}

// 작업 추가 )
// 프로젝트 전체 목록 데이터
function projectWorkListData(){
	let retval;
	$.ajax({
		url : "${pageContext.request.contextPath}/project/project/workListView/${project.proCode}",
		method : "get",
		dataType : "json",
		async :false,
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success : function(resp) {
			console.log(resp);
			retval = resp;
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	return retval
}

// 작업 추가 )
// 프로젝트 전체 상위 작업 목록 가져오는 함수
function projectPntUpWorkListData(){
	let retval;
	$.ajax({
		url : "${pageContext.request.contextPath}/project/project/pntUpWorkListView/${project.proCode}",
		method : "get",
		dataType : "json",
		async :false,
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success : function(resp) {
			console.log(resp);
			retval = resp;
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	return retval;
}

// 작업 추가 )
// 프로젝트 상위 작업 선택 버튼 클릭 시
$("#projectWorkPntNoSelectBtn").on("click",function(){
	$("#projectWorkPntNoDisp").empty();
	/* projectWorkPntNoDisp.html(makeProjectWorkPntNoListHtml(projectWorkListData())); */
	$("#projectWorkPntNoDisp").html(makeProjectWorkPntNoListHtml(projectPntUpWorkListData()));
	console.log(projectWorkListData());
})

// 작업 추가 )
// 프로젝트 참여 멤버 리스트 UI
$("#projectWorkMemberSelectBtn").on("click", function(){
	projectParticipateMemberListView();
});

// 작업 추가 )
// 프로젝트 참여 멤버 리스트 UI 함수
function projectParticipateMemberListView(){
	$.ajax({
		url : "${pageContext.request.contextPath }/project/project/management/memberManagementList/${project.proCode }",
		method : "get",
		dataType : "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success : function(resp) {
				console.log(resp.yes);
				$("#projectMemberListDisp").empty();
				$("#projectMemberListDisp").html(makeProjectMemberListHtml(resp.yes));
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	})
}

// 작업 추가 )
// 상위 작업 선택 시 상위작업 등록
$("#projectWorkPntNoAddBtn").on("click", function(){
	let radioCheckFind = $("input[type=radio][name=workPntNo]:checked").val();
	$("#projectWorkPntNoSelectDisp").html(makeProjectWorkPntNoSelectHtml(radioCheckFind));
});

// 작업 추가 )
// 작업 담당자 선택 시 담당자 등록
$("#projectWorkMemberAddBtn").on("click", function(){
	let emailListData = [];
		let checkfind = $(this).parent().parent().siblings().prevObject[0];
	let inputTags = $(checkfind).find("input");
	 for(var i=0; i<inputTags.length; i++){
		if(inputTags[i].checked){
			emailListData.push(inputTags[i].dataset.memEmail);
		}
	}
	console.log(emailListData);
	if(emailListData.length >= 0){
		if($("#projectWorkMemberSelectListDisp").html() == "담당자가 없습니다."){
			if(emailListData.length > 0){
				$("#projectWorkMemberSelectListDisp").empty();
				$("#projectWorkMemberSelectListDisp").html(makeProjectWorkMemberSelectListHtml(emailListData))					
			}else{
				$("#projectWorkMemberSelectListDisp").empty();
				$("#projectWorkMemberSelectListDisp").html("담당자가 없습니다.");
			}
		}else{
			$("#projectWorkMemberSelectListDisp").append(makeProjectWorkMemberSelectListHtml(emailListData))
		}
	}else{
		$("#projectWorkMemberSelectListDisp").empty();
		$("#projectWorkMemberSelectListDisp").html("담당자가 없습니다.");
	}
});

// 작업 추가 )
// 담당자 삭제하기
$(document).on("click", ".isWorkRemoveBtn", function(){
	if($("div").hasClass("isWorkMemberRemoveBtn")) {
		$(this).parent().remove();
		if(!$("div").hasClass("isWorkMemberRemoveBtn")){
			projectWorkMemberSelectListDisp.empty();
			projectWorkMemberSelectListDisp.html("담당자가 없습니다.");
		}
	}
	if($("div").hasClass("isWorkPntNoRemoveBtn")) {
		$(this).parent().remove();
		if(!$("div").hasClass("isWorkPntNoRemoveBtn")){
			$("#projectWorkPntNoSelectDisp").empty();
			$("#projectWorkPntNoSelectDisp").html("상위 작업이 없습니다.");
		}
	}
});

// 작업 추가 )
// 프로젝트 작업 등록
$("#projectWorkAddBtn").on("click", function(){
	Swal.fire({
		   title: '작업 등록 하시겠습니까?',
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
				let work = $(".projectWorkAddForm").serialize();
		   
		  		$.ajax({
					url : "${pageContext.request.contextPath}/project/project/workInsert",
					method : "post",
					data : work,
					async: false,
					beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			        },
					success : function(resp) {
						console.log(resp);
						workChargerAjax(resp);
						Swal.fire('작업 등록 완료되었습니다.', '화끈하시네요~!', 'success');
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				}); 
				location.href="${pageContext.request.contextPath }/project/project/workList/${project.proCode }";
		   }
		   else{
			   Swal.fire('', '작업 등록 취소하였습니다.', "failed");
			   return;
		   }
	});
});

// 작업 추가 )
// 프로젝트 작업 담당자 등록
function workChargerAjax(workNo){
	let isWorkMemberInputFind = $(".isWorkMember").find("input");
	let workChargerVO = [];

		for(let i=0; i<isWorkMemberInputFind.length; i++){
			let data = {
				"workNo" : workNo,
				"memEmail" : isWorkMemberInputFind[i].dataset.workIs
			};
		workChargerVO.push(data);
	}
	 
		$.ajax({
		url : "${pageContext.request.contextPath}/project/project/workChargerInsert",
		method : "post",
		data : JSON.stringify(workChargerVO),
		contentType : "application/json;charset=utf-8",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success : function(resp) {
			console.log(resp);
			if(resp==1){
				console.log("담당자 배정 드디어 성공")
			}else{
				console.log("담당자 배정 실패")					
			}
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	}); 
}
/**************************** 작업 추가 끝 ****************************/
</script>