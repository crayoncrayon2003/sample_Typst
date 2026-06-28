// CeTZ 図形描画のサンプル（LaTeX の TikZ に相当する Typst の描画パッケージ）
// 初回コンパイル時にパッケージ取得のためネットワークが必要です。
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3": plot   // 関数グラフ用

#set text(lang: "ja", font: ("Noto Serif CJK JP",))
#set page(numbering: "1")

#align(center)[
  #text(size: 1.6em)[*CeTZ 図形描画のサンプル*] \
  Typst サンプル
]

// -------------------------------------------------------------------
// 基本図形
// -------------------------------------------------------------------
= 基本図形

#cetz.canvas({
  import cetz.draw: *
  // 直線
  line((0, 0), (2, 0))
  // 矩形
  rect((3, 0), (5, 1.5), stroke: blue + 1.5pt)
  // 円
  circle((7, 0.75), radius: 0.75, fill: red.lighten(80%), stroke: red)
  // 楕円
  circle((9.5, 0.75), radius: (1, 0.5), fill: green.lighten(80%), stroke: green.darken(20%))
  // ラベル
  content((1, -0.4), [直線])
  content((4, -0.4), [矩形])
  content((7, -0.4), [円])
  content((9.5, -0.4), [楕円])
})

// -------------------------------------------------------------------
// 矢印・パス
// -------------------------------------------------------------------
= 矢印・パス

#cetz.canvas({
  import cetz.draw: *
  // 矢印
  line((0, 2), (2, 2), mark: (end: ">"))
  content((2.3, 2), anchor: "west", [一方向])
  line((0, 1), (2, 1), mark: (start: ">", end: ">"), stroke: blue)
  content((2.3, 1), anchor: "west", [双方向])
  line((0, 0), (2, 0), mark: (end: "stealth"), stroke: red)
  content((2.3, 0), anchor: "west", [stealth])

  // ベジェ曲線
  bezier((4, 2), (7, 2), (5, 3), (6, 1), mark: (end: ">"))
  content((7.3, 2), anchor: "west", [ベジェ曲線])

  // 折れ線
  line((4, 0), (5, 1), (6, 0), (7, 1), stroke: (paint: orange, dash: "dashed"))
})

// -------------------------------------------------------------------
// ノードと接続
// -------------------------------------------------------------------
= ノードと接続

#cetz.canvas({
  import cetz.draw: *
  let node(pos, name, label) = {
    rect(
      (rel: (-1.25, -0.4), to: pos),
      (rel: (1.25, 0.4), to: pos),
      name: name, radius: 0.1,
    )
    content(pos, label)
  }
  node((0, 0), "A", [ノード A])
  node((4, 0), "B", [ノード B])
  node((2, -2), "C", [ノード C])

  line("A", "B", mark: (end: ">"))
  line("A", "C", mark: (end: ">"))
  line("B", "C", mark: (end: ">"))
})

// -------------------------------------------------------------------
// フローチャート
// -------------------------------------------------------------------
= フローチャート

#cetz.canvas({
  import cetz.draw: *
  let box(pos, name, label, fill) = {
    rect(
      (rel: (-1.3, -0.35), to: pos),
      (rel: (1.3, 0.35), to: pos),
      name: name, fill: fill, radius: 0.1,
    )
    content(pos, label)
  }
  box((0, 0), "start", [開始], green.lighten(70%))
  box((0, -1.3), "p1", [処理 A], blue.lighten(80%))
  box((0, -2.6), "cond", [条件?], yellow.lighten(60%))
  box((-2.2, -3.9), "p2", [処理 B], blue.lighten(80%))
  box((2.2, -3.9), "p3", [処理 C], blue.lighten(80%))
  box((0, -5.2), "stop", [終了], red.lighten(70%))

  line("start", "p1", mark: (end: ">"))
  line("p1", "cond", mark: (end: ">"))
  line("cond", "p2", mark: (end: ">"))
  line("cond", "p3", mark: (end: ">"))
  line("p2", "stop", mark: (end: ">"))
  line("p3", "stop", mark: (end: ">"))
})

// -------------------------------------------------------------------
// 関数グラフ（cetz-plot）
// -------------------------------------------------------------------
= 関数グラフ

#cetz.canvas({
  import cetz.draw: *
  plot.plot(
    size: (8, 4),
    x-tick-step: 1,
    y-tick-step: 1,
    x-label: $x$,
    y-label: $y$,
    {
      plot.add(domain: (0, 6.28), x => calc.sin(x), label: $sin x$)
      plot.add(domain: (0, 6.28), x => calc.cos(x), label: $cos x$, style: (stroke: (dash: "dashed")))
    },
  )
})
