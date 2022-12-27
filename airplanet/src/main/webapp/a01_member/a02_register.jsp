<%@page import="vo.DB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"    
    import="vo.*" 
  	import="dao.*" 
   %>
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

<%
String email = request.getParameter("email");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String tel = request.getParameter("tel");

A_regMem rm = new A_regMem();
rm.regMem(email, pw, name, tel);
%>



</body>
<script>
if(true){
	location.href="1002_signin.jsp"
}
</script>
</html>