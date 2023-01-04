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
<c:set var="naver_id" scope="session" value="${param.id}"/> 
<c:set var="naver_name" scope="session" value="${param.name}"/> 
</body>
<script>
if(localStorage.getItem('lastPage')){
	var lastPage = localStorage.getItem('lastPage')
}
window.opener.location.href = lastPage
window.close()
</script>
</html>