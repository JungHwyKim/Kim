// 태평양 표준시로 바꿔서 계산하기..
var dDate1 = document.querySelectorAll(".dDate1")
var fHour1 = document.querySelectorAll(".fHour1")
var airlinelogo1 = document.querySelectorAll(".airlinelogo1")
var dCode1 = document.querySelectorAll(".dCode1")
var aCode1 = document.querySelectorAll(".aCode1")
var aDate1 = document.querySelectorAll(".aDate1")
var totprice = document.querySelectorAll(".totprice")

var returnJson = []
flightOb1.forEach(function(fa1){
		var rt={}
		rt.flightnumber1 = fa1.flightnumber
		rt.dDate1 = fa1.departDate
		rt.fHour1 = fa1.flightHours
		rt.airlinelogo1 = fa1.airlinelogo
		rt.dCode1 = fa1.departAirportcode
		rt.aCode1 = fa1.arrivetAirportcode
		rt.dpTime1 = fa1.departPacifictime
		rt.apTime1 = fa1.arrivePacifictime
		rt.aDate1 = new Date(fa1.departDate.getFullYear(),fa1.departDate.getMonth(),fa1.departDate.getDate(),fa1.departDate.getHours(),fa1.departDate.getMinutes())
		rt.aDate1.setMinutes(rt.aDate1.getMinutes()+(fa1.departPacifictime-fa1.arrivePacifictime+fa1.flightHours)*60)
		rt.totprice = fa1.standardFee + fa1.classFee
		returnJson.push(rt)
	})


// 최저가 순으로 일단 정렬
returnJson.sort(function(left,right){
	return left.totprice- right.totprice;
})

// 화면에 출력	
var i=0;
returnJson.forEach(function(rt){
	dDate1[i].innerText= rt.dDate1.toLocaleString()
	fHour1[i].innerText= parseInt(rt.fHour1)+"시간 "+(rt.fHour1%1)*60+"분"
	airlinelogo1[i].src= rt.airlinelogo1
	dCode1[i].innerText = rt.dCode1
	aCode1[i].innerText = rt.aCode1
	aDate1[i].innerText = rt.aDate1.toLocaleString()
	totprice[i].innerText = rt.totprice
	i++;
})

var secondaryArr = document.querySelectorAll(".btn-secondary")
secondaryArr.forEach(function(sec,idx){
	sec.onclick= function(){
		var qstr = "?flightNumber="+returnJson[idx].flightnumber1+"&departDate="+returnJson[idx].dDate1+
				"&arriveDate="+returnJson[idx].aDate1+"&departAirportcode="+returnJson[idx].dCode1+"&arriveAirportcode="+returnJson[idx].aCode1+
				"&airlinelogo="+returnJson[idx].airlinelogo1  
		location.href="2999_search_connection.jsp"+qstr
	}
})