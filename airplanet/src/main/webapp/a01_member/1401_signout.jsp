<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"    
    import="jspexp.vo.*" 
  	import="jspexp.a13_database.*"
   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
</head>
<body>
<c:remove var="profile_name" scope="session" />
<h2>${profile_name }</h2>
</body>
<script src="http://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
//카카오 로그아웃
Kakao.init('42668abcd2ff093e3126085f52f5802c')
function kakaoLogout(){
	if(Kakao.Auth.getAccessToken()){
		Kakao.API.request({
			url:'/v1/user/unlink',
			success: function(response){
				console.log(response)
				
			},
			fail: function(error){
				console.log(error)
			},
		})
		Kakao.Auth.setAccessToken(undefined)
	}
}
kakaoLogout()
location.href = document.referrer;
</script>
</html>