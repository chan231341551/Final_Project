<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script>
	var AlarmData = { 
			"alarm_receiver" : 겨마/* memEmail */,
			"alarm_sender" : 서빈짱/* alSender */, 
			"alarm_title" : "멘션 알림",
			"alarm_content" : memEmail + "님이
	<!-- 		<a type='external' -->
	<!-- 			href='/mentor/essayboard/essayboardView?pg=1&seq="+essayboard_seq+"&mentors="+ memberSeq +"'>" -->
	<!-- 			+ essayboard_seq + " -->
	<!-- 		</a> -->
			OO에서 OO시간에 회원님을 언급했습니다."};
	
	// notifySend
	$('#connBtn').click(function(e){
	    
	    // 전송한 정보를 db에 저장	
	    $.ajax({
	        type: 'POST',
	        url: '$${pageContext.request.contextPath}/project/alarmInsert',
	        data: JSON.stringify(AlarmData),
			contentType: "application/json; charset=utf-8",
	        dataType: 'text',
	        success: function(data){    // db전송 성공시 실시간 알림 전송
	            // 소켓에 전달되는 메시지
	            // 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
	            if(socket){	
		            let socketMsg = "mention," + alreceiver +","+ alSender;
					console.log("msgmsg : " + socketMsg);
		            socket.send(socketMsg);	
	            }
	        },
			error : function(err){
				console.log(err);
			}
	    });
	});
</script>

