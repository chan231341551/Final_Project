<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
<script id="aaa" src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
<script id="bbb" src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>

<!-- <input class="menCont" >  -->
<!-- <input type="hidden" id="alarmCd" value="AC002"> -->
<!-- <button class="alarmSend">알림전송</button> -->
<style>
.tagify--mix{
	border: 0px;
	display: inline-block;
}
</style>
<script>
var whitelist = [];
let flag = true;
let mailList = [];   
let alCode = "";

function addTagify(){
   alCode = $("#alarmCd").val();
   let proCode = '${proCode}'
   
   $.ajax({ 
      url : "${pageContext.request.contextPath }/project/mentionMem/"+proCode,
      type : "get",
      dataType : "json",
      success : function(resp) {
//          console.log("resp : ", resp);
		whitelist = [];
         $.each(resp, function(i,v){
            if(v.partYn==1){
               let obj = {};
               obj["value"] = v.memEmail;
               obj["text"] = v.memName;
               whitelist.push(obj);
            }
         });
         console.log("whitelist",whitelist);
      },
      error : function(jqXHR, status, error) {
         console.log(jqXHR);
         console.log(status);
         console.log(error);
      }
   });
   
	var input = document.querySelector('.menCont'),
	 tagify = new Tagify(input, {
	     mode: 'mix',  
	     pattern: /@/,  
	     tagTextProp: 'text',  
	     whitelist: whitelist.map(function(item){
	         return typeof item == 'string' ? {value:item} : item
	     }),
	     dropdown : {
	         enabled: 1,
	         position: 'text', // <-- render the suggestions list next to the typed text ("caret")
	         mapValueTo: 'text', // <-- similar to above "tagTextProp" setting, but for the dropdown items
	         highlightFirst: true  // automatically highlights first sugegstion item in the dropdown
	     },
	     callbacks: {
	         add: function(e){
	            for(let i = 0; i<whitelist.length; i++){
	               //찾으면 건너뜀. 못찾으면 if문 실행
	               if((whitelist[i].text).indexOf(e.detail.data.text) < 0){
	                    flag = false;
	               }else{
	                     flag = true;
	                     break;
	               }
	            }
	            
	            if(flag){//찾음
	               console.log("찾음");
	            }else{//못찾음
	               console.log("못찾음");
	            }
	         }, 
	         remove: function(e){
	           for(let i = 0; i < mailList.length; i++) {
	           if(mailList[i] === e.detail.data.value)  {
	              mailList.splice(i, 1);
	               i--;
	           }
	         }
//	          console.log("mailList", mailList)
	        }   
	     }
	 });

	// A good place to pull server suggestion list accoring to the prefix/value
	tagify.on('input', function(e){
	    var prefix = e.detail.prefix;
	   
	    if( prefix ){
	        if( prefix == '@' )
	            tagify.whitelist = whitelist;
	   
	        if( e.detail.value.length > 1 )
	            tagify.dropdown.show(e.detail.value);
	    }
	    console.log( tagify.value )
	    console.log('mix-mode "input" event value: ', e.detail)
	})

	tagify.on('add', function(e){
	   if(flag==true){
	       mailList.push(e.detail.data.value);
//	        console.log("mailList 찾기", mailList)
	   }
	});
	
}
addTagify();
function alarmBtn(){
    let AlarmData = { 
            "memEmailList" : mailList, 
            "alContCd" : alCode         
     };
	console.log("받은 정보: ", AlarmData);
	$.ajax({
        type: 'POST',
        url: '${pageContext.request.contextPath}/project/alarmInsert',
        data: JSON.stringify(AlarmData),
        contentType: "application/json; charset=utf-8",
        dataType: 'text',
        beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
         },
        success: function(data){    // db전송 성공시 실시간 알림 전송
		console.log("data들어옴??", data);
         
           $.ajax({
              url : '${pageContext.request.contextPath}/project/alarmNo',
              type : 'GET',
                dataType : 'text',
              success : function(resp) {
				console.log("resp들어옴??", resp);
                 var alNo=resp;
                 console.log("alNo", alNo);
                 
                  // 소켓에 전달되는 메시지
                  let socketMsg = "";
                  $.each(mailList,function(i,v){
                     socketMsg += "!"+v;
                  });
                  socketMsg += ","+alCode+","+alNo;
                  console.log("socketMsg",socketMsg)
                  socket.send(socketMsg);   
              }
            })
        },
      error : function(err){
         console.log("err : " + JSON.stringify(err));
      }
  });
}

//=================================================================================================================
$(document).on("click", ".alarmSend" , function(){
	alarmBtn();
});
   
</script>