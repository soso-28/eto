# eto

![test](https://github.com/soso-28/eto/actions/workflows/test.yml/badge.svg)

標準入力から西暦または生年月日を受け取り、対応する干支（十二支）を標準出力に返すコマンドです。

## インストール方法

```bash
git clone [https://github.com/soso-28/eto.git](https://github.com/soso-28/eto.git)
cd eto
```

## 使い方

西暦（例: `2026`）またはハイフン区切りの生年月日（例: `2004-05-15`）を標準入力から渡して実行します。

```bash
$ echo 2026 | ./eto
午

$ echo 2004-05-15 | ./eto
申
```

複数行をまとめて処理することもできます。

```bash
$ seq 2024 2026 | ./eto
辰
巳
午
```

## 異常入力時の動作

数値に変換できない文字列、1未満の整数、または空行のみが入力された場合は、標準エラー出力にエラーメッセージを表示し、終了ステータス `1` で終了します。

## テスト

リグレッションテストを実行するには、以下のコマンドを実行します。

```bash
./test.bash
```

すべてのテストに合格すると `OK` と表示され、終了ステータス `0` を返します。

## 動作環境

* Python 3.10 〜 3.14
* Ubuntu Linux（GitHub Actions の `ubuntu-latest` 上で動作確認済み）

## ライセンス

* このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
* © 2026 Soya Yuzawa
