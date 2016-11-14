
var sub = true;

function membercheck_ok() {
	
	var frm = document.frm;
	
	if (frm.mid.value.length < 4 ) {
		alert("아이디는 4자 이상으로 입력해주세요");
		frm.mid.focus();
		return false;
	}
	
	else if ((frm.cid.value != frm.mid.value) || frm.cid.value == "") {
		alert("아이디 중복 체크 해주세용");
		frm.mid.focus();
		return false;			
	}
	
	else if (frm.mpw.value.length < 4) {
		alert("비밀번호는 4자 이상으로 입력해주세요.");
		frm.mpw.focus();
		return false;			
	}

	else if (frm.rempw.value != frm.mpw.value) {
		alert("비밀번호가 일치하지 않습니다.");
		frm.rempw.focus();
		return false;			
	}
	
	else if (frm.mnm.value == "") {
		alert("이름을 입력해주세요.");
		frm.mnm.focus();
		return false;			
	}
	
	else if (frm.mphone.value.length < 10) {
		alert("전화번호를 끝까지 입력하셔야 합니다.");
		frm.mphone.value= "";
		frm.mphone.focus();
		return false;			
	}
	
	else if (isNaN(frm.mphone.value)) {
		alert("전화번호는 숫자로 입력하셔야 합니다.");
		frm.hphone.value= "";
		frm.hphone.focus();
		return false;			
	}
	
	else if (frm.firstmemail.value=="") {
		alert("이메일을 입력하셔야 합니다.");
		frm.firstmemail.focus();
		return false;			
	}
	
	else if(!sub){
		return false;
	}
	
	sub = false;
	
	return true;
}