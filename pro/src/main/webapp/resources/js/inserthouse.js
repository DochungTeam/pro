
function housecheck_ok() {
	
	var frm = document.frm;
	
	if (frm.hnm.value == "") {
		alert("맛집 이름을  써주세요.");
		frm.hnm.focus();
		return false;
	}
	
//	if (frm.email1.value == "") {
//		alert("이메일을 끝까지 입력하셔야 합니다.");
//		frm.email1.value= "";
//		frm.email1.focus();
//		return false;
//	}
//
//	if (frm.email2.value == "") {
//		alert("이메일을 끝까지 입력하셔야 합니다.");
//		frm.email2.value= "";
//		frm.email2.focus();
//		return false;			
//	}
	
	else if (frm.hphone.value == "") {
		alert("전화번호를 끝까지 입력하셔야 합니다.");
		frm.hphone.focus();
		return false;			
	}
	
	else if (isNaN(frm.hphone.value)) {
		alert("전화번호는 숫자로 입력하셔야 합니다.");
		frm.hphone.focus();
		return false;			
	}
	
	if (frm.hp2.value=="") {
		alert("전화번호를 끝까지 입력하셔야 합니다.");
		frm.hp2.value= "";
		frm.hp2.focus();
		return false;			
	}
	
	if (frm.hp3.value=="") {
		alert("전화번호를 끝까지 입력하셔야 합니다.");
		frm.hp3.value= "";
		frm.hp3.focus();
		return false;			
	}
		
	if (frm.zipcode.value=="") {
		alert("우편번호를 입력하셔야 합니다.");
		frm.zipcode.value= "";
		frm.zipcode.focus();
		return false;			
	}
	
	if (frm.addr2.value=="") {
		alert("주소를 입력하셔야 합니다.");
		frm.addr2.value= "";
		frm.addr2.focus();
		return false;			
	}
	
	
	if (frm.skill.value=="") {
		alert("한가지 이상의 기술을 입력하셔야 합니다.");
		frm.skill.value= "";
		frm.skill.focus();
		return false;			
	}
	
	if (frm.pictureUrl.value==""){
		alert("사진을 등록하셔야 합니다.");
		frm.pictureUrl.value= "";
		frm.pictureUrl.focus();
		return false;
	}
	
	return true;
}



function readURL(input) {
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			$("#img_preview").attr("src",e.target.result);
		};
		reader.readAsDataURL(input.files[0]);
	}
	
}



jQuery.fn.center = function () {
	this.css("position","absolute");
	this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
	this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
	return this;
}

function modalMsage(msg, sec) {
	$('#modalMsg').text(msg);
	$("#modal_btn").click(); //보이게
	$('#myModal').delay(sec).fadeOut(function(){
		$('#btn-default').click();
	});
}

function Zipcode(){
	$('#modalMsg').html("<input type='text' id='dong' name='dong'><input type='button' value='검색' onclick='zip();'><div style='max-height:250px; overflow:auto;'><table width='380px'><tr><th align='center' width='65px'>우편번호</th><th align='center'>주소</th></tr><tbody id='print'></tbody></table></div>");
	$("#modal_btn").click(); //보이게
	
}

function zip(){ //button1을 클릭했을 경우
		  $.ajax({
				type: "POST",
				url: "staff.jhj?command=zipcode",
				data: {dong:$("#dong").val()
					},
				  success: function(mm){
					 $("#print").html(mm);
					 }	  
			});
	  		$('#zipcode').val("");
}

function zip_chk(zip,addr){
	document.frm.zipcode.value=zip;
	document.frm.addr1.value=addr;
	$('#btn-default').click();
}
	  		
	  		
window.onload = function() {
	$("#myModal").center();
	$("#modalTitle").html("<b>우편번호 검색</b>");
	
}


