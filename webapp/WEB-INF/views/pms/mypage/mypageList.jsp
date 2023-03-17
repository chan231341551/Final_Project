<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> -->

<main class="content">
	<div class="container-fluid p-0">
		<h1 class="h3 mb-3"> My Page</h1>
		<div class="row">
			<!-- 사이드 메뉴 -->
			<div class="col-md-4 col-xl-3">
				<div class="card mb-3">
					<!-- Profile -->
					<div class="card-body text-center">
					<div class="mb-2">
						<span id="stts"></span>
					</div>
					<img src="" id="memImg" alt="업로드" class="rounded-circle" width="128" height="128" onclick="ajaxFileUpload();">
					<div class="mt-4">
						<form id="ajaxForm">
						    <input type="hidden" name="memEmail"/>
						    <!-- display:none으로 화면상에서 파일 확인 창을 숨겨둔다 -->
						    <input type="file" id="ajaxFile" name="files" onChange="ajaxFileTransmit();" style="display:none;" multiple="multiple" accept="image/*"/>
<!-- 							    <input type="button" class="btn btn-primary" onClick="ajaxFileUpload();" value="업로드"/> -->
							<security:csrfInput/>
						</form>
					</div>
					<h5 class="card-title mb-2" id="email"></h5>
					<div class="text-muted mb-2" id="name"></div>
						<div>
<!-- 							<a class="btn btn-primary btn-sm mb-2" id="proBtn">회원 정보</a> -->
<!-- 							<br> -->
<!-- 							<a class="btn btn-light border btn-sm" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>  -->
								
<!-- 							</a> -->
						</div>
					</div>
					<hr class="my-0">

				<!--작업 상태 -->
					<div class="card-body text-center">
						<h5 class="h6 card-title mb-3">근무 상태</h5>
						<button class="btn btn-outline-secondary mb-1 stBtn" data-icon="glyphicon glyphicon-sunglasses">사무실</button>
						<button class="btn btn-outline-primary mb-1 stBtn" data-icon="glyphicon glyphicon-cutlery">식사중</button>
						<button class="btn btn-outline-success mb-1 stBtn" data-icon="glyphicon glyphicon-earphone">외근</button>
						<br>
						<button class="btn btn-outline-danger mt-3 stBtn" data-icon="glyphicon glyphicon-plane">휴가</button>
						<button class="btn btn-outline-warning mt-3 stBtn" data-icon="glyphicon glyphicon-remove-sign">병가</button>
						<button class="btn btn-outline-info mt-3 stBtn" data-icon="glyphicon glyphicon-home">재택근무</button>
					</div>
					<hr class="my-0">
					</div>
				</div>

			<!-- 회원정보 -->
			<div id="detail" class="col-xl-7" >
				<div class="card h-100" style="float:left; width:49%">
			<div class="card-body d-flex flex-column mb-n4">
				<div class="card-header mb-n2">
					<h5 class="card-title mb-0 text-center">Private info</h5>
				</div>
				<div class="card-body h-100">
					<form action="${pageContext.request.contextPath}/member/memberUpdate" method="post">
					<div class="row ">
						<div class="mb-2 d-flex justify-content-end">
							<label id="memSdate" class="form-label "></label>
						</div>
					</div>
					<div class="row">
						<div class="mb-2">
							<label class="form-label" for="inputFirstName">이메일</label>
							<input type="email" class="form-control" name="memEmail" id="memEmail" readonly="true">
						</div>
					</div>
					<div class="row">
						<div class="mb-2">
							<label class="form-label" for="inputLastName">이름</label>
							<input type="text" class="form-control" name="memName" id="memName" placeholder="변경할 이름을 입력하세요" >
						</div>
					</div>
					<div class="row">
						<div class="mb-2">
							<label class="form-label" for="inputEmail4">전화번호</label>
							<input type="text" class="form-control" name="memTel" id="memTel" placeholder="변경할 전화번호를 입력하세요"> 
						</div>
					</div>
					<div class="row">
						<div class="mb-4">
							<label class="form-label" for="inputAddress2">비밀번호</label>
							<input type="password" class="form-control" name="memPass" id="memPass" value="" placeholder="수정하려면 비밀번호를 입력하세요">
						</div>
					</div>
					<div class="mb-2 d-flex justify-content-end">
						<button type="submit" class="btn btn-primary ">수정</button>
					</div>
					<security:csrfInput/>
				</form>
				</div>
			</div>
		</div>

		<div class="card text-center h-100" style="float:right; width:49%">
			<div class="card-body d-flex flex-column mb-n4">
				<div class="card-header mb-n2">
			<!-- 접속 로그 -->
					<h5 id="memee" class="h6 card-title">마지막 접속 일시</h5>
					<ul class="list-unstyled mb-0">
						<li class="mb-1">
							<span id="memLog" class="me-1">
							</span>
						</li>
					</ul>
					<hr class="">
				</div>
				<div class="card-body h-100">
				</div>
			</div>
		</div>
			</div>
			
			
			
		</div>
	</div>
</main>

<script>
	// 상태 코드 변경
	$(".stBtn").on("click",function(){
		let stBtn = $(this);
// 		stBtn.siblings().css("background-color","white").css("color","");
		btnColor = $(this).css("border-color");
// 		stBtn.css("background-color",btnColor).css("color","white");
		data = stBtn.html();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/member/memberSomeUpdate",
			method : "post",
			data : {memSttsCd : data},
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
		        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		    },
			success : function(resp) {
				memberDetail(btnColor);
				
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		})
		
				
	})

	memberDetail();
	function memberDetail(btnColor){
		$.ajax({
			url : "${pageContext.request.contextPath}/member/memberDetail",
			method : "get",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
		        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		    },
			success : function(member) {
				console.log("받아온 결과값 : ",member);
				$("#email").html(member.memEmail);
				$("input[name=memEmail]").val(member.memEmail);
				$("#name").html(member.memName);
				$("#stts").html(member.memSttsCd).css("color",btnColor);
				$("#memImg").attr("src",member.memAttPath);
				$("#memSdate").text("가입일 : "+member.memSdate);
				$("#memEmail").val(member.memEmail);
				$("#memName").val(member.memName);
				$("#memTel").val(member.memTel);
				$("#memLog").html(member.memDateLog);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		})
	}


	// 업로드 버튼이 클릭되면 파일 찾기 창을 띄운다.
	function ajaxFileUpload() {
	       $("#ajaxFile").click();
	   }
	
	function ajaxFileTransmit() {
		let formData = new FormData($("#ajaxForm")[0]);
		// console.log("formdata[files] : ",formData.getAll("files"));
	    $.ajax({
	          url : "${pageContext.request.contextPath }/member/imgUpload"
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
	            let file = formData.get("files");
	            let url = URL.createObjectURL(file);
	            $("#memImg").attr("src",url);
	        }
	    	, error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
	    });
	}
	
	
	
	var listCont =  $("#detail").html();
	
	$("#proBtn").on("click",function(){
		
	    if($("#proBtn").val()==0){
	        $("#proBtn").val(1); 
	    }
	    else{
	        $("#proBtn").val(0);
	    }
	    var isChange=$("#proBtn").val();
    
        if(isChange==0){
			$("#proBtn").html("회원 정보");
		   
			// 회원정보 페이지로 변경
			$('#detail').html(listCont);
			
	    }else{
	      	$("#proBtn").html("작업 목록");
		   
			// 일감으로 변경
			$.ajax({
				url : '${pageContext.request.contextPath}/member/mypageDetail',
				type : 'get',
				dataType : 'html',
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			    },
				success : function(res) {
					$('#detail').html(res);
					
				},
				error : function(xhr, error, msg) {
					ajaxError(xhr, error, msg);
				}
			}) 
      	 }
	});
</script>