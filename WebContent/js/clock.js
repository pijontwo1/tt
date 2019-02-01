window.onload=function(){
	printClock();

}

function printClock(){

	var clock=document.getElementById("clock");
	var currentDate=new Date();
	
	if(currentDate.getHours()>=10){
	var currentHours=currentDate.getHours();
	}else{
	var currentHours="0"+currentDate.getHours();
	}
	if(currentDate.getMinutes()>=10){
	var currentMinute=currentDate.getMinutes();
	}else{
	var currentMinute="0"+currentDate.getMinutes();
	}
	if(currentDate.getSeconds()>=10){
	var currentSeconds=currentDate.getSeconds();
	}else{
	var currentSeconds="0"+currentDate.getSeconds();
	}
	
	
	clock.innerHTML=currentHours+":"+currentMinute+":"+currentSeconds;
	
	setTimeout("printClock()",1000);
	

}