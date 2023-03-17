<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<main class="content">
	<div class="container-fluid p-0">

	<!-- BEGIN Insert modal -->
		<div class="modal fade" id="InsertModal" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-lg isCont" role="document">	
				<div class="modal-content">
					<div class="modal-body m-3">
						<form name="issue" id="issueForm" enctype="multipart/form-data" method="post">
							<div class="flexEnd">
								<div class="card-title mb-0" style="display: flex;">
									<select id="workNoSelect" name="work.workNo" class="workNo"></select>
									<select id="issLabelCd" name="issLabelCd" class="">
										 <option value="IL001">Question</option>
										 <option value="IL002">Bug</option>
										 <option value="IL003">Help</option>
										 <option value="IL004" selected>Notice</option>
									 </select>
									
									<select id="issEmerCd" name="issEmerCd" value="">
										<option value="IE001">긴급</option>
										<option value="IE002">보통</option>
										<option value="IE003" selected>낮음</option>
									</select>
								
								</div>
								<button type="button" class="btn-close float-end reSet" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="d-flex align-items-start" style="margin-top: 20px;">
								<div class="flex-grow-1">
									<table class="table table-bordered">
										<tr>
											<td colspan="2" style="height:400px">
												<div class="card-header">
													<input name="issTitle" class="float-start card-title inline form-control" style="width: 50%;" value=""></input>
													
													<input type="text" class="float-end rtl" id="issStatusCd" name="issStatusCd" value="" readonly></input><br>
													<div class="float-end" id="issRdate"><!-- toDay() --></div>
													<div class="card-title float-end paddingL5">등록일</div>
												</div>
												<div class="card-body">
													<textarea name="issCont" id="issCont" style="height: 350px;padding-top: 100px;"></textarea>
													<div class="paddingTop">
														<!-- 멘션 -->
														<input id="mention" class="card-title inline menCont" placeholder="@ _ _ _" >
														<div class="flex float-end">
															<div class="card-title mb-0 paddingL5">작성자</div>
															<div class="card-title mb-0" id="memName">계정 주인</div>
														</div>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td style="width:50%">
													<div>\u00A0시작일 \u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0  종료일</div>
													<input type="hidden" name="issNo" id="issNo" value=""><!-- moIssNo -->
													<input type="date" name="issSdate" id="issSdate" class="form-control dateForm" value=""></input>
													<input type="date"  name="issEedate" id="issEedate" class="form-control dateForm float-end" value=""></input>
												</td>
												<td>
													<div id="charger" class="flexCenter"></div>
												</td>
											</tr>
										</table>
										<div>
											댓글
										</div>
									</div>
								</div>
								<input type="hidden" id="alarmCd" value="AC002">
							</form>
							<hr>
							<button type="button" id="delete" class="btn btn-secondary" data-bs-dismiss="modal">삭제</button>
							<button type=submit class="btn btn-primary update alarmSend">저장</button>
						</div>
					</div>
				</div>	
			</div>
		<!-- END Insert modal -->

	<form name="issue" id="issueForm" enctype="multipart/form-data" method="post">
		<security:csrfInput/>
		<div class="flexEnd">
			<div class="card-title mb-0" style="display: flex;">
				<div id="workNo" style="align-self:center;padding-right:10px;" class="workNo"></div>
				<div id="issLabelCd"></div>
				<div id="issEmerCd"></div>
			</div>
			<button type="button" class="btn-close float-end reSet" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		
		<div class="d-flex align-items-start" style="margin-top: 20px;">
			<div class="flex-grow-1">
				<table class="table table-bordered">
					<tr>
						<td colspan="2" style="height:400px">
							<div class="card-header">
								<div class="float-start card-title inline" id="issTitle"></div>
								<div class="float-end" id="issStatusCd"></div><br>
								<div class="float-end" id="issRdate"></div>
								<div class="card-title float-end paddingL5">등록일</div>
							</div>
							<div class="card-body">
								<div id="cont" style="height: 350px;padding-top: 100px;"></div>
								<div class="paddingTop">
									<!-- 멘션 -->
									<input id="mention" class="card-title inline menCont" placeholder="@ _ _ _" >
<!-- 															<input class="menCont" > -->
									<div class="flex float-end">
										<div class="card-title mb-0 paddingL5">작성자</div>
										<div class="card-title mb-0" id="memName"></div>
									</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td style="width:50%">
										<div id="hidden"></div>
										<span class="mb-2 font-weight-bold" id="issSdate"></span>
										<span class="float-end" id="issEedate"></span>
										<div class="progress progress-sm" id="progress">
											<div class="progress-bar" role="progressbar" aria-valuemin="0" aria-valuemax="100">
											</div>
										</div>
							</td>
							<td>
								<div id="chargerMem" class="flexCenter"></div>
							</td>
						</tr>
					</table>
					<div>
						댓글
					</div>
				</div>
			</div>
			<input type="hidden" id="alarmCd" value="AC002">
		<hr>
		<button type="button" id="delete" class="btn btn-secondary" data-bs-dismiss="modal">삭제</button>
		<button type="button" class="btn btn-primary issUpdate">수정</button>
		</form>
		
		
		<!-- BEGIN insert modal -->
			<div class="modal fade" id="centeredModalPrimary" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered modal-lg isCont" role="document">	
							
					<div class="modal-content">
						<div class="modal-body m-3">
							<form name="issue" id="issueForm" enctype="multipart/form-data" method="post">
								<div class="flexEnd">
									<div class="card-title mb-0" style="display: flex;">
										<select id="workNoSelect" name="work.workNo" class="workNo"></select>
										<select id="issLabelCd" name="issLabelCd" class="">
											 <option value="IL001">Question</option>
											 <option value="IL002">Bug</option>
											 <option value="IL003">Help</option>
											 <option value="IL004" selected>Notice</option>
										 </select>
										
										<select id="issEmerCd" name="issEmerCd" value="">
											<option value="IE001">긴급</option>
											<option value="IE002">보통</option>
											<option value="IE003" selected>낮음</option>
										</select>
									
									</div>
									<button type="button" class="btn-close float-end reSet" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								
								<div class="d-flex align-items-start" style="margin-top: 20px;">
									<div class="flex-grow-1">
										<table class="table table-bordered">
											<tr>
												<td colspan="2" style="height:400px">
													<div class="card-header">
														<input name="issTitle" class="float-start card-title inline form-control" style="width: 50%;" value=""></input>
														
														<input type="text" class="float-end rtl" id="issStatusCd" name="issStatusCd" value="" readonly></input><br>
														<div class="float-end" id="issRdate"><!-- toDay() --></div>
														<div class="card-title float-end paddingL5">등록일</div>
													</div>
													<div class="card-body">
														<textarea name="issCont" id="issCont" style="height: 350px;padding-top: 100px;"></textarea>
														<div class="paddingTop">
															<!-- 멘션 -->
															<input id="mention" class="card-title inline menCont" placeholder="@ _ _ _" >
															<div class="flex float-end">
																<div class="card-title mb-0 paddingL5">작성자</div>
																<div class="card-title mb-0" id="memName">계정 주인</div>
															</div>
															</div>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td style="width:50%">
													<div>\u00A0시작일 \u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0  종료일</div>
													<input type="hidden" name="issNo" id="issNo" value=""><!-- moIssNo -->
													<input type="date" name="issSdate" id="issSdate" class="form-control dateForm" value=""></input>
													<input type="date"  name="issEedate" id="issEedate" class="form-control dateForm float-end" value=""></input>
												</td>
												<td>
													<div id="charger" class="flexCenter"></div>
												</td>
											</tr>
										</table>
										<div>
											댓글
										</div>
									</div>
								</div>
								<input type="hidden" id="alarmCd" value="AC002">
							<hr>
							<button type="button" id="delete" class="btn btn-secondary" data-bs-dismiss="modal">삭제</button>
							<button type=submit class="btn btn-primary update alarmSend">저장</button>
							</form>
						</div>
					</div>
				</div>	
			</div>
		<!-- END primary modal -->
		
<!-- insert -->
<script>
 let no =  $("#workNoSelect option:selected").val(); 
 console.log("$workNo", no)
</script>
		
<!-- 수정 -->
<script>
//라벨
 $issLabelCd.addClass(LabelTag(resp.issue.issLabelCd));
 $issLabelCd.val(resp.issue.issLabelCd).prop("selected", "true");
 

 //수정페이지 클릭시 참여회원 불러오기
 memFnc(resp.issue.work.workNo); // resp.issue.member.memName
 
 // 담당자 기본값 세팅(선택)위해서 전역변수에 담기
 $.each(resp.member,function(i,v){
 	checkMem.push(v.MEM_EMAIL);
 });
 
 // 긴급도
 $issEmerCd.val(resp.issue.issEmerCd);
 $issEmerCd.val(resp.issue.issEmerCd).prop("selected", "true");
 
 
 $workNo.val(resp.issue.work.workNo); 
 $memName.text(resp.issue.member.memName);
 $issTitle.val(resp.issue.issTitle);
 $issStatusCd.val(StateText(resp.issue.issStatusCd));
   
 $issSdate.val(resp.issue.issSdate);
 $issEedate.val(resp.issue.issEedate);
 $("#issNo").val(resp.issue.issNo)
</script>