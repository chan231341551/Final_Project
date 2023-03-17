<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<security:authentication property="principal.realMember" var="authMember"/>


<!--====================== 작업 Detail ======================-->
<div class="modal fade" id="projectWorkDetailModal" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-xl" role="document">
		<div class="modal-content" id="projectWorkSelectDetailDisp">
			<div class="modal-header d-flex justify-content-center align-items-center" >
				<h5 class="modal-title">작업 자세히보기</h5>
				<span id="updateAlarm" style="padding-left:2rem; color:red;"></span>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body row">
				<div class="col-md-8 col-xl-8">
					<!--=========== 작업 Detail Form  ==========-->
					<form name="dataForm" class="projectWorkDetailForm">
						<table class="table table-bordered">
							<tr>
								<th>작업 번호</th>
								<td>
									<input type="text" id="workNo" name="workNo" Class="form-control" value="\${work.workNo}" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<th>프로젝트 번호</th>
								<td>
									<input type="text" id="proCode" name="proCode" Class="form-control" value="\${work.proCode}" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<th>작업 상위 번호</th>
								<td>
									<input type="text" id="workPntNo" name="workPntNo" Class="form-control" value="\${work.workPntNo}" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<th>작업 작성자</th>
								<td>
									<input type="text" id="memEmail" name="memEmail" Class="form-control" value="\${work.memEmail}" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<th>작업 제목</th>
								<td>
									<input type="text" id="workTitle" name="workTitle" Class="form-control workUpdateReadonlyOn" value="\${work.workTitle}" />
								</td>
							</tr>
							<tr>
								<th>
									담당자 별 작업 상태
								</th>
								<td id="workDetialChargerListDisp"></td>
							</tr>
							<tr>
								<th>작업 상태</th>
								<td>
									<select id="workOrderCdSelect" id="workStateCd" name="workStateCd" class="form-control workUpdateReadonlyOn">
										<option value="WS001">시작전</option>
										<option value="WS002">진행중</option>
										<option value="WS003">이슈발생</option>
										<option value="WS004">보류</option>
										<option value="WS005">종료</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>작업 중요도</th>
								<td>
									<select id="workStateCdSelect" id="workOrderCd" name="workOrderCd" class="form-control workUpdateReadonlyOn">
										<option value="WO001">낮음</option>
										<option value="WO002">보통</option>
										<option value="WO003">높음</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>작업 시작 날짜</th>
								<td>
									<input type="date" id="workSdate" name="workSdate" value="\${work.workSdate}" class="form-control workUpdateReadonlyOn"/>
								</td>
							</tr>	
							<tr>
								<th>작업 종료 날짜</th>
								<td>
									<input type="date" id="workEdate" name="workEdate" value="\${work.workEdate}" class="form-control workUpdateReadonlyOn"/>
								</td>
							</tr>
							<tr>
								<th>작업 내용</th>
								<td>
									<textarea class="workUpdateReadonlyOn" type="text" id="workDetail" name="workDetail" Class="form-control" value="\${work.workDetail}"/ rows="3" cols="80"></textarea>
								</td>
							</tr>
						</table>
						<security:csrfInput/>
					</form>
				</div>
				<!--=========== 작업 댓글 ==========-->
				<div class="col-md-4 col-xl-4">
					<section class="mb-5" style="height:100%;">
	                    <div class="card bg-light" style="height:100%;">
	                        <div class="card-body d-flex flex-column justify-content-between">
	                            <!-- Single comment-->
	                            <div id="projectWorkDetailCommDisp"></div>

	                            <!-- Comment form-->
	                            <div>
		                            <form class="mb-4" id="workCommInsertForm">
		                            	<input type="hidden" id="workCommWorkNo" name="workNo" value=""> 
		                            	<input type="hidden" name="memEmail" value="${authMember.memEmail }">
		                            	<textarea name="workCommCont" class="form-control" rows="3" placeholder="댓글 작성"></textarea>
		                            	<div class="d-flex justify-content-end pt-2">
		                            		<a id="workCommInsertBtn" class="btn btn-primary">작성</a>
		                            	</div>
		                            	<security:csrfInput/>
		                            </form>
	                            </div>
	                        </div>
	                    </div>
	                </section>
				</div>
			</div>
			<div class="modal-footer d-flex justify-content-end align-items-center">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>



<script>


	/**************************** 작업 Detail 시작  ****************************/
	// 작업 Detail )
	// 작업 자세히보기 : 담당자 목록 html
	function f_WorkChargerListHtml(data){
		let workChargerListHtml = "";
			for (var j = 0; j < data.workChargerList.length; j++) {
				workChargerListHtml += `
					<p>
						<input type="text" name="workChargerListMemEmail" value="\${data.workChargerList[j].memEmail}" readonly="readonly"/>
						<div class="progress progress-sm workUpdateReadonlyOn">
							<div class="progress-bar" id="bar\${j}" role="progressbar" aria-valuemin="0" data-cnt="bar\${j}" aria-valuemax="100" aria-valuenow="\${data.workChargerList[j].workProgress}" style="width:\${data.workChargerList[j].workProgress}%;"></div>
						</div>
						<select name="workChargerListProgress" id="\${j}" class="form-control workUpdateReadonlyOn">
							<option value="\${data.workChargerList[j].workProgress}" selected>\${data.workChargerList[j].workProgress}</option>
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
					</p>
				`;	
			}
		return workChargerListHtml;
	}

	// 작업 Detail )
	// 작업 댓글 html				
	function f_WorkDetailCommListHtml(data){
		let workDetailCommListHtml = "";
			for (var i = 0; i < data.length; i++) {
				workDetailCommListHtml +=`
	                <div class="d-flex" >
						<div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..."></div>
				        <div class="ms-3">
				            <div class="fw-bold">\${data[i].memEmail}</div>
				            	\${data[i].workCommCont}
				        </div>
			        </div>
	                <hr>
	        	`
			}
		return workDetailCommListHtml;
	}
	
	// 작업 Dtail )
	// 작업 댓글 달기
	$("#workCommInsertBtn").on("click",function(){
		console.log("hi");
		let data = $("#workCommInsertForm").serialize();
		console.log(data);
		$.ajax({
			url : "${pageContext.request.contextPath}/project/project/workCommInsert",
			method : "post",
			data : data,
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				let workNo = resp + "";
				f_WorkCommListView(workNo);
				$("textarea[name=workCommCont]").val('');
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
	
	// 작업 Detail )
	// 작업 댓글 목록 가져오기
	function f_WorkCommListView(workNo){
		let data = {"workNo" : workNo};
		$.ajax({
			url : "${pageContext.request.contextPath}/project/project/workCommList",
			method : "post",
			data: JSON.stringify(data),
			contentType:"application/json;charset=utf-8",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				console.log("댓글",resp);
				console.log(resp.length == 0);
				if(resp.length == 0){
					$("#projectWorkDetailCommDisp").html('<p>댓글이 없습니다.</p><hr>')
				}else{					
					$("#projectWorkDetailCommDisp").html(f_WorkDetailCommListHtml(resp));
				}
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	} 
	
	// 작업 Detail )
	// 작업 자세히보기 ( 작업 눌렀을 때 Detail 템플릿 적용 )
	$(document).on("click",".projectWorkDetailBtn",function(){
		$("#updateAlarm").html(" ");
		let proCode = "${project.proCode}";
		let workNo = $(this).data("workNo");
		let data = {
				"workNo":workNo
			};
		
		console.log("data",data);

		$.ajax({
			url:"${pageContext.request.contextPath}/project/project/kanban/workDetail",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			type:"post",
			dataType:"json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(res) {
				$("#workNo").val(res.workNo);
				$("#proCode").val(res.proCode);
				$("#workPntNo").val(res.workPntNo);
				$("#memEmail").val(res.memEmail);
				$("#workTitle").val(res.workTitle);
				$("#workDetialChargerListDisp").html(f_WorkChargerListHtml(res));
				if($("#workOrderCdSelect").val() == res.workOrderCdSelect){
					$("#workOrderCdSelect").val().attr("selected", "selected");
				}
				if($("#workStateCdSelect").val() == res.workStateCdSelect){
					$("#workOrderCdSelect").val().attr("selected", "selected");
				}
				$("#workSdate").val(res.workSdate);
				$("#workEdate").val(res.workEdate);
				$("#workDetail").val(res.workDetail);
				
				$("#workCommWorkNo").val(res.workNo);
				
				f_WorkCommListView(res.workNo);
			},
			error : function(xhr, error, msg) {
				ajaxError(xhr, error, msg);
			}
		});
	});
	
	
	// 작업 Detail )
	// 작업 수정
	$(document).on("input",".projectWorkDetailForm",function(){
		$("#updateAlarm").html(" ");
		$("#updateAlarm").html("수정되었습니다.");
		let data = new Object();
		let cnt = 0;
		let dataObject = {};
		data = fn_seri($(".projectWorkDetailForm")[0]);
		let workNoData = data.workNo;
		let workProgressList = data.workChargerListProgress;
		let workProgressMemEmail = data.workChargerListMemEmail;
		
		console.log("data",data);

		// 만약에 배열이 아니라면 그대로 객체에 넣는다.
		if(Array.isArray(workProgressList)){            		
			delete data.workChargerListProgress;
			delete data.workChargerListMemEmail;      		
			let workChargerList = [];
			for(let i=0; i<workProgressMemEmail.length; i++){
				let workChargerData = {};
				workChargerData['workNo'] = workNoData;
				workChargerData['memEmail'] = workProgressMemEmail[i];
				workChargerData['workProgress'] = workProgressList[i];
				$("#bar"+i).css("width",workProgressList[i]+"%");
				workChargerList.push(workChargerData);
				data['workChargerList'] = workChargerList;
			}
    	}else{
    		let workChargerList = [];
    		let workChargerData = {};
			workChargerData['workNo'] = workNoData;
			workChargerData['memEmail'] = workProgressMemEmail;
			workChargerData['workProgress'] = workProgressList;
			$("#bar"+0).css("width",workProgressList+"%");
			workChargerList.push(workChargerData);
			data['workChargerList'] = workChargerList;
    	}
		
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
	});
	/**************************** 작업 Detail 끝  ****************************/

	
	/**************************** 공통 함수 시작 ****************************/
	// form에 name에 있는 데이터 data Object로 만들어주는 함수
	function fn_seri(myForm){
	    let elems = myForm.elements;
	    console.log("elems",elems);
	    let myObj = {};
	    /* let array = null; */
	    for(let i=0; i<elems.length; i++){
	    	// myObj객체에 key값으로 elems[i].name가 있는지 없는지 여부
	        if(myObj.hasOwnProperty(elems[i].name)){
	        	// Array.isArray() 메서드는 인자가 Array인지 판별합니다.
	        	if(Array.isArray(myObj[elems[i].name])){
					// 이미 만들어진 배열이 있다면 배열 안에 값을 넣는다.
	        		myObj[elems[i].name].push(elems[i].value);
	        	}else{
	        		// 중복되는 name이 있다면 배열로 만들어준다.
	        		let array = [myObj[elems[i].name]]
		          	array.push(elems[i].value);
		          	myObj[elems[i].name] = array;
	        	}
	        }else{
	          myObj[elems[i].name] = elems[i].value;
	        }
	    }
		return myObj;
	}
	/**************************** 공통 함수 끝 ****************************/

</script>