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
<%
	String departlocation = request.getParameter("departlocation");
	String arrivelocation = request.getParameter("arrivelocation");
	String departdate = request.getParameter("departdate");
	String arrivedate = request.getParameter("arrivedate");
	String classP = request.getParameter("classP");
	String cnt = request.getParameter("cnt");
%>
<%=departlocation %>
<%=arrivelocation %>
<%=departdate %>
<%=arrivedate %>
<%=classP %>
<%=cnt %>
</body>
<script>
/*

 */
</script>
</html>