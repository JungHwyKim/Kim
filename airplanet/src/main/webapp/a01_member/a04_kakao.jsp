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
<script>
/*
 
 */
</script>
</head>
<body>
<c:set var="profile_name" scope="session" value="${param.profile_name}"/> 
${profile_name}
</body>
<script>

if(localStorage.getItem('lastPage')){
	var lastPage = localStorage.getItem('lastPage')
}
 
 var pass = '${profile_name}'
if(pass != ''){
	location.href=lastPage
}else{
	location.href="/a01_member/1002_signin.jsp"
}
</script>
</html>