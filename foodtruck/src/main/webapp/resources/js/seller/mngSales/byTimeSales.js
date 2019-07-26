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
	
    google.charts.load('current', {'packages':['bar']});
    
    var status = 0;
    
    for(var i=0; i<24; i++){
    	for(var j=1; j<4; j++){
    		if(byTimeSalesResult[i][j] == 0) {status = status + 1;}
    	}
    }
    console.log(status);
    if(status == 72){
    	$("#chart_div").html("<img src='/resources/image/nodata.png' style='width:400px; margin-top: 5%;'/>");
    	$(".hideTable").css("display", "none");
    } else {
    	google.charts.setOnLoadCallback(drawChart);
    }

    function drawChart() {
      
      var data = google.visualization.arrayToDataTable([
    	  ['시간대별', '전체', '회원', '비회원'],
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