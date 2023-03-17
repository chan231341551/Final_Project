<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>


<main class="content" style="padding-top:0px;">

<div class="container-fluid p-0">
	<div class="row">
		<div class="col-12 col-md-12 col-lg-12">
				<div class="card">
					<div class="card-header px-4 pt-4">

						<h5 class="card-title">자유게시판</h5>
						<table class="table table-sm mt-2 mb-4">
							<tbody>
								<tr>
									<th>제목</th>
									<td>${boardVO.boardTitle}</td>
								</tr>
								<tr>
									<th>No</th>
									<td>${boardVO.boardNo}</td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>${boardVO.memName }</td>
								</tr>
								<tr>
									<th>작성일자</th>
									<td>${boardVO.boardDate }</td>
								</tr>
								<tr>
									<th>조회수</th>
									<td>${boardVO.hit}</td>
								</tr>
							</tbody>
						</table>
						
					</div>
					<div class="card-body px-4 pt-2">
						<p>${boardVO.boardCont}</p>
						<hr>
						<a class="btn btn-success" href="/project/project/boardUpdate/${boardVO.boardNo}">수정</a>
						<a class="btn btn-danger" href="/project/project/boardDelete/${boardVO.boardNo}">삭제</a>
						<a class="btn btn-secondary" href="/project/project/boardList/${boardVO.proCode}" >목록으로</a>
					</div>


					<!-- 댓글  -->
				<div class="card">
					<div class="card-header">
						<h5 class="card-title">댓글 작성</h5>
					</div>
					<div class="card-body">
						<input type="hidden" id="memEmail" value="${boardVO.memEmail}" />
						<input type="hidden" id="boardNo" value="${boardVO.boardNo}" />
						<div class="row">
							<div class="col-md-12">
								<div class="mb-3">
									<label class="form-label" for="inputUsername">내용</label>
									<textarea rows="2" class="form-control" id="inputBio" placeholder="내용을 입력해주세요"></textarea>
								</div>
							</div>
						</div>
						<button id="button" class="btn btn-success">전송</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


</main>

<script>
$(function(){
	$("#button").on("click",function(){
		var memEmail = $("#memEmail").val();
		var inputBio = $("#inputBio").val();
		var boardNo = $("#boardNo").val();
		var memName = "${boardVO.memName }"
		console.log("해당 이메일 : "+memEmail);
		console.log("해당 본문내용 : "+inputBio);
		console.log("해당게시글 번호 : "+boardNo);
		
		let data = { // 이게 제이슨
				"memEmail" : memEmail,
				"boardCommCont" : inputBio,
				"boardNo" : boardNo,
				"memName" : memName
		}
		console.log("data : ",data)
		console.log("JSON.stringify(data) : ",JSON.stringify(data)) //직렬화
		
		
		  $.ajax({   
		         url:"/project/project/boardCommInsert",
		         contentType:"application/json;charset:utf-8", // 보내는 데이터 타입
		         type:"post",
		         data: JSON.stringify(data),
		         dataType:"json", // 받는 데이터 타입
		         beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
		             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		         },
		         success:function(result){
		        	 console.log("뭐가들어왔나",result)
		            
		         }
	      });
    });
})

</script>