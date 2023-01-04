<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"    
    import="vo.*" 
    import="dao.*"
   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
request.setCharacterEncoding("utf-8");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
</head>
<jsp:useBean id="dao" class="dao.A_signinCheck"/>
<jsp:useBean id="reg" class="vo.AirMember"/>
<jsp:setProperty property="*" name="reg"/>
<body>
<h2>${dao.login(reg)}</h2>
<c:if test="${not empty dao.login(reg)}">
      <c:set var="reg2" scope="session" value="${dao.login(reg)}"/> 
</c:if>
</body>
<script>
var lastPage = ""
if(localStorage.getItem('lastPage')){
	lastPage = localStorage.getItem('lastPage')
}

var pass = '${reg2.email}'
if(pass != ''){
	location.href=lastPage
}else{
	location.href="/a01_member/1002_signin.jsp"
}

</script>
</html>