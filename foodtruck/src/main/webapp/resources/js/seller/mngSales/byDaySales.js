/**
 * 
 */

$(document).ready(function(){
	var byDaySalesResultMon = [
		Number($(".byDaySalesResult9").eq(0).val()),
		Number($(".byDaySalesResult10").eq(0).val()),
		Number($(".byDaySalesResult11").eq(0).val())
	];
	var byDaySalesResultTue = [
		Number($(".byDaySalesResult9").eq(1).val()),
		Number($(".byDaySalesResult10").eq(1).val()),
		Number($(".byDaySalesResult11").eq(1).val())
	];
	var byDaySalesResultWed = [
		Number($(".byDaySalesResult9").eq(2).val()),
		Number($(".byDaySalesResult10").eq(2).val()),
		Number($(".byDaySalesResult11").eq(2).val())
	];
	var byDaySalesResultThu = [
		Number($(".byDaySalesResult9").eq(3).val()),
		Number($(".byDaySalesResult10").eq(3).val()),
		Number($(".byDaySalesResult11").eq(3).val())
	];
	var byDaySalesResultFri = [
		Number($(".byDaySalesResult9").eq(4).val()),
		Number($(".byDaySalesResult10").eq(4).val()),
		Number($(".byDaySalesResult11").eq(4).val())
	];
	var byDaySalesResultSat = [
		Number($(".byDaySalesResult9").eq(5).val()),
		Number($(".byDaySalesResult10").eq(5).val()),
		Number($(".byDaySalesResult11").eq(5).val())
	];
	var byDaySalesResultSun = [
		Number($(".byDaySalesResult9").eq(6).val()),
		Number($(".byDaySalesResult10").eq(6).val()),
		Number($(".byDaySalesResult11").eq(6).val())
	];
	
    google.charts.load('current', {'packages':['bar']});
    
    var status = 0;
    
    for(var i=0; i<3; i++){
	    if(byDaySalesResultSun[i] == 0) {status = status + 1;}
	    
	    if(byDaySalesResultMon[i] == 0) {status = status + 1;}
	    
	    if(byDaySalesResultTue[i] == 0) {status = status + 1;}
	    
	    if(byDaySalesResultWed[i] == 0) {status = status + 1;}
	    
	    if(byDaySalesResultThu[i] == 0) {status = status + 1;}
	    
	    if(byDaySalesResultFri[i] == 0) {status = status + 1;}
	    
	    if(byDaySalesResultSat[i] == 0) {status = status + 1;}
    }
   
    if(status == 21){
    	$("#chart_div").html("<img src='/resources/image/nodata.png' style='width:400px; margin-top: 5%;'/>");
    	$(".hideTable").css("display", "none");
    } else {
    	google.charts.setOnLoadCallback(drawChart);
    }

    function drawChart() {

      
      var data = google.visualization.arrayToDataTable([
          ['요일별', '전체', '회원', '비회원'],
          ['월요일', byDaySalesResultMon[2], byDaySalesResultMon[1], byDaySalesResultMon[0]],
          ['화요일', byDaySalesResultTue[2], byDaySalesResultTue[1], byDaySalesResultTue[0]],
          ['수요일', byDaySalesResultWed[2], byDaySalesResultWed[1], byDaySalesResultWed[0]],
          ['목요일', byDaySalesResultThu[2], byDaySalesResultThu[1], byDaySalesResultThu[0]],
          ['금요일', byDaySalesResultFri[2], byDaySalesResultFri[1], byDaySalesResultFri[0]],
          ['토요일', byDaySalesResultSat[2], byDaySalesResultSat[1], byDaySalesResultSat[0]],
          ['일요일', byDaySalesResultSun[2], byDaySalesResultSun[1], byDaySalesResultSun[0]]
      ]);

      var options = {
        chart: {
//          title: 'Company Performance',
//          subtitle: 'Sales, Expenses, and Profit: 2014-2017',
        },
        bars: 'vertical',
        bar : {
			groupWidth : '50%' // 그래프 너비 설정 %
		},
        legend : {position:'top'},
        vAxis: {format: 'decimal'},
        height: 400,
        colors: ['#1b9e77', '#d95f02', '#7570b3']
      };

      var chart = new google.charts.Bar(document.getElementById('chart_div'));

      chart.draw(data, google.charts.Bar.convertOptions(options));

      var btns = document.getElementById('btn-group');
      $('#btn-group').on('click',function(e) {
          if (e.target.tagName === 'BUTTON') {
              options.vAxis.format = e.target.id === 'none' ? '' : e.target.id;
              chart.draw(data, google.charts.Bar.convertOptions(options));
            }
       });
//      btns.onclick = function(e) {
//        if (e.target.tagName === 'BUTTON') {
//          options.vAxis.format = e.target.id === 'none' ? '' : e.target.id;
//          chart.draw(data, google.charts.Bar.convertOptions(options));
//        }
//      }
    }
});