// テキスト装飾のサンプル
#set text(lang: "ja", font: ("Noto Serif CJK JP",))
#set page(numbering: "1")

#align(center)[
  #text(size: 1.6em)[*テキスト装飾のサンプル*] \
  Typst サンプル \
  #datetime.today().display("[year]年[month]月[day]日")
]

// -------------------------------------------------------------------
// 基本的な文字装飾
// -------------------------------------------------------------------
= 基本装飾

*太字 (bold)* — `*...*` または #strong[`#strong[...]`]

_イタリック (italic)_ — `_..._` または #emph[`#emph[...]`]

#underline[下線 (underline)] — `#underline[...]`

#strike[取り消し線 (strikethrough)] — `#strike[...]`

#highlight[ハイライト (highlight)] — `#highlight[...]`

#overline[上線 (overline)] — `#overline[...]`

// -------------------------------------------------------------------
// フォントファミリー
// -------------------------------------------------------------------
= フォントファミリー

#text(font: "Noto Serif CJK JP")[セリフ体 (serif)] — デフォルト

#text(font: "Noto Sans CJK JP")[サンセリフ体 (sans-serif)]

#text(font: "DejaVu Sans Mono")[等幅フォント monospace] あるいは `等幅は raw でも書けます`

// -------------------------------------------------------------------
// フォントサイズ
// -------------------------------------------------------------------
= フォントサイズ

#text(size: 6pt)[6pt]
#text(size: 8pt)[8pt]
#text(size: 10pt)[10pt]
#text(size: 12pt)[12pt（標準）]
#text(size: 14pt)[14pt]
#text(size: 18pt)[18pt]
#text(size: 24pt)[24pt]
#text(size: 1.5em)[1.5em（相対指定）]

// -------------------------------------------------------------------
// テキストカラー
// -------------------------------------------------------------------
= テキストカラー

#text(fill: red)[赤]
#text(fill: blue)[青]
#text(fill: green)[緑]
#text(fill: orange)[オレンジ]
#text(fill: purple)[紫]

// RGB で任意の色を指定
#text(fill: rgb(0, 128, 128))[カスタムカラー (teal)]

// 背景色（box の fill）
#box(fill: yellow, inset: 3pt)[背景色: 黄色]
#box(fill: rgb("#00bcd4"), inset: 3pt)[#text(fill: white)[背景色: シアン + 白文字]]

// -------------------------------------------------------------------
// 組み合わせ
// -------------------------------------------------------------------
= 装飾の組み合わせ

*_太字 + イタリック_*

#text(fill: red)[*太字 + 赤*]

#text(size: 18pt, fill: blue)[*大きい + 太字 + 青*]
