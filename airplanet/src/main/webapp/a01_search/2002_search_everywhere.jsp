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
<link href="/a00_com/a01_common.css" rel="stylesheet">
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
  	<jsp:include page="header.html"></jsp:include>
  	
  		<p class="text-md-end">예상 최저 가격일 뿐입니다. 최근 8일 내에 검색한 결과입니다.</p>
  		
  		
  		<div class="accodion-item d-grid gap-2">
  		
  		 <button class="btn btn-light" type="button">
  			<div class="accodion-header d-flex">
  				<span class="p-2 flex-grow-1">대한민국</span><span class="p-2">44286부터</span><span class="material-symbols-outlined p-2">expand_more</span>
  			</div></button>
  			
  			<button type="button" class="accodion-con-btn">
  			<div class="accodion-body">
  			<div class="card mb-12" >
			  <div class="row g-0">
			    <div class="col-md-4">
			      <img src="/b01_img/jeju.jpg" class="img-fluid rounded-start" alt="...">
			    </div>
			    <div class="col-md-8">
			      <div class="card-body">
			        <h5 class="card-title">제주</h5>
			        <p class="card-text"><small class="text-muted">직항</small></p>
			        <p class="card-text d-flex justify-content-between" >
			        <span class="material-symbols-outlined">flight_takeoff</span>
			        <span>44,555부터</span></p> 
			      </div>
			    </div>
			  </div>
			</div>
  			</div></button>
  	</div>
  	
  		<div class="accodion-item d-grid gap-2">
  		 <button class="btn btn-light" type="button">
  			<div class="accodion-header d-flex">
  				<span class="p-2 flex-grow-1">일본</span><span class="p-2">32488부터</span><span class="material-symbols-outlined p-2">expand_more</span>
  			</div></button>
  			<button type="button" class="accodion-con-btn">
  			<div class="accodion-body">
  			<div class="card mb-12">
			  <div class="row g-0">
			    <div class="col-md-4">
			      <img src="/b01_img/fukuoka.jpg" class="img-fluid rounded-start" alt="..."></div>
			    <div class="col-md-8">
			      <div class="card-body">
			        <h5 class="card-title">후쿠오카</h5>
			        <p class="card-text"><small class="text-muted">직항</small></p>
			        <p class="card-text d-flex justify-content-between" >
			        <span class="material-symbols-outlined">flight_takeoff</span>
			        <span>327,388부터</span></p> 
			      </div>
			    </div>
			  </div>
			</div>
  			</div></button>
  			<button type="button" class="accodion-con-btn">
  			<div class="accodion-body">
  			<div class="card mb-12" >
			  <div class="row g-0">
			    <div class="col-md-4">
			      <img src="/b01_img/osaka.jpg" class="img-fluid rounded-start" alt="..."></div>
			    <div class="col-md-8">
			      <div class="card-body">
			        <h5 class="card-title">오사카</h5>
			        <p class="card-text"><small class="text-muted">직항</small></p>
			        <p class="card-text d-flex justify-content-between" >
			        <span class="material-symbols-outlined">flight_takeoff</span>
			        <span>396,096부터</span></p> 
			      </div>
			    </div>
			  </div>
			</div>
  			</div></button>
  			<button type="button" class="accodion-con-btn">
  			<div class="accodion-body">
  			<div class="card mb-12">
			  <div class="row g-0">
			    <div class="col-md-4">
			      <img src="/b01_img/tokyo.jpg" class="img-fluid rounded-start" alt="..."></div>
			    <div class="col-md-8">
			      <div class="card-body">
			        <h5 class="card-title">도쿄</h5>
			        <p class="card-text"><small class="text-muted">직항</small></p>
			        <p class="card-text d-flex justify-content-between" >
			        <span class="material-symbols-outlined">flight_takeoff</span>
			        <span>490,523부터</span></p> 
			      </div>
			    </div>
			  </div>
			</div>
  			</div></button>  			  			
  		
  	
  	
  	
  	</div>
  	
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