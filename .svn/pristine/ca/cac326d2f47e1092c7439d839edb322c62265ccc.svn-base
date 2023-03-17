<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>


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
  margin-top: 30px;
  background: #fff;
  padding: 6px 10px;
  position: relative;
  border-radius: 25px;
  box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.06);
  text-align: left;
}
</style>
<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION }">
	<script>
		alert("${SPRING_SECURITY_LAST_EXCEPTION.message}");
	</script>
	<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
</c:if>

<section id="contact" class="contact" style="padding-top: 160px;">
	<div class="container" data-aos="fade-up">

		<div class="section-title">
			<h2>로그인</h2>
		</div>

		<div class="row justify-content-center">
			<div class="col-lg-5 mt-5 mt-lg-0 d-flex align-items-stretch">
				<form id="loginForm" action="<c:url value='/login/loginProcess'/>" method="post" class="php-email-form2">
					<div class="row">
						<div class="form-group">
							<label for="name">Email</label> 
							<input type="text" class="form-control" name="memEmail" id="memEmail" placeholder="이메일을 입력해주세요." required>
						</div>
					</div>
					<div class="form-group mt-3">
						<label for="name">Password</label> 
						<input type="password" class="form-control" name="memPass" id="memPass" placeholder="비밀번호를 입력해주세요." required>
					</div>
					<div class="text-center mt-3">
						<button id="loginBtn" type="submit">로그인</button>
					</div>
					<div class="text-center mt-3">
						<a href="${pageContext.request.contextPath }/member/join">회원가입</a>
					</div>
					<security:csrfInput/>
				</form>
			</div>
		</div>
	</div>
</section>
<script>

	// 메일 인증 여부
	let mailAuth = 0;
	
	$('#memEmail').on('blur', function() {
		let memEmail = $('#memEmail').val();
		console.log("memEmail",memEmail);
		$.ajax({
			url : "${pageContext.request.contextPath}/member/emailAuth",
			method : "post",
			data : memEmail,
			contentType : "application/json; charset=UTF-8",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
		        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		    },
			success : function(auth) {
				console.log("받아온 결과값 : ",auth);
				if(auth==1 && auth !==""){
					mailAuth = 1;
				}else{
					mailAuth = 0;
				}
				console.log("mailAuth 결과값 : ",mailAuth);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		})
	})
	
	$("#loginForm").on("submit",function(event){
		if(mailAuth==0){
			event.preventDefault()
			Swal.fire("이메일 인증을 해주세요.", "", "warning");
			return false;	
		}
	})

</script>