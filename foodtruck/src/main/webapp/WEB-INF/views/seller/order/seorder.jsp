<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <meta http-equiv="Cache-Control" content="no-cache" />
            <meta http-equiv="Expires" content="0" />
            <meta http-equiv="Pragma" content="no-cache" />
            <title>당신의 푸드트럭</title>
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
            <link rel="stylesheet" href="<c:url value=" /resources/css/seller/order/seorder.css "/>">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
            <script src="https://www.gstatic.com/firebasejs/5.9.3/firebase.js"></script>
            <script src="https://www.gstatic.com/firebasejs/5.8.4/firebase-app.js"></script>
            <script src="https://www.gstatic.com/firebasejs/5.8.4/firebase-auth.js"></script>
            <script src="https://www.gstatic.com/firebasejs/5.9.3/firebase-database.js"></script>
            <style>
                @font-face {
                    font-family: 'yg-jalnan';
                    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
                    font-weight: normal;
                    font-style: normal;
                }
                
                h1 {
                    margin-top: 50px;
                    text-align: center;
                    font-size: 6rem;
                }
                
                .wrap {
                    margin-top: 50px;
                }
            </style>
        </head>

        <body>
            <h1>주문 내역</h1>
            <div class="wrap"></div>
            <div class="result"></div>
            <c:if test="${today_sales =='empty'}">
                <div class="today_sales">오늘의 매출액 : 0원</div>
            </c:if>
            <c:if test="${today_sales !='empty'}">
                <div class="today_sales">오늘의 매출액 : ${today_sales}원</div>
            </c:if>
        </body>
        <script>
            var first = true;
            var config = {
                apiKey: "AIzaSyDgw_gFc9MB7Rc8Z7WjJUOqeWT6YQOqvxU",
                authDomain: "fir-test-f3fea.firebaseapp.com",
                databaseURL: "https://fir-test-f3fea.firebaseio.com",
                projectId: "fir-test-f3fea",
                storageBucket: "fir-test-f3fea.appspot.com",
                messagingSenderId: "960564228551"
            };
            firebase.initializeApp(config);

            function getQuerystring(paramName) { //html 파라미터 넘어오는거 값 받을수있음
                var _tempUrl = window.location.search.substring(1); //url에서 처음부터 '?'까지 삭제
                //alert(_tempUrl);

                if (_tempUrl == "") return false;
                var _tempArray = _tempUrl.split('&'); // '&'을 기준으로 분리하기 
                for (var i = 0; _tempArray.length; i++) {
                    var _keyValuePair = _tempArray[i].split('='); // '=' 을 기준으로 분리하기 
                    if (_keyValuePair[0] == paramName) { // _keyValuePair[0] : 파라미터 명 // _keyValuePair[1] : 파라미터 값
                        return _keyValuePair[1];
                    }
                }
            }

            var truck_code = getQuerystring('truck_code');
            var _uid = getQuerystring('_uid');

            if (truck_code == "") {
                //alert("없당");
                truck_code = "${sessionScope.seller.truck_code}";
                _uid = '${requestScope._uid}';
            }

            //var _uid='${requestScope._uid}';

            console.log(_uid);
            var beforeSnapshot = '';
            var forDblist = new Array();
            var list = [];
            var isChecked = false;

            function pay(a) {
                var isPayed = false;
                if (!isPayed) {
                    var result = confirm('결제완료하시겠습니까?');
                    if (result) {
                        var parent_node = $('#' + a).parent();
                        //         console.log(parent_node.html());
                        //         console.log('===========');
                        //         console.log(parent_node.children().eq(1).html());
                        var payment_list = parent_node.children().eq(1);
                        //console.log(a.html());
                        $("#" + a).css("background-color", "red");
                        var telephone = $("#" + a).next().val();
                        var truckcode = $("#" + a).next().next().val();
                        telephone = telephone.substr(1);
                        telephone = telephone.substr(0, telephone.length - 1);
                        //         console.log(telephone +'//' + truckcode);
                        var pay_length = payment_list.children().length;
                        console.log(pay_length);
                        for (var i = 0; i < pay_length; i++) {
                            //<p>닭강정2 1 3400 과 hidden 두개</p>
                            var menucode = payment_list.children().eq(i);
                            var menu_code = menucode.find('.insert_menu_code');
                            var payment_class = menu_code.next();
                            var total_price = menu_code.prev();
                            var amount = total_price.prev();
                            var pay_list = {
                                truck_code: truckcode,
                                payment_telephone: telephone,
                                menu_code: menu_code.val(),
                                payment_class: parseInt(payment_class.val()),
                                total_price: parseInt(total_price.text()),
                                amount: parseInt(amount.text())
                            };
                            list.push(pay_list);
                        }
                        console.log(list);
                        for (var i = 0; i < list.length; i++) {
                            firebase.database().ref('/PaymentTest2/' + _uid + '/' + telephone + '/' + a + '/' + i + '/payed').set('payed');
                            firebase.database().ref('/PaymentResult/' + _uid + '/' + telephone + '/' + a + '/' + i).set(list[i]);
                        }

                        $.ajax({
                            type: "POST",
                            url: "/pay/insertPayment",
                            data: JSON.stringify(list),
                            contentType: "application/json;charset=UTF-8",
                            traditional: true,
                            success: function(data) {
                                console.log('success');
                            },
                            error: function(err) {
                                console.log(err);
                            }
                        });
                        list = [];
                        parent_node.addClass('payed');
                        $(this).attr('disabled', true);
                        $(this).addClass("disabled");

                    }
                } else {

                }

            }

            function release(a) {
                var isPayed = false;
                if (!isPayed) {
                    var released = confirm("조리완료하시겠습니까?");
                    if (released && isChecked) {
                        var telephone = $("#" + a).next().val();
                        telephone = telephone.substr(1);
                        telephone = telephone.substr(0, telephone.length - 1);
                        var truckcode = $("#" + a).next().next().val();
                        var date = new Date();
                        var year = date.getFullYear().toString().substr(2);
                        var month = date.getMonth() + 1;
                        var day = date.getDate();
                        var hour = date.getHours();
                        var minute = date.getMinutes();
                        var sec = date.getSeconds();
                        if ((day + '').length < 2) day = "0" + day;
                        if ((month + '').length = 1) month = "0" + month;
                        console.log(date.toString());
                        var sysdate = year + month + day + "";
                        var parent_node = $('#' + a).parent();
                        var payment_list = parent_node.children().eq(1);
                        var menucode = payment_list.children().eq(0);
                        var menu_code = menucode.find('.insert_menu_code');
                        var payment_class = menu_code.next();
                        var data = {
                            truck_code: truckcode,
                            payment_telephone: telephone,
                            payment_code: sysdate,
                            payment_class: parseInt(payment_class.val())
                        };
                        $.ajax({
                            type: "POST",
                            url: "/pay/updatePayment",
                            data: JSON.stringify(data),
                            contentType: "application/json;charset=UTF-8",
                            traditional: true,
                            success: function(data) {
                                console.log('success');
                            },
                            error: function(err) {
                                console.log(err);
                            }
                        });
                        $('.result').append(parent_node);
                        console.log(parent_node);
                        var delref = firebase.database().ref('/PaymentTest2/' + _uid + '/' + telephone + '/' + a);
                        delref.remove();
                        parent_node.removeClass("payed");
                        parent_node.addClass('ended');
                        $('#' + a).attr('disabled', 'disabled');
                        parent_node.find('.release').attr('disabled', 'disabled');
                        parent_node.find('.release').addClass('disabled');
                        var pushObj = {};
                        pushObj.notification = {};
                        pushObj.notification.title = "[${sessionScope.seller.brandname}] 주문이 완료되었습니다!";
                        pushObj.notification.body = "맛있게 드시고 리뷰남겨주세요!";
                        pushObj.notification.sound = "default";
                        pushObj.to = "/topics/order";
                        pushObj.priority = "high";
                        pushObj.data = {};
                        pushObj.data.toLink = "review";
                        console.log(pushObj);
                        //alert(pushObj.to);
                        $.ajax({
                            type: "post",
                            url: "/pushTest2",
                            data: JSON.stringify(pushObj),
                            contentType: "application/json; chartset=UTF-8",
                            success: function(data) {
                                alert("성공적으로 보냈습니다!");
                                updateTodaySales();
                            },
                            error: function(err) {
                                alert("ajax 연결 실패!");
                                console.log(JSON.stringify(err));
                            }
                        });
                        //updateTodaySales();
                    } else if (!isChecked) {
                        alert("결제완료을 먼저 하십시오");
                    }
                }

            }

            function updateTodaySales() {
                $.ajax({
                    type: "POST",
                    url: "/pay/updateTodaySales",
                    contentType: "application/json;charset=UTF-8",
                    traditional: true,
                    success: function(data) {
                        var json = JSON.parse(data);
                        console.log(json);
                        //alert(data);
                        if (json.today_sales == "empty") {
                            $('.today_sales').html("오늘의 매출액 : 0원");
                        } else {
                            $('.today_sales').html("오늘의 매출액 : " + json.today_sales + "원");
                        }

                    },
                    error: function(err) {
                        console.log(err);
                    }
                });
            }

            $(function() {
                var truck_code = "${sessionScope.seller.truck_code}";
                var isfirst = true;
                var ref = firebase.database().ref('/PaymentTest2/' + _uid + '/').limitToFirst(15);
                ref.once('value').then(function(snapshot) {
                    first = false;
                }).catch(function(err) {
                    console.log(err.errorMessage);
                });
                var index;
                ref.on('value', function(snapshot) {
                    if (isfirst) {
                        var result = snapshot.val();
                        console.log(result);
                        for (var menus in result) {
                            console.log('=====결과를 전화번호별로 구분=====');
                            console.log(menus);
                            console.log(result[menus]);
                            var orderList = result[menus];

                            for (var order in orderList) {
                                console.log('=======전화번호별 거래내용들을 보여줌(같은번호로 했을떄 한개만)=======');
                                console.log(orderList[order]); //전화번호별 거래내역
                                console.log("'" + order + "'"); //전화번호
                                var order_index = orderList[order].length; //한사람당 주문한 제품개수
                                console.log(order_index);
                                $('.wrap').append('<div id="list" class="list" style=""><div class="head"><h4>' + orderList[order][0].payment_telephone + '</h4><span class="num"></span><div style="margin-top:30px; border-bottom:solid 1px black;"><span class="info_div"></span></div></div><div id="' + orderList[order][0].payment_telephone + '" class="menu"style="overflow-y: scroll; overflow-x: hidden;"></div><button class="button orange" id="' + order + '"  onclick="pay(\'' + order + '\')" class="pay">결제완료</button><input type="hidden" value="\'' + orderList[order][0].payment_telephone + '\'"><input type="hidden" value="' + truck_code + '"><button class=" orange button release" onclick="release(\'' + order + '\')">조리완료</button></div>');
                                var timeTxt = order.slice(2, -6);
                                timeTxt = timeTxt.replace("_", "-");
                                timeTxt = timeTxt.replace("_", " ");
                                $('.num').text("주문시간 " + timeTxt);
                                var payment_class = orderList[order][0].payment_class;
                                console.log(payment_class);
                                if (payment_class == '2' || payment_class == '5') {
                                    $('.info_div').text('삼성카드 9410-****-****-*949');
                                }
                                if (payment_class == '1' || payment_class == '4') {
                                    $('.info_div').text('   현금');
                                }
                                if (order_index > 1) {
                                    var se_total_price = 0;
                                    for (var i = 0; i < order_index; i++) {
                                        $('#' + orderList[order][0].payment_telephone + '').append('<p><span>' + orderList[order][i].name + '</span>&nbsp;<span>' + orderList[order][i].amount + '</span>&nbsp;<span>' + orderList[order][i].total_price + '</span><input type="hidden" class="insert_menu_code" value="' + orderList[order][i].menu_code + '"><input type="hidden" class="insert_payment_class" value="' + orderList[order][i].payment_class + '"></p>');
                                        //총 금액 표시하기
                                        se_total_price += orderList[order][i].total_price;
                                        if (orderList[order][0].payed == 'payed') {
                                            $('#' + orderList[order][0].payment_telephone + '').parent().addClass('payed');
                                            $("#" + orderList[order][0].payment_telephone).next().attr("disabled", true);
                                            $("#" + orderList[order][0].payment_telephone).next().addClass("disabled");
                                            isChecked = true;
                                        }
                                        console.log(se_total_price);
                                        /*                      $('.menu').append('<span class="orderInfo">'+orderList[order][i].total_price+'</span><br/>');
                                                             $('.menu').append('<span class="orderInfo">'+orderList[order][i].payment_telephone+'</span><br/>'); */
                                    }
                                    var parent_node = $('#' + orderList[order][0].payment_telephone + '').parent();
                                    console.log(parent_node);
                                    console.log(parent_node.children('.head'));
                                    console.log(parent_node.children('.head').children('.num'));
                                    console.log($('#' + orderList[order][0].payment_telephone + ''));
                                    parent_node.children('.head').children('.num').after('<span class="se_total">&nbsp;&nbsp;' + se_total_price + '원</span>');
                                } else {
                                    $('#' + orderList[order][0].payment_telephone + '').append('<p><span>' + orderList[order][0].name + '</span>&nbsp;<span>' + orderList[order][0].amount + '</span>&nbsp;<span>' + orderList[order][0].total_price + '</span><input type="hidden" class="insert_menu_code" value="' + orderList[order][0].menu_code + '"><input type="hidden" class="insert_payment_class" value="' + orderList[order][0].payment_class + '"></p>');
                                    if (orderList[order][0].payed == 'payed') {
                                        $('#' + orderList[order][0].payment_telephone + '').parent().addClass('payed');
                                        $("#" + orderList[order][0].payment_telephone).next().attr("disabled", true);
                                        $("#" + orderList[order][0].payment_telephone).next().addClass("disabled");
                                        isChecked = true;
                                    }
                                    var parent_node = $('#' + orderList[order][0].payment_telephone + '').parent();
                                    console.log(parent_node);
                                    console.log(parent_node.children('.head'));
                                    console.log(parent_node.children('.head').children('.num'));
                                    console.log($('#' + orderList[order][0].payment_telephone + ''));
                                    parent_node.children('.head').children('.num').after('<span class="se_total">&nbsp;&nbsp;' + orderList[order][0].total_price + '원</span>');
                                    /*                   $('.menu').append('<span class="orderInfo">'+orderList[order][0].total_price+'</span><br/>');
                                                      $('.menu').append('<span class="orderInfo">'+orderList[order][0].payment_telephone+'</span><br/>');    */
                                }
                                break;
                            }
                        }
                        isfirst = false;
                    } else {
                        $('.wrap').html("");
                        var result = snapshot.val();
                        console.log(result);
                        for (var menus in result) {
                            console.log('=====결과를 전화번호별로 구분=====');
                            console.log(menus);
                            console.log(result[menus]);
                            var orderList = result[menus];

                            for (var order in orderList) {
                                console.log('=======전화번호별 거래내용들을 보여줌(같은번호로 했을떄 한개만)=======');
                                console.log(orderList[order]); //전화번호별 거래내역
                                console.log(order); //전화번호
                                var order_index = orderList[order].length; //한사람당 주문한 제품개수
                                console.log(order_index);
                                $('.wrap').append('<div id="list" class="list" style=""><div class="head"><h4>' + orderList[order][0].payment_telephone +
                                    '</h4><span class="num"></span><div style="margin-top:30px; border-bottom:solid 1px black;"><span class="info_div"></span></div></div><div id="' +
                                    orderList[order][0].payment_telephone +
                                    '" class="menu"style="overflow-y: scroll; overflow-x: hidden;"></div><button class="button orange" id="' + order +
                                    '"  onclick="pay(\'' + order + '\')" class="pay">결제완료</button><input type="hidden" value="\'' +
                                    orderList[order][0].payment_telephone + '\'"><input type="hidden" value="${sessionScope.seller.truck_code }"><button class="button orange release"  onclick="release(\'' + order + '\')">조리완료</button></div>');
                                var timeTxt = order.slice(2, -6);
                                timeTxt = timeTxt.replace("_", "-");
                                timeTxt = timeTxt.replace("_", " ");
                                $('.num').text("주문시간 " + timeTxt);
                                var payment_class = orderList[order][0].payment_class;
                                console.log(payment_class);
                                if (payment_class == '2' || payment_class == '5') {
                                    $('.info_div').text('삼성카드 9410-****-****-*949');
                                }
                                if (payment_class == '1' || payment_class == '4') {
                                    $('.info_div').text('   현금');
                                }
                                if (order_index > 1) {
                                    var se_total_price = 0;
                                    for (var i = 0; i < order_index; i++) {
                                        $('#' + orderList[order][0].payment_telephone + '').append('<p><span>' + orderList[order][i].name + '</span>&nbsp;<span>' + orderList[order][i].amount + '</span>&nbsp;<span>' + orderList[order][i].total_price + '</span><input type="hidden" class="insert_menu_code" value="' + orderList[order][i].menu_code + '"><input type="hidden" class="insert_payment_class" value="' + orderList[order][i].payment_class + '"></p>');
                                        se_total_price += orderList[order][i].total_price;
                                        if (orderList[order][0].payed == 'payed') {
                                            $('#' + orderList[order][0].payment_telephone + '').parent().addClass('payed');
                                            $("#" + orderList[order][0].payment_telephone).next().attr("disabled", true);
                                            $("#" + orderList[order][0].payment_telephone).next().addClass("disabled");
                                            isChecked = true;
                                        }
                                        /*                      $('.menu').append('<span class="orderInfo">'+orderList[order][i].total_price+'</span><br/>');
                                                             $('.menu').append('<span class="orderInfo">'+orderList[order][i].payment_telephone+'</span><br/>'); */
                                    }
                                    var parent_node = $('#' + orderList[order][0].payment_telephone + '').parent();
                                    console.log(parent_node);
                                    console.log(parent_node.children('.head'));
                                    console.log(parent_node.children('.head').children('.num'));
                                    console.log($('#' + orderList[order][0].payment_telephone + ''));
                                    parent_node.children('.head').children('.num').after('<span class="se_total">&nbsp;&nbsp;' + se_total_price + '원</span>');
                                } else {
                                    $('#' + orderList[order][0].payment_telephone + '').append('<p><span>' + orderList[order][0].name + '</span>&nbsp;<span>' + orderList[order][0].amount + '</span>&nbsp;<span>' + orderList[order][0].total_price + '</span><input type="hidden" class="insert_menu_code" value="' + orderList[order][0].menu_code + '"><input type="hidden" class="insert_payment_class" value="' + orderList[order][0].payment_class + '"></p>');
                                    if (orderList[order][0].payed == 'payed') {
                                        $('#' + orderList[order][0].payment_telephone + '').parent().addClass('payed');
                                        $("#" + orderList[order][0].payment_telephone).next().attr("disabled", true);
                                        $("#" + orderList[order][0].payment_telephone).next().addClass("disabled");
                                        isChecked = true;
                                    }
                                    var parent_node = $('#' + orderList[order][0].payment_telephone + '').parent();
                                    console.log(parent_node);
                                    console.log(parent_node.children('.head'));
                                    console.log(parent_node.children('.head').children('.num'));
                                    console.log($('#' + orderList[order][0].payment_telephone + ''));
                                    parent_node.children('.head').children('.num').after('<span class="se_total">&nbsp;&nbsp;' + orderList[order][0].total_price + '원</span>');
                                    /*                   $('.menu').append('<span class="orderInfo">'+orderList[order][0].total_price+'</span><br/>');
                                                      $('.menu').append('<span class="orderInfo">'+orderList[order][0].payment_telephone+'</span><br/>');    */
                                }
                                break;
                            }
                        }
                    }
                });
            });
        </script>

        </html>