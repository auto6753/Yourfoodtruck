/**
 * 
 */
	$(function () {	
		tab('#tab',0);	
	});

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
	
	$(document).ready(function(){
		$(".edit").click(function(){
			
		});
		
		$(".delete").click(function(){
			var eventName = $(this).parent().next().next().text();
			var delCheck = confirm(eventName + " 을(를) 정말 삭제하시겠습니까?");
		});
	});