$(document).ready(function() {
   $(document.body).on("click",".request_code",function() {
      var a = $(this);
      console.log(a.next().val());
      var code = a.next().val();
      var str = "/customer/poplist?request_code="+ code;
      var win = window.open(str, "PopupWin","width=400,height=500,location=no,resizable=no,toolbar=no");
      });
   $(document.body).on("click","tr>td:not(:last-child)",function(){
      var a =$(this).closest("tr");
      console.log(a.text());
      a = a.find('.request_code');
      a= a.next().val();
      console.log(a);
      window.location.href="/recruit/specific?request_code="+a;
   });

});