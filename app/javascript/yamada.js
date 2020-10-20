//初回読み込み、リロード、ページ切り替えで動く。
$(document).on('turbolinks:load', function() {
  $(function(){
    console.log("hello");
  });
});
