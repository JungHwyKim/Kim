/*3. 마일리지랑 카드 할인 금액 변경  */
/*myMileage는 js밖에서 el태그로 불러옴*/
	var mileageinputs = document.querySelectorAll('#mileageinput input')
 	var finalmileage =document.querySelector('#finalmileage')
 	var finaldiscountcard = document.querySelector('#finaldiscountcard')
	//마일리지 입력할때마다 금액 더 크면 입력 안되게 유효성
	function mileageValid(){
		var isitokay = (myMileage-mileageinputs[0].value >= 0)
		if(isitokay){
			mileageinputs[1].value = myMileage - mileageinputs[0].value //회원정보에서 불러온 마일리지에서 사용하는 마일리지 빼기
			this.classList.remove("is-invalid");
	        this.classList.add("is-valid");
	        //최종금액칸에서 금액도 변경
	       finalmileage.innerText = mileageinputs[0].value
		}else{
			this.classList.remove("is-valid");
			this.classList.add("is-invalid");
			mileageinputs[0].value = 0;
			mileageinputs[1].value = myMileage;
			finalmileage.innerText = 0;
		}
	finalpriceapply()	
	}
	
	//만원 이상 있을때만 사용 가능 
mileageminimum()
function mileageminimum(){
	if(mileageinputs[1].value<10000||mileageinputs[1].value==''){
		mileageinputs[0].readOnly=true
		mileageinputs[0].classList.add("input-group-text");
		mileageinputs[0].classList.remove("form-control");
		
	}
}


//카드정보입력칸 바뀔때, 
function discountcardapply (cardvalue){
	var discountcardamounts = document.querySelectorAll('#discountcard div')
	for(var i in discountcard){
		if(discountcard[i].value==cardvalue){
			let dcamount = discountcardamounts[i].innerText
			finaldiscountcard.innerHTML=dcamount.replace('원','')
			break;
			}else{
				finaldiscountcard.innerHTML=0
			}
	}
}

function finalpriceapply(){
	let finalprice=document.querySelector('#finalprice')
	let mileage1 = finalmileage.innerText
	let mileage2 = mileage1.replace(',','')
	let card1 = finaldiscountcard.innerText
	let card2 = card1.replace(',','')
	finalprice.innerText=(originalPrice-mileage2-card2).toLocaleString()
	let cardPromotion=document.querySelector('[name=cardPromotion]')
	cardPromotion.value=card2
}