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
<style type="text/css">
.pList{
	background:rgba(200,200,200,0.5);
	font-weight:600;
	width:250px;
	height:10%;
	border:1px solid #cccccc;
}
.pList:hover{
	background:#aaaaaa;
	color:white;
	font-weight:600;
}
.place{
	margin-left:5%;
}
</style>
</head>
<body>
<jsp:useBean id="dao" class="dao.A_searchAp"></jsp:useBean>
<c:forEach var="schMain" items="${dao.search(param.apnation) }">
	<div class="pList"><span class="place">${schMain.apNation }, ${schMain.apCity }</span></div>
</c:forEach>
</body>
<script>

</script>
</html>