// sections/sec_usage.typ
// 単独コンパイル: 104_Modular ディレクトリ内から
//   typst compile --root . sections/sec_usage.typ
#import "../template.typ": conf
#show: conf

= モジュール分割の使い方

== メインファイルの書き方

メインファイルの先頭で `#import "template.typ": conf` と `#show: conf` を書き、
本文中で `#include "sections/パス.typ"` を使ってサブファイルを読み込みます。

== サブファイルの書き方

サブファイルの先頭に次の2行を書きます:

```typ
#import "../template.typ": conf
#show: conf
```

こうすると、メインから読み込まれたときも単独でコンパイルしたときも
同じ体裁になります。

== 3つの分割方法の比較

#table(
  columns: 4,
  align: (left, center, center, center),
  table.header([], [`#include`], [`#import`], [テンプレート方式]),
  [単独コンパイル], [一応可], [—], [*可（推奨）*],
  [体裁の共有], [手動], [—], [*自動*],
  [取り込む対象], [内容], [関数・定数], [内容＋設定],
)
