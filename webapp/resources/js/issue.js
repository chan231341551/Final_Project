//issue page js 모음
// 모달 띄우기
$(document).on("click", ".modalPop", function(){
	let modalPop = $(this).attr("id");
	let issNo = $(this).children("input").text()
	
	if(modalPop=="issCreate"){
		// 이슈 생성 페이지
		$.ajax({
			url : '${pageContext.request.contextPath}/project/issueForm',
			type : 'GET',
			success : function(resp) {
				$('.isCont').html(resp);
			},
			error : function(xhr, error, msg) {
				console.log(xhr, error, msg);
			},
			dataType : 'html'
		}) 
	}else if(modalPop=="issDetail"){
		// 이슈 상세 페이지
		$.ajax({
			url : '${pageContext.request.contextPath}/project/issueDetail/'+issNo,
			type : 'POST',
            dataType : 'json',
			success : function(resp) {
//					console.log("member", resp.member);
//					console.log("issue", resp.issue);
//					console.log("memName 배열", resp.member[0].MEM_NAME);

				 $workTitle.text(resp.issue.work.workTitle);
				 $issLabelCd.text(LabelText(resp.issue.issLabelCd)).addClass(LabelTag(resp.issue.issLabelCd));
				 $issTitle.text(resp.issue.issTitle);
				 $issStatusCd.text(StateText(resp.issue.issStatusCd));
				 $issRdate.text((resp.issue.issRdate).substring(0, 10));
				 $issRdate.text((resp.issue.issRdate).substring(0, 10));
				 $issCont.text(resp.issue.issCont);
				 $memName.text(resp.issue.member.memName);
				 $issSdate.text((resp.issue.issSdate).substring(0, 10));
				 $issEedate.text((resp.issue.issEedate).substring(0, 10));
				 $issEmerCd.html(EmerCdTag(resp.issue.issEmerCd));
				 
				 // 담당자들 생성
				 let selectTag = [];
			     selectTag.push($("<div>").attr('class', 'card-title padding5').html("담당자"));
				 $.each(resp.member,function(i,v){
					  selectTag.push($("<div>").attr('class', 'padding5').html(v.MEM_NAME));
				 });
				 $(chargerMem).html(selectTag);
				 
				 // 퍼센트 게이지 css추가
				 $(".progress-bar").css('width', Progress(resp.issue.issSdate, resp.issue.issEedate))
				 
				 
				// 수정 페이지
				$(".issUpdate").on("click", function(event){
			
						let issNo = resp.issue.issNo
			
						 $workTitle.text(resp.issue.work.workTitle);
						 $issLabelCd.text(LabelText(resp.issue.issLabelCd)).addClass(LabelTag(resp.issue.issLabelCd));
						 $issEmerCd.contents().unwrap().wrap( '<select id="issEmerCd" name="issEmerCd"><option></option></select>' );
						 $memName.text(resp.issue.member.memName);
						
						 $issTitle.contents().unwrap().wrap( '<input class="float-start card-title inline form-control" style="width: 50%;" value="'+resp.issue.issTitle+'"></input>' );
						 $issStatusCd.contents().unwrap().wrap( '<input class="float-end" value="'+StateText(resp.issue.issStatusCd)+'"></input>' );
						 $issCont.contents().unwrap().wrap( '<input class="form-control" style="height: 350px;padding-top: 100px;" value="'+resp.issue.issCont+'"></input>' );
						
						 $issSdate.contents().unwrap().wrap( '<input type="date"  name="issSdate" id="issSdate" class="form-control dateForm" value="'+resp.issue.issSdate+'"></input>' );
						 $issEedate.contents().unwrap().wrap( '<input type="date"  name="issSdate" id="issSdate" class="form-control dateForm float-end" value="'+resp.issue.issEedate+'"></input>' );
						 $progress.contents().unwrap();
						 $hidden.text("\u00A0시작일 \u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0  종료일");
						
						 // 담당자들 생성
//							 let selectTag = [];
//						     selectTag.push($("<div>").attr('class', 'card-title').css('padding', '5px').html("담당자"));
//							 $.each(resp.member,function(i,v){
//								  selectTag.push($("<div>").css('padding', '5px').html(v.MEM_NAME));
//							 });
//							 $(chargerMem).html(selectTag);
						 
//							 // 퍼센트 게이지 css추가
//							 $(".progress-bar").css('width', Progress(resp.issue.issSdate, resp.issue.issEedate))
				});
				 
				 
				 
			},
			error : function(jqXHR, status, error) {
				console.log("jqXHR : " + jqXHR);
				console.log("status : " + status);
				console.log("error : " + error);
             }
        })
	}
});

// issue List 값  호출
$(document).ready(function(){
	 $.ajax({
         url: '${pageContext.request.contextPath}/project/project/issue/'+proCode,
         method: 'GET',
         dataType : 'json',
         success: function (resp) {
        	 
//				 console.log("resp.issueList : ", resp.issueList);
//				 // ui 생성 함수 호출
			 let selectTag = [];
			 $.each(resp.issueList,function(i,v){
			 	selectTag.push(ListTag(i,v));
			 });
			 $(".list").html(selectTag);
         },
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
         }
     })
});
					
/* 년 / 월 / 일을 쪼갬 */
let dateCal = function(date){
	var result = date.substring(0, 4)+date.substring(5, 7)+date.substring(8, 10);
	return result;
}
// 날짜 퍼센트 계산
let Progress = function(start, end){
//		console.log("start : ", start);
//		console.log("end : ", end);
	
	let start_date= dateCal(start);
	let end_date = dateCal(end);
	
	var date = new Date();
	var today = date.getFullYear() +
	'' + ( (date.getMonth()+1) < 9 ? "0" + (date.getMonth()+1) : (date.getMonth()+1) )+
	'' + ( (date.getDate()) < 9 ? "0" + (date.getDate()) : (date.getDate()) );
	
//		console.log("start_date : ", start_date);
//		console.log("end_date : ", end_date);
//		console.log("today : ", today);
	
	

	var total = end_date-start_date;
	var day = end_date-today;

	var perc ="";
	if(total<0 || start_date>today){
		perc = 0;
	}else if(day>0){
		perc = 1 - day/total;			
	}else if(day<=0 || today>end_date){
		perc = 100;
	}
	var result = Math.floor(perc*100);
//		console.log("result : ", result);
	
	return result+"%";
}

// 긴급도 생성
let EmerCdTag = function(code){
//		console.log("code : ",code);
	if(code == "IE001"){
		return $('<div>').attr({'class':'btn btn-github', 'style':'margin-left: 5px'}).html('긴급');
	}else{
		return "&nbsp;";
	}
}

// 상태 텍스트 설정
let StateText= function(label){
	let text="";
	
	if(label == "IS001"){
		text = "종료";
	}else if(label == "IS002"){
		text = "진행중 ";
	}else {
		text = "시작 예정";
	}
	return text;
}

// 라벨 텍스트 설정
let LabelText= function(label){
	let text="";
	
	if(label == "IL001"){
		text = "QUESTION";
	}else if(label == "IL002"){
		text = "BUG";
	}else if(label == "IL003"){
		text = "HELP";
	}else{
		text = "NOTICE";
	}
	return text;
}

// 라벨 색 지정
let LabelTag = function(label){
//		console.log("label : ",label);
	let color="";
	
	if(label == "IL001"){
		color = "btn btn-success";
	}else if(label == "IL002"){
		color = "btn btn-danger";
	}else if(label == "IL003"){
		color = "btn btn-warning";
	}else {
		color = "btn btn-primary";
	}
	return color;
}

let $hidden = $("#hidden");

//project code
let proCode = '${project.proCode}'

// issue detail 값 선택
let $progress = $("#progress");
let $workTitle = $("#workTitle");
let $issLabelCd = $("#issLabelCd");
let $issEmerCd = $("#issEmerCd");
let $issTitle = $("#issTitle");
let $issStatusCd = $("#issStatusCd");
let $issRdate = $("#issRdate");
let $issCont = $("#issCont");
let $memName = $("#memName");
let $issSdate = $("#issSdate");
let $issEedate = $("#issEedate");
let $chargerMem = $("#chargerMem");

// issue list ui 생성 함수
let ListTag = function(i,v){
	// console.log("v : ",v);
	return $("<div>").attr('class', 'col-12 col-md-6 col-lg-3')
			.append($("<div>").attr('class','card')
			.append($("<button>").attr({
									  'type' : 'button'
									, 'class' : 'btn modalPop'
									, 'data-bs-toggle' : 'modal'
									, 'data-bs-target' : '#centeredModalPrimary'
									, 'id':'issDetail'
			}).css('text-align', 'start')
			.append(
				$("<input>").attr({
					"type" : "hidden",
				}).html(v.issNo),
				$("<div>").attr('class', 'card-header px-4 pt-4')
				.append(
					  $("<div>").attr('class', 'card-actions float-end').html(StateText(v.issStatusCd))
					, $("<h5>").attr('class', 'card-title mb-0').html(v.issTitle)
					, $("<div>").attr('class', LabelTag(v.issLabelCd)).html(LabelText(v.issLabelCd))
					, EmerCdTag(v.issEmerCd)
					  )
				, $("<div>").attr('class', 'card-body px-4 pt-2')
					.append(
						  $("<p>").html(v.issCont)
						, $("<h5>").attr('class', 'rounded-circle me-1').html(v.memName))
				, $("<ul>").attr('class', 'list-group list-group-flush')
					.append($("<li>").attr('class', 'list-group-item px-4 pb-4')
						.append($("<p>").attr('class', 'mb-2 font-weight-bold').html("마감 기한")
									.append($("<span>").attr('class', 'float-end').html(Progress(v.issSdate, v.issEedate)))
									, $("<div>").attr('class', 'progress progress-sm')
										.append($("<div>").attr({
																'class':'progress-bar'
																, 'role':'progressbar'
																, 'aria-valuenow':'100'
																, 'aria-valuemin':'0'								
																, 'aria-valuemax':'100'
																})
																.css('width', Progress(v.issSdate, v.issEedate))
							)
						)
					)
				)
			)
		)
	}

// CK EDITOR
CKEDITOR.replace( 'issCont' );

let optionMemTag = function(i, v){
	return $("<option>").attr("value", v.memEmail).html(v.memName)
}
		
// 회원 목록 띄우기
$(document).ready(function(){
	var workData = $("#workNo").val();
	
	$.ajax({ 
		url : "${pageContext.request.contextPath }/project/issueMemList",
		type : "get",
		data : {workNo:workData},
		dataType : "json",
		success : function(resp) {
			console.log("resp : ", resp.memList);
			
			let selectTag = [];
			$.each(resp.memList, function(i,v){
				selectTag.push(optionMemTag(i, v));
			});
			$("#memEmail").html(selectTag);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			consol
			
			e.log(status);
			console.log(error);
		}
	});
});
		
// 선택한 회원목록 띄우기
$("#memName").on("click", function(event){
// 			let value = $(this).val();
	let name = $(this).find("option:checked").text();
// 			let opName = $(this).data("opName")

	while(name){
		var names = $("<div>").html(name)
		$("#issNames").html(names).css('padding-top','12px');
		break;
// 				let operator = {mail:value,name:name}
// 				opName.push(operator)
// 				console.log(opName);
	}
})
// 		.data("opName",[]);
		
// SUBMIT 버튼 EVENT
let issueForm = $("#issueForm").on("submit",function(event){
	event.preventDefault();
	
	// 날짜 계산 후 상태 넣기
	let issSdate = $("[name=issSdate]").val();
	let today = new Date();
	
	let Stoday = today.getFullYear() +
			'-' + ( (today.getMonth()+1) < 9 ? "0" + (today.getMonth()+1) : (today.getMonth()+1) )+
			'-' + ( (today.getDate()) < 9 ? "0" + (today.getDate()) : (today.getDate()) );
	let status = "";
	  if(issSdate > today){
		  status = "IS002";
	  }else{
	    status = "IS003";
	  }
	$("[name=issStatusCd]").val(status);
	
	  
	// INSERT 작업
	let data = issueForm.serialize();
	console.log("data : ", data);
	
	$.ajax({
		url : "${pageContext.request.contextPath }/project/issueForm",
		type : "post",
		data : data,
		dataType : "json",
		success : function(resp) {
			console.log("resp : ", resp);
			console.log("message", resp.message);
			// 모달 숨기기
			$("#hideModal").trigger("click");
			
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	$(".isCont").val('');
	return false;
});

	