<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="UTF-8">
<title>조직조회</title>
</head>
<!-- 
		<frameset> 태그
		HTML5에서 지원하지 않는다고 합니다.
		body태그를 사용하지 않음
 -->
	<frameset rows="*" cols="192,*" frameborder="Yes" border="1" >
		<frame src='tree.jsp' name='menu' scrolling="AUTO" noresize>
		
		<frameset rows="30%,*" cols="*"  frameborder="Yes" border="0">
			<frame src='org_base_inform.jsp' name='top' scrolling="AUTO" noresize>
			<frame src='org_code.jsp' name='bottom'>
		</frameset>
		
	</frameset>
	
	<noframes>
<body>
	</noframes>
</body>

</html>