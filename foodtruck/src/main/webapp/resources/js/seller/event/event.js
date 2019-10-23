/**
 * 
 */
//	var index = 1;
var imgchngchk = 0;
	
	function chselcat(num) {
		var target = $("#dialog2").find("#field2").children().eq(num).children().eq(0);
		
		$(target).next().next().next().val("");
		$(target).next().next().next().attr("disabled", true);
		var thisCatVal = $(target).val(); // 선택된 카테고리 값("" 또는 1~5)
		var menuNum = $(".catVal").length; // 메뉴 개수
		var menu = "<option value='' selected>&nbsp;&nbsp;--메뉴--</option>";
		
		$(target).next().children().remove();
		$(menu).appendTo($(target).next());

		for(var i=0; i<menuNum; i++){
			if($(".catVal").eq(i).val() == thisCatVal){
				
				$("#allMenu").children().eq(i).clone().appendTo($(target).next());
			}
		}
	}

	function date_to_str(format)

{

    var year = format.getFullYear();

    var month = format.getMonth() + 1;

    if(month<10) month = '0' + month;

    var date = format.getDate();

    if(date<10) date = '0' + date;

    var hour = format.getHours();

    if(hour<10) hour = '0' + hour;

    var min = format.getMinutes();

    if(min<10) min = '0' + min;

    return year + "-" + month + "-" + date + "T" + hour + ":" + min;

}

	function dialogFind(param){
		
		return $("#dialog").find(param).val();
	}
	
	function dialogFind2(param){
			
		return $("#dialog2").find(param).val();
	}
	
	function onlyNumber(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode; // which는 onkeypress에 사용, keyCode는 onkeydown에 사용
		if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )
		{
			return;
		}
		else
		{
			return false;
		}
		/* 48~57:일반 숫자키 코드, 96~105:숫자키패드 숫자키 코드 */
	}
	
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
	

	function showDiscResult(disc) {
		var discount = $(disc).val();
		var price = $(disc).prev().val();
		
		var discResult = 0;
		
		if(isNaN(discount)){
			return false;
		}
		else {
			discResult = price - discount;
		}
		
		$(disc).next().val(discResult);
		
		if(discResult < 0) {
			alert("할인액은 단가를 초과할 수 없습니다.");
			$(disc).val("");
			$(disc).next().val(price);
		}
	}
	
	

	
	$(document).on("change", ".selectCat", function(){
		$(this).next().next().next().val("");
		$(this).next().next().next().attr("disabled", true);
		var thisCatVal = $(this).val(); // 선택된 카테고리 값("" 또는 1~5)
		var menuNum = $(".catVal").length; // 메뉴 개수
		var menu = "<option value='' selected>&nbsp;&nbsp;--메뉴--</option>";
		
		$(this).next().children().remove();
		$(menu).appendTo($(this).next());

		for(var i=0; i<menuNum; i++){
			if($(".catVal").eq(i).val() == thisCatVal){
				
				$("#allMenu").children().eq(i).clone().appendTo($(this).next());
			}
		}
		
	});
	
	function changeAttr(selectTag) {
		$(selectTag).next().next().val("");
		var menuNum = $(selectTag).children().length - 1;
		var selectVal = $(selectTag).val();
		var thisMenu = $(".selectmenu").index(selectTag);


		
		for(var i=0; i<menuNum; i++){
			var menu = $(".selectmenu option:selected").eq(i+1).val();

			if(selectVal == menu && (i+1) != thisMenu && selectVal != ""){
				$(selectTag).next().next().attr("disabled", true);
				alert("이미 선택된 메뉴입니다.");
				
				$(selectTag).children("option:eq(0)").prop("selected", true);
				$(selectTag).next().val("");
				$(selectTag).next().next().val("");
				$(selectTag).next().next().next().val("");
				
				return false;
			}
			
		}
		
		if(selectVal != "" && selectVal != null && selectVal != undefined){
			var unit_price = $('#'+selectVal).val();
			$(selectTag).next().val(unit_price);
			$(selectTag).next().next().next().val(unit_price);
			$(selectTag).next().next().attr("disabled", false);
		}else {
			$(selectTag).next().val("");
			$(selectTag).next().next().val("");
			$(selectTag).next().next().next().val("");
			$(selectTag).next().next().attr("disabled", true);
		}
		
		
	}
	
	function changeAttr2(selectTag) {
		$(selectTag).next().next().val("");
		var menuNum = $(selectTag).children().length - 1;
		var selectVal = $(selectTag).val();
		var thisMenu = $(".selectmenu2").index(selectTag);


		
		for(var i=0; i<menuNum; i++){
			var menu = $(".selectmenu2 option:selected").eq(i+1).val();

			if(selectVal == menu && (i+1) != thisMenu && selectVal != ""){
				$(selectTag).next().next().attr("disabled", true);
				alert("이미 선택된 메뉴입니다.");
				
				$(selectTag).children("option:eq(0)").prop("selected", true);
				$(selectTag).next().val("");
				$(selectTag).next().next().val("");
				$(selectTag).next().next().next().val("");
				
				return false;
			}
			
		}
		
		if(selectVal != "" && selectVal != null && selectVal != undefined){
			var unit_price = $('#'+selectVal).val();
			$(selectTag).next().val(unit_price);
			$(selectTag).next().next().next().val(unit_price);
			$(selectTag).next().next().attr("disabled", false);
		}else {
			$(selectTag).next().val("");
			$(selectTag).next().next().val("");
			$(selectTag).next().next().next().val("");
			$(selectTag).next().next().attr("disabled", true);
		}
		
		
	}
	

	function tab(e, num){
	    var num = num || 0;
	    var menu = $(e).children();
	    var con = $(e+'_con').children();
	    var select = $(menu).eq(num);
	    var i = num;

	    select.addClass('on');
	    con.eq(num).show();
	    con.eq(num).find('*').css("display", "inline-block");

	    menu.click(function(){
	        if(select!==null){
	            select.removeClass("on");
	            con.eq(i).hide();
	        }

	        select = $(this);
	        i = $(this).index();

	        select.addClass('on');
	        con.eq(i).show();
	        con.eq(i).find('*').css("display", "inline-block");
	        $(".eventBox").scrollTop(0);
	    });
	}
	
	//-- textarea에 입력바이트 수를 계산

	var clearChk=true;
	var limitByte = 600; //바이트의 최대크기, limitByte 를 초과할 수 없음

	// textarea에 입력된 문자의 바이트 수를 체크
	function checkByte(frm) {
	   
	        var totalByte = 0;
	        var message = dialogFind("#details");

	        for(var i =0; i < message.length; i++) {
	                var currentByte = message.charCodeAt(i);
	                
	                if(currentByte > 128) {
	                	totalByte +=3;
	                }
	                else {
	                	totalByte++;
	                	}
	                }
	        
	        var string = message;
	        
	        
	        var stringLength = string.length;
	        var stringByteLength = 0;
	        
	        
	        for(var i=0; i<stringLength; i++) {
	            if(escape(string.charAt(i)).length >= 4)
	                stringByteLength += 3;
	            else if(escape(string.charAt(i)) == "%A7")
	                stringByteLength += 3;
	            else
	                if(escape(string.charAt(i)) != "%0D")
	                    stringByteLength++;
	        }
	        console.log(stringByteLength + " Bytes");
	        
	        $("#dialog").find("#messagebyte").val(stringByteLength);
	        
	        // 코드 이해 필요
	        for(b=i=0;c=string.charCodeAt(i);) {
	        	b+=c>>7?3:1;
	        	if (b > limitByte) {
	        		$("#dialog").find("#messagebyte").val(limitByte);
	        		break;
	        	}
	        	i++;
	        }
	        
	        string = string.substring(0,i);
	        $("#dialog").find("#details").val(string);
	        
	}
	
	function checkByte2(frm) {
		   
        var totalByte = 0;
        var message = dialogFind2("#details2");

        for(var i =0; i < message.length; i++) {
                var currentByte = message.charCodeAt(i);
                
                if(currentByte > 128) {
                	totalByte +=3;
                }
                else {
                	totalByte++;
                	}
                }
        
        var string = message;
        
        
        var stringLength = string.length;
        var stringByteLength = 0;
        
        
        for(var i=0; i<stringLength; i++) {
            if(escape(string.charAt(i)).length >= 4)
                stringByteLength += 3;
            else if(escape(string.charAt(i)) == "%A7")
                stringByteLength += 3;
            else
                if(escape(string.charAt(i)) != "%0D")
                    stringByteLength++;
        }
        console.log(stringByteLength + " Bytes");
        
        $("#dialog2").find("#messagebyte2").val(stringByteLength);
        
        // 코드 이해 필요
        for(b=i=0;c=string.charCodeAt(i);) {
        	b+=c>>7?3:1;
        	if (b > limitByte) {
        		$("#dialog2").find("#messagebyte2").val(limitByte);
        		break;
        	}
        	i++;
        }
        
        string = string.substring(0,i);
        $("#dialog2").find("#details2").val(string);
        
}
	
	
	// 딤처리 팝업 레이어(시작)
	function layer_popup(el) {
		
		var $el = $(el); //레이어의 id를 $el 변수에 저장
		var isDim = $el.prev().hasClass('dimBg'); //dimmed 레이어를 감지하기 위한 boolean 변수

		isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

		var $elWidth = ~~($el.outerWidth()), $elHeight = ~~($el.outerHeight()), docWidth = $(
				document).width(), docHeight = $(document).height();

		// 화면의 중앙에 레이어를 띄운다.
		if ($elHeight < docHeight || $elWidth < docWidth) {
			$el.css({
				marginTop : -$elHeight / 2,
				marginLeft : -$elWidth / 2
			})
		} else {
			$el.css({
				top : 0,
				left : 0
			});
		}
		

		$el.find('button.btn-layerClose').click(function() {
			isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
			return false;
		});

		$('.layer .dimBg').click(function() {
			$('.dim-layer').fadeOut();
			return false;
		});
	}
	// 딤처리 팝업 레이어(끝)
	
	// 딤처리 팝업 레이어(시작)
	function layer_popup2(el) {

		var $el = $(el); //레이어의 id를 $el 변수에 저장
		var isDim = $el.prev().hasClass('dimBg2'); //dimmed 레이어를 감지하기 위한 boolean 변수

		isDim ? $('.dim-layer2').fadeIn() : $el.fadeIn();

		var $elWidth = ~~($el.outerWidth()), $elHeight = ~~($el.outerHeight()), docWidth = $(
				document).width(), docHeight = $(document).height();

		// 화면의 중앙에 레이어를 띄운다.
		if ($elHeight < docHeight || $elWidth < docWidth) {
			$el.css({
				marginTop : -$elHeight / 2,
				marginLeft : -$elWidth / 2
			})
		} else {
			$el.css({
				top : 0,
				left : 0
			});
		}

		$el.find('button.btn-layerClose').click(function() {
			isDim ? $('.dim-layer2').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
			return false;
		});

		$('.layer .dimBg2').click(function() {
			$('.dim-layer2').fadeOut();
			return false;
		});
	}
	// 딤처리 팝업 레이어(끝)
	
	// 메뉴 input 추가
	function add_item(){
		// pre_set 에 있는 내용을 읽어와서 처리..
		var div = document.createElement('div');
		div.innerHTML = document.getElementById('pre_set').innerHTML;
		document.getElementById('field').appendChild(div);

	}
	
	function add_item2(){
		// pre_set 에 있는 내용을 읽어와서 처리..
		var div = document.createElement('div');
		div.innerHTML = document.getElementById('pre_set2').innerHTML;
		document.getElementById('field2').appendChild(div);

	}

	function remove_item(obj){
		// obj.parentNode 를 이용하여 삭제
		document.getElementById('field').removeChild(obj.parentNode);
	}
	
	function remove_item2(obj){
		// obj.parentNode 를 이용하여 삭제
		document.getElementById('field2').removeChild(obj.parentNode);
	}
	
	function alerttest(){
		alert("a");
	}
	
	$(document).ready(function(){
//		$('body').css('overflow','hidden');
		 $( "#dialog" ).dialog({

			 height: 800,
			    width: 'auto',
			    modal: true,
		      autoOpen: false,
		      show: {
		        duration:0
		      },
		      hide: {
		        duration:0
		      },
		      
		      resizable: false,
		      draggable:false,
		      scrollable: true,
		      close: function(){
		    	  $("#resetBtn").click();
		      }
		    });
		$("#opener").on( "click", function() {
		      $( "#dialog" ).dialog("open");
		      $("#resetBtn").click();
		      
		      // 테스트
		      $("#eventName").val("test이벤트명");
		      $("#beginDate").val("2019-12-01T16:00");
		      $("#endDate").val("2019-12-31T16:00");
		      $("#target").val("test대상");
		      $("#details").val("test상세내용");
		      $("input[id='pCash']").attr("checked", true);
		      $("input[id='duplicate0']").attr("checked", true);
		    });
		
		 $( "#dialog2" ).dialog({

			 height: 800,
			    width: 'auto',
			    modal: true,
		      autoOpen: false,
		      show: {
		        duration:0
		      },
		      hide: {
		        duration:0
		      },
		      
		      resizable: false,
		      draggable:false,
		      scrollable: true,
		      close: function(){
		    	  $("#resetBtn2").click();
		      }
		    });
		 
		 

		 
		 $(".opener2").on( "click", function() {
			
			 var eventCode = $(this).parent().find($(".eCode")).val();
			 
		      $( "#dialog2" ).dialog("open");
		      $("#resetBtn2").click();
		      
		      $("#dialog2").find(".btn-r").append("<input type='hidden' class='ec'/>");
		      $(".ec").val(eventCode);
		      
		      var eventCode = $(this).next().val();
		      
		      $.ajax({
					type: "post",
					url: "editEvent",
					data: {
						"eventCode": eventCode
					},
					success: function(data) {
						
						
						var menuNum = data.menuNum;
						var imgurl = data.evo.event_url;
						
						$("#uploadedImg").attr("src",  src="/resources/image/upload/" + imgurl);
						$("#uploadedImg").css("display", "");
						$("#defaultImg2").css("display", "none");
						$("#noImage2").css("display", "none");
						$("#uploadImg2").val("");
						$("#prev_previewId2").remove();
						setTimeout(function() {
							
						}, 1);
						
						for(var i=0; i<menuNum-1; i++){
							add_item2();
						}
						
						for(var i=0; i<menuNum; i++){
							var category = data.mvo[i].menu_category;
							var menucode = data.emvo[i].menu_code;
							var discount = data.emvo[i].discount;
							
							$("#dialog2").find("#field2").children().eq(i).children().eq(0).val(category); // 종류
							chselcat(i);
							$("#dialog2").find("#field2").children().eq(i).children().eq(1).val(menucode); // 메뉴
							changeAttr($("#dialog2").find("#field2").children().eq(i).children().eq(1));
							
							$("#dialog2").find("#field2").children().eq(i).children().eq(3).val(discount);
						}
						
						$("#dialog2").find("#eventName2").val(data.evo.event_name);
						$("#dialog2").find("#target2").val(data.evo.event_target);
						$("#dialog2").find("#details2").val(data.evo.event_content);
						
						
						var event_start = data.evo.event_start;
						var event_end = data.evo.event_end;
						var es = new Date(event_start);
						var ee = new Date(event_end);

						es = date_to_str(es);
						ee = date_to_str(ee);
						
						$("#dialog2").find("#beginDate2").val(es);
						$("#dialog2").find("#endDate2").val(ee);
						
						var pm = data.evo.event_payment;
						
						switch(pm){
						case 100: // 현금
							$("input[value=cash]").attr("checked", true);
							break;
						case 10: // 카드
							$("input[value=card]").attr("checked", true);
							break;
						case 110: // 모두
							$("input[value=cash]").attr("checked", true);
							$("input[value=card]").attr("checked", true);
							break;
						}
						
						var du = data.evo.event_combinable;
						
						switch(du){
						case 0:
							$("input[id=duplicate02]").attr("checked", true);
							break;
						case 1:
							$("input[id=duplicate12]").attr("checked", true);
							break;
						}
					}
		      });
		    });
		
		$("#resetBtn").click(function(){
			var chkImg = $("#dialog").find("#noImage").css("display");
			
			$("#dialog").find("#defaultImg").css("display", "none");
			$("#dialog").find("#noImage").css("display", "");
			$("#dialog").find("#uploadImg").val("");
			$("#dialog").find("#prev_previewId").remove();
			
			$("#dialog").find("#uploadedImg").css("display", "none");
			
			
			$("#default").children().eq(1).children().remove();
			$("#dialog").find("#default").children().eq(1).children().remove();
			$("#field").children().not("#default").remove();
			$(".discount").attr("disabled", true);
			$("#dialog").find("input[type='checkbox']").attr("checked", false);
			$("#dialog").find("input[type='radio']").attr("checked", false);
			
			var menu = "<option value='' selected>&nbsp;&nbsp;--메뉴--</option>";
			$(menu).appendTo($("#dialog").find("#default").children().eq(1));
		});
		
		$("#resetBtn2").click(function(){
			var chkImg = $("#dialog2").find("#noImage2").css("display");
			
			$("#dialog2").find("#defaultImg2").css("display", "none");
			$("#dialog2").find("#noImage2").css("display", "");
			$("#dialog2").find("#uploadImg2").val("");
			$("#dialog2").find("#prev_previewId2").remove();
			
			$("#dialog2").find("#uploadedImg").css("display", "none");
			
			
			$("#default2").children().eq(1).children().remove();
			$("#dialog2").find("#default2").children().eq(1).children().remove();
			$("#field2").children().not("#default2").remove();
			$(".discount").attr("disabled", true);
			$("#dialog2").find("input[type='checkbox']").attr("checked", false);
			$("#dialog2").find("input[type='radio']").attr("checked", false);
			
			var menu = "<option value='' selected>&nbsp;&nbsp;--메뉴--</option>";
			$(menu).appendTo($("#dialog2").find("#default2").children().eq(1));
		});
		
		$(document).on("keypress", ".discount", function(event){
			onlyNumber(event);
		});
		
		$(document).on("change", ".discount", function(){
			showDiscResult(this);
		});
		
		$("#reset").click(function(){
			$(".discount").attr("disabled", true);
		});
		
		$('.test').ready(function() {
			$('.test nav').addClass('z-indexto1');
		});
		var isAddDefault=false;
		var isEditDefault=false;
		
		$("#previewId").mouseenter(function(){
			$("#imgControlBox").fadeIn();
			$("#noImage,#defaultImg,#prev_previewId").css("position", "relative");
			$("#noImage,#defaultImg,#prev_previewId").css("top", "-50px");
		});
		
		$("#previewId").mouseleave(function(){
			$("#imgControlBox").fadeOut(200);
			setTimeout(function() {
				$("#noImage,#defaultImg,#prev_previewId").css("top", "0");
			}, 200);
			
/*			var opacityVal;
			var checkOpacity =
				setInterval(function() {
					opacityVal = $("#imgControlBox").css("opacity");
					if(opacityVal == 0) {
						$("#noImage").css("top", "0");		
					clearInterval(checkOpacity);
					}
				}, 0);
*/
		});
		
		$("#previewId2").mouseenter(function(){
			$("#imgControlBox2").fadeIn();
			$("#noImage2,#defaultImg2,#prev_previewId2").css("position", "relative");
			$("#noImage2,#defaultImg2,#prev_previewId2").css("top", "-50px");
		});
		
		$("#previewId2").mouseleave(function(){
			$("#imgControlBox2").fadeOut(200);
			setTimeout(function() {
				$("#noImage2,#defaultImg2,#prev_previewId2").css("top", "0");
			}, 200);
		});
		
		$("#setDefaultBtn").click(function(){
			$("#defaultImg").css("display", "");
			$("#noImage").css("display", "none");
			$("#uploadImg").val("");
			$("#prev_previewId").remove();
			isAddDefault=true;
			
			setTimeout(function() {
				alert("기본이미지로 변경되었습니다.");
			}, 1);
		});
		
		$("#setDefaultBtn2").click(function(){
			imgchngchk = 1;
			$("#uploadedImg").css("display", "none");
			$("#defaultImg2").css("display", "");
			$("#noImage2").css("display", "none");
			$("#uploadImg2").val("");
			$("#prev_previewId2").remove();
			isEditDefault=true;
			setTimeout(function() {
				alert("기본이미지로 변경되었습니다.");
			}, 1);
		});
		
		$("#delUploadImg").click(function(){
			imgchngchk = 1;
			var chkImg = $("#noImage").css("display");
			
			$("#defaultImg").css("display", "none");
			$("#noImage").css("display", "");
			$("#uploadImg").val("");
			$("#prev_previewId").remove();
			
			if(chkImg == "none"){
				setTimeout(function() {
					alert("업로드된 이미지가 삭제되었습니다.");
				}, 1);
			} else {
				alert("삭제할 이미지가 존재하지 않습니다.");
			}
		});
		
		$("#delUploadImg2").click(function(){
			var chkImg = $("#noImage2").css("display");
			
			$("#defaultImg2").css("display", "none");
			$("#noImage2").css("display", "");
			$("#uploadImg2").val("");
			$("#prev_previewId2").remove();
			
			if(chkImg == "none"){
				setTimeout(function() {
					alert("업로드된 이미지가 삭제되었습니다.");
				}, 1);
			} else {
				alert("삭제할 이미지가 존재하지 않습니다.");
			}
		});
		
		$("#cancelAdd").click(function(){
			$("form").each(function(){
				this.reset();
				// input type="file"의 경우, IE10을 제외한 모든 브라우저에서 지원
				// IE10에서는 reset 된 것처럼 보이지만, submit 할 경우 해당 파일이 전송되는 버그 발생 
				$("#noImage").css("display", "");
				$("#prev_previewId").remove();
			});
			$('.test nav').removeClass('z-indexto1');
		});
		
		$("#cancelEdit").click(function(){
			$("form").each(function(){
				this.reset();
				// input type="file"의 경우, IE10을 제외한 모든 브라우저에서 지원
				// IE10에서는 reset 된 것처럼 보이지만, submit 할 경우 해당 파일이 전송되는 버그 발생 
				$("#noImage2").css("display", "");
				$("#prev_previewId2").remove();
			});
		});
		
		tab('#tab',0);
		
		$(".imgUploadBtn").click(function(){
			document.getElementById("uploadImg").click();
		});
		
		$(".imgUploadBtn2").click(function(){
			document.getElementById("uploadImg2").click();
		});
		
		$("#addEventBtn").click(function(){
			var time = new Date();
			var nTime = time.getTime();
			var sTime = String(nTime);
			var subTime = sTime.substring(0,7);
			var fTime = Number(subTime);
			
			var inputTime = new Date(dialogFind("#beginDate"));
			var nInputTime = inputTime.getTime();
			var sInputTime = String(nInputTime);
			var subInputTime = sInputTime.substring(0,7);
			var fInputTime = Number(subInputTime);
			
			
		
			
			var files = $("#uploadImg")[0].files;
			var file = files[0];
			
			var eventName = dialogFind("#eventName"); // 이벤트명
			
			var beginDate = new Date(dialogFind("#beginDate")).getTime(); // 이벤트 시작일
			var endDate = new Date(dialogFind("#endDate")).getTime(); // 이벤트 종료일
			
			var target = dialogFind("#target"); // 이벤트 대상
			
			var eventMenuNum = $("#field").children().length; // 이벤트 메뉴의 개수
		
			var menuCode = new Array(); // 메뉴코드 배열
			var discount = new Array(); // 할인액 배열 
			
			for(var i=0; i<eventMenuNum; i++) {
				menuCode[i] = $("#field").children().eq(i).children().eq(1).val(); // 메뉴코드를 배열에 추가
				discount[i] = $("#field").children().eq(i).children().eq(3).val(); // 할인액을 배열에 추가
			}

			
			var details = dialogFind("#details"); // 이벤트 상세내용
			
			// 이벤트 결제수단 코드 생성
			var payment1 = $("#pCash").prop("checked"); // 현금 결제에 대한 true/false 값
			var payment2 = $("#pCard").prop("checked"); // 카드 결제에 대한 true/false 값
			var payment3 = $("#pKakao").prop("checked"); // 카카오페이 결제에 대한 true/false 값
			
			// true=1, false=0
			var pResult1 = payment1 ? "1" : "0";
			var pResult2 = payment2 ? "1" : "0";
			var pResult3 = payment3 ? "1" : "0";
			
			// true/false 1,0 조합
			var payment = pResult1 + pResult2 + pResult3; // 이벤트 결제수단 (코드)
			
			var duplicate = dialogFind("input[name='duplicate']:checked"); // 이벤트 중복적용 여부(0 또는 1)
			
			var formData = new FormData();
			formData.append("file", file);
			formData.append("event_name", eventName);
			formData.append("event_start", beginDate);
			formData.append("event_end", endDate);
			formData.append("event_target", target);
			formData.append("menuCode[]", menuCode);
			formData.append("discount[]", discount);
			formData.append("event_content", details);
			formData.append("event_payment", payment);
			formData.append("event_combinable", duplicate);
			
			if(eventName == ""){
				alert("이벤트명을 입력해 주세요.");
				return false;
			}
			
			if(dialogFind("#beginDate") == "" || dialogFind("#endDate") == ""){
				alert("기간을 입력해 주세요.");
				return false;
			}
			
			if(new Date(dialogFind("#beginDate")).getTime() >= new Date(dialogFind("#endDate")).getTime()) {
				alert("기간이 잘못 입력되었습니다.");
				return false;
			}
			
			if(fTime > fInputTime) {
				alert("시작일을 현재 시각 이후로 입력해 주세요.");
				 return false;
			}
			
			if(dialogFind("#target") == ""){
				alert("대상을 입력해 주세요.");
				return false;
			}
			
			if(dialogFind("#details") == ""){
				alert("상세내용을 입력해 주세요.")
				return false;
			}
			
			if($("#pCash").prop("checked") == false && $("#pCard").prop("checked") == false){
				alert("결제수단을 1개 이상 체크해 주세요.");
				return false;
			}
			
			if($("#duplicate1").prop("checked") == false && $("#duplicate0").prop("checked") == false){
				alert("중복적용 여부를 체크해 주세요.");
				return false;
			}
			
			
			
			var menuNum = $(".selectmenu").length - 1;
			var check = 1;
			
			for(var i=0; i<menuNum; i++){
				var menu = $(".selectmenu option:selected").eq(i+1).val();

				if(menu == ""){
					check = 0;
				}
			}
			
			if(check == 0) {
				alert("선택되지 않은 메뉴가 있습니다.");
				return false;
			}
			else {
				for(var i=0; i<menuNum; i++){
					var discount = $(".discount").eq(i+1).val();
					
					if(discount == ""){
						check = 0;
					}
				}
				
				if(check == 0) {
					alert("할인액이 입력되지 않은 메뉴가 있습니다.");
					return false;
				}
			}
			
			$.ajax({
				type: "post",
				url: "event",
//				data: {
//					"event_name": eventName,
//					"event_start": beginDate,
//					"event_end": endDate,
//					"event_target": target,
//					"menuCode[]": menuCode,
//					"discount[]": discount,
//					"event_content": details,
//					"event_payment": payment,
//					"event_combinable": duplicate
//				},
				data:formData,
	            processData: false,
	            contentType: false,
				success: function(data){
					// alert(data);
					 $('#layer1').hide();
					 window.location.href="/seller/event";
				}
			});
			setTimeout(function() {
				window.location.href="/seller/event";
			},1000);
			alert("이벤트가 등록되었습니다.");
		});
		
		$("#editEventBtn").click(function(){
			var time = new Date();
			var nTime = time.getTime();
			var sTime = String(nTime);
			var subTime = sTime.substring(0,7);
			var fTime = Number(subTime);
			
			var inputTime = new Date(dialogFind2("#beginDate2"));
			var nInputTime = inputTime.getTime();
			var sInputTime = String(nInputTime);
			var subInputTime = sInputTime.substring(0,7);
			var fInputTime = Number(subInputTime);
			
			var files = "";
			var file = "";
			if(imgchngchk == 1){ // 이미지 변경 여부
				files = $("#uploadImg2")[0].files;
				file = files[0];
			}
			
			var eventName = dialogFind2("#eventName2"); // 이벤트명
			
			var beginDate = new Date(dialogFind2("#beginDate2")).getTime(); // 이벤트 시작일
			var endDate = new Date(dialogFind2("#endDate2")).getTime(); // 이벤트 종료일
			
			var target = dialogFind2("#target2"); // 이벤트 대상
			
			var eventMenuNum = $("#field2").children().length; // 이벤트 메뉴의 개수
		
			var menuCode = new Array(); // 메뉴코드 배열
			var discount = new Array(); // 할인액 배열 
			
			for(var i=0; i<eventMenuNum; i++) {
				menuCode[i] = $("#field2").children().eq(i).children().eq(1).val(); // 메뉴코드를 배열에 추가
				discount[i] = $("#field2").children().eq(i).children().eq(3).val(); // 할인액을 배열에 추가
			}

			
			var details = dialogFind2("#details2"); // 이벤트 상세내용
			
			// 이벤트 결제수단 코드 생성
			var payment1 = $("#pCash2").prop("checked"); // 현금 결제에 대한 true/false 값
			var payment2 = $("#pCard2").prop("checked"); // 카드 결제에 대한 true/false 값
			var payment3 = $("#pKakao2").prop("checked"); // 카카오페이 결제에 대한 true/false 값
			
			// true=1, false=0
			var pResult1 = payment1 ? "1" : "0";
			var pResult2 = payment2 ? "1" : "0";
			var pResult3 = payment3 ? "1" : "0";
			
			// true/false 1,0 조합
			var payment = pResult1 + pResult2 + pResult3; // 이벤트 결제수단 (코드)
			
			var duplicate = dialogFind2("input[name='duplicate']:checked"); // 이벤트 중복적용 여부(0 또는 1)
			var event_code = $("#dialog2").find(".ec").val();
			
			var formData = new FormData();
			formData.append("file", file);
			formData.append("event_name", eventName);
			formData.append("event_start", beginDate);
			formData.append("event_end", endDate);
			formData.append("event_target", target);
			formData.append("menuCode[]", menuCode);
			formData.append("discount[]", discount);
			formData.append("event_content", details);
			formData.append("event_payment", payment);
			formData.append("event_combinable", duplicate);
			formData.append("event_code", event_code);
			
			if(eventName == ""){
				alert("이벤트명을 입력해 주세요.");
				return false;
			}
			
			if(dialogFind2("#beginDate2") == "" || dialogFind2("#endDate2") == ""){
				alert("기간을 입력해 주세요.");
				return false;
			}
			
			if(new Date(dialogFind2("#beginDate2")).getTime() >= new Date(dialogFind2("#endDate2")).getTime()) {
				alert("기간이 잘못 입력되었습니다.");
				return false;
			}
			
			if(fTime > fInputTime) {
				alert("시작일을 현재 시각 이후로 입력해 주세요.");
				 return false;
			}
			
			if(dialogFind2("#target2") == ""){
				alert("대상을 입력해 주세요.");
				return false;
			}
			
			if(dialogFind2("#details2") == ""){
				alert("상세내용을 입력해 주세요.")
				return false;
			}
			
			if($("#pCash2").prop("checked") == false && $("#pCard2").prop("checked") == false){
				alert("결제수단을 1개 이상 체크해 주세요.");
				return false;
			}
			
			if($("#duplicate12").prop("checked") == false && $("#duplicate02").prop("checked") == false){
				alert("중복적용 여부를 체크해 주세요.");
				return false;
			}
			
		
			
			var menuNum = $(".selectmenu2").length - 1;
			var check = 1;
			
			for(var i=0; i<menuNum; i++){
				var menu = $(".selectmenu2 option:selected").eq(i+1).val();

				if(menu == ""){
					check = 0;
				}
			}
			
			if(check == 0) {
				alert("선택되지 않은 메뉴가 있습니다.");
				return false;
			}
			else {
				for(var i=0; i<menuNum; i++){
					var discount = $(".discount2").eq(i+1).val();
					
					if(discount == ""){
						check = 0;
					}
				}
				
				if(check == 0) {
					alert("할인액이 입력되지 않은 메뉴가 있습니다.");
					return false;
				}
			}
			
			$.ajax({
				type: "post",
				url: "editEvent2",
//				data: {
//					"event_name": eventName,
//					"event_start": beginDate,
//					"event_end": endDate,
//					"event_target": target,
//					"menuCode[]": menuCode,
//					"discount[]": discount,
//					"event_content": details,
//					"event_payment": payment,
//					"event_combinable": duplicate
//				},
				data:formData,
	            processData: false,
	            contentType: false,
				success: function(data){
					 window.location.href="/seller/event";
				}
			});
			setTimeout(function() {
				window.location.href="/seller/event";
			},1000);
			alert("이벤트가 수정되었습니다.");
		});
		
		$(".delete").click(function(){
			var eventCode = $("#eCode").val();
			var eventName = $(this).parent().next().next().text();
			var delCheck = confirm(eventName + " 을(를) 정말 삭제하시겠습니까?");
			
			if(delCheck) {
				$.ajax({
					type: "post",
					url: "delEvent",
					data: {
						"eventCode": eventCode
					},
					success: function(data) {
						//alert(data);
						location.reload();
						alert("삭제가 완료되었습니다.");
					},
					error: function(data) {
						alert("errror: 삭제 실패");
					}
				});
			} else {
				alert("삭제가 취소되었습니다.");
			}
		});
		
		$(".deleteEventDiv").click(function(){
			//var eventName = $(this).parent().next().next().text();
			var delCheck = confirm(" 을(를) 정말 삭제하시겠습니까?");
		});
		
		// 딤처리 팝업 레이어(시작)
		$('.btn-example').click(function() {
			var $href = $(this).attr('href');
			layer_popup($href);
		});
		// 딤처리 팝업 레이어(끝)
		
		// 딤처리 팝업 레이어(시작)
		$('.btn-example2').click(function() {
			var $href = $(this).attr('href');
			layer_popup2($href);
		});
		// 딤처리 팝업 레이어(끝)
	});

	function previewImage(targetObj, previewId) {
		var preview = document.getElementById(previewId); // div id
		var ua = window.navigator.userAgent;

		if (ua.indexOf("MSIE") > -1) {// ie일때

			targetObj.select();

			try {
				var src = document.selection.createRange().text; // get file full
				// path
				var ie_preview_error = document.getElementById("ie_preview_error_"
						+ previewId);

				if (ie_preview_error) {
					preview.removeChild(ie_preview_error); // error가 있으면 delete
				}

				var img = document.getElementById(previewId); // 이미지가 뿌려질 곳

				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
						+ src + "', sizingMethod='scale')"; // 이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
			} catch (e) {
				if (!document.getElementById("ie_preview_error_" + previewId)) {
					var info = document.createElement("<p>");
					info.id = "ie_preview_error_" + previewId;
					info.innerHTML = "a";
					preview.insertBefore(info, null);
				}
			}
		} else { // ie가 아닐때
			var files = targetObj.files;
			for (var i = 0; i < files.length; i++) {

				var file = files[i];

				var imageType = /image.*/; // 이미지 파일일 경우에만 뿌려줌
				if (!file.type.match(imageType))
					continue;
				
				var prevImg = document.getElementById("prev_" + previewId); // 이전에 미리보기가 있다면 삭제
				if (prevImg) {
					preview.removeChild(prevImg);
				}
				
				$("#noImage").css("display", "none");
				$("#defaultImg").css("display", "none");
				

				var img = document.createElement("img"); // 크롬은 div에 이미지가 뿌려지지 않기 때문에 자식 Element를 생성
				img.id = "prev_" + previewId;
				img.classList.add("obj");
				img.file = file;
				img.style.width = '400px'; // 기본 설정된 div의 안에 뿌려지는 효과를 주기 위해서 div 크기와 같은 크기로 지정
				img.style.height = '300px';

				preview.appendChild(img);

				if (window.FileReader) { // FireFox, Chrome, Opera 확인
					var reader = new FileReader();
					reader.onloadend = (function(aImg) {
						return function(e) {
							aImg.src = e.target.result;
						};
					})(img);
					reader.readAsDataURL(file);
				} else { // safari is not supported FileReader
					// alert('not supported FileReader');
					if (!document.getElementById("sfr_preview_error_" + previewId)) {
						var info = document.createElement("p");
						info.id = "sfr_preview_error_" + previewId;
						info.innerHTML = "not supported FileReader";
						preview.insertBefore(info, null);
					}
				}
			}
		}
	}
	
	function previewImage2(targetObj, previewId) {
		imgchngchk = 1;
		
		$("#uploadedImg").css("display", "none");
		var preview = document.getElementById(previewId); // div id
		var ua = window.navigator.userAgent;

		if (ua.indexOf("MSIE") > -1) {// ie일때

			targetObj.select();

			try {
				var src = document.selection.createRange().text; // get file full
				// path
				var ie_preview_error = document.getElementById("ie_preview_error_"
						+ previewId);

				if (ie_preview_error) {
					preview.removeChild(ie_preview_error); // error가 있으면 delete
				}

				var img = document.getElementById(previewId); // 이미지가 뿌려질 곳

				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
						+ src + "', sizingMethod='scale')"; // 이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
			} catch (e) {
				if (!document.getElementById("ie_preview_error_" + previewId)) {
					var info = document.createElement("<p>");
					info.id = "ie_preview_error_" + previewId;
					info.innerHTML = "a";
					preview.insertBefore(info, null);
				}
			}
		} else { // ie가 아닐때
			var files = targetObj.files;
			for (var i = 0; i < files.length; i++) {

				var file = files[i];

				var imageType = /image.*/; // 이미지 파일일 경우에만 뿌려줌
				if (!file.type.match(imageType))
					continue;
				
				var prevImg = document.getElementById("prev_" + previewId); // 이전에 미리보기가 있다면 삭제
				if (prevImg) {
					preview.removeChild(prevImg);
				}
				
				$("#noImage2").css("display", "none");
				$("#defaultImg2").css("display", "none");

				var img = document.createElement("img"); // 크롬은 div에 이미지가 뿌려지지 않기 때문에 자식 Element를 생성
				img.id = "prev_" + previewId;
				img.classList.add("obj");
				img.file = file;
				img.style.width = '400px'; // 기본 설정된 div의 안에 뿌려지는 효과를 주기 위해서 div 크기와 같은 크기로 지정
				img.style.height = '300px';

				preview.appendChild(img);

				if (window.FileReader) { // FireFox, Chrome, Opera 확인
					var reader = new FileReader();
					reader.onloadend = (function(aImg) {
						return function(e) {
							aImg.src = e.target.result;
						};
					})(img);
					reader.readAsDataURL(file);
				} else { // safari is not supported FileReader
					// alert('not supported FileReader');
					if (!document.getElementById("sfr_preview_error_" + previewId)) {
						var info = document.createElement("p");
						info.id = "sfr_preview_error_" + previewId;
						info.innerHTML = "not supported FileReader";
						preview.insertBefore(info, null);
					}
				}
			}
		}
	}

	function fileCheck(obj) {
		pathpoint = obj.value.lastIndexOf('.');
		filepoint = obj.value.substring(pathpoint+1,obj.length);
		filetype = filepoint.toLowerCase();
		
		if(filetype=='jpg' || filetype=='jpeg' || filetype=='png' || filetype=='gif' ||  filetype=='bmp') {
			// 정상적인 이미지 확장자 파일일 경우
		
		} else {
			alert('이미지 파일만 선택할 수 있습니다.');
			parentObj  = obj.parentNode
			node = parentObj.replaceChild(obj.cloneNode(true),obj);
			
			return false;
		}
		
		if(filetype=='bmp') {
			upload = confirm('BMP 파일은 웹상에서 사용하기엔 적절한 이미지 포맷이 아닙니다.\n그래도 계속 하시겠습니까?');
			if(!upload) //return false;
				location.reload();
		}
	}
