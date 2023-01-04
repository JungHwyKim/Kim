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
<%--

 --%>

</body>
<script type="text/javascript">
var depC="ICN"
var ddateOb="2022-12-21"
var adateOb="2022-12-30"
var arriv="미국"
var arvC="FUK"
var optOb="ec"
var cnt=4
go()
//왕복
function go(){
	/*
	var qstr="?departlocation="+depC+"&arrivelocation=&departdate="+ddateOb+
	"&arrivedate="+adateOb+"&cnt="+cnt
	
	location.href="2002_search_everywhere.jsp"+qstr
	
	//왕복 city
	var qstr="?departlocation="+depC+"&arrivelocation="+arriv+"&departdate="+ddateOb+
			"&arrivedate="+adateOb+"&cnt="+cnt

	location.href="2001_search_cityJSON.jsp"+qstr
	
	
	//왕복 detail*/
	var qstr="?departlocation="+depC+"&arrivelocation="+arvC+"&departdate="+ddateOb+
			"&arrivedate="+adateOb+"&classP="+optOb+"&cnt="+cnt

	location.href="2003_search_detailrangeExpJSON.jsp"+qstr/*
	
	
	//편도 everywhere*//*
	var qstr="?departlocation="+depC+"&arrivelocation=&departdate="+ddateOb+
			"&classP="+optOb+"&cnt="+cnt

	location.href="2002_search_everywhere_oneway.jsp"+qstr
	
	//편도 city 
	var qstr="?departlocation="+depC+"&arrivelocation="+arriv+"&departdate="+ddateOb+
			"&classP="+optOb+"&cnt="+cnt

	location.href="2001_search_city_onewayJSON.jsp"+qstr
	//편도 detail
	var qstr="?departlocation="+depC+"&arrivelocation="+arvC+"&departdate="+ddateOb+
			"&classP="+optOb+"&cnt="+cnt

	location.href="2003_search_detail_onewayJSON.jsp"+qstr*/
	
}


</script>
</html>