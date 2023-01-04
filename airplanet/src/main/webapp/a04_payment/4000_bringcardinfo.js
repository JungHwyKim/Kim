
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
				finalpriceapply();
					
		}})

		//select옵션인 요소 할부	
 var cardinstallmentopts = document.querySelectorAll('[name=cardinstallment] option')
 	cardinstallmentopts.forEach(function(insopt){
		if(insopt.value==cardjson['cardinstallment']){
			insopt.selected = true;
			document.querySelector('[name=cardinstallment]').readOnly=true;
			}
		})
			
//못바꾸게
		inputs.forEach(function(thisinput){
		thisinput.readOnly=true;
		})
		discountcard.forEach(function(thisinput){
		thisinput.readOnly=true;
		})
		
	}else{
//체크해제하면 readOnly 해제
		inputs.forEach(function(thisinput){
		thisinput.readOnly=false;
		})
		discountcard.forEach(function(thisinput){
		thisinput.readOnly=false;
		})
		cardcorporate.readOnly=false;
		document.querySelector('[name=cardinstallment]').readOnly=false;
	}
	
	let cardcorporate2= document.querySelector('[name=cardcorporate2]')
	cardcorporate2.value=cardcorporate.value
}
