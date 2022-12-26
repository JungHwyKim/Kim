<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
 <link href="bs-custom.css" rel="stylesheet" >
<style>
.btn-light{
	padding: 30px 15px 30px 15px;
  --bs-btn-color: #000;
  --bs-btn-bg: lightgray;
  margin-bottom: 3px;
  margin-top: 3px;
}
.accodion-con-btn{
	border: 0;
	outline: 0;
	background: transparent;
	display: none;
}
.act .accodion-con-btn{
	display: block;
	padding:0;
}
.flex-grow-1{
	text-align: left;
}
.accodion-con-btn:active{
	border: 1px solid #828282;
	border-radius: 6px;
}
.accodion-header{
	font-size: 1.2rem;
	padding-top: 0.5%; 
	padding-bottom: 0.5%; 
}

</style>

</head>
<body>
	

  	<div class="container">
  	<jsp:include page="/header.jsp"></jsp:include>
  	
  		<p class="text-md-end">예상 최저 가격일 뿐입니다. 최근 8일 내에 검색한 결과입니다.</p>
  
  		<jsp:useBean id="daoE" class="dao.B_searcheverywhere"/>
  		<jsp:useBean id="schE" class="vo.FlightAll"/>
  		<jsp:setProperty property="*" name="schE"/>
  		${schE.setDepartDate("2022-12-21") } ${schE.setDepartLocation("인천") }
  		
  		<c:forEach var="byNation" items="${daoE.getMinfeeE(schE) }">
  		
  		  	<%-- dao.B_searcheverywherereturn  returnMinfeeE  왕복시 리턴 --%>
		  	<jsp:useBean id="daoR" class="dao.B_searcheverywherereturn"/>
		  	<jsp:useBean id="schR" class="vo.FlightAll"/>
		  	<jsp:setProperty property="*" name="schR"/>
		  	${schR.setDepartDate("2022-12-30") } ${schR.setDepartLocation(byNation.arriveApcity) }${schR.setArriveLocation("ICN") }
		    
  		
  		<div class="accodion-item d-grid gap-2">
  		
  		 <button class="btn btn-light" type="button">
  			<div class="accodion-header d-flex">
  				<span class="p-2 flex-grow-1">${byNation.arriveApcity }</span>
  				<c:forEach var="rPrice" items="${daoR.returnMinfeeE(schR) }" >
  		<%-- 편도가격 + 왕복 리턴가격 --%>
  				<c:set var= "total1" value="${rPrice.standardFee + byNation.standardFee}"/> 
  				<span class="p-2"><fmt:formatNumber value="${total1 }"/>부터</span></c:forEach>
  				<span class="material-symbols-outlined p-2">expand_more</span>
  			</div></button>
  			
		    <jsp:useBean id="daoN" class="dao.B_searchnation"/>
			<jsp:useBean id="schN" class="vo.FlightAll"/>
			<jsp:setProperty property="*" name="schN"/>
		  	${schN.setDepartDate("2022-12-21") } ${schN.setDepartLocation("인천") } ${schN.setArriveLocation(byNation.arriveApcity) }
		  	<c:forEach var="byCity" items="${daoN.getMinfeeN(schN) }">
  	
  			<button type="button" class="accodion-con-btn">
  			<div class="accodion-body">
  			<div class="card mb-12" >
			  <div class="row g-0">
			    <div class="col-md-4">
			      <img src="${byCity.arriveApphoto }" class="img-fluid rounded-start" alt="...">
			    </div>
			    <div class="col-md-8">
			      <div class="card-body">
			        <h5 class="card-title">${byCity.arriveApcity }</h5>
			        <p class="card-text"><small class="text-muted">직항</small></p>
			        <p class="card-text d-flex justify-content-between" >
			        <span class="material-symbols-outlined">flight_takeoff</span>
			        <span>${byCity.standardFee }부터</span></p> 
			      </div>
			    </div>
			  </div>
			</div>
  			</div></button></c:forEach>
  		</div>
  		</c:forEach>
  
  	
  	</div>

<jsp:include page="footer.html"></jsp:include>
</body>
<script type="text/javascript">
// 아코디언
var accodion = document.querySelectorAll(".accodion-item")
var accodionHead = document.querySelectorAll(".btn-light")

accodionHead.forEach(function(acc){
	acc.onclick = function(){
		if(this.parentNode.classList.contains('act')){
			this.parentNode.classList.remove('act');
		}else{
			this.parentNode.classList.add('act');
		}	
	}
})
</script>
</html>