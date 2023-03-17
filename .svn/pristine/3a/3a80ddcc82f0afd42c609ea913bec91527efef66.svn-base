<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>

<main class="content" style="padding-top:0px;">

<div class="container-fluid p-0">
	<div class="row">
		<div class="col-md-8 col-xl-12">
			<!-- 게시판 작성 -->
			<div class="card">

				<div class="card-header">
					<h5 class="card-title">게시판 수정</h5>
					
				</div>
				<div class="card-body">
				<!--param : proCode=P202302280097 -->
					<form:form modelAttribute="boardVO" action="/project/project/boardUpdate/${boardVO.boardNo }" method="post">
						<!-- <input type="text" name="proCode" id="proCode"  value="${boardVO.proCode}" /> -->
						<h5 class="card-title">제목
						<input type="text" name="boardTitle" id="boardTitle" placeholder="제목을 입력해주세요." value="${boardVO.boardTitle }"/>
						<br>
						<br>
						<!-- CONT  -->
						<textarea name="boardCont" id="editor1" rows="10" cols="80">${boardVO.boardCont}</textarea>
					    <script>
					        CKEDITOR.replace( 'editor1' );
					    </script>
						<button type="submit" class="btn btn-success">수정</button>
					</form:form>
					<a class="btn btn-secondary" href="#" onclick="history.back()">목록으로</a>
				</div>

			</div>

		</div>

		
	</div>
</div>
</main>



