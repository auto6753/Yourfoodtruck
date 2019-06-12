/**
 * 
 */

$(document).ready(function(){
	var byTimeSalesResult = new Array();
	
	for(var i=0; i<24; i++){
		var temp = new Array();
			temp.push(i+"시");
			temp.push(Number($(".byTimeSalesResult9").eq(i).val()));
			temp.push(Number($(".byTimeSalesResult10").eq(i).val()));
			temp.push(Number($(".byTimeSalesResult11").eq(i).val()));
			byTimeSalesResult.push(temp);
	}
	
	console.log(byTimeSalesResult);
    google.charts.load('current', {'packages':['bar']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
      
      var data = google.visualization.arrayToDataTable([
    	  ['시', '전체', '회원', '비회원'],
    	  [byTimeSalesResult[0][0], byTimeSalesResult[0][1], byTimeSalesResult[0][2], byTimeSalesResult[0][3]]
      ]);
      
      for(var i=1; i<24; i++){
    	  data.addRow(byTimeSalesResult[i]);
      }

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