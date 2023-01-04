<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<title>Insert title here</title>
</head>
<body>
</body>
<script>
var naver_id_login = new naver_id_login("RTYAK5wpHQ_5DXB8xM_e", "http://localhost:6080/a01_member/a05_naver.jsp");
naver_id_login.get_naver_userprofile("naverSignInCallback()");
function naverSignInCallback() {
	let id = naver_id_login.getProfileData('email');
	let name = naver_id_login.getProfileData('nickname');
	const userObj = { id: id, name: name };
	//window.close()
	location.href="a05_1_naver.jsp?id="+id+"&name="+name
	  
	  
}
</script>
</html>