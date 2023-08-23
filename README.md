<h1>Habit</h1>
<p>--習慣で人生が変わる--</p>

トレーニングの記録を投稿するサイトです。
自分が行ったトレーニングを共有しながら他のユーザーの投稿も見ながらお互いに高めあう為に作りました。
レスポンシブ対応しているのでスマホからもご確認いただけます。
![スクリーンショット 2023-08-23 17 13 45](https://github.com/tomoya-takahashi1/myapp110/assets/123609557/e30fec96-c9ad-40dc-bfef-9e09d99240d2)

URL
https://sheltered-waters-57153-72235aa359f9.herokuapp.com

画面上部のヘッダーからゲストログインボタンから、メールアドレスとパスワードを入力せずにログインできます。

開発にあたって
元々はダイエットする友人がいてその付き添いとしてやっていたのですが<br>中々体重が減らず習慣にすることが出来なかったことがあり
どうすれば習慣になるかを考え
続かない原因をまず考え <br>1,すぐに結果に現れない<br> 2,辛い、キツイ<br>などがありこれを解決するべく記録を残し一緒に頑張っている仲間と共有することで自分の努力が可視化され自己肯定感が高まり何より目標に向かう仲間がいるので自分一人でするより複数でやった方が頑張れることによって結果に繋がると思いこのアプリを作成することにしました。

概要
このサイトは、トレーニングに関する情報を投稿し、ユーザー同士でトレーニングの成果を共有できます。

<table>
  <caption>機能一覧</caption>
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
<P>投稿画面</p>
![スクリーンショット 2023-08-08 18 11 53](https://github.com/tomoya-takahashi1/myapp110/assets/123609557/7701df87-e4b1-4d3a-abb6-298336761a70)

<P>グラフでの成長の確認</p>
![スクリーンショット 2023-08-08 18 40 43](https://github.com/tomoya-takahashi1/myapp110/assets/123609557/518cbc7c-de47-49a0-947c-cc12e49af8a3)

<table>
  <caption>使用技術</caption>
    <tr>
      <th>・Rails 6.1.7.4</th> 
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
    <td>・Rspec</td> 
  </tr>
</table>

<table>
  <caption>機能一覧</caption>
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
  <caption>テスト</caption>
    <tr>
      <th>・Rspec</th> 
    </tr>
  <tr>
    <td>・単体テスト(model)</td> 
  </tr>
  <tr>
    <td>・機能テスト(request)</td> 
  </tr>
</table>

ER 図
<img width="1156" alt="スクリーンショット 2023-08-04 16 41 12" src="https://github.com/tomoya-takahashi1/myapp110/assets/123609557/abc01cc2-070c-4126-b522-dfd80826434c">

<p>今後の課題</p>
API関係を実装していないので以下が課題です。
1.他のユーザーが投稿した種目をYoutubeが検索
2.APIを使用しての商品検索(器具、プロテイン等)
