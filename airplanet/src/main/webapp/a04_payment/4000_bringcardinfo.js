var cardjson={
		"cardownertype": "법인",
		"cardownernation":"내국인",
		"cardcorporate":"삼성카드",
		"cardinstallment":"12",
		"cardnumber":"4444222211115666",
		"cardYY":"26",
		"cardMM":"11",
		"cardownername":"김박박",
		"cardbirthday":"2000-02-10",
		"cardpassword":"23",
		"cardmf":"f"}

function bringcardinfo(self){
	var inputs=document.querySelectorAll('#cardinfo input')
	if(self.checked==true){
	//불러오기 눌렀을때
		if(cardjson['cardownertype']=="개인"){
			inputs[0].checked=true;
		}else{
			inputs[1].checked=true;
		}
		if(cardjson['cardownernation']=="내국인"){
			inputs[2].checked=true;
		}else{
			inputs[3].checked=true;
		}
		inputs[4].value=cardjson['cardnumber']
		inputs[5].value=cardjson['cardYY']
		inputs[6].value=cardjson['cardMM']
		inputs[7].value=cardjson['cardownername']
		inputs[8].value=cardjson['cardbirthday']
		inputs[9].value=cardjson['cardpassword']

		if(cardjson['cardmf']=="m"){
			inputs[10].checked=true;
		}else{
			inputs[11].checked=true;
		}

		//select옵션인 요소 카드회사
	cardcorporateopts.forEach(function(coropt){
		if(coropt.value==cardjson['cardcorporate']){
			coropt.selected = true;
		//카드사할인
			discountcardbyselectedcard();
			cardcorporate.disabled=true;
			discountcardapply(cardcorporate.value);
					
		}})

		//select옵션인 요소 할부	
 var cardinstallmentopts = document.querySelectorAll('[name=cardinstallment] option')
 	cardinstallmentopts.forEach(function(insopt){
		if(insopt.value==cardjson['cardinstallment']){
			insopt.selected = true;
			document.querySelector('[name=cardinstallment]').disabled=true;
			}
		})
//못바꾸게
		inputs.forEach(function(thisinput){
		thisinput.disabled=true;
		})
		discountcard.forEach(function(thisinput){
		thisinput.disabled=true;
		})
		
	}else{
//체크해제하면 disabled 해제
		inputs.forEach(function(thisinput){
		thisinput.disabled=false;
		})
		discountcard.forEach(function(thisinput){
		thisinput.disabled=false;
		})
		cardcorporate.disabled=false;
		document.querySelector('[name=cardinstallment]').disabled=false;
	}
}

/* 탑승자정보 불러오기 */
function bringPassengerinfo(){	//db에서 정보 불러와서 넣기
 	let psginputs =document.querySelectorAll('#passengerinfoset input')
 	psginputs[0].value='김박박';
 	psginputs[1].value='Kim';
 	psginputs[2].value='bakbak';
 	psginputs[3].value='2222-10-01';
 	if('m'=='f'){psginputs[4].checked=true;}
 	if('f'=='f'){psginputs[5].checked=true;}
 	psginputs[6].value='m485465312';
 	psginputs[7].value='2023-10-01';
 	psginputs[8].value='한국';
 	psginputs[9].value='북한';
 }
