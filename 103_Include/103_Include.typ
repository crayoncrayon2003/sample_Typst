// #include と #import のサンプル
#set text(lang: "ja", font: ("Noto Serif CJK JP",))
#set page(numbering: "1")
#set heading(numbering: "1.1")

#align(center)[
  #text(size: 1.8em)[*#raw("#include") と #raw("#import")*] \
  Typst サンプル
]

#v(1em)
#outline(title: [目次])
#v(1em)

// -------------------------------------------------------------------
// #include: 別ファイルの「内容（コンテンツ）」を挿入する
// LaTeX の \include と違い、自動の改ページは入りません。
// 章を新ページから始めたい場合は pagebreak() を使います。
// 一部の章だけ確認したいときは、不要な行をコメントアウトします。
// -------------------------------------------------------------------
#include "chapters/chap1.typ"
#pagebreak()
#include "chapters/chap2.typ"
#pagebreak()
#include "chapters/chap3.typ"

// -------------------------------------------------------------------
// 参考: #import は「変数・関数」を取り込むときに使います。
//   #import "utils.typ": my-func, MY-CONST
// 内容そのものを差し込む #include とは目的が異なります。
// -------------------------------------------------------------------
