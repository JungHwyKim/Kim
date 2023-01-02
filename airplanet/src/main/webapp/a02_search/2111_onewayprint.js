
// 태평양 표준시로 바꿔서 계산하기..
var dDate1 = document.querySelectorAll(".dDate1")
var fHour1 = document.querySelectorAll(".fHour1")
var airlinelogo1 = document.querySelectorAll(".airlinelogo1")
var dCode1 = document.querySelectorAll(".dCode1")
var aCode1 = document.querySelectorAll(".aCode1")

var dDate2 = document.querySelectorAll(".dDate2")
var fHour2 = document.querySelectorAll(".fHour2")
var airlinelogo2 = document.querySelectorAll(".airlinelogo2")
var dCode2 = document.querySelectorAll(".dCode2")
var aCode2 = document.querySelectorAll(".aCode2") 
var totprice = document.querySelectorAll(".totprice")

var returnJson = []
flightOb1.forEach(function(fa1){
		var rt={}
		rt.dDate1 = fa1.departDate
		rt.fHour1 = fa1.flightHours
		rt.airlinelogo1 = fa1.airlinelogo
		rt.dCode1 = fa1.departAirportcode
		rt.aCode1 = fa1.arrivetAirportcode
		rt.dpTime1 = fa1.departPacifictime
		rt.apTime1 = fa1.arrivePacifictime
		// 도착 시간 어떻게 할것인지..
		//rt.aDate1 = fa1.departDate
		//rt.aDate1.setMinutes(rt.aDate1.getMinutes()+(fa1.departPacifictime-fa1.arrivePacifictime+fa1.flightHours)*60)
		
		//console.log(rt.dDate1)
		//console.log(rt.aDate1)
		rt.totprice = fa1.standardFee + fa1.classFee
		i++;
		returnJson.push(rt)
	})


// 최저가 순으로 일단 정렬
function sortMinprice(){
	returnJson.sort(function(left,right){
		return left.totprice- right.totprice;
	})	
}
// 짧은 비행시간 순으로 정렬
function sortFlighhours(){
	returnJson.sort(function(left,right){
		return left.fHour1- right.fHour1;
	})	
}
//빠른 출발시간 순으로 정렬
function sortDepartime(){
	returnJson.sort(function(left,right){
		return left.dDate1- right.dDate1;
	})	
}
// 화면에 출력	
var i=0;
returnJson.forEach(function(rt){
	dDate1[i].innerText= rt.dDate1.toLocaleString()
	fHour1[i].innerText= parseInt(rt.fHour1)+"시간 "+(rt.fHour1%1)*60+"분"
	airlinelogo1[i].src= rt.airlinelogo1
	dCode1[i].innerText = rt.dCode1
	aCode1[i].innerText = rt.aCode1
	totprice[i].innerText = rt.totprice
	i++;
})