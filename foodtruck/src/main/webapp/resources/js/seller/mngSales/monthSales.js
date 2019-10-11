/**
 * 
 */

$(document).ready(function(){
	$("#yymm").change(function(){
		$("#monthSalesRe").click();
	});

	var mCashSalesMonth = Number($("#mCashSalesMonth").val());
	var nCashSalesMonth = Number($("#nCashSalesMonth").val());
	var totalCashSalesMonth = Number($("#totalCashSalesMonth").val());
	var mCardSalesMonth = Number($("#mCardSalesMonth").val());
	var nCardSalesMonth = Number($("#nCardSalesMonth").val());
	var totalCardSalesMonth = Number($("#totalCardSalesMonth").val());
	var mKakaoSalesMonth = Number($("#mKakaoSalesMonth").val());
	var nKakaoSalesMonth = Number($("#nKakaoSalesMonth").val());
	var totalKakaoSalesMonth = Number($("#totalKakaoSalesMonth").val());
	var mTotalSalesMonth = Number($("#mTotalSalesMonth").val());
	var nTotalSalesMonth = Number($("#nTotalSalesMonth").val());
	var totalSalesMonth = Number($("#totalSalesMonth").val());
	
    google.charts.load('current', {'packages':['bar']});
    if(
    		mCashSalesMonth == 0 &&
    		nCashSalesMonth == 0 &&
    		totalCashSalesMonth == 0 &&
    		mCardSalesMonth == 0 &&
    		nCardSalesMonth == 0 &&
    		totalCardSalesMonth == 0 &&
    		mKakaoSalesMonth == 0 &&
    		nKakaoSalesMonth == 0 &&
    		totalKakaoSalesMonth == 0 &&
    		mTotalSalesMonth == 0 &&
    		nTotalSalesMonth == 0 &&
    		totalSalesMonth == 0	
    ){
    	$("#chart_div").html("<img src='/resources/image/nodata.png' style='width:400px; margin-top: 5%;'/>");
    	$(".hideTable").css("display", "none");
    } else {
    	google.charts.setOnLoadCallback(drawChart);
    }

    function drawChart() {

      var data = google.visualization.arrayToDataTable([
          ['월간', '전체', '회원', '비회원'],
          ['합계', totalSalesMonth, mTotalSalesMonth, nTotalSalesMonth],
          ['현금', totalCashSalesMonth, mCashSalesMonth, nCashSalesMonth],
          ['카드', totalCardSalesMonth, mCardSalesMonth, nCardSalesMonth]
//          ,['카카오페이', totalKakaoSalesMonth, mKakaoSalesMonth, nKakaoSalesMonth]
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