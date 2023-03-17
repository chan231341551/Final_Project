<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<div class="nav" style="padding-bottom:0px; padding-left: 3rem; padding-top: 3rem">
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<security:authentication property="principal.realMember" var="authMember"/>

<%-- 			<a class="btn btn-secondary" href="${pageContext.request.contextPath }/project/mention/${project.proCode }">멘션(임시)</a> --%>
 		<div id="projectSubMenu" class="btn-group btn-group-lg mb-3" role="group" aria-label="Large a group">
<%-- 			<a class="btn btn-secondary active" href="${pageContext.request.contextPath }/project/project/Home/${project.proCode }">개요</a>
			<a class="btn btn-secondary" href="${pageContext.request.contextPath }/project/project/workList/${project.proCode }">작업목록</a>
			<a class="btn btn-secondary" href="${pageContext.request.contextPath }/project/project/kanban/${project.proCode }">칸반보드</a>
			<a class="btn btn-secondary" href="${pageContext.request.contextPath }/project/project/calendar2/${project.proCode }">캘린더</a>
			<a class="btn btn-secondary" href="${pageContext.request.contextPath }/project/project/gantt/${project.proCode }">간트차트</a>
			<a class="btn btn-secondary" href="${pageContext.request.contextPath }/project/project/dashboard/${project.proCode }">대시보드</a>
			<a class="btn btn-secondary" href="${pageContext.request.contextPath }/project/project/issueList/${project.proCode }" >이슈</a>
			<a class="btn btn-secondary" href="${pageContext.request.contextPath }/project/project/wiki/${project.proCode }">위키</a>
			<a class="btn btn-secondary" href="${pageContext.request.contextPath }/project/project/news/${project.proCode }">뉴스</a>
			<a class="btn btn-secondary" href="${pageContext.request.contextPath }/project/project/boardList/${project.proCode }">게시판</a>
			<a id="fileBtn" class="btn btn-secondary" href="${pageContext.request.contextPath }/project/project/file/${project.proCode }">파일</a>
			<a class="btn btn-secondary me-2" href="${pageContext.request.contextPath }/project/project/management/${project.proCode }">관리</a> --%>
		</div>

		</div>
		
		<script>
		
		function subMenuOnHtml(projectProCode,memEmail){
			console.log("뭐뜨냐 ? ",memEmail)
			let projectSubMenuOnHtml = "";
			if(memEmail == "관리자" || memEmail == "서비스 관리자"){
				projectSubMenuOnHtml += "<a class='btn btn-secondary active' href='${pageContext.request.contextPath }/project/project/Home/${project.proCode }'>개요</a>";
				projectSubMenuOnHtml += "<a class='btn btn-secondary' href='${pageContext.request.contextPath }/project/project/workList/${project.proCode }'>작업목록</a>";
				projectSubMenuOnHtml += "<a class='btn btn-secondary' href='${pageContext.request.contextPath }/project/project/kanban/${project.proCode }'>칸반보드</a>";
				projectSubMenuOnHtml += "<a class='btn btn-secondary' href='${pageContext.request.contextPath }/project/project/calendar2/${project.proCode }'>캘린더</a>";
				projectSubMenuOnHtml += "<a class='btn btn-secondary' href='${pageContext.request.contextPath }/project/project/gantt/${project.proCode }'>간트차트</a>";
				projectSubMenuOnHtml += "<a class='btn btn-secondary' href='${pageContext.request.contextPath }/project/project/dashboard/${project.proCode }'>대시보드</a>";
				projectSubMenuOnHtml += "<a class='btn btn-secondary' href='${pageContext.request.contextPath }/project/project/issueList/${project.proCode }' >이슈</a>";
				projectSubMenuOnHtml += "<a class='btn btn-secondary' href='${pageContext.request.contextPath }/project/project/wiki/${project.proCode }'>위키</a>";
				projectSubMenuOnHtml += "<a class='btn btn-secondary' href='${pageContext.request.contextPath }/project/project/news/${project.proCode }'>뉴스</a>";
				projectSubMenuOnHtml += "<a class='btn btn-secondary' href='${pageContext.request.contextPath }/project/project/boardList/${project.proCode }'>게시판</a>";
				projectSubMenuOnHtml += "<a id='fileBtn' class='btn btn-secondary' href='${pageContext.request.contextPath }/project/project/file/${project.proCode }'>파일</a>";
				projectSubMenuOnHtml += "<a class='btn btn-secondary me-2' href='${pageContext.request.contextPath }/project/project/management/${project.proCode }'>관리</a>";				
			}else{
				projectSubMenuOnHtml += "<a class='btn btn-secondary active' href='${pageContext.request.contextPath }/project/project/Home/${project.proCode }'>개요</a>";
				projectSubMenuOnHtml += "<a class='btn btn-secondary' href='${pageContext.request.contextPath }/project/project/workList/${project.proCode }'>작업목록</a>";
				projectSubMenuOnHtml += "<a class='btn btn-secondary' href='${pageContext.request.contextPath }/project/project/kanban/${project.proCode }'>칸반보드</a>";
				projectSubMenuOnHtml += "<a class='btn btn-secondary' href='${pageContext.request.contextPath }/project/project/calendar2/${project.proCode }'>캘린더</a>";
				projectSubMenuOnHtml += "<a class='btn btn-secondary' href='${pageContext.request.contextPath }/project/project/gantt/${project.proCode }'>간트차트</a>";
				projectSubMenuOnHtml += "<a class='btn btn-secondary' href='${pageContext.request.contextPath }/project/project/dashboard/${project.proCode }'>대시보드</a>";
				projectSubMenuOnHtml += "<a class='btn btn-secondary' href='${pageContext.request.contextPath }/project/project/issueList/${project.proCode }' >이슈</a>";
				projectSubMenuOnHtml += "<a class='btn btn-secondary' href='${pageContext.request.contextPath }/project/project/wiki/${project.proCode }'>위키</a>";
				projectSubMenuOnHtml += "<a class='btn btn-secondary' href='${pageContext.request.contextPath }/project/project/news/${project.proCode }'>뉴스</a>";
				projectSubMenuOnHtml += "<a class='btn btn-secondary' href='${pageContext.request.contextPath }/project/project/boardList/${project.proCode }'>게시판</a>";
				projectSubMenuOnHtml += "<a id='fileBtn' class='btn btn-secondary' href='${pageContext.request.contextPath }/project/project/file/${project.proCode }'>파일</a>";
			}
			return projectSubMenuOnHtml;
		}
		

			
		// 프로젝트 생성자와 로그인한 memEmail이 같은 경우 관리 버튼이 보인다.
		let projetVO = JSON.parse(sessionStorage.getItem("projectInfo"));
		console.log("projectVO",projetVO);
		if('${authMember.memEmail}' == projetVO.memEmail){
			console.log(subMenuOnHtml(projetVO.proCode,"관리자"));
			$("#projectSubMenu").html(subMenuOnHtml(projetVO.proCode,"관리자"));
			console.log("관리자가 맞습니다.");
		}else if('${authMember.memEmail}' == 'admin'){
			$("#projectSubMenu").html(subMenuOnHtml(projetVO.proCode,"서비스 관리자"));
		}
		else{
			console.log(subMenuOnHtml(projetVO.proCode,"일반멤버"));
			$("#projectSubMenu").html(subMenuOnHtml(projetVO.proCode,"일반멤버"));
			console.log("관리자가 아닙니다.");
		}
		
		
		
		
// 		$(".subMenu").on("click",function(){
// 			//urlParam : issueList
// 			let urlParam = $(this).attr("id");
// 			//http://localhost/project/project/wiki/P202302280097
// 			let proCode = window.location.href;
// 			let proCodeArr = proCode.split("/");
			
// 			console.log("urlParam : " + urlParam);
			
// 			//P202302280097
// 			proCode = proCodeArr[proCodeArr.length-1];
// 			//proCode : 
// 			console.log("proCode : " + proCode);
			
// 			let url = '${pageContext.request.contextPath}/project/project/'+urlParam+"/"+proCode;
// 			//url : /project/project/issueList/P202302280097
// 			console.log("url : " + url);
			
// 			$.ajax({
// 				url : url,
// 				type : 'get',
// 				dataType : 'html',
// 				success : function(res) {
					
// //  				console.log(res);
// 					$('.content').html("");
// 					$('.content').html(res);
// 				},
// 				error : function(xhr, error, msg) {
// 					console.log(xhr, error, msg);
// 				},
// 			}) 
// 		});
		</script>