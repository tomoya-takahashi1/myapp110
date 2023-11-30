//= require jquery
//= require rails-ujs
// app/assets/javascripts/application.js
// //= require turbolinks
//= require jquery
//= require rails-ujs
//= require_tree .

// Ajaxリクエスト前にスクロール位置を保持
var scrollPosition = 0; // スクロール位置を保持する変数

$(document).on("turbolinks:load", function () {
  $(".favorite-button").on("ajax:success", function (e, data) {
    e.preventDefault(); // デフォルトの動作をキャンセル
    var button = $(this);
    var post_id = button.data("post-id");
    var action = button.data("action");

    // スクロール位置を保存
    scrollPosition = $(window).scrollTop();

    if (data.success) {
      // 成功時の処理
      if (action === "post") {
        // いいねを追加した場合の処理
        button.find("i").removeClass("far fa-heart").addClass("fas fa-heart");
        button.data("action", "delete");
      } else {
        // いいねを削除した場合の処理
        button.find("i").removeClass("fas fa-heart").addClass("far fa-heart");
        button.data("action", "post");
      }
      // いいねの数を更新
      button
        .closest(".favorite-wrapper")
        .find(".favorite-count")
        .text(data.favorite_count);

      // スクロール位置を復元
      $(window).scrollTop(scrollPosition);
    } else {
      // 失敗時の処理
      alert("操作に失敗しました");
    }
  });
});
