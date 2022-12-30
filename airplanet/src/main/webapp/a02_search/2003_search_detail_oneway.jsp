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
<link href="2003.css" rel="stylesheet">
</head>
<body>
	
	<div class="container">
	<jsp:include page="/header.jsp"></jsp:include>
	<%
	String city = request.getParameter("city");
	session.setAttribute("city", city);
	%>
	
	<div class="row">
	<div class="col-4"> <!-- 왼쪽 내용 -->
	<a class="d-block p-2" href="*">달력/차트보기</a>
	<button type="button" class="btn btn-primary btn-lg">가격 변동 알림 받기</button>
	
	<div class="accodion">
	<!-- 경유 -->
	 <div class="accodion-item d-grid gap-3 act">
  		 <button class="btn btn-secondary" type="button">
  			<div class="accodion-header d-flex justify-content-between">
  				<span>경유</span><span class="material-symbols-outlined">expand_more</span>
  			</div></button>
  		<div class="accodion-body">
  		 <input class="form-check-input" name="via" type="checkbox" value="직항" checked="checked" >
  		 <label class="form-check-label">
    	 <span>직항</span><br><span>530,301부터</span>
  		 </label>
  		  <br><br>
  		 <input class="form-check-input" name="via"  type="checkbox" value="1회경유" checked="checked" >
  		 <label class="form-check-label">
    	 <span>1회 경유</span><br><span>603,200부터</span>
  		 </label> 		 
  		</div>
  		</div>
	 
	 <!-- 출발시간대 설정 -->
	 <div class="accodion-item d-grid gap-3 act">
  		 <button class="btn btn-secondary" type="button">
  			<div class="accodion-header d-flex justify-content-between">
  				<span>출발 시간대 설정</span><span class="material-symbols-outlined">expand_more</span>
  			</div></button>
  		<div class="accodion-body">
  		<!--  가는날 출발시간 -->
  			<div class="time-range">
  			<p class="time-set-head">가는날 출발시간</p>
			  <div class="multi-range-slider">
			    <!-- 진짜 슬라이더 -->
			    <p class="print-time"></p>
			    <input type="range" id="input-left" min="0" max="86400" step="1800" value="0" />
			    <input type="range" id="input-right" min="0" max="86400" step="1800" value="86400" />
			
			    <!-- 보이는 슬라이더 -->
			    <div class="slider">
			      <div class="track"></div>
			      <div class="range"></div>
			      <div class="thumb left"></div>
			      <div class="thumb right"></div>
			    </div>
			  </div>
			</div><br>

	</div>
	
	
	</div>
	
	 <div class="accodion-item d-grid gap-3 act">
  		 <button class="btn btn-secondary" type="button">
  			<div class="accodion-header d-flex justify-content-between">
  				<span>항공사</span><span class="material-symbols-outlined">expand_more</span>
  			</div></button>
  		<div class="accodion-body">
  		 <input class="form-check-input" type="checkbox" value="" >
  		 <label class="form-check-label">
    	 <span>대한항공(KAL)</span><br><span>660,301부터</span>
  		 </label>
  		  <br><br>
  		</div>
	
	</div>
	
	</div>
	

	</div>
	
	<div class="col-8"> <!-- 오른쪽 내용 -->
		<div class="row">
		<div class="d-flex w-100 justify-content-between">	
		<span>1231개의 결과</span>
		<label>정렬기준   <select class="form-select">
		  		 	<option selected>추천순</option>
		  		 	<option>최저가순</option>
		  		 	<option>최단여행시간순</option>
		  		 	<option>출국:출발시간</option>
		  		 	<option>귀국:출발시간</option>
				 </select></label>
		</div>
		</div>
		<div class="row">
			<div class="btn-group">
			  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" value="추천순" checked >
			  <label class="btn btn-outline-primary" for="btnradio1">
				  <div class="card-body">
				   <p class="card-text">추천순</p>
				    <h5 class="card-title">530,300</h5>
				    <h6 class="card-subtitle mb-2 text-muted">2시간25분(평균)</h6>
				  </div>
			  </label>		
			  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" value="최저가">
			  <label class="btn btn-outline-primary" for="btnradio2">
				  <div class="card-body">
				   <p class="card-text">최저가</p>
				    <h5 class="card-title">530,300</h5>
				    <h6 class="card-subtitle mb-2 text-muted">2시간25분(평균)</h6>
				  </div>		  
			  </label> 
			  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" value="최단여행시간">
			  <label class="btn btn-outline-primary" for="btnradio3">
				  <div class="card-body">
				   <p class="card-text">최단여행시간</p>
				    <h5 class="card-title">789,250</h5>
				    <h6 class="card-subtitle mb-2 text-muted">2시간10분(평균)</h6>
				  </div>		  
			  </label>
			</div>
			
			
		</div>
		
		<div class="row" id="print-search"> </div>
		
			
	
	
	</div>
	</div>
	
	</div>
	
	
	<jsp:include page="footer.html"></jsp:include>
</body>

<script>
// 경유 checkbox value값 추출
var via = document.querySelectorAll("[name=via]")
via.forEach(function(v){
	v.onchange= function(){
		via.forEach(function(vv){
			if(vv.checked) console.log(vv.value)
		})
	}
})

// 추천순/최저가/최단여행 변하는것
var btnradio = document.querySelectorAll("[name=btnradio]")
btnradio.forEach(function(btn){
	btn.onchange= function(){
		btnradio.forEach(function(b){
			if(b.checked) console.log(b.value)
		})
	}
})




// 아코디언 펼치기
var accodion = document.querySelectorAll(".accodion-item")
var accodionHead = document.querySelectorAll(".btn-secondary")

accodionHead.forEach(function(acc){
	acc.onclick = function(){
		if(this.parentNode.classList.contains('act')){
			this.parentNode.classList.remove('act');
		}else{
			this.parentNode.classList.add('act');
		}	
	}
})

// 출발시간, 도착시간 설정(가는날 출발시간)
var inputLeft = document.querySelector("#input-left");
var inputRight = document.querySelector("#input-right");
var thumbLeft = document.querySelector(".slider > .thumb.left");
var thumbRight = document.querySelector(".slider > .thumb.right");
var range = document.querySelector(".slider > .range");
var p = document.querySelector(".print-time")

function printTime(){
	var rHour = Math.floor((Math.floor(inputRight.value) > 84600? 86340 : Math.floor(inputRight.value))/3600)
	var rMin = inputRight.value > 84600 ? 59 : (inputRight.value%3600)/60
    var lefthour= Math.floor(inputLeft.value/3600)
    var righthour= rHour // 수정한 부분
    var leftminute = (inputLeft.value%3600)/60
    var rightminute = rMin // 수정한 부분

	if(leftminute==0&&rightminute==0){
		p.innerText = lefthour+":"+leftminute+"0 - "+righthour+":"+rightminute+"0"
	}else if(leftminute==0){
		p.innerText = lefthour+":"+leftminute+"0 - "+righthour+":"+rightminute
	}else if(rightminute==0){
		p.innerText = lefthour+":"+leftminute+" - "+righthour+":"+rightminute+"0"
	}else{
		p.innerText = lefthour+":"+leftminute+" - "+righthour+":"+rightminute
	}
}

function setLeftValue(){	
  var [min, max] = [parseInt(inputLeft.min), parseInt(inputLeft.max)];
  inputLeft.value = Math.min(parseInt(inputLeft.value), parseInt(inputRight.value) - 1800);
  var percent = ((inputLeft.value - min) / (max - min)) * 100;
  thumbLeft.style.left = percent + "%";
  range.style.left = percent + "%";
  printTime()
};

function setRightValue (){
  var [min, max] = [parseInt(inputRight.min), parseInt(inputRight.max)];   
  inputRight.value = Math.max(parseInt(inputRight.value), parseInt(inputLeft.value) + 1800);
  var percent = ((inputRight.value - min) / (max - min)) * 100;
  thumbRight.style.right = 100 - percent + "%";
  range.style.right = 100 - percent + "%";
  printTime()
};
printTime()
inputLeft.addEventListener('input', setLeftValue);
inputLeft.addEventListener('input', printSearch);
inputRight.addEventListener('input', setRightValue);
inputRight.addEventListener('input', printSearch);

printSearch()
//print-search에 값 출력
function printSearch(){
	var xhr = new XMLHttpRequest()
	var lVal = inputLeft.value
	var rVal = inputRight.value
	var qstr = "?inputLeft="+lVal+"&inputRight="+rVal
	xhr.open("get","2003_search_detail_printrange_oneway.jsp"+qstr,true) 
	xhr.send()
	xhr.onreadystatechange = function (){
		if(xhr.readyState == 4 && xhr.status == 200){
			console.log(xhr.responseText)
			document.querySelector("#print-search").innerHTML = xhr.responseText
			var script = document.querySelector("#inscript") // 자바스크립트 가져오기...
			eval(script.innerHTML)
		}
	}
}



</script>
</html>