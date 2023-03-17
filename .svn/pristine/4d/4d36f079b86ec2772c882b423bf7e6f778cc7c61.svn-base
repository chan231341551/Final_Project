<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>


<input class='customLook'  value=''>
<button type="button" class="plus">+</button>

<script>
var whitelist = [];
$(document).ready(function(){
	let proCode = '${proCode}'
	
	$.ajax({ 
		url : "${pageContext.request.contextPath }/project/mentionMem/"+proCode,
		type : "get",
		dataType : "json",
		success : function(resp) {
// 			console.log("resp : ", resp);

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
});

var randomStringsArr = Array.apply(null, Array(100)).map(whitelist)

var input = document.querySelector('.customLook'),
tagify = new Tagify(input, {
  // email address validation (https://stackoverflow.com/a/46181/104380)
  pattern: /^[가-힣]{2,4}$/,
  whitelist: randomStringsArr,
  callbacks: {
    "invalid": onInvalidTag
  },
  dropdown : {
    position: 'text',
//     position: 'text', // <-- render the suggestions list next to the typed text ("caret")
//     mapValueTo: 'text', 
    enabled: 1 // show suggestions dropdown after 1 typed character
  }
}),
button = input.nextElementSibling;  // "add new tag" action-button

button.addEventListener("click", onAddButtonClick)

function onAddButtonClick(){
tagify.addEmptyTag()
}

function onInvalidTag(e){
console.log("invalid", e.detail)
}
</script>