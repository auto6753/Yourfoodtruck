<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet" href="<c:url value ="/resources/css/customercss/customercss.css"/>"/>
<script>
	$(document).ready(function() {
		$(".review").click(function() {
			location.href = "/project/customer/review";
		});
		$(".callList").click(function() {
			location.href = "/project/customer/callList";
		});
		$(".goodbyeForm").click(function() {
			location.href = "/project/customer/goodbyeForm";
		});
		$(".onboard").click(function() {
			location.href = "/project/customer/onboard";
		});
		$(".onSale").click(function() {
			location.href = "/project/customer/onSale";
		});
		$(".cusInfo").click(function() {
			location.href = "/project/customer/cusInfo";
		});
	});
</script>

<div>
	<div id="title" class="col">
		<div id="container" class="snip1535 text onboard col">탑승트럭<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 64 80" enable-background="new 0 0 64 64" xml:space="preserve"><g><g><path d="M46.2167969,21.9897461h-3.3837891v-2.3330078h7.125c0.2763672,0,0.5-0.2236328,0.5-0.5v-6.875    c0-0.2763672-0.2236328-0.5-0.5-0.5h-38c-0.2763672,0-0.5,0.2236328-0.5,0.5v6.875c0,0.2763672,0.2236328,0.5,0.5,0.5h7.125    v2.3330078H7c-0.2763672,0-0.5,0.2236328-0.5,0.5v17.0834961V42.65625v5.5771484c0,0.2763672,0.2236328,0.5,0.5,0.5h8.1872559    c0.2490234,1.9595947,1.9077759,3.4853516,3.9338379,3.4853516s3.6856079-1.5257568,3.9348145-3.4853516H36h4.9440918    c0.2492065,1.9595947,1.9087524,3.4853516,3.9348145,3.4853516s3.6848145-1.5257568,3.9338379-3.4853516h4.6550293    c2.2236328,0,4.0322266-1.8085938,4.0322266-4.0322266V42.65625v-3.0830078v-6.2998047    C57.5,27.0517578,52.4384766,21.9897461,46.2167969,21.9897461z M12.4580078,12.7817383h37v5.875h-37V12.7817383z     M20.0830078,19.6567383h21.75v2.3330078h-21.75V19.6567383z M46.2167969,22.9897461    C51.8867188,22.9897461,56.5,27.6030273,56.5,33.2734375v5.7998047H45.3789062v-14.5c0-0.2763672-0.2236328-0.5-0.5-0.5H36H11    c-0.2763672,0-0.5,0.2236328-0.5,0.5v4.4165039v1.5834961v8.5h-3V22.9897461H46.2167969z M56.5,42.15625H45.3789062v-2.0830078    H56.5V42.15625z M7.5,40.0732422h3.2838135c0.06604,0.0321045,0.1377563,0.0537109,0.2161865,0.0537109h24.5V42.15625h-28    V40.0732422z M30.125,37.3027344h2.1875v1.7705078H30.125V37.3027344z M33.3125,37.3027344H35.5v1.7705078h-2.1875V37.3027344z     M29.125,39.0732422h-2.1875v-1.7705078h2.1875V39.0732422z M32.8125,36.3027344H29.625h-3.1875    c-0.2763672,0-0.5,0.2236328-0.5,0.5v2.2705078H11.5v-6.2802734c0.5319824,0.4797363,1.2288818,0.7802734,2,0.7802734    c1.0436401,0,1.9624023-0.5369263,2.5-1.3477173c0.5375977,0.810791,1.4563599,1.3477173,2.5,1.3477173    s1.9624023-0.5369263,2.5-1.3477173c0.5375977,0.810791,1.4563599,1.3477173,2.5,1.3477173s1.9624023-0.5369263,2.5-1.3477173    c0.5375977,0.810791,1.4563599,1.3477173,2.5,1.3477173s1.9624023-0.5369263,2.5-1.3477173    c0.5375977,0.810791,1.4563599,1.3477173,2.5,1.3477173c0.7711182,0,1.4680176-0.3005371,2-0.7802734v3.5097656H32.8125z     M11.5,29.4897461h4v1.0834961c0,1.1030273-0.8974609,2-2,2s-2-0.8969727-2-2V29.4897461z M20.5,29.4897461v1.0834961    c0,1.1030273-0.8974609,2-2,2s-2-0.8969727-2-2v-1.0834961H20.5z M25.5,29.4897461v1.0834961c0,1.1030273-0.8974609,2-2,2    s-2-0.8969727-2-2v-1.0834961H25.5z M30.5,29.4897461v1.0834961c0,1.1030273-0.8974609,2-2,2s-2-0.8969727-2-2v-1.0834961H30.5z     M35.5,30.5732422c0,1.1030273-0.8974609,2-2,2s-2-0.8969727-2-2v-1.0834961h4V30.5732422z M35.5,28.4897461H31h-5h-5h-5h-4.5    v-3.4165039h24V28.4897461z M7.5,43.15625h28v4.5771484H23.0559082c-0.2492676-1.9594116-1.9087524-3.484375-3.9348145-3.484375    s-3.6847534,1.5249634-3.9338379,3.484375H7.5V43.15625z M19.1210938,51.21875    c-1.6455078,0-2.984375-1.3388672-2.984375-2.9853516c0-1.6455078,1.3388672-2.984375,2.984375-2.984375    c1.6144409,0,2.9251709,1.2894287,2.9758911,2.8908081c-0.0061646,0.0313721-0.0188599,0.0603638-0.0188599,0.0935669    s0.0126953,0.0621948,0.0188599,0.0935669C22.0462646,49.9293213,20.7355347,51.21875,19.1210938,51.21875z M36.5,42.65625    v-3.0292969v-0.0537109v-2.7705078v-6.2294922v-1.5834961v-3.9165039h7.8789062v14.5V42.65625v1.6433105    c-1.7940063,0.2279663-3.206604,1.6400146-3.4348145,3.4338379H36.5V42.65625z M44.8789062,51.21875    c-1.6464844,0-2.9853516-1.3388672-2.9853516-2.9853516c0-1.6455078,1.3388672-2.984375,2.9853516-2.984375    c1.6455078,0,2.984375,1.3388672,2.984375,2.984375C47.8632812,49.8798828,46.5244141,51.21875,44.8789062,51.21875z     M53.4677734,47.7333984h-4.6550293c-0.2280273-1.7938232-1.6400146-3.2058105-3.4338379-3.4338379V43.15625H56.5v1.5449219    C56.5,46.3730469,55.1396484,47.7333984,53.4677734,47.7333984z"/><path d="M46.6669922,35.40625h8.4003906c0.2763672,0,0.5-0.2236328,0.5-0.5v-1.9326172    c0-4.9077148-3.9931641-8.9003906-8.9003906-8.9003906c-0.2763672,0-0.5,0.2236328-0.5,0.5V34.90625    C46.1669922,35.1826172,46.390625,35.40625,46.6669922,35.40625z M47.1669922,25.0888672    c4.1240234,0.2587891,7.4003906,3.6962891,7.4003906,7.8847656V34.40625h-7.4003906V25.0888672z"/><path d="M43.5,36.9033203c0.2763672,0,0.5-0.2236328,0.5-0.5s-0.2236328-0.5-0.5-0.5h-2.75c-0.2763672,0-0.5,0.2236328-0.5,0.5    s0.2236328,0.5,0.5,0.5H43.5z"/><path d="M43.4824219,31.8632812v-4.8334961c0-0.2763672-0.2236328-0.5-0.5-0.5h-5.0859375c-0.2763672,0-0.5,0.2236328-0.5,0.5    v4.8334961c0,0.2763672,0.2236328,0.5,0.5,0.5h5.0859375C43.2587891,32.3632812,43.4824219,32.1396484,43.4824219,31.8632812z     M42.4824219,31.3632812h-4.0859375v-3.8334961h4.0859375V31.3632812z"/></g></g><text x="0" y="79" fill="#000000" font-size="5px" font-weight="bold" font-family="'Helvetica Neue', Helvetica, Arial-Unicode, Arial, Sans-serif"></text><text x="0" y="84" fill="#000000" font-size="5px" font-weight="bold" font-family="'Helvetica Neue', Helvetica, Arial-Unicode, Arial, Sans-serif"></text></svg></div>
		<div id="container" class="snip1535 text onSale col">운행중인트럭<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 125" x="0px" y="0px"><title>food</title><g data-name="Layer 2"><g data-name="Layer 1"><path d="M46.66,18a2.1,2.1,0,0,0-2.1,2.1V37a5.07,5.07,0,0,1-2.71,4.49,2.1,2.1,0,0,0-1.12,1.92l1,31.82a2.27,2.27,0,1,1-4.5.06l1-31.88a2.1,2.1,0,0,0-1.12-1.92A5.07,5.07,0,0,1,34.39,37V20.06a2.1,2.1,0,1,0-4.19,0V37A9.25,9.25,0,0,0,34,44.48L33,75.23A6.64,6.64,0,0,0,39.48,82a6.66,6.66,0,0,0,6.44-6.87L45,44.48A9.25,9.25,0,0,0,48.76,37V20.06A2.1,2.1,0,0,0,46.66,18Z"/><path d="M39.48,37a2.1,2.1,0,0,0,2.1-2.1V20.06a2.1,2.1,0,0,0-4.19,0V35A2.1,2.1,0,0,0,39.48,37Z"/><path d="M58.81,18.43a2.1,2.1,0,0,0-3.42,1.63V75.23a6.45,6.45,0,1,0,12.89,0s0-.08,0-.12L67.2,56.4C77.32,33.88,59,18.59,58.81,18.43Zm5.27,56.84a2.27,2.27,0,1,1-4.5-.05V25.31c4.2,5.29,10,16,3.6,29.81a2.08,2.08,0,0,0-.19,1Z"/><path d="M50,0a50,50,0,1,0,50,50A50.06,50.06,0,0,0,50,0Zm0,95.81A45.81,45.81,0,1,1,95.81,50,45.86,45.86,0,0,1,50,95.81Z"/></g></g><text x="0" y="115" fill="#000000" font-size="5px" font-weight="bold" font-family="'Helvetica Neue', Helvetica, Arial-Unicode, Arial, Sans-serif"></text><text x="0" y="120" fill="#000000" font-size="5px" font-weight="bold" font-family="'Helvetica Neue', Helvetica, Arial-Unicode, Arial, Sans-serif"></text></svg></div>
		<div id="container" class="snip1535 text review col" >리뷰 및 평점<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 100 125" style="enable-background:new 0 0 100 100;" xml:space="preserve"><g><path d="M54.0922852,11.25c-17.6658325,0-32.1099854,14.1811523-32.5354004,31.753479   c-2.4482422,1.574585-3.9523926,4.2637329-3.9523926,7.2098999c0,4.4293823,3.2769775,8.0428467,7.5877686,8.5435181   c0.3866577,0.7507324,0.7964478,1.4849243,1.2369995,2.1937256c-0.0693359-0.0010986-0.1376953-0.0126343-0.2070923-0.0126343   c-7.0961914,0-12.8696289,5.7734375-12.8696289,12.8696289V87.5c0,0.6904297,0.5595703,1.25,1.25,1.25h23.2387695   c0.6904297,0,1.25-0.5595703,1.25-1.25v-9.7651978l6.5356445-2.5062866   c2.7543945,0.7436523,5.6000977,1.1201172,8.465332,1.1201172c17.9511719,0,32.5551758-14.6040039,32.5551758-32.5551758   C86.6474609,25.8491211,72.043457,11.25,54.0922852,11.25z M20.1044922,50.2133789   c0-2.2709961,1.2504883-4.3388672,3.2670898-5.3979492c0.8876953-0.4692383,1.8466797-0.7075195,2.8505859-0.7075195   c3.3730469,0,6.1171875,2.7387695,6.1171875,6.1054688c0,3.3730469-2.7441406,6.1171875-6.1796875,6.1176758   c-0.0454102-0.0063477-0.0913086-0.0102539-0.137207-0.0117188C22.7041016,56.2202148,20.1044922,53.5380859,20.1044922,50.2133789   z M36.5913086,86.25H15.8525391V73.8076172c0-5.7177734,4.6518555-10.3696289,10.3696289-10.3696289   c0.8481445,0,1.6904297,0.1030273,2.5039063,0.3066406c1.8359375,0.4584961,3.5068359,1.4018555,4.8295898,2.7241211   c1.9575195,1.96875,3.0356445,4.574707,3.0356445,7.3388672v3.0678711V86.25z M54.0922852,73.8486328   c-2.7749023,0-5.5292969-0.3823242-8.1870117-1.137207c-0.2597656-0.0742188-0.5356445-0.0615234-0.7890625,0.0356445   l-6.0249023,2.3105469v-1.25c0-3.4291992-1.3364258-6.6616211-3.765625-9.1040039   c-0.3986206-0.3986206-0.8242798-0.7664185-1.2698364-1.1074829c-0.1486206-0.1137695-0.3109741-0.2069092-0.4642944-0.3139648   c-0.3063354-0.2139282-0.6115723-0.4285278-0.9354248-0.6149902c-0.194397-0.1119385-0.4000854-0.2019653-0.6003418-0.303772   c-0.3001709-0.1525879-0.5983887-0.3071899-0.9104004-0.4362183c-0.2232666-0.0924072-0.4545288-0.1637573-0.6832886-0.2437134   c-0.2310791-0.0807495-0.4549561-0.1786499-0.6911011-0.24646c-0.6489258-0.8808594-1.2519531-1.8115234-1.8037109-2.7841797   c0.2617798-0.0540161,0.5184326-0.1218262,0.7709961-0.1990967c0.0820923-0.0251465,0.1611938-0.0565796,0.2422485-0.0841064   c0.1708374-0.0579224,0.3407593-0.1176758,0.5066528-0.1858521c0.0940552-0.0386353,0.1851807-0.0820313,0.2775269-0.1239014   c0.1484375-0.0672607,0.2954712-0.1365967,0.43927-0.2119141c0.0942383-0.0493774,0.1864624-0.1013184,0.2786255-0.1540527   c0.137146-0.0784302,0.2717896-0.1602173,0.4041138-0.2457886c0.0889282-0.0575562,0.177063-0.1156616,0.2637939-0.1763916   c0.1315308-0.0921021,0.2590332-0.1889038,0.3850098-0.2880249c0.0795288-0.062561,0.159729-0.1237793,0.2369385-0.1889648   c0.1328735-0.1122437,0.2598877-0.2306519,0.3857422-0.350647c0.0625-0.0596313,0.1275635-0.116272,0.1882935-0.1776733   c0.173584-0.1755981,0.3400269-0.3580322,0.4981079-0.5478516c0.0083618-0.0100098,0.0178223-0.019165,0.0261841-0.0292358   c0.1653442-0.2003784,0.3201904-0.4094849,0.4671631-0.6243896c0.0474854-0.069397,0.0894165-0.142395,0.1348877-0.2131958   c0.0956421-0.1489868,0.1895752-0.2989502,0.276123-0.4539795c0.0491943-0.0880737,0.0935059-0.1787109,0.1396484-0.2686768   c0.0741577-0.1445923,0.1459351-0.2902832,0.2120361-0.4394531c0.0430298-0.097168,0.0829468-0.1955566,0.1224976-0.2945557   c0.0593262-0.1486816,0.1144409-0.2990112,0.1655884-0.4515381c0.0341797-0.1018677,0.0674438-0.2039185,0.0978394-0.3074341   c0.0466309-0.1586914,0.0866699-0.3197021,0.1242065-0.4820557c0.0232544-0.1005249,0.0480957-0.2001953,0.0678101-0.302063   c0.034668-0.1791382,0.0599976-0.361084,0.083313-0.5439453c0.0113525-0.088623,0.0269165-0.1757202,0.0354614-0.2651978   c0.0262451-0.2732544,0.0419922-0.5494995,0.0419922-0.8294678c0-4.7451172-3.8657227-8.6054688-8.6171875-8.6054688   c-0.3586426,0-0.7130737,0.0223389-1.0629883,0.0652466c-0.1154785,0.0141602-0.2272949,0.0439453-0.3417358,0.0627441   c-0.2322998,0.038147-0.46521,0.0734253-0.6928101,0.1306763c-0.008728,0.0021973-0.0178223,0.0028076-0.0264893,0.0050049   C25.0957031,26.2036133,38.1835938,13.75,54.0922852,13.75c16.5722656,0,30.0551758,13.4775391,30.0551758,30.043457   C84.1474609,60.3657227,70.6645508,73.8486328,54.0922852,73.8486328z"/><path d="M37.6318359,41.9799805c-0.1420898,0.5039063,0.0449219,1.0424805,0.4682617,1.3500977   c0.4233398,0.3081055,0.9931641,0.3193359,1.4287109,0.0283203l4.0239258-2.6855469l4.0234375,2.6855469   c0.2104492,0.140625,0.4521484,0.2104492,0.6938477,0.2104492c0.2583008,0,0.5161133-0.0800781,0.7348633-0.2387695   c0.4233398-0.3076172,0.6103516-0.8461914,0.4682617-1.3500977l-1.3110352-4.65625l3.7978516-2.996582   c0.4106445-0.3242188,0.5761719-0.8701172,0.4145508-1.3676758c-0.1621094-0.4975586-0.6166992-0.8417969-1.1391602-0.862793   l-4.8339844-0.1918945l-1.6762695-4.5375977c-0.1811523-0.4907227-0.6489258-0.8168945-1.1723633-0.8168945   s-0.9912109,0.3261719-1.1723633,0.8168945l-1.6767578,4.5375977l-4.8334961,0.1918945   c-0.5224609,0.0209961-0.9770508,0.3652344-1.1391602,0.862793c-0.1616211,0.4975586,0.0039063,1.043457,0.4145508,1.3676758   l3.7973633,2.996582L37.6318359,41.9799805z M41.6367188,34.3696289c0.5043945-0.0200195,0.9477539-0.3417969,1.1225586-0.815918   l0.793457-2.1464844l0.7929688,2.1464844c0.1748047,0.4741211,0.6181641,0.7958984,1.1225586,0.815918l2.2866211,0.0908203   l-1.7963867,1.4174805c-0.3964844,0.3129883-0.565918,0.8339844-0.4287109,1.3203125l0.6201172,2.2021484l-1.9033203-1.2700195   c-0.4194336-0.2802734-0.9672852-0.2802734-1.3876953,0l-1.9038086,1.2705078l0.6201172-2.2026367   c0.137207-0.4863281-0.0322266-1.0073242-0.4287109-1.3203125l-1.7963867-1.4174805L41.6367188,34.3696289z"/><path d="M72.3149414,32.0966797l-4.8339844-0.1918945l-1.6762695-4.5375977   c-0.1811523-0.4907227-0.6489258-0.8168945-1.1723633-0.8168945s-0.9912109,0.3261719-1.1723633,0.8168945l-1.6767578,4.5375977   l-4.8334961,0.1918945c-0.5224609,0.0209961-0.9770508,0.3652344-1.1391602,0.862793   c-0.1616211,0.4975586,0.0039063,1.043457,0.4145508,1.3676758l3.7973633,2.996582l-1.3110352,4.65625   c-0.1420898,0.5039063,0.0449219,1.0424805,0.4682617,1.3500977c0.4233398,0.3081055,0.9936523,0.3193359,1.4287109,0.0283203   l4.0239258-2.6855469l4.0234375,2.6855469c0.2104492,0.140625,0.4521484,0.2104492,0.6938477,0.2104492   c0.2583008,0,0.5161133-0.0800781,0.7348633-0.2387695c0.4233398-0.3076172,0.6103516-0.8461914,0.4682617-1.3500977   l-1.3110352-4.65625l3.7978516-2.996582c0.4106445-0.3242188,0.5761719-0.8701172,0.4145508-1.3676758   C73.2919922,32.4619141,72.8374023,32.1176758,72.3149414,32.0966797z M67.0380859,35.8779297   c-0.3964844,0.3129883-0.565918,0.8339844-0.4287109,1.3203125l0.6201172,2.2021484l-1.9033203-1.2700195   c-0.4194336-0.2802734-0.9672852-0.2802734-1.3876953,0l-1.9038086,1.2705078l0.6201172-2.2026367   c0.137207-0.4863281-0.0322266-1.0073242-0.4287109-1.3203125l-1.7963867-1.4174805l2.2866211-0.0908203   c0.5043945-0.0200195,0.9477539-0.3417969,1.1225586-0.815918l0.793457-2.1464844l0.7929688,2.1464844   c0.1748047,0.4741211,0.6181641,0.7958984,1.1225586,0.815918l2.2866211,0.0908203L67.0380859,35.8779297z"/><path d="M70.1806641,48.1044922H38.6918945c-0.6904297,0-1.25,0.5595703-1.25,1.25s0.5595703,1.25,1.25,1.25h31.4887695   c0.6904297,0,1.25-0.5595703,1.25-1.25S70.8710938,48.1044922,70.1806641,48.1044922z"/><path d="M70.1806641,53.9614258H45.5268555c-0.6904297,0-1.25,0.5595703-1.25,1.25s0.5595703,1.25,1.25,1.25h24.6538086   c0.6904297,0,1.25-0.5595703,1.25-1.25S70.8710938,53.9614258,70.1806641,53.9614258z"/><path d="M70.1806641,59.8188477H50.121582c-0.6904297,0-1.25,0.5595703-1.25,1.25s0.5595703,1.25,1.25,1.25h20.059082   c0.6904297,0,1.25-0.5595703,1.25-1.25S70.8710938,59.8188477,70.1806641,59.8188477z"/></g><text x="0" y="115" fill="#000000" font-size="5px" font-weight="bold" font-family="'Helvetica Neue', Helvetica, Arial-Unicode, Arial, Sans-serif"></text><text x="0" y="120" fill="#000000" font-size="5px" font-weight="bold" font-family="'Helvetica Neue', Helvetica, Arial-Unicode, Arial, Sans-serif"></text></svg></div>
		<div id="container" class="snip1535 text callList col">호출내역<svg xmlns:x="http://ns.adobe.com/Extensibility/1.0/" xmlns:i="http://ns.adobe.com/AdobeIllustrator/10.0/" xmlns:graph="http://ns.adobe.com/Graphs/1.0/" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 100 125" style="enable-background:new 0 0 100 100;" xml:space="preserve"><switch><foreignObject requiredExtensions="http://ns.adobe.com/AdobeIllustrator/10.0/" x="0" y="0" width="1" height="1"/><g i:extraneous="self"><g><path d="M83.4,68.7l-11.1-8.8c-2.1-1.7-4.7-2.6-7.4-2.6c-3.5,0-6.8,1.5-9.1,4.2c-1.4,1.7-2.4,2.7-2.9,3.3     c-1.9-0.2-6.3-2.1-11-6.7c-5-5-6.6-9.4-6.7-11c0.6-0.5,1.6-1.4,3.3-2.9c4.9-4.2,5.6-11.4,1.6-16.5l-8.8-11.1     c-2.3-2.9-5.7-4.5-9.4-4.5c-1.6,0-3.2,0.3-4.8,1c-3.4,1.5-7.4,4.1-9.6,6.3c-3.4,3.4-8.1,11.3-2.5,26.5c3.6,9.6,10.6,20,19.8,29.2     c13.8,13.8,30,22.4,42.2,22.4c5.5,0,10.2-1.8,13.5-5.1c2.2-2.2,4.8-6.2,6.3-9.6C89.1,77.8,87.7,72,83.4,68.7z M81,80.2     c-1.3,3-3.5,6.1-5,7.6C73.9,90,70.8,91,67.1,91c-10.1,0-24.7-7.6-37.6-20.5C11.9,52.8,4.1,32,12.2,23.9c1.4-1.4,4.6-3.6,7.6-5     c0.7-0.3,1.4-0.5,2.2-0.5c1.6,0,3.2,0.7,4.3,2.1L35,31.8c1.8,2.3,1.5,5.6-0.7,7.5c-2.3,2-3.8,3.3-4.2,3.7     c-3.4,3.4-0.1,12.2,7.3,19.6c5.4,5.4,11.6,8.7,15.8,8.7c1.6,0,2.9-0.4,3.8-1.3c0.4-0.4,1.8-1.9,3.7-4.2c1.1-1.3,2.6-1.9,4.1-1.9     c1.2,0,2.4,0.4,3.4,1.2l11.1,8.8C81.3,75.3,82,78,81,80.2z"/><path d="M55.9,30.7c-2.4-0.6-4.6,1.3-4.4,3.7l0,0c0.1,1.6,1.2,2.9,2.8,3.2c1.9,0.5,3.7,1.4,5.2,2.9c1.5,1.5,2.5,3.3,2.9,5.2     c0.4,1.5,1.7,2.6,3.2,2.8l0,0c2.4,0.2,4.3-2.1,3.7-4.4c-0.8-3.1-2.4-6.1-4.8-8.6C62,33.1,59,31.5,55.9,30.7z"/><path d="M79.7,49.6c2.2,0.2,4-1.7,3.8-3.9c-0.6-7.3-3.7-14.4-9.3-19.9c-5.6-5.6-12.6-8.6-19.9-9.3c-2.2-0.2-4.1,1.6-3.9,3.8     c0.1,1.8,1.5,3.2,3.2,3.3c5.7,0.5,11.2,2.9,15.5,7.2c4.3,4.3,6.7,9.8,7.2,15.5C76.5,48.1,78,49.4,79.7,49.6z"/><path d="M84.1,15.9c-8.6-8.6-19.7-13-31-13.4c-2.1-0.1-3.8,1.7-3.6,3.8l0,0c0.1,1.8,1.6,3.3,3.4,3.3C62.4,10,71.8,13.8,79,21     c7.2,7.2,11,16.6,11.3,26.1c0.1,1.8,1.5,3.3,3.3,3.4l0,0c2.1,0.1,3.9-1.5,3.8-3.6C97.1,35.6,92.7,24.5,84.1,15.9z"/></g></g></switch><text x="0" y="115" fill="#000000" font-size="5px" font-weight="bold" font-family="'Helvetica Neue', Helvetica, Arial-Unicode, Arial, Sans-serif"></text><text x="0" y="120" fill="#000000" font-size="5px" font-weight="bold" font-family="'Helvetica Neue', Helvetica, Arial-Unicode, Arial, Sans-serif"></text></svg></div>
	</div>
	<div id="title2" class="col">
		<div id="container2" class="snip1535 text2 cusInfo col">회원 정보 관리<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 66 82.5" enable-background="new 0 0 66 66" xml:space="preserve"><g><g><g><g><g><path d="M64.2,28.1c-0.2-0.1-3.1-0.9-5.3-1.5c-0.7-2.6-1.7-5.1-3.1-7.4l2.7-4.8c0.2-0.4,0.2-0.9-0.2-1.2       l-5.6-5.6c-0.3-0.3-0.8-0.4-1.2-0.2l-4.9,2.7c-2.3-1.4-4.8-2.4-7.4-3l-1.5-5.4c-0.1-0.4-0.5-0.7-1-0.7h-7.9       c-0.5,0-0.8,0.3-1,0.7l-1.5,5.4c-2.6,0.6-5,1.7-7.4,3.1l-4.9-2.7c-0.4-0.2-0.9-0.2-1.2,0.2l-5.6,5.6c-0.3,0.3-0.4,0.8-0.2,1.2       l2.7,4.8c-1.4,2.3-2.4,4.8-3.1,7.4l-5.3,1.5c-0.4,0.1-0.7,0.5-0.7,1v7.9c0,0.5,0.3,0.8,0.7,1l5.3,1.5c0.7,2.6,1.7,5.1,3.1,7.4       l-2.7,4.8c-0.2,0.4-0.2,0.9,0.2,1.2l5.6,5.6c0.3,0.3,0.8,0.4,1.2,0.2l4.9-2.7c2.3,1.4,4.8,2.4,7.4,3.1l1.5,5.4       c0.1,0.4,0.5,0.7,1,0.7h7.9c0.4,0,0.8-0.3,1-0.7l1.5-5.4c2.6-0.6,5.1-1.7,7.4-3.1l4.9,2.7c0.4,0.2,0.9,0.1,1.2-0.2l5.6-5.6       c0.3-0.3,0.4-0.8,0.2-1.2l-2.7-4.8c1.4-2.3,2.4-4.8,3.1-7.4l5.3-1.5c0.4-0.1,0.7-0.5,0.7-1v-7.8C65,28.6,64.7,28.2,64.2,28.1z        M33,49c-8.8,0-16-7.2-16-16c0-8.8,7.2-16,16-16c8.8,0,16,7.2,16,16C49,41.8,41.8,49,33,49z"/></g></g></g></g><g><g><path d="M27.4,29.3c0-3.1,2.5-5.6,5.6-5.6s5.6,2.5,5.6,5.6c0,3.1-2.5,5.6-5.6,5.6S27.4,32.4,27.4,29.3z"/><path d="M44.3,41.9c-0.2,0.2-0.5,0.4-0.8,0.4H22.4c-0.3,0-0.6-0.1-0.8-0.4c-0.2-0.2-0.3-0.5-0.2-0.8     c0.7-2.8,2.3-5.3,4.6-6.9c0.4-0.3,1-0.2,1.3,0.1c1.4,1.6,3.5,2.5,5.6,2.5c2.1,0,4.2-0.9,5.6-2.5c0.3-0.4,0.9-0.4,1.3-0.1     c2.3,1.7,3.9,4.1,4.6,6.9C44.6,41.4,44.5,41.7,44.3,41.9z"/></g></g></g><text x="0" y="81" fill="#000000" font-size="5px" font-weight="bold" font-family="'Helvetica Neue', Helvetica, Arial-Unicode, Arial, Sans-serif"></text><text x="0" y="86" fill="#000000" font-size="5px" font-weight="bold" font-family="'Helvetica Neue', Helvetica, Arial-Unicode, Arial, Sans-serif"></text></svg></div>
		<div id="container2" class="snip1535 text2 col ">1:1문의 내역<svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 64 80" enable-background="new 0 0 64 64" xml:space="preserve"><g><path fill="#000000" d="M9.9,63.7H9.6c-2.5,0-4-0.7-4.6-2c-0.2-0.5-0.7-1.7,0.4-3.1l3.4-4.6c0.4-0.5,0.6-0.8,0.7-1.1   C4,47.1,0.9,39.5,0.9,31.4c0-17.2,14-31.1,31.1-31.1c17.1,0,31.1,14,31.1,31.1c0,17.1-13.9,31.1-31.1,31.1c-3.4,0-6.7-0.5-9.8-1.6   c-0.1,0-0.2,0.1-0.3,0.1c-1.2,0.6-2.4,1-3.5,1.4c-0.4,0.1-0.8,0.2-1.2,0.3l-0.5,0.1C14.7,63.4,12.4,63.7,9.9,63.7z M32,4.7   c-14.7,0-26.7,12-26.7,26.7c0,7.1,2.8,13.8,7.8,18.9l0.3,0.3l0.2,0.3c0.5,1.1,0.6,2.2,0.2,3.4c-0.3,1-0.9,1.7-1.4,2.4l-1.9,2.6   c1.9,0,3.6-0.3,5.1-0.7l0.6-0.2c0.3-0.1,0.6-0.2,0.9-0.3c1-0.3,1.9-0.7,2.9-1.1c0.5-0.3,1.3-0.5,2.2-0.6l0.7,0l0.4,0.1   c2.8,1,5.8,1.5,8.8,1.5c14.7,0,26.7-12,26.7-26.7C58.7,16.7,46.7,4.7,32,4.7z"/><path fill="#000000" d="M31.9,49v0.3V49c-0.8,0-1.6-0.3-2.2-0.9c-0.6-0.6-0.9-1.4-0.9-2.2c0-1.7,1.4-3.1,3.1-3.1c1.7,0,3,1.4,3,3.1   C35,47.6,33.6,49,31.9,49z"/><path fill="#000000" d="M41.4,27.7c-1.1,1.5-2.6,2.7-4,3.9l-0.3,0.3c-2,1.7-2.2,2.1-2.3,4.7c0,0.7,0,1.3,0,2c0,0.5-0.2,0.6-0.6,0.6   c-0.3,0-0.6,0-0.9,0h-1.1v0h-2.7c-0.5,0-0.6-0.1-0.6-0.6c-0.1-2.1,0.1-4.2,0.5-6.2c0.2-1.1,0.8-2.1,1.9-3.1   c0.8-0.8,1.7-1.6,2.6-2.3c0.4-0.4,0.8-0.7,1.2-1.1l0.1-0.1c0.2-0.2,0.5-0.4,0.7-0.7c1.2-1.3,1-3.2-0.3-4.4c-1-1-2.3-1.3-4.1-1.1   c-2.2,0.3-3.6,1.6-4.2,4.1c0,0.1,0,0.1,0,0.2c0,0.1,0,0.1-0.1,0.2c-0.1,0.4-0.4,0.4-0.5,0.4c-1.7-0.2-3.4-0.4-5-0.6   c-0.3,0-0.5-0.2-0.5-0.7c0.3-4.3,3.7-7.8,8.3-8.6c2.7-0.4,5.1-0.3,7.3,0.5c2.9,1,4.9,2.9,5.9,5.6C43.4,23.3,43,25.6,41.4,27.7z"/></g><text x="0" y="79" fill="#000000" font-size="5px" font-weight="bold" font-family="'Helvetica Neue', Helvetica, Arial-Unicode, Arial, Sans-serif"></text><text x="0" y="84" fill="#000000" font-size="5px" font-weight="bold" font-family="'Helvetica Neue', Helvetica, Arial-Unicode, Arial, Sans-serif"></text></svg></div>
		<div id="container2" class="snip1535 text2 goodbyeForm col">회원탈퇴<svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve" version="1.1" style="shape-rendering:geometricPrecision;text-rendering:geometricPrecision;image-rendering:optimizeQuality;" viewBox="0 0 847 1058.75" x="0px" y="0px" fill-rule="evenodd" clip-rule="evenodd"><defs><style type="text/css">
    .fil0 {fill:black;fill-rule:nonzero}
  </style></defs><g><path class="fil0" d="M423 12c227,0 412,184 412,411 0,227 -185,412 -412,412 -227,0 -411,-185 -411,-412 0,-227 184,-411 411,-411zm0 469l-148 149c-38,38 -96,-20 -58,-58l148 -149 -148 -148c-38,-38 20,-96 58,-58l148 148 149 -148c38,-38 96,20 58,58l-149 148 149 149c38,38 -20,96 -58,58l-149 -149zm0 -449c-216,0 -391,175 -391,391 0,216 175,392 391,392 216,0 392,-176 392,-392 0,-216 -176,-391 -392,-391z"/></g><text x="0" y="862" fill="#000000" font-size="5px" font-weight="bold" font-family="'Helvetica Neue', Helvetica, Arial-Unicode, Arial, Sans-serif"></text><text x="0" y="867" fill="#000000" font-size="5px" font-weight="bold" font-family="'Helvetica Neue', Helvetica, Arial-Unicode, Arial, Sans-serif"></text></svg>
  </div>
	</div>
</div>

