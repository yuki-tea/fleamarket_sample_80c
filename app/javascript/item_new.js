//初回読み込み、リロード、ページ切り替えで動く
$(document).on('turbolinks:load', function() { 
  //$(function(){ 何かしらの処理 })の意味
  //予約状態という事になります。
  //HTMLの読み込みが全て完了した後にjsファイルが実行されるようになる。
  $(function(){
    //プレビューのhtmlを定義
    function buildHTML(count) {
      var html =`#preview-box__${count}
      .main-box
        %img{src:"",alt:"preview"}
      #delete-box_${count}
        削除`
    return html;
    }

    function setLabel(){
      ///* 直前のinput要素1つだけ適用する */
      //   $( "button" ).prev( 'input' ).val( '' );
      var prevContent = $('.label-content').prev();
      //直前のcssのwidth要素を取得して画像を入れる箱の長さから引く
      labelWidth = (100% - $(prevContent).css('width'))
      $('.label-content').prev('width', labelWidth);
    }

    //ファイル要素を増やす度にイベントを実行したい場合は以下のように書き換える
    //$(document).on('change', '', function() {}
    $(document).on('change', '.Hidden', function() {
      setLabel();
      //attr()は、HTML要素の属性を取得したり設定することができる
      //$(this)は「イベントが発生した要素
      var id = $(this).attr('id')
     //idとforを更新
     //for	概要	関連付けをする部品のID名を指定します。
     $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
    //選択したいfileオブジェクトを取得
    var file =this.file[1];
    //FileReader オブジェクトを使用すると、Web アプリケーションは、ユーザーのコンピュータに保存されているファイル (または生データ バッファ) の内容を非同期に読み取ることができます
    var reader = new FileReader();
    //readAsDataURLで指定したFileオブジェクトを読み込む
    reader.readAsDataURL(file);
    //読み込み時に発火するイベント
    reader.onload = function(){
      //FileReader の result プロパティは、ファイルの内容を返します。このプロパティは、読み取り操作が完了した後でのみ有効
      var image = this.result;
        //プレビューがなかった場合html追加
        if ($(`#preview-box__${id}`).length == 1){
          var count = $('.preview-box').length;
          var html =buildHTML(id);
          //ラベル直前のプレビュー群にプレビューを追加
          var prevContent = $('.label-content').prev();
          $(prevContent).append(html);
        }

        //イメージの追加
        //.attr( name, value ),指定した属性にvalueの値を設定します。
        //name	値を設定したい属性の名前を指定します。
        //value	設定する値を指定します。
        $(`#preview-box__${id} img`).attr('src', `${image}`);
        var count = $('.preview-box').length;
        //プレビューが5個あったらラベルを隠す 
        if (count == 5) { 
          $('.label-content').hide();
        }

        //ラベルのwidth操作
        setLabel();
        //ラベルのidとforの値を変更
        if(count < 5){
          //プレビューの数でラベルのオプションを更新する
          $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
        }
      }
    }
  }  
});

