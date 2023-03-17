<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<security:authentication property="principal.realMember" var="authMember"/>
<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
			<a class="sidebar-brand" href="${pageContext.request.contextPath }/project/myProject">
        		<span class="align-middle">BlueMine</span>
        	</a>

		<ul class="sidebar-nav">
			<li class="sidebar-header">
				<button class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#projectInsertModal" style="width:100%;">새 프로젝트 생성</button>
			</li>
			<li class="sidebar-item">
				<a class="sidebar-link" href="${pageContext.request.contextPath }/project/myProject">
					<i class="align-middle" data-feather="home"></i> <span class="align-middle">내 프로젝트</span>
				</a>
			</li>
			<li class="sidebar-item">
				<a class="sidebar-link" href="${pageContext.request.contextPath }/project/invitedProject">
					<i class="align-middle" data-feather="user-plus"></i> <span class="align-middle">초대받은 프로젝트</span>
				</a>
			</li>
			<li class="sidebar-item">
				<a class="sidebar-link" href="${pageContext.request.contextPath }/project/favorites">
					<i class="align-middle" data-feather="star"></i> <span class="align-middle">즐겨찾기</span>
				</a>
			</li>
			
			<li class="sidebar-header">
				모아보기
			</li>
			<li class="sidebar-item">
				<a class="sidebar-link" href="${pageContext.request.contextPath }/project/myWork">
					<i class="align-middle" data-feather="edit"></i> <span class="align-middle">작업</span>	
				</a>
			</li>
			
			<li class="sidebar-header">
				프로젝트 폴더
			</li>
			<li class="sidebar-item">
				<a class="sidebar-link" href="${pageContext.request.contextPath }/project/projectFolder1">
					<i class="align-middle" data-feather="folder"></i> <span class="align-middle">디자인</span>	
				</a>
			</li>
			<li class="sidebar-item">
				<a class="sidebar-link" href="${pageContext.request.contextPath }/project/projectFolder2">
					<i class="align-middle" data-feather="folder"></i> <span class="align-middle">마케팅</span>
				</a>
			</li>
			<li class="sidebar-item">
				<a class="sidebar-link" href="${pageContext.request.contextPath }/project/projectFolder3">
					<i class="align-middle" data-feather="folder"></i> <span class="align-middle">엔지니어링</span>
				</a>
			</li>
			<li class="sidebar-item">
				<a class="sidebar-link" href="${pageContext.request.contextPath }/project/projectFolder4">
					<i class="align-middle" data-feather="folder"></i> <span class="align-middle">웹개발</span>
				</a>
			</li>
			<li class="sidebar-item">
				<a class="sidebar-link" href="${pageContext.request.contextPath }/project/projectFolder5">
					<i class="align-middle" data-feather="folder"></i> <span class="align-middle">앱개발</span>
				</a>
			</li>
			<li class="sidebar-item">
				<a class="sidebar-link" href="${pageContext.request.contextPath }/project/projectFolder6">
					<i class="align-middle" data-feather="folder"></i> <span class="align-middle">기타</span>
				</a>
			</li>
			
			<li class="sidebar-header">
				기타
			</li>
			<li class="sidebar-item">
				<a class="sidebar-link" href="${pageContext.request.contextPath }/">
					<i class="align-middle" data-feather="arrow-left-circle"></i> <span class="align-middle">메인 이동</span>
				</a>
			</li>
			<li id="adminMenu" class="sidebar-item"></li>
			

		</ul>

<%-- 				<div class="sidebar-cta">
					<div class="sidebar-cta-content">
						<strong class="d-inline-block mb-2">Upgrade to Pro</strong>
						<div class="mb-3 text-sm">
							Are you looking for more components? Check out our premium version.
						</div>
						<div class="d-grid">
							<a href="<c:url value='/service/payDetail'/>" class="btn btn-primary">Upgrade to Pro</a>
						</div>
					</div>
				</div> --%>
			</div>
		</nav>
		
<script>
	let memEMail = '${authMember.memEmail}'
	
	let adminTag = function(){
		let tag = "";
		return tag = `
			<a class="sidebar-link" href="${pageContext.request.contextPath }/pms/manager">
			<i class="align-middle" data-feather="lock"></i> <span class="align-middle">관리자 페이지</span>
			</a>
		`
	}
	
	$(window).on('load', function () {
		console.log("찍히냐 : ",memEMail);
		if(memEMail == 'admin' ){
			$("#adminMenu").html(adminTag);
		}
	});
	
</script>