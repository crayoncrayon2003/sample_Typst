// template.typ
// 共通の設定（プリアンブル）をまとめた show 関数。
// メインファイルと各サブファイルの両方から #import して適用することで、
// サブファイルを「単独でもコンパイルできる」ようにします。
// （LaTeX の subfiles パッケージに相当する Typst のやり方）

#let conf(body) = {
  set text(lang: "ja", font: ("Noto Serif CJK JP",))
  set heading(numbering: "1.1")
  set page(numbering: "1")
  body
}
