<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/a00_com/a01_common.css" rel="stylesheet">
<script type="text/javascript"></script>
</head>
<body>


<div class="show1"></div>
<script>
var show1=document.querySelector(".show1");

var departTimes=[]
var arriveTimes=[]

departTimes.push(new Date(2022,10,10,20,11,44))
departTimes.push(new Date(2022,10,10,28,11,44))
arriveTimes.push(new Date(2023,1,2,8,20,44))

departTimes.forEach(function(dd){console.log('departTimes: '+dd.toLocaleString())})
arriveTimes.forEach(function(dd){console.log('arriveTimes: '+dd.toLocaleString())})
</script>
</body>
</html>