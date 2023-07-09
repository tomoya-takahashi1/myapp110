const path = require('path');

module.exports = {
  mode: 'development', // ビルドモードを指定します
  entry: './index.js', // エントリーポイントのファイルパス
  output: {
    path: path.resolve(__dirname, 'dist'), // 出力先ディレクトリのパス
    filename: 'bundle.js' // 出力ファイル名
  },
  // その他の設定オプション
};
