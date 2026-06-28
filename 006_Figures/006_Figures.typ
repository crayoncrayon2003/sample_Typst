// 図のサンプル
// CeTZ（描画パッケージ）を使うので、初回コンパイル時にネットワークが必要です。
#import "@preview/cetz:0.4.2"

#set text(lang: "ja", font: ("Noto Serif CJK JP",))
#set page(numbering: "1")
// 図に通し番号と「図 N」形式の参照を設定
#set figure(numbering: "1")

#align(center)[
  #text(size: 1.6em)[*図のサンプル*] \
  Typst サンプル
]

// -------------------------------------------------------------------
// 外部画像ファイルの挿入
// -------------------------------------------------------------------
= 外部画像の挿入

`#image("ファイル名")` で画像（PNG / JPG / SVG / GIF）を挿入します。
`#figure` で囲むとキャプションと番号が付きます。

#figure(
  image("sample.png", width: 50%),
  caption: [サンプル画像],
) <fig:sample>

// -------------------------------------------------------------------
// CeTZ で生成したインライン図
// -------------------------------------------------------------------
= CeTZ で生成した図

外部ファイルなしでも CeTZ で図を描けます。

#figure(
  cetz.canvas({
    import cetz.draw: *
    rect((0, 0), (3, 2), fill: blue.lighten(80%), stroke: blue + 1.5pt)
    circle((1, 0.75), radius: 0.7, fill: red.lighten(80%), stroke: red + 1.5pt)
    content((1.5, 2.3), [矩形と円])
  }),
  caption: [CeTZ による図の例],
) <fig:cetz>

// -------------------------------------------------------------------
// 図の配置
// -------------------------------------------------------------------
= 配置オプション

Typst の図は基本的にその場に配置されます（フロートしません）。
ページ上部などに浮かせたい場合は `placement` 引数を使います:

/ #raw("placement: none"): その場に配置（既定）
/ #raw("placement: top"): ページ上部に配置
/ #raw("placement: bottom"): ページ下部に配置
/ #raw("placement: auto"): Typst が自動で決定

// -------------------------------------------------------------------
// 図の幅・スケール指定
// -------------------------------------------------------------------
= サイズ指定

- #raw("image(..., width: 50%)") --- 利用可能幅の 50%
- #raw("image(..., width: 8cm)") --- 絶対指定
- #raw("scale(80%)[...]") --- 元のサイズに対する倍率
- #raw("rotate(90deg)[...]") --- 回転（度）

// -------------------------------------------------------------------
// 複数の図を横並び
// -------------------------------------------------------------------
= 複数図の並列配置

`grid` で複数の図を横に並べられます。

#figure(
  grid(
    columns: 2,
    gutter: 1em,
    [
      #figure(
        cetz.canvas({
          import cetz.draw: *
          circle((0, 0), radius: 0.8, fill: blue.lighten(70%))
        }),
        caption: [円],
        kind: "subfig",
        supplement: [図],
      ) <fig:circle>
    ],
    [
      #figure(
        cetz.canvas({
          import cetz.draw: *
          rect((0, 0), (1.6, 1.2), fill: red.lighten(70%))
        }),
        caption: [矩形],
        kind: "subfig",
        supplement: [図],
      ) <fig:rect>
    ],
  ),
  caption: [2つの図を並列表示],
) <fig:two>

@fig:circle は円、@fig:rect は矩形です。
