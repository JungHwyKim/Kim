<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
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
<link href="2003.css" rel="stylesheet">
<style>
.row{
	margin-left: 16px;
	margin-right: 16px;
}

</style>
</head>
<body>

		<div class="row">	
			<div class="card">
			  <div class="card-body schedule">
			    <div class="row">
				  	<div class="col-8">
				  		<div class="row">
				  			<div class="col-3"><img src="/b01_img/logo_airseoul.jpg" width="100%"></div>
				  			<div class="col-9">
				  				<div class="row">
				  					<div class="col-4 topleft">출발시간</div>
				  					<div class="col-4 topcenter">비행시간</div>
				  					<div class="col-4 topright">도착시간</div>
				  				</div>
				  				<div class="row">
				  					<div class="col-4 botleft">출발공항코드</div>
				  					<div class="col-4 botcenter">직항/경유</div>
				  					<div class="col-4 botright">도착공항코드</div>
				  				</div>				  				
				  			</div>
				  		</div>
				  		<div class="row">
				  			<div class="col-3"><img src="/b01_img/logo_airseoul.jpg" width="100%"></div>
				  			<div class="col-9">
				  				<div class="row">
				  					<div class="col-4 topleft">출발시간</div>
				  					<div class="col-4 topcenter">비행시간</div>
				  					<div class="col-4 topright">도착시간</div>
				  				</div>
				  				<div class="row">
				  					<div class="col-4 botleft">출발공항코드</div>
				  					<div class="col-4 botcenter">직항/경유</div>
				  					<div class="col-4 botright">도착공항코드</div>
				  				</div>						  			
				  			</div>
				  		</div>				  		
				     </div>
				     <div class="col-4 schedule-right">
						<p class="text-center topcenter">총 9건중 최저가</p>
						<p class="text-center fw-semibold">530,300</p>
						<button type="button" class="btn btn-secondary"><span>선택</span><span class="material-symbols-outlined align-middle">arrow_forward</span></button>
				     </div>
			     </div>
			  </div>
			</div>	
		</div>

</body>
<script type="text/javascript">

</script>
</html>