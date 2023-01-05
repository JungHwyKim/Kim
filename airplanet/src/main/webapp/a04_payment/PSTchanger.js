/**
show2.innerHTML = PSTchanger('2022-12-30 20:00:00.000',8)
 */
 

 function PSTchanger(newtime,pst){
 	let newday = new Date(newtime.substr(0,4),newtime.substr(5,2)-1,
				newtime.substr(8,2), 
				Number(newtime.substr(11,2))+pst,
				newtime.substr(14,2),
				newtime.substr(17,2))
	return newday.toLocaleString();
		}