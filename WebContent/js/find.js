
function findId() {
	var email = $('#user_email').val();
	var name = $('#user_name').val();
	
	if (email.length==0) {
		alert("이메일을 입력하세요");
		$('#user_email').focus();
		return;
	}
	
	if (name.length==0) {
		alert("이름을 입력하세요");
		$('#user_name').focus();
		return;
	}
	
	document.idfrm.action = "findId";
	document.idfrm.submit();
	
}

function findPassword() {
	
	var id = $('#pass_user_id').val();
	var email = $('#pass_user_email').val();
	var name = $('#pass_user_name').val();
	
	if (id.length==0) {
		alert("아이디를 입력하세요");
		$('#pass_user_email').focus();
		return;
	}
	
	if (email.length==0) {
		alert("이메일을 입력하세요");
		$('#pass_user_email').focus();
		return;
	}
	
	if (name.length==0) {
		alert("이름을 입력하세요");
		$('#pass_user_name').focus();
		return;
	}
	
	document.passfrm.action = "findPassword";
	document.passfrm.submit();
	
}