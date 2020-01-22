// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

// 確認ダイアログを見た目良くするために導入　参照https://fuchiaz.com/rails-bootstrap4/
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require data-confirm-modal



$(document).on('turbolinks:load', function() {
    

    $(function(){
        // 「.modal_open」をクリック
        $('.modal_open').click(function(){
            // オーバーレイ用の要素を追加
            $('body').append('<div class="modal_overlay"></div>');
            // オーバーレイをフェードイン
            $('.modal_overlay').fadeIn('slow');
     
            // モーダルコンテンツのIDを取得
            var modal = '#' + $(this).attr('data-target');
            // モーダルコンテンツの表示位置を設定
            modalResize();
             // モーダルコンテンツフェードイン
            $(modal).fadeIn('slow');
     
            // 「.modal_overlay」あるいは「.modal_close」をクリック
            $('.modal_overlay, .modal_close').off().click(function(){
                // モーダルコンテンツとオーバーレイをフェードアウト
                $(modal).fadeOut('slow');
                $('.modal_overlay').fadeOut('slow',function(){
                    // オーバーレイを削除
                    $('.modal_overlay').remove();
                });
            });
     
            // リサイズしたら表示位置を再取得
            $(window).on('resize', function(){
                modalResize();
            });
     
            // モーダルコンテンツの表示位置を設定する関数
            function modalResize(){
                // ウィンドウの横幅、高さを取得
                var w = $(window).width();
                var h = $(window).height();
     
                // モーダルコンテンツの表示位置を取得
                var x = (w - $(modal).outerWidth(true)) / 2;
                var y = (h - $(modal).outerHeight(true)) / 2;
     
                // モーダルコンテンツの表示位置を設定
                $(modal).css({'left': x + 'px','top': y + 'px'});
            }
     
        });
    });



     $(function(){
        $("div.item").click(function(){
          $(".selected").removeClass("selected");
          $(".not_select").removeClass("not_select");
          $(this).addClass("selected");
          var id = event.target.parentNode.getAttribute("value");
          var admin = $("#admin").val();
          if (admin == id) {
               $("#delete").addClass("not_select");
          }
          $("#send_data").val(id);
          $("#send_data2").val(id);
        });
    });
     $(function(){
        $("div.item1").click(function(){
          $(".selected").removeClass("selected");
          $(".not_select").removeClass("not_select");
          $(this).addClass("selected");
          var id = event.target.parentNode.getAttribute("value");
          var admin = $("#admin").val();
          if (admin == id) {
               $("#delete").addClass("not_select");
          }
          $("#send_data").val(id);
          $("#send_data2").val(id);
        });
    });
});

//categoryValue = document.getElementById('selectCategory').getAttribute("value");
//document.getElementById('selectCategory').options[categoryValue].selected = true;
//document.getElementById('selectCategory').options[1].selected = true;

function setCategory() {
    categoryValue = document.getElementById('selectCategory').getAttribute("value");
    document.getElementById('selectCategory').options[categoryValue].selected = true;
}