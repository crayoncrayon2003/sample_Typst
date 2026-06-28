// sections/sec_feature.typ
//
// 単独コンパイル可能なサブファイル。
// 先頭で共通テンプレートを import して #show: conf を適用することで、
// このファイル単独でもメインと同じ体裁でコンパイルできます。
// メインから #include されたときは、設定が重ねて適用されるだけで問題ありません。
//
// 単独でコンパイルするときは、104_Modular フォルダをプロジェクトルートに
// 指定します（../template.typ がルート外参照にならないようにするため）。
// 104_Modular ディレクトリ内から:
//   typst compile --root . sections/sec_feature.typ
#import "../template.typ": conf
#show: conf

= モジュール分割の特徴

各サブファイルが共通テンプレート（`template.typ`）を読み込むことで、
*単独でもコンパイルできる* ようになります。

- メインファイルからは `#include "sections/..."` で読み込む
- サブファイル単体でコンパイルしても、共通の体裁が適用される
- 共通設定は `template.typ` の `conf` 関数にまとめておく
