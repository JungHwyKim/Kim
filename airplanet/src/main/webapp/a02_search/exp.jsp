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
var json= [{"num1":0,"num2":1},{"num3":2,"num4":3},{"nums1":0,"nums2":1},{"nums3":2,"nums4":3}]
var j1 =[]
var j2 =[]
console.log(json)
console.log(json.length)
json.forEach(function(f,idx){
	if(idx<json.length/2){
		j1.push(f)
		
	}else{
		j2.push(f)
	}
})
console.log(j1)

console.log(j2)


</script>
</html>