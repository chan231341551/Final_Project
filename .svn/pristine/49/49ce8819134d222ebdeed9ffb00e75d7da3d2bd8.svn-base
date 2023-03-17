<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<script	src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<script	src="${pageContext.request.contextPath }/resources/js/news.js"></script>


<table class="table table-bordered">
	<thead class="thead-dark">
		<tr>
			<th>일련번호</th>
			<th>뉴스제목</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
	<tbody>
		<c:set var="newsList" value="${pagingVO.dataList }" />
		<c:choose>
			<c:when test="${not empty newsList}">
				<c:forEach items="${newsList}" var="news">
					<tr>
						<td>${news.rnum }</td>

						<td><c:url value="/project/newsDetail/{proCode}" var="viewURL">
								<c:param name="what" value="${news.newsNo }" />
					 	</c:url> <a href="${viewURL}">${news.newsTitle }</a></td> 
						<td>${news.newsDate}</td>
						<td>${news.newsHit }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="6">게시글 없음.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
	<%-- <tfoot>
		<tr>
			<td colspan="6">
				<div id="pagingArea">
					<ui:pagination pagingVO="${pagingVO }" type="default" />
				</div> <form:form id="searchUI" modelAttribute="simpleCondition"
					method="get" onclick="return false;">
					<form:select path="searchType">
						<option value>전체</option>
						<form:option value="writer" label="작성자" />
						<form:option value="content" label="내용" />
					</form:select>
					<form:input path="searchWord" />
					<input type="button" value="검색" id="searchBtn" />
				</form:form>
			</td>
		</tr>
	</tfoot> --%>
</table>


<!------------------ 뉴스 작성 모달창 --------------------------------->

<button type="button" class="btn btn-primary" data-bs-toggle="modal"
	data-bs-target="#newsModal">뉴스작성</button>
<%--   <form action="${pageContext.request.contextPath}/project/newsInsert/{proCode}" method="post"> --%>
<!-- Modal -->

<div class="modal fade" id="newsModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	
		<div class="modal-content" id="newswrite">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">뉴스 추가</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">
				<form id="newsForm" enctype="multipart/form-data" method="post"> 
		   <%-- <form action="${pageContext.request.contextPath}/project/newsInsert/{proCode}" method="post"> --%>		
				<form>
					<div class="form-group">
						<label for="news-title-input" class="col-form-label">뉴스 제목</label>
						<input type="text" class="form-control" id="newsTitle">
					</div>
				</form>
				
				<!-- 불러와야함 -->
				<div class="form-group">
					<th>회원이메일</th> <input type="text" class="form-control"
						id="memEmail">
				</div>

				<div class="form-group">
					<th>프로젝트코드</th> <input type="text" class="form-control"
						id="proCode" />
				</div>


				<th>뉴스내용</th>
				<!-- 	<label class="col-form-label">뉴스 내용</label> -->
				<td><input type="text" id="newsCont" cssClass="form-control" />
				</td>

			<div class="form-group">
				<th>비밀번호</th> <input type="text" class="form-control" id="newsPass">
			</div>

			<!-- modal-footer -->
			<div class="modal-footer">
				<form id="newsImage">
					<input type="file" name="file" accept="image/*">
				</form>
			</div>

			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			<button type="submit" class="btn btn-success">저장</button>
		</form>
		</div>
	</div>
</div>
</div>


<!-- 자바스크립트  -->

<%--  검색창  
<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
	<form:hidden path="searchType" />
	<form:hidden path="searchWord" />
	<input type="hidden" name="page" />
</form:form>

<script type="text/javascript">
	let searchForm = $("#searchForm");
	let searchUI = $("#searchUI").on("click", "#searchBtn", function() {
		let inputs = searchUI.find(":input[name]");
		$.each(inputs, function(index, input) {
			let name = this.name;
			let value = $(this).val();
			searchForm.find("[name=" + name + "]").val(value);
		});
		searchForm.submit();
	});

	$("a.paging").on("click", function(event) {
		event.preventDefault();
		let page = $(this).data("page");
		if (!page)
			return false;
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
		return false;
	});
</script> --%>

<script>
	CKEDITOR.replace('newsCont');
</script>


<script>	

// SUBMIT EVENT
	
		
	 /*   let news_title = $('#newsTitle').val();
	   let news_cont = $('#newsCont').val();
	   let mem_Eamil = $('#memEmail').val();
	   let news_Pass = $('#newsPass').val();
	   
  		console.log(news_title);    
  		console.log(news_cont);    
  		console.log(mem_Eamil);    
  		console.log(news_Pass); 
	} */


/* 
// INSERT 작업
let data = newsForm.serialize();
console.log("data : ", data);

$.ajax({
	url : "${pageContext.request.contextPath }/project/newsForm",
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
return false;
}); 

	

  document.getElementById("saveNewsBtn").onclick = function () {
	   
	   let news_title = $('#newsTitle').val();
	   let news_cont = $('#newsCont').val();
	   let mem_Eamil = $('#memEmail').val();
	   let news_Pass = $('#newsPass').val();
    		console.log(news_title);    
    		console.log(news_cont);    
    		console.log(mem_Eamil);    
    		console.log(news_Pass);      
   }
   
  */

</script>






