<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	alert("이메일 인증이 완료되었습니다!")
	location.href = "${pageContext.request.contextPath}/login"
</script>
</body>
</html>