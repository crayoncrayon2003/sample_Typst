// 相互参照のサンプル
#import "@preview/cetz:0.4.2"

#set text(lang: "ja", font: ("Noto Serif CJK JP",))
#set page(numbering: "1")
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#set figure(numbering: "1")

#align(center)[
  #text(size: 1.8em)[*相互参照のサンプル*] \
  Typst サンプル
]

#v(1em)
#outline(title: [目次])
#v(1em)

// -------------------------------------------------------------------
// 参照先の定義（ラベル <...> を貼る）
// -------------------------------------------------------------------
= 数式 <sec:math>

$ e^(i pi) + 1 = 0 $ <eq:euler>

$ integral_0^1 x^2 dif x = 1/3 $ <eq:integral>

= 図 <sec:fig>

#figure(
  cetz.canvas({
    import cetz.draw: *
    line((0, 0), (2, 0), (1, 1.7), close: true, fill: green.lighten(70%))
    content((1, -0.3), [三角形])
  }),
  caption: [サンプルの三角形],
) <fig:triangle>

= 表 <sec:tab>

#figure(
  table(
    columns: 2,
    align: (left, right),
    [項目], [値],
    [A], [10],
    [B], [20],
  ),
  caption: [サンプルの表],
) <tab:sample>

// -------------------------------------------------------------------
// 参照のまとめ
// -------------------------------------------------------------------
= 相互参照 <sec:ref>

上で定義したラベルをここでまとめて参照します。
ラベルは `<key>`、参照は `@key` で行います。

== #raw("@key") による参照

`@key` は要素の種類に応じて「節1」「図1」「式(1)」のように
自動でプレフィックスと番号を付けます。

- 節参照: @sec:math
- 数式参照: @eq:euler
- 図参照: @fig:triangle
- 表参照: @tab:sample

== 補足語（supplement）の指定

`#ref(<key>, supplement: [...])` で「図」などの語を上書きできます。

- #ref(<eq:euler>, supplement: [数式]) はオイラーの等式
- #ref(<eq:integral>, supplement: [数式]) は定積分の例

== 本文として参照する

`@key` をそのまま文章に混ぜれば、@sec:fig のように自然に参照できます。
ページ番号など細かな制御は `#ref` 関数を使います。
