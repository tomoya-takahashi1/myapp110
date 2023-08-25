<h1>Habit</h1>
<h3>--習慣で人生が変わる--</h3>

トレーニングの記録を投稿するサイトです。
自分が行ったトレーニングを共有しながら他のユーザーの投稿も見ながらお互いに高めあう為に作りました。
レスポンシブ対応しているのでスマホからもご確認いただけます。
![スクリーンショット 2023-08-23 17 13 45](https://github.com/tomoya-takahashi1/myapp110/assets/123609557/e30fec96-c9ad-40dc-bfef-9e09d99240d2)

<h2>URL</h2>
https://sheltered-waters-57153-72235aa359f9.herokuapp.com

画面上部のヘッダーからゲストログインボタンから、メールアドレスとパスワードを入力せずにログインできます。

<h2>開発にあたって</h2>
元々はダイエットする友人がいてその付き添いとしてやっていたのですが<br>中々体重が減らず習慣にすることが出来なかったことがあり、<br>
どうすれば習慣になるかを考え
続かない原因をまず考え 
<br>1,すぐに結果に現れない
<br> 2,辛い、キツイ
<br>などがありこれを解決するべく記録を残し一緒に頑張っている仲間と共有することで自分の努力が可視化され、
<br>自己肯定感が高まり何より目標に向かう仲間がいるので自分一人でするより
<br>複数でやった方が頑張れることによって結果に繋がると思い
<br>このアプリを作成することにしました。

概要
このサイトは、トレーニングに関する情報を投稿し、ユーザー同士でトレーニングの成果を共有できます。

<h2>投稿画面</h2>

![スクリーンショット 2023-08-08 18 11 53](https://github.com/tomoya-takahashi1/myapp110/assets/123609557/7701df87-e4b1-4d3a-abb6-298336761a70)

<h2>グラフでの成長の確認</h2>

<img width="1354" alt="スクリーンショット 2023-08-23 21 07 29" src="https://github.com/tomoya-takahashi1/myapp110/assets/123609557/6d660e87-575e-4cc4-8f7a-e6c0052c87a6">

<table>
  <h3>使用技術</h3>
  <tr>
    <td>・Rails 6.1.7.4</td> 
  </tr>
  <tr>
    <td>・ruby 3.1.3</td> 
  </tr>
  <tr>
    <td>・psql (PostgreSQL) 14.8 (Homebrew)</td> 
  </tr>
  <tr>
    <td>・sqlite3 3.36.0</td> 
  </tr>
   <tr>
    <td>・yarn 1.22.19</td> 
  </tr>
  <tr>
    <td>・rubocop</td> 
  </tr>
  <tr>
    <td>・Bootstrap 4.4.1</td> 
  </tr>
  <tr>
    <td>・Pry-Rails</td> 
  </tr>
  <tr>
    <td>・Rails ERD</td> 
  </tr>
</table>

<table>
  <h3>機能一覧</h3>
    <tr>
      <th>・ログイン登録、ゲストログイン(devise)</th> 
    </tr>
  <tr>
    <td>・いいね機能</td> 
  </tr>
  <tr>
    <td>・CRUD機能</td> 
  </tr>
  <tr>
    <td>・検索機能(ransack)</td> 
  </tr>
   <tr>
    <td>・画像投稿(carrierwave,mini_magick)</td> 
  </tr>
  <tr>
    <td>・rubocop</td> 
  </tr>
  <tr>
    <td>・Rspec</td> 
  </tr>
</table>

<table>
  <h3>テスト</h3>
    <tr>
      <th>Rspec</th> 
    </tr>
  <tr>
    <td>・単体テスト(model)</td> 
  </tr>
  <tr>
    <td>・機能テスト(request)</td> 
  </tr>
</table>

<h2>ER図</h2>
<img width="1156" alt="スクリーンショット 2023-08-04 16 41 12" src="https://github.com/tomoya-takahashi1/myapp110/assets/123609557/abc01cc2-070c-4126-b522-dfd80826434c">

<table>
  <h3>参考書籍や記事</h3>
  <thead>
    <tr>
      <th>名前</th> <th>説明</th>
    </tr>
  </thead>
  <tr>
    <td> ポテパンキャンプ </td> <td>ゼロの初心者からお世話になりました。<br>HTML・CSSのフロントエンド<br>Javascript・Rubyのバックエンド<br>GitHub・AWSなどのインフラ関係<br>特にRailsのテスト関係については、難しかったですがとてもやりがいがあり、深く学ぶことができました。</td>
  </tr>
  <tr>
    <td> 習慣が10割</td> <td>習慣の仕組みやまず初めに習慣のハードルをとにかく下げることなど</td>
  </tr>
  <tr>
    <td>様々なQiitaの記事や<br>Railsドキュメント</td> <td>基本的にはエラー解決のほとんどをQiitaの記事で解決しました。</td>
  </tr>
</table>

<h2>今後の課題</h2>
API関係を実装していないので以下が課題です。<br>
1.他のユーザーが投稿した種目をYoutubeが検索<br>
2.APIを使用しての商品検索(器具、プロテイン等)<br>
