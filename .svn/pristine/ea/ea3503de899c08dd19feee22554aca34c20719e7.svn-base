/**
 * https://developer.mozilla.org/en-US/docs/Web/API/WebSocket
 * https://stomp-js.github.io/guide/stompjs/using-stompjs-v5.html
 * https://spring.io/guides/gs/messaging-stomp-websocket/
 * 
 */
function test(){console.log("tt");}

function makeStompClient(){
	let $controlBtn = this;
	
	//==========STOMP CONNECT 메시지 헤더에 CSRF 토큰을 포함시킴. template.jsp 참고========
	let csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
	let csrfToken = $("meta[name='_csrf']").attr("content");
	let connectHeaders = {};
	console.log("csrfHeaderName : ",csrfHeaderName);
	console.log("csrfToken : ",csrfToken);
	connectHeaders[csrfHeaderName] = csrfToken;
	//==========================================================================
	const client = new StompJs.Client({
		webSocketFactory:function(){
			let url = $controlBtn.data('url');
			let protocol = location.protocol.endsWith("s:")?"wss:":"ws:";
			let host =  location.host;
			let wsURL = protocol+"//"+host+url;
			console.log("wsURL : ",wsURL);
			return new WebSocket(wsURL);
		}
		, connectHeaders : connectHeaders
		, debug: function (str) {
			console.log(str);
		}
		, reconnectDelay: 5000
		, heartbeatIncoming: 4000
		, heartbeatOutgoing: 4000
	});
	
	let roomId = $(this).attr('id');
	console.log("roomId : ",roomId);
	
	client.onConnect = function(frame){
		let subscribeHeaders = {};
		
		const subscriptionEcho = this.subscribe(
			`/user/queue/${roomId}/echo`
			, subscribeEchoMessage.bind(this, $chatCont)
			, subscribeHeaders
		);
		const subscriptionBroad = this.subscribe(
				`/topic/${roomId}/echo`
				, subscribeEchoMessage.bind(this, $chatCont)
				, subscribeHeaders
		);
		const subscriptionInit = this.subscribe(`/app/mockChat/${roomId}/entering`, function(frame){
			console.log(`수신한 다이렉트 SUBSCRITION FRAME : \n ${frame} 다이렉트 메시지 : ${frame.body} `);
		});
		const subscriptionChatting = this.subscribe(
				`/topic/mockChat/${roomId}/chatting`
				, subscribeChattingMessage.bind(this, $chatCont)
				, subscribeHeaders
		);
		
		client.subscribeList = [subscriptionEcho,subscriptionInit,subscriptionChatting];
	}
	client.onChangeState = function(state){
		
		if(state === StompJs.ActivationState.ACTIVE){
			$controlBtn.prop("disabled", function(){
				return $(this).hasClass("beforeConnect");
			});
		}else if(state === StompJs.ActivationState.INACTIVE){
			$controlBtn.prop("disabled", function(){
				return $(this).hasClass("afterConnect");
			});
		}
	}
	client.onStompError = function(frame){
		console.log('Broker reported error: ' + frame.headers['message']);
		console.log('Additional details: ' + frame.body);
	}
	
	client.activate();
	console.log("client : ",client);
	return client;
}

function publishMessage($controlBtn, destination, $messageArea){
	console.log("publishMessage 왔다.")
	console.log("$messageArea : ",$messageArea);
	let client = this;
	let messageHeaders = {};
	let textIpt = $(".chatingInput").children('input');
	let message = textIpt.val();
	textIpt.val("");
	console.log("client : ",client);
	console.log("textIpt : ",textIpt);
	if(!client?.connected || !message) return false;
	// 메시지 발행시 프레임 헤더를 이용해 메타데이터를 포함시킬 수 있음.
	client.publish({
		destination : destination
		, body : message
		, headers : messageHeaders
	});
	console.log("destination : ",destination);
	$(".chatCont").append(
		$("<p class='text-end mt-3 '>")
		.html(
			$("<span>")
			.addClass("bg-warning mine p-2 ")
			.html(message)
		)
	);
}


function subscribeEchoMessage($messageArea, frame){
	let client = this;
	let message = frame.body;
	$messageArea.append(
		$("<p class='text-start mt-3'>")
			.html(
				$("<span>")
					.addClass("bg-light other p-2")
					.html(`echoed : ${message}`)
			)
	);
}

let $messageArea = $("#chatings");

function subscribeChattingMessage($messageArea, frame){
	
	console.log("subscribeChattingMessage 왔다.")
	console.log("$messageArea : ",$messageArea)
	console.log("frame.body : ",frame.body);
	let client = this;
	let messageMap = frame.body;
	console.log("messageMap : ",messageMap);
	$(".chatCont").append(
			$("<p class='text-start mt-3'>")
			.html(
					$("<span>")
					.addClass("bg-light other p-2")
					.html(messageMap)
			)
	);
}

function quit(){
	let client = this;
	for(let subscription of client.subscribeList){
		subscription.unsubscribe();
	}
	client?.deactivate();
}


//
//let $controlBtn = $(".controlBtn").on("click", function(event){
//	let roomId = $controlBtn.data("roomId");
//	console.log(`room id : ${roomId}`)
//	
//	if(event.target.id==='connBtn'){
//		$controlBtn.data("stomp", makeStompClient.call($controlBtn));
//		
//	}else if(event.target.id==='echoBtn'){
//		let client = $(this).data("stomp");
//		publishMessage.call(client, $controlBtn, `/app/${roomId}/echo`, $messageArea);
//		
//	}else if(event.target.id==='broadBtn'){
//		let client = $(this).data("stomp");
//		publishMessage.call(client, $controlBtn, `/topic/${roomId}/echo`, $messageArea);
//		
//	}else if(event.target.id==='mockChatBtn'){
//		console.log("mockChatBtn 들어옴");
//		let client = $(this).data("stomp");
//		publishMessage.call(client, $controlBtn, `/app/mockChat/${roomId}/chatting`, $messageArea);
//		
//	}else if(event.target.id==='disconnBtn'){
//		let client = $(this).data("stomp");
//		quit.call(client);
//	}
	
//});

//$(window).on("beforeunload", function(){
//	let client = $controlBtn.data("stomp");
//	console.log(`connected : ${client?.connected}, state : ${client?.state}`)
//	quit.call(client);
//});