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
<div style="margin-left:10%;width:80%;">
		<jsp:include page="/header.jsp" flush="true"/> 	
</div>
<%
	String departlocation = request.getParameter("departlocation");
	String arrivelocation = request.getParameter("arrivelocation");
	String departdate = request.getParameter("departdate");
	String arrivedate = request.getParameter("arrivedate");
	String classP = request.getParameter("classP");
	String cnt = request.getParameter("cnt");
%>
출발지:<%=departlocation %><br>
도착지:<%=arrivelocation %><br>
출발일자:<%=departdate %><br>
도착일자:<%=arrivedate %><br>
등급:<%=classP %><br>
인원:<%=cnt %><br>
</body>
<script>

</script>
</html>