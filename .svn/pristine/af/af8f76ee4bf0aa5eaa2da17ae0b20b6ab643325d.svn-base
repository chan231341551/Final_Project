<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<style>
.contact .php-email-form2 {
    width: 100%;
    border-top: 3px solid #47b2e4;
    border-bottom: 3px solid #47b2e4;
    padding: 30px;
    background: #fff;
    box-shadow: 0 0 24px 0 rgb(0 0 0 / 12%);
}


.contact .php-email-form2 button[type=submit] {
    background: #47b2e4;
    border: 0;
    padding: 12px 34px;
    color: #fff;
    transition: 0.4s;
    border-radius: 25px;
}
form {
	border-radius: 25px;
	margin-top: 30px;
	background: #fff;
	padding: 6px 10px;
	position: relative;
	box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.06);
	text-align: left;
}

input[type=email] input[type=text] input[type=email] {
	padding: 6px 8px;
}

input[type=button] {
	border-radius: 5px;
	position: absolute;
	top: 0;
	right: 12px;
	bottom: 0;
	border: 0;
	background: none;
	font-size: 16px;
	padding: 0 20px;
	background: #47b2e4;
	color: #fff;
	transition: 0.3s;
	box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
}

input[type=button]:hover {
	background: #209dd8;
}
p{
	color : red;
}
</style>
	
<section id="contact" class="contact" style="padding-top: 160px;">
	<div class="container" data-aos="fade-up">

		<div class="section-title">
			<h2>회원 가입</h2>
		</div>

		<div class="row justify-content-center">
			<div class="col-lg-5 mt-5 mt-lg-0 d-flex align-items-stretch">
				<form id=form action="${pageContext.request.contextPath}/member/memberInsert" method="post" class="php-email-form2">
					<security:csrfInput/>
					<div class="row">
						<label for="name">이메일</label> 
						<div class="form-group" id="divEmail" style="position: relative;">
							<input type="email" class="form-control" name="memEmail" id="memEmail" placeholder="이메일을 입력해주세요." required>
							<input type="button" id="ckbtn" value="중복검사">
						</div>
						<div class="form-group mt-3">
							<label for="name">이름</label> 
							<input type="text" class="form-control" name="memName" id="memName" placeholder="이름을 입력해주세요." required>
						</div>
						<div class="form-group mt-3">
							<label for="name">비밀번호</label> 
							<input type="password" class="form-control" name="memPass" id="memPass" placeholder="비밀번호를 입력해주세요." required>
						</div>
						<div class="form-group mt-3">
							<label for="name">비밀번호 확인</label> 
							<input type="password" class="form-control" name="memPass2" id="memPass2" placeholder="비밀번호를 다시 한번 입력해주세요." required>
							<p id="pwms"></p>
						</div>
					</div>
					<div class="text-center pt-3">
						<button type="submit" id="submitBtn">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
	//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
	let idck = 0;
	let pwck = 0;
	
	$("#ckbtn").on("click", function() {
		let memEmail = $('#memEmail').val();
		if (memEmail == '') {
			$("#memEmail").focus();
			return false;
		}
		if (memEmail.indexOf('@') == -1) {
			Swal.fire("잘못된 이메일 형식", "다시 입력해 주세요.", "warning");
			$("#memEmail").val('');
			$("#memEmail").focus();
		} else {
			$.ajax({
				async : true,
				type : 'POST',
				data : memEmail,
				url : "${pageContext.request.contextPath}/member/emailCheck",
				contentType : "application/json; charset=UTF-8",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			    },
				success : function(cnt) {
					if (cnt > 0) {
						Swal.fire("해당 이메일이 존재합니다.", "다른 이메일을 입력해 주세요.", "warning");
						$("#memEmail").val('');
						$("#memEmail").focus();
						idck = 0;
					} else {
						Swal.fire("사용 가능한 이메일입니다.", "다른 항목을 입력해 주세요.", "success");
						$("#memEmail").focus();
						//아이디가 중복하지 않으면  idck = 1 
						idck = 1;
					}
				},
				error : function(error) {
					Swal.fire("error : " + error);
				}
			});
		}
	});

	//비밀번호 확인
	$('#memPass2').on('blur', function() {
		if ($('#memPass').val() != $('#memPass2').val()) {
			$('#pwms').text("비밀번호가 다릅니다.");
			// 			Swal.fire("비밀번호가 일치하지 않습니다.", "다시 확인해 주세요.", "warning");
			// 			$('#memPass2').val('');
			// 			$('#memPass2').focus();
			pwck = 0;
		} else {
			$('#pwms').text("");
			pwck = 1;
		}
	})

	$('#form').on("submit", function() {
		if (confirm("가입 하시겠습니까?")) {
			if (pwck == 1 && idck == 1) {
				return true;
			} else
				return false;
		}
	})
</script>