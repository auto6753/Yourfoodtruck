$(document).ready(function() {
			$(document.body).on("click",".truck_code",function(){
				var temp = $(this);
				var truck_code = temp.find('input').val();
				window.open("/truck/?truck_code='"+truck_code+"'","PopupWin");
				
			});
			
			$("#choice").click(function(){
				var ck = $(".choice").attr('checked',true);
				var list = [];
				console.log(ck+"ㅇ");
				console.log(ck.length);
				if(ck.length ==""){
					alert("선택된게 없습니다. 선택해주세여");
				}else{
					for(var i=0;i<ck.length;i++){
						var truck_code = $(ck[i]).closest('input').val();
						console.log(truck_code);
						list.push(truck_code);
					}
					if(prompt("선택하시겠습니까 ? 선택하면 모집이 마감되며 해당 푸드트럭에게 알림이 가게됩니다.")){
						//ajax
						
						//success:
								this.close();
						
					}
				}
				
			});
			
});