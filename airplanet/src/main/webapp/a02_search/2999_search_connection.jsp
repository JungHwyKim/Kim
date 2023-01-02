<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
	import="jspexp.a13_database.vo.*"
	import="jspexp.a13_database.*"
    %>
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%> 
<fmt:requestEncoding value="utf-8"/>   
<% request.setCharacterEncoding("utf-8"); %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">

</head>
<body>
${param.flightNumber }
${param.departDate }
${param.arriveDate }
${param.departAirportcode }
${param.arriveAirportcode }
${param.airlinelogo }


</body>
<script type="text/javascript">
/*
 
 */
</script>
</html>