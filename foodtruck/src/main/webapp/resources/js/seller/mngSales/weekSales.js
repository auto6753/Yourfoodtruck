/**
 * 
 */

$(document).ready(function(){
	var mCashSalesWeek = Number($("#mCashSalesWeek").val());
	var nCashSalesWeek = Number($("#nCashSalesWeek").val());
	var totalCashSalesWeek = Number($("#totalCashSalesWeek").val());
	var mCardSalesWeek = Number($("#mCardSalesWeek").val());
	var nCardSalesWeek = Number($("#nCardSalesWeek").val());
	var totalCardSalesWeek = Number($("#totalCardSalesWeek").val());
	var mKakaoSalesWeek = Number($("#mKakaoSalesWeek").val());
	var nKakaoSalesWeek = Number($("#nKakaoSalesWeek").val());
	var totalKakaoSalesWeek = Number($("#totalKakaoSalesWeek").val());
	var mTotalSalesWeek = Number($("#mTotalSalesWeek").val());
	var nTotalSalesWeek = Number($("#nTotalSalesWeek").val());
	var totalSalesWeek = Number($("#totalSalesWeek").val());
	
    google.charts.load('current', {'packages':['bar']});
    if(
    		mCashSalesWeek == 0 &&
    		nCashSalesWeek == 0 &&
    		totalCashSalesWeek == 0 &&
    		mCardSalesWeek == 0 &&
    		nCardSalesWeek == 0 &&
    		totalCardSalesWeek == 0 &&
    		mKakaoSalesWeek == 0 &&
    		nKakaoSalesWeek == 0 &&
    		totalKakaoSalesWeek == 0 &&
    		mTotalSalesWeek == 0 &&
    		nTotalSalesWeek == 0 &&
    		totalSalesWeek == 0	
    ){
    	$("#chart_div").html("<img src='/resources/image/nodata.png' style='width:400px; margin-top: 5%;'/>");
    	$(".hideTable").css("display", "none");
    } else {
    	google.charts.setOnLoadCallback(drawChart);
    }

    function drawChart() {

      
      var data = google.visualization.arrayToDataTable([
          ['주간', '전체', '회원', '비회원'],
          ['합계', totalSalesWeek, mTotalSalesWeek, nTotalSalesWeek],
          ['현금', totalCashSalesWeek, mCashSalesWeek, nCashSalesWeek],
          ['카드', totalCardSalesWeek, mCardSalesWeek, nCardSalesWeek]
//          ,['카카오페이', totalKakaoSalesWeek, mKakaoSalesWeek, nKakaoSalesWeek]
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
        vAxis: {format: 'decimal'},
        legend : {position:'top'},
        height: 400,
        colors: ['#1b9e77', '#d95f02', '#7570b3']
      };

      var chart = new google.charts.Bar(document.getElementById('chart_div'));

      chart.draw(data, google.charts.Bar.convertOptions(options));
    }
});