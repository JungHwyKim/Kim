
var showswitch = document.querySelectorAll('.showswitch')

function showswitching(targetidx,selfidx,dsp,innertexttargetid,innertext,actionchange){
	let showswitchtargets = document.querySelectorAll('.showswitchtarget')
	showswitchtargets[targetidx].style.display= dsp;	//none이면 안보이고 공백이면 보임
	btnon(showswitch[selfidx])
	let otherbtn= (selfidx%2==0)?Number(selfidx)+1:selfidx-1;
	btnoff(showswitch[otherbtn])
	if(innertexttargetid!=''){
		let innertextid = document.querySelector('#'.concat(innertexttargetid))
		innertextid.innerText= innertext;}
	if(actionchange!=''){
		let form = document.querySelector('form')
		form.action= actionchange;}
}	
	
	
function btnon(self){
self.classList.remove('btn-secondary');
self.classList.add('btn-primary');
}
function btnoff(self){
self.classList.remove('btn-primary');
self.classList.add('btn-secondary');
}


