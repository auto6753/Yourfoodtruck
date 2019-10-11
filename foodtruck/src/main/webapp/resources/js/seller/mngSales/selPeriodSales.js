/**
 * 
 */

$(document).ready(function(){
	$("#selDate").show();
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
    if(
    		mCashSalesSelPeriod == 0 &&
    		nCashSalesSelPeriod == 0 &&
    		totalCashSalesSelPeriod == 0 &&
    		mCardSalesSelPeriod == 0 &&
    		nCardSalesSelPeriod == 0 &&
    		totalCardSalesSelPeriod == 0 &&
    		mKakaoSalesSelPeriod == 0 &&
    		nKakaoSalesSelPeriod == 0 &&
    		totalKakaoSalesSelPeriod == 0 &&
    		mTotalSalesSelPeriod == 0 &&
    		nTotalSalesSelPeriod == 0 &&
    		totalSalesSelPeriod == 0	
    ){
    	$("#chart_div").html("<img src='/resources/image/nodata.png' style='width:400px; margin-top: 5%;'/>");
    	$(".hideTable").css("display", "none");
    } else {
    	google.charts.setOnLoadCallback(drawChart);
    }

    function drawChart() {

      
      var data = google.visualization.arrayToDataTable([
          ['오늘', '전체', '회원', '비회원'],
          ['합계', totalSalesSelPeriod, mTotalSalesSelPeriod, nTotalSalesSelPeriod],
          ['현금', totalCashSalesSelPeriod, mCashSalesSelPeriod, nCashSalesSelPeriod],
          ['카드', totalCardSalesSelPeriod, mCardSalesSelPeriod, nCardSalesSelPeriod]
//          ,['카카오페이', totalKakaoSalesSelPeriod, mKakaoSalesSelPeriod, nKakaoSalesSelPeriod]
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
    
    if($("#inputFirstDate").val() == "" || $("#inputLastDate").val() == ""){
    	$("#selDate").hide();
    }
});