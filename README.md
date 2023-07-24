# OCamlのテンプレート 🐫

## ファイル・フォルダ作成

### フォルダ構成

- bin/
  - report1/ : 第一回レポートで使用する実行可能ファイル
  - ...
- lib/
  - report1/ : 第一回レポートで使用するライブラリファイル
- test/
  - report1/ : 第一回レポートで使用するテストファイル
- docs/ : レポートを書く場所

### 新規レポートの作成

すべて、プロジェクトルートディレクトリから始まるとする。

#### ライブラリを作る

```bash
cd lib
mkdir report3
cd report3
touch dune
touch kadai1.ml
```

lib/report3/dune:

```
(library
 (name report3))
```

ここで、`report3/`以下のファイルすべては、`report3`ライブラリのモジュール判定となる。

#### テストを書く

```bash
cd test
mkdir report3
cd report3
touch dune
touch test_report3.ml
```

test/report3/dune:

```
(executable
 (name test_report3)
 (public_name test_report3)
 (libraries alcotest report3))

(rule
 (alias runtest)
 (package cs_ocaml)
 (action
  (run %{dep:test_report3.exe})))
```

`open Report3`でreport3ライブラリを開ける。

#### 実行可能ファイルを作る

```bash
cd bin
mkdir report3
cd report3
touch dune
touch kadai1.ml
```

bin/report3/dune

```
(executable
 (name kadai1)
 (public_name report3_kadai1)
 (libraries report3))
```

この場合、`dune exec report3_kadai1`で`bin/report3/kadai1.ml`を実行する。

## Commands

### Install dependencies

```bash
opam install . --deps-only --with-test
```

### Build

- ビルド結果は、`_build/default/`に保存されてる。
- ファイルを新しく作ったら、1回ビルドする必要がある。

```bash
# プロジェクトをビルド
dune build
```

### Test

```bash
# すべてのテストを実行
dune runtest

# 1回目のレポートのテストを実行
dune exec test_report1

# 2回目のレポートのテストを実行
dune exec test_report2
```

### Execute

```bash
# dune exec <public_name> の形で実行する
# 例. 1回目のレポートの実行可能ファイル (bin/report1/main) を実行
dune exec report1
```

### PDFの生成

```bash
pandoc_pdf <file>
```

### CI

GitHubへプッシュされると、次の2つのバージョンで`dune runtest`が実行される

- ocaml 5.0   (最新版)
- ocaml 4.0.7 (学校環境のバージョン)
