
function check_ok() {
	var reg_frm = document.reg_frm;
	
	if (document.getElementById("hnm").value == "") {
		alert("맛집 이름을  써주세요.");
		reg_frm.sname.focus();
		return false;
	}
	
	if(isNaN(reg_frm.jumin1.value)){
		alert("주민번호는 숫자로 입력하세요");
		reg_frm.jumin1.value= "";
		reg_frm.jumin1.focus();
		return false;
	}
	
	if(isNaN(reg_frm.jumin2.value)){
		alert("주민번호는 숫자로 입력하세요");
		reg_frm.jumin2.value= "";
		reg_frm.jumin2.focus();
		return false;
	}
		
	if (reg_frm.jumin1.value.length != 6) {
		alert("주민번호 앞자리는 6글자이어야 합니다.");
		reg_frm.jumin1.value= "";
		reg_frm.jumin1.focus();
		return false;
	}
	
	if (reg_frm.jumin2.value.length != 7) {
		alert("주민번호  뒷자리는 7글자이어야 합니다.");
		reg_frm.jumin2.value= "";
		reg_frm.jumin2.focus();
		return false;			
	}
	
	if (reg_frm.gendercd.value == "") {
		alert("성별을 선택하셔야 합니다.");
		reg_frm.gendercd.value= "";
		return false;			
	}
	
	if (reg_frm.email1.value == "") {
		alert("이메일을 끝까지 입력하셔야 합니다.");
		reg_frm.email1.value= "";
		reg_frm.email1.focus();
		return false;
	}

	if (reg_frm.email2.value=="") {
		alert("이메일을 끝까지 입력하셔야 합니다.");
		reg_frm.email2.value= "";
		reg_frm.email2.focus();
		return false;			
	}
	
	if (isNaN(reg_frm.hp1.value)) {
		alert("전화번호는 숫자로 입력하셔야 합니다.");
		reg_frm.hp1.value= "";
		reg_frm.hp1.focus();
		return false;			
	}
	if (isNaN(reg_frm.hp2.value)) {
		alert("전화번호는 숫자로 입력하셔야 합니다.");
		reg_frm.hp2.value= "";
		reg_frm.hp2.focus();
		return false;			
	}
	if (isNaN(reg_frm.hp3.value)) {
		alert("전화번호는 숫자로 입력하셔야 합니다.");
		reg_frm.hp3.value= "";
		reg_frm.hp3.focus();
		return false;			
	}
	
	if (reg_frm.hp1.value=="") {
		alert("전화번호를 끝까지 입력하셔야 합니다.");
		reg_frm.hp1.value= "";
		reg_frm.hp1.focus();
		return false;			
	}
	
	if (reg_frm.hp2.value=="") {
		alert("전화번호를 끝까지 입력하셔야 합니다.");
		reg_frm.hp2.value= "";
		reg_frm.hp2.focus();
		return false;			
	}
	
	if (reg_frm.hp3.value=="") {
		alert("전화번호를 끝까지 입력하셔야 합니다.");
		reg_frm.hp3.value= "";
		reg_frm.hp3.focus();
		return false;			
	}
	if (reg_frm.deptcd.value=="") {
		alert("부서를 선택하셔야 합니다.");
		reg_frm.deptcd.value= "";
		reg_frm.deptcd.focus();
		return false;			
	}
	if (reg_frm.jobcd.value=="") {
		alert("직급을 선택하셔야 합니다.");
		reg_frm.jobcd.value= "";
		reg_frm.jobcd.focus();
		return false;			
	}
	
	if (reg_frm.zipcode.value=="") {
		alert("우편번호를 입력하셔야 합니다.");
		reg_frm.zipcode.value= "";
		reg_frm.zipcode.focus();
		return false;			
	}
	
	if (reg_frm.addr2.value=="") {
		alert("주소를 입력하셔야 합니다.");
		reg_frm.addr2.value= "";
		reg_frm.addr2.focus();
		return false;			
	}
	
	if (isNaN(reg_frm.sal.value)) {
		alert("급여는 숫자로 입력하셔야 합니다.");
		reg_frm.sal.value= "";
		reg_frm.sal.focus();
		return false;			
	}
	
	if (reg_frm.sal.value=="") {
		alert("급여를 입력하셔야 합니다.");
		reg_frm.sal.value= "";
		reg_frm.sal.focus();
		return false;			
	}
	
	if (reg_frm.skill.value=="") {
		alert("한가지 이상의 기술을 입력하셔야 합니다.");
		reg_frm.skill.value= "";
		reg_frm.skill.focus();
		return false;			
	}
	
	if (reg_frm.pictureUrl.value==""){
		alert("사진을 등록하셔야 합니다.");
		reg_frm.pictureUrl.value= "";
		reg_frm.pictureUrl.focus();
		return false;
	}
	
	return true;
}

function select_email(){
	var reg_frm = document.reg_frm;
	var selectedEmail = document.getElementById("email3");
	reg_frm.email2.value = selectedEmail.options[selectedEmail.selectedIndex].value;
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
	document.reg_frm.zipcode.value=zip;
	document.reg_frm.addr1.value=addr;
	$('#btn-default').click();
}
	  		
	  		
window.onload = function() {
	$("#myModal").center();
	$("#modalTitle").html("<b>우편번호 검색</b>");
	
}


