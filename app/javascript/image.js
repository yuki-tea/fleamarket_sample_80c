$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = ` <div data-index="${num}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${num}][image]"
                    id="item_images_attributes_${num}_image"><br>
                  </div>
                `;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `
    <img data-index="${index}" src="${url}" width="10%" height="112px">
    `;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  // .splice() 古い要素の削除しながら、新しい要素を追加することで、配列の内容を変更します。
  // fileIndexの0~lastIndexの場所まで削除する。
  // 例）fileIndex.splice(0, 4)だったら次に入れるインデックスは5となる。
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  // $('#image-box').on('click', '.far.fa-image', function(e){
  //   $("input[type='file']").on('click',function(e){
  //     e.stopPropagation();
  //   });

  $('.label-content').on('change', '.js-file', function(e) {
    // .parent()マッチしている要素の各親要素を取得します。
    // 今回の場合js-file-groupのindexを取得する
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    // 選択ファイルを配列形式で取得
    const file = e.target.files[0];
    // urlを表示
    const blobUrl = window.URL.createObjectURL(file);
 
    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    // 
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      // targetindexではなかったら新しく画像を入れてtargetindexとurlをはる
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      const test =`<div class="js-remove">削除</div>`
      $(this).after(test)
      $('.select-box').append(buildFileField(fileIndex[0]));
      //shift() メソッドは、配列から最初の要素を取り除き、その要素を返します。このメソッドは配列の長さを変えます。
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      // push() メソッドは、配列の末尾に 1 つ以上の要素を追加することができます。また戻り値として新しい配列の要素数を返します
      fileIndex.push(fileIndex[fileIndex.length -1 ] + 1);
    }

    $('label').attr('for', 'item_images_attributes_' + [fileIndex[0] - 1]+'_image')

    // $("#js-file_group").removeAttr("width");
  });



  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));

    
  });

  // reader.onload = function(e){
  //   let preview_count = $('.js-file_group').length;
  //   if (preview_count <= 10){
  //     $('js-file_group').removeClass('js-file_group').addClass('image-preview').appendTo('.images');
  //   }

  //   if (preview_count <= 10){
  //     $('.images').prepend(nextInput(preview + 1));
  //   }
  // }
});