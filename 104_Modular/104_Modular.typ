// モジュール分割（単独コンパイル可能なサブファイル）のサンプル
// LaTeX の subfiles パッケージに相当します。
#import "template.typ": conf

#show: conf

#align(center)[
  #text(size: 1.8em)[*モジュール分割のサンプル*] \
  Typst サンプル
]

#v(1em)
#outline(title: [目次])
#v(1em)

// -------------------------------------------------------------------
// 各サブファイルを #include で読み込む。
// 各サブファイルは template.typ を import しているので、
// それ単体でも `typst compile sections/sec_feature.typ` のように
// コンパイルできます。
// -------------------------------------------------------------------
#include "sections/sec_feature.typ"
#include "sections/sec_usage.typ"
