/**
 * 
 */

$(document).ready(function(){
	
	
	
	var mCashSales = Number($("#mCashSales").val());
	var nCashSales = Number($("#nCashSales").val());
	var totalCashSales = Number($("#totalCashSales").val());
	var mCardSales = Number($("#mCardSales").val());
	var nCardSales = Number($("#nCardSales").val());
	var totalCardSales = Number($("#totalCardSales").val());
	var mKakaoSales = Number($("#mKakaoSales").val());
	var nKakaoSales = Number($("#nKakaoSales").val());
	var totalKakaoSales = Number($("#totalKakaoSales").val());
	var mTotalSales = Number($("#mTotalSales").val());
	var nTotalSales = Number($("#nTotalSales").val());
	var totalSales = Number($("#totalSales").val());
	
    google.charts.load('current', {'packages':['bar']});
    if(
    		mCashSales == 0 &&
    		nCashSales == 0 &&
    		totalCashSales == 0 &&
    		mCardSales == 0 &&
    		nCardSales == 0 &&
    		totalCardSales == 0 &&
    		mKakaoSales == 0 &&
    		nKakaoSales == 0 &&
    		totalKakaoSales == 0 &&
    		mTotalSales == 0 &&
    		nTotalSales == 0 &&
    		totalSales == 0	
    ){
    	$("#chart_div").html("<img src='/resources/image/nodata.png' style='width:400px; margin-top: 5%;'/>");
    	$(".hideTable").css("display", "none");
    } else {
    	google.charts.setOnLoadCallback(drawChart);
    }

    function drawChart() {

      
      var data = google.visualization.arrayToDataTable([
          ['오늘', '전체', '회원', '비회원'],
          ['합계', totalSales, mTotalSales, nTotalSales],
          ['현금', totalCashSales, mCashSales, nCashSales],
          ['카드', totalCardSales, mCardSales, nCardSales]
//          ,['카카오페이', totalKakaoSales, mKakaoSales, nKakaoSales]
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
//      btns.onclick = function (e) {
//
//        if (e.target.tagName === 'BUTTON') {
//          options.vAxis.format = e.target.id === 'none' ? '' : e.target.id;
//          chart.draw(data, google.charts.Bar.convertOptions(options));
//        }
//      }
    }
});