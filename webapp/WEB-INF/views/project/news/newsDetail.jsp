 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>	
<table class="table table-bordered">
	<tr>
		<th><spring:message code="board.boTitle" /></th>
		<td>${news.newsTitle}</td>
	</tr>
	<tr>
		<th><spring:message code="board.boWriter" /></th>
		<td>${news.memEmail}</td>
	</tr>
	
	<c:if test="${not empty board.attatchList }">
		<tr>
			<th>첨부파일</th>
			<td>
				<c:forEach items="${board.attatchList }" var="attatch" varStatus="vs">
					${attatch.attFilename } ${vs.last?"":"," }
				</c:forEach>
			</td>
		</tr>
	</c:if>

	<tr>
		<th><spring:message code="board.boDate" /></th>
		<td>${news.newsDate}</td>
	</tr>
	
	<tr>
		<th><spring:message code="board.boHit" /></th>
		<td>${news.newsHit}</td>
	</tr>
	<tr>
		<th><spring:message code="board.boContent" /></th>
		<td>${news.newsCont}</td>
	</tr>
	<tr>
		<td colspan="2">	
			<c:url value="/project/project/" var="updateURL">
				<c:param name="what" value="${news.newsNo }"/>
			</c:url>
			<a class="btn btn-primary" href="${updateURL}">수정</a>
			<a class="btn btn-danger" href="">삭제</a>
			<a class="btn btn-secondary" href="<c:url value='/project/project/news/{proCode}'/>">목록으로</a>
		</td>
	</tr>
</table> 