/**
 * 
 */

$(document).ready(function(){
	$("#yy").change(function(){
		$("#yearSalesRe").click();
	});
	
	var mCashSalesYear = Number($("#mCashSalesYear").val());
	var nCashSalesYear = Number($("#nCashSalesYear").val());
	var totalCashSalesYear = Number($("#totalCashSalesYear").val());
	var mCardSalesYear = Number($("#mCardSalesYear").val());
	var nCardSalesYear = Number($("#nCardSalesYear").val());
	var totalCardSalesYear = Number($("#totalCardSalesYear").val());
	var mKakaoSalesYear = Number($("#mKakaoSalesYear").val());
	var nKakaoSalesYear = Number($("#nKakaoSalesYear").val());
	var totalKakaoSalesYear = Number($("#totalKakaoSalesYear").val());
	var mTotalSalesYear = Number($("#mTotalSalesYear").val());
	var nTotalSalesYear = Number($("#nTotalSalesYear").val());
	var totalSalesYear = Number($("#totalSalesYear").val());
	
    google.charts.load('current', {'packages':['bar']});
    if(
    		mCashSalesYear == 0 &&
    		nCashSalesYear == 0 &&
    		totalCashSalesYear == 0 &&
    		mCardSalesYear == 0 &&
    		nCardSalesYear == 0 &&
    		totalCardSalesYear == 0 &&
    		mKakaoSalesYear == 0 &&
    		nKakaoSalesYear == 0 &&
    		totalKakaoSalesYear == 0 &&
    		mTotalSalesYear == 0 &&
    		nTotalSalesYear == 0 &&
    		totalSalesYear == 0	
    ){
    	$("#chart_div").html("<img src='/resources/image/nodata.png' style='width:400px; margin-top: 5%;'/>");
    	$(".hideTable").css("display", "none");
    } else {
    	google.charts.setOnLoadCallback(drawChart);
    }

    function drawChart() {

      
      var data = google.visualization.arrayToDataTable([
          ['연간', '전체', '회원', '비회원'],
          ['합계', totalSalesYear, mTotalSalesYear, nTotalSalesYear],
          ['현금', totalCashSalesYear, mCashSalesYear, nCashSalesYear],
          ['카드', totalCardSalesYear, mCardSalesYear, nCardSalesYear],
          ['카카오페이', totalKakaoSalesYear, mKakaoSalesYear, nKakaoSalesYear]
      ]);

      var options = {
        chart: {
//          title: 'Company Performance',
//          subtitle: 'Sales, Expenses, and Profit: 2014-2017',
        },
        bars: 'vertical',
        vAxis: {format: 'decimal'},
        height: 400,
        colors: ['#1b9e77', '#d95f02', '#7570b3']
      };

      var chart = new google.charts.Bar(document.getElementById('chart_div'));

      chart.draw(data, google.charts.Bar.convertOptions(options));

      var btns = document.getElementById('btn-group');

      btns.onclick = function (e) {

        if (e.target.tagName === 'BUTTON') {
          options.vAxis.format = e.target.id === 'none' ? '' : e.target.id;
          chart.draw(data, google.charts.Bar.convertOptions(options));
        }
      }
    }
});