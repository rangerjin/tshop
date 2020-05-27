<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String msg = (String) request.getAttribute("msg");
	String user_id = (String) request.getAttribute("user_id");
	String user_pwd = (String) request.getAttribute("user_pwd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title>food 24 로그인 폼</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<style>
.class {
	margin: auto;
}

#content {
	margin: auto;
}

body {
	margin: auto;
	width: 50%;
}

footer {
	width: 50%;
	text-align: center;
}
</style>
</head>

<body>
	<div id="content">
		<div class="logo" style="margin-left: 7%">
			<img src="/img/food24.png"
				style="background-position: center; background-repeat: no-repeat; background-size: cover; width: 200px; height: 200px;"
				alt="Logo">
		</div>
		<div class="main">
			<div class="card align-middle"
				style="width: 20rem; border-radius: 20px;">
				<div class="card-title" style="margin-top: 30px;">
					<h3 class="card-title text-center" style="color: #113366;">Food
						24 로그인</h3>
				</div>
				<div class="card-body">
					<form name="frm" class="form-signin" action="/food/loginPost.do"
						method="post">
						<label for="inputEmail" class="sr-only">아이디</label> <input
							type="text" id="user_id" name="user_id" class="form-control"
							placeholder="ID" required autofocus><BR> <label
							for="inputPassword" class="sr-only">비밀번호</label> <input
							type="password" id="user_pwd" name="user_pwd"
							class="form-control" placeholder="Password" required><br>

						<button id="btn-Yes" class="btn btn-lg btn-primary btn-block"
							type="submit">로 그 인</button>
					</form>
					<br>
					<br>
					<div class="row forGotPassword">
						<a class="aa" href="/food/find_id_form.do">&nbsp;&nbsp;아이디 찾기
						</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a class="aa"
							href="/food/find_pw_form.do"> 비밀번호 찾기 </a>&nbsp;&nbsp;|&nbsp;&nbsp;
						<a class="aa" href="/food/regTest.do"> 회원가입 </a>
					</div>

				</div>
			</div>
			<br> <br> <br>
			<div style="margin-right: 30%">
				<footer class="footer">
					<label>Food 24</label> |  <label>Project</label> 
					<p>Copyright © 2019.12 poly data-analyze</p>
				</footer>
			</div>
		</div>
	</div>
</body>
<script>
		function login() {
			var id = $('#user_id').val();
			var pwd = $('#user_pwd').val();
			
			if (id.length==0) {
				alert("아이디를 입력하세요");
				$('#user_id').focus();
				return;
			}
			
			if (pwd.length==0) {
				alert("패스워드를 입력하세요");
				$('#user_pwd').focus();
				return;
			}
			
		}
		
		<%if (msg != null && !msg.equals("")) {%>
			alert('<%=msg%>');
		<%}%>
		<%if (user_id != null && !user_id.equals("")) {%>	
			
			var user_id = "회원님의 아이디는 '<%=user_id%>' 입니다";
			alert(user_id)
		<%}%>
		<%if (user_pwd != null && user_pwd != "") {%>	
			var user_pwd = "회원님의 비밀번호는" + <%=user_pwd%>+ "입니다";
			alert(user_pwd);
		<%}%>
	
</script>
</html>