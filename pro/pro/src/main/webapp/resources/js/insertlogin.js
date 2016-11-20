
function logincheck_ok() {
	
	var frm = document.frm;
	
	if (frm.mid.value == "") {
		alert("아이디 입력해주세요");
		frm.mid.focus();
		return false;
	}
	
	else if (frm.mpw.value == "") {
		alert("비밀 번호를 입력해주세요.");
		frm.mpw.focus();
		return false;			
	}
	
	return true;
}





