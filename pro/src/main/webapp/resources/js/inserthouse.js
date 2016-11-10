
function housecheck_ok() {
	
	var frm = document.frm;
	
	if (frm.hnm.value == "") {
		alert("맛집 이름을  써주세요.");
		frm.hnm.focus();
		return false;
	}
	
	else if (frm.hphone.value == "") {
		alert("전화번호를 끝까지 입력하셔야 합니다.");
		frm.hphone.value= "";
		frm.hphone.focus();
		return false;			
	}
	
	else if (isNaN(frm.hphone.value)) {
		alert("전화번호는 숫자로 입력하셔야 합니다.");
		frm.hphone.value= "";
		frm.hphone.focus();
		return false;			
	}
	
	//주소 api받아서 등록되면 적용 시키기!!!!!주석 지우지말것!!
	/*else if (frm.haddr.value=="") {
		alert("우편번호를 입력하셔야 합니다.");
		frm.haddr.value= "";
		frm.haddr.focus();
		return false;			
	}
	
	else if (frm.haddr2.value=="") {
		alert("주소를 입력하셔야 합니다.");
		frm.haddr2.value= "";
		frm.haddr2.focus();
		return false;			
	}*/
	
	else if (frm.hkind.value=="") {
		alert("맛집테마를 선택하셔야 합니다.");
		frm.hkind.value= "";
		frm.hkind.focus();
		return false;			
	}
	
	else if (frm.hmenu.value == "") {
		alert("맛집메뉴를 입력하셔야 합니다.");
		frm.hmenu.focus();
		return false;			
	}
	
	else if (frm.hcontent.value=="") {
		alert("맛집설명을 입력하셔야 합니다.");
		frm.hcontent.focus();
		return false;			
	}
	
	else if (frm.hurl.value=="") {
		alert("블로그주소를 입력하셔야 합니다.");
		frm.hurl.focus();
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


