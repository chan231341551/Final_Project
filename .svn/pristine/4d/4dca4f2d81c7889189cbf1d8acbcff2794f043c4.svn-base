<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<security:authentication property="principal.realMember" var="authMember"/>
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
									<li class="breadcrumb-item"><a href="#">칸반보드</a></li>
									<li class="breadcrumb-item active">전체 작업</li>
								</ol>
							</nav>
							<div role="tablist" class="d-flex flex-row justify-content-end">								
								<button id='dropdownMenuButton' class="nav-link dropdown-toggle btn btn-primary" role="button" data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' style="margin-right:1rem;">분류 </button>
			                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			                       <a class="dropdown-item">전체 작업</a>
			                       <a class="dropdown-item">내 작업</a> 
			                     </div>
								<button class="btn btn-primary projectWorkInsertBtn" data-bs-toggle="modal" data-bs-target="#projectWorkInsertModal" data-work-no="\${data.workNo}" style="margin-right:1rem;">작업 추가</button>
								<button type="button" class="btn btn-secondary">작업 삭제</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="tab-content">
				<!--====================== 칸반보드 컨텐츠 ======================-->
				<div class="tab-pane fade active show" id="tab-1" role="tabpanel">
					<div class="row">
						<div class="col-12 col-lg-6 col-xl-3">
							<!--=========== 오늘 시작 전 작업  ==========-->
							<div id="kWorkBeforeState" class="card  kanvanWorkState" draggable="true" ondrop="dragend(event)" ondragstart="drag(event)">
								<div class="card-header">
									<h5 class="card-title">시작 전 작업</h5>
								</div>
								<div class="card-body">
									<div id="kWorkBeforeDisp" style="min-height:50px;" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
									<div class="d-grid">
										<!-- <a href="#" class="btn btn-primary">작업 추가</a> -->
<!-- 										<a class="btn btn-primary btn-sm projectWorkInsertBtn" data-bs-toggle="modal" data-bs-target="#projectWorkInsertModal"
											data-work-no="\${data.workNo}">
											작업 추가
										</a> -->
									</div>
								</div>
							</div>
						</div>
						<div class="col-12 col-lg-6 col-xl-3">
							<!--=========== 오늘 진행 작업  ==========-->
							<div id="kWorkIngState" class="card kanvanWorkState"  draggable="true" ondrop="dragend(event)" ondragstart="drag(event)">
								<div class="card-header">
									<h5 class="card-title">진행 작업</h5>
								</div>
								<div class="card-body">
									<div id="kWorkIngDisp" style="min-height:50px;" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
								</div>
							</div>
						</div>
						<div class="col-12 col-lg-6 col-xl-3">
							<!--=========== 오늘 이슈 작업  ==========-->
							<div id="kWorkIssueState" class="card kanvanWorkState"  draggable="true" ondrop="dragend(event)" ondragstart="drag(event)">
								<div class="card-header">
									<h5 class="card-title">이슈 작업</h5>
								</div>
								<div class="card-body">
									<div id="kWorkIssueDisp" style="min-height:50px;" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
								</div>
							</div>
						</div>
						<div class="col-12 col-lg-6 col-xl-3">
							<!--=========== 오늘 종료 작업  ==========-->
							<div id="kWorkEndState" class="card kanvanWorkState"  draggable="true" ondrop="dragend(event)" ondragstart="drag(event)">
								<div class="card-header">
									<h5 class="card-title">종료 작업</h5>
								</div>
								<div class="card-body">
									<div id="kWorkEndDisp" style="min-height:50px;" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>








<script type="text/javascript">

	/**************************** 간트 차트 시작 ****************************/
	// 간트차트 )
	// 칸반보드 올 경우 자동으로 오늘 작업 목록 불러온다.
	f_TodayWorkListView();
	
	// 간트차트 )
	// 오늘 작업 html
	function f_TodayWorkHtml(data){
		let todayWorkHtml = "";
		todayWorkHtml += `
				<div class="card mb-3 bg-light cursor-grab border dragWork" id="\${data.workNo}" draggable="true" ondrop="dragend(event)" ondragstart="drag(event)">
					<div class="card-body p-3">
						<div class="float-end me-n2">
							<label class="form-check">
								<input type="checkbox" class="form-check-input">
								<span class="form-check-label d-none">Checkbox</span>
							</label>
						</div>
						<h5>\${data.workTitle}</h5>
						<p>\${data.workDetail}</p>
						<p>`
						if(data.workStateCd == 'WS001'){
		todayWorkHtml += "<span class='badge bg-secondary'>시작전</span>";
						}else if(data.workStateCd == 'WS002'){
		todayWorkHtml += "<span class='badge bg-success'>진행중</span>";					
						}else if(data.workStateCd == 'WS003'){
		todayWorkHtml += "<span class='badge bg-danger'>이슈</span>";					
						}else if(data.workStateCd == 'WS004'){
		todayWorkHtml += "<span class='badge bg-secondary'>보류</span>";					
						}else if(data.workStateCd == 'WS005'){
		todayWorkHtml += "<span class='badge bg-secondary'>종료</span>";					
						}
						
		todayWorkHtml += `
						</p>
						<div class="float-end mt-n1">
							<img src="/resources/images/pms/800.png" width="32" height="32" class="rounded-circle" alt="Avatar">
						</div>
						<a class="btn btn-primary btn-sm projectWorkDetailBtn" data-bs-toggle="modal" data-bs-target="#projectWorkDetailModal"
							data-work-no="\${data.workNo}">
							자세히 보기
						</a>
					</div>
				</div>
				`
		return todayWorkHtml;
	}
	
	// 간트차트 )
	// 오늘 작업 할 작업 목록
	let kWorkBeforeDisp = $("#kWorkBeforeDisp");
	function f_TodayWorkListView(){
		$.ajax({
			url : "${pageContext.request.contextPath}/project/project/todayWorkList/${project.proCode }",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				
				$("#kWorkBeforeDisp").empty();
				$("#kWorkIngDisp").empty();
				$("#kWorkIssueDisp").empty();
				$("#kWorkEndDisp").empty();
				
				let trTagsBefore = [];
				let trTagsIng = [];
				let trTagsIssue = [];
				let trTagsEnd = [];
				
				for(var i=0; i<resp.length; i++){
					if(resp[i].workStateCd == "WS001"){
						trTagsBefore.push(f_TodayWorkHtml(resp[i]));						
					}else if(resp[i].workStateCd == "WS002"){
						trTagsIng.push(f_TodayWorkHtml(resp[i]));	
					}else if(resp[i].workStateCd == "WS003"){
						trTagsIssue.push(f_TodayWorkHtml(resp[i]));	
					}else if(resp[i].workStateCd == "WS005"){
						trTagsEnd.push(f_TodayWorkHtml(resp[i]));	
					}
				}
				$("#kWorkBeforeDisp").html(trTagsBefore);
				$("#kWorkIngDisp").html(trTagsIng);
				$("#kWorkIssueDisp").html(trTagsIssue);
				$("#kWorkEndDisp").html(trTagsEnd);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}
	
	// 간트차트 )
	// 간트차트 이동 시 발생되는 이벤트
	function drag(ev) {
	    ev.dataTransfer.setData("text", ev.target.id);
	}
	function allowDrop(ev) {
	    ev.preventDefault();
	}
	function drop(ev) {
	    ev.preventDefault();
	    var data = ev.dataTransfer.getData("text");
	    ev.currentTarget.appendChild(document.getElementById(data));
	}
	function dragend(ev){
		ev.preventDefault();
		
		let workState = ""; 
		let workNo = ev.dataTransfer.getData("text");
		// 해당 id가 있는 Node를 찾아서 그 Node의 id가 일치하는지 비교
		if(ev.target.closest('.kanvanWorkState').id == "kWorkBeforeState"){
			workState = "WS001";
		}else if(ev.target.closest('.kanvanWorkState').id == "kWorkIngState"){
			workState = "WS002";
		}else if(ev.target.closest('.kanvanWorkState').id == "kWorkIssueState"){
			workState = "WS003";
		}else{
			workState = "WS005";
		}
		
		let workVO = { "workNo" : workNo, "workStateCd" : workState};
		
		// 작업 상태 변경
		$.ajax({
			url : "${pageContext.request.contextPath}/project/project/workStateCdUpdate",
			method : "post",
			data:JSON.stringify(workVO),
			contentType : "application/json;charset=utf-8;",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				console.log(resp);
				f_TodayWorkListView();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}
	/**************************** 간트 차트 끝 ****************************/
	
	

	


	
	
	
	/************************* 데이터 불러오기 시작 *************************/
	// 데이터 )
	// 프로젝트 전체 목록 데이터
/* 	function projectWorkListData(){
		let retval;
		$.ajax({
			url : "${pageContext.request.contextPath}/project/project/workListView/${project.proCode}",
			method : "get",
			dataType : "json",
			async :false,
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
	} */
	/************************* 데이터 불러오기 끝 *************************/

	


</script>


























