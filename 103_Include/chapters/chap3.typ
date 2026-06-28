// chapters/chap3.typ

= 使い分けのまとめ

== #raw("#include") と #raw("#import") の使い分け

#table(
  columns: 3,
  align: (left, left, left),
  table.header([用途], [推奨], [理由]),
  [文章・章の分割], [#raw("#include")], [ファイルの内容を本文に差し込むため],
  [関数・定数の共有], [#raw("#import")], [他ファイルで定義した値だけを取り込むため],
  [テンプレートの適用], [#raw("#import") + #raw("#show")], [スタイル関数を取り込んで全体に適用するため],
)

== ファイル分割のポイント

+ 各章は `#include` で読み込み、必要に応じて `#pagebreak()` で改ページする
+ 共通の設定（`#set`）はメインファイルにまとめる
+ 共通の関数・定数は別ファイルに置き `#import` で取り込む
