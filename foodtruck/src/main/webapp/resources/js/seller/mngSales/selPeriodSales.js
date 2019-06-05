/**
 * 
 */

$(document).ready(function(){
	var mCashSalesSelPeriod = Number($("#mCashSalesSelPeriod").val());
	var nCashSalesSelPeriod = Number($("#nCashSalesSelPeriod").val());
	var totalCashSalesSelPeriod = Number($("#totalCashSalesSelPeriod").val());
	var mCardSalesSelPeriod = Number($("#mCardSalesSelPeriod").val());
	var nCardSalesSelPeriod = Number($("#nCardSalesSelPeriod").val());
	var totalCardSalesSelPeriod = Number($("#totalCardSalesSelPeriod").val());
	var mKakaoSalesSelPeriod = Number($("#mKakaoSalesSelPeriod").val());
	var nKakaoSalesSelPeriod = Number($("#nKakaoSalesSelPeriod").val());
	var totalKakaoSalesSelPeriod = Number($("#totalKakaoSalesSelPeriod").val());
	var mTotalSalesSelPeriod = Number($("#mTotalSalesSelPeriod").val());
	var nTotalSalesSelPeriod = Number($("#nTotalSalesSelPeriod").val());
	var totalSalesSelPeriod = Number($("#totalSalesSelPeriod").val());
	
    google.charts.load('current', {'packages':['bar']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

      
      var data = google.visualization.arrayToDataTable([
          ['오늘', '전체', '회원', '비회원'],
          ['합계', totalSalesSelPeriod, mTotalSalesSelPeriod, nTotalSalesSelPeriod],
          ['현금', totalCashSalesSelPeriod, mCashSalesSelPeriod, nCashSalesSelPeriod],
          ['카드', totalCardSalesSelPeriod, mCardSalesSelPeriod, nCardSalesSelPeriod],
          ['카카오페이', totalKakaoSalesSelPeriod, mKakaoSalesSelPeriod, nKakaoSalesSelPeriod]
      ]);

      var options = {
        chart: {
          title: 'Company Performance',
          subtitle: 'Sales, Expenses, and Profit: 2014-2017',
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