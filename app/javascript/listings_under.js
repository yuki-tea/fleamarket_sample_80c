//初回読み込み、リロード、ページ切り替えで動く。
$(document).on('turbolinks:load', function() {
  //リアルタイムで表示したいのでinputを使う｡入力の度にイベントが発火するようになる｡
  $('.price_fill_in__input').on('input', function(){
    var data = $('.price_fill_in__input').val(); // val()でフォームのvalueを取得(数値)
    var fee = Math.round(data * 0.1); // 手数料計算を行う｡dataに0.1を掛けて手数料が10%になる｡
    var profit = (data - fee); //入力した数値から計算結果(profit)を引く｡それが利益となる｡
    $('#price_fee').html(fee); //  手数料の表示｡html()は追加ではなく､上書き｡入力値が変わる度に表示も変わるようにする｡
    $('#price_fee').prepend('¥'); // 手数料の前に¥マークを付けたいので
    $('#price_profit').html(profit);
    $('#price_profit').prepend('¥');
    $('#price_fee').val(fee); // 計算結果を格納用フォームに追加｡もし､入力値を追加したいのなら､今回はdataを引数に持たせる｡
    $('#price_profit').val(profit); // 計算結果を格納用フォームに追加｡もし､入力値を追加したいのなら､今回はdataを引数に持たせる｡
    if(data == ''){ // もし､計算結果が''なら表示も消す｡
    $('#price_fee').html('');
    $('#price_profit').html('');
    } else if (data < 300){
        $('#price_fee').html('');
        $('#price_profit').html('');
      }
  });
});
