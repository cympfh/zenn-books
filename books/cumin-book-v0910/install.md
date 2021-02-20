---
title: cumin を使う方法

---

cumin を使うための手段として次を用意しています.

1. cumin コンパイラ: cuminc
2. Python バインディングの cumin-py
3. try-cumin-online
4. cuminc の wasm 版

## 1. cumin コンパイラ: cuminc

cumin は Rust で書かれており, `cargo` を必要とします.  手元に `cargo` が入っていない人は [rustup](https://rustup.rs/) という Rust 処理系のマネージャーがあるので, これを入れることをおすすめします.

cumin コンパイラである `cuminc` は cumin コードを JSON または YAML へ変換する CLI コマンドです. ソースコードは [github.com/cympfh/cumin](https://github.com/cympfh/cumin) でホスティングしてありますので, これをビルドしてもらっても良いですし, 次のコマンドでもダウンロード出来ます.

```bash
cargo install cumin
```

### 使い方

```bash
$ echo '1 + 2' | cuminc  # 標準入力から cumin コードを読む
$ cuminc data.cumin  # ファイルから cumin コードを読む
```

## 2. Python バインディングの cumin-py

これもやはり内部的には cuminc をビルドするため `cargo` が必要です.
Python バインディングとして `cumin-py` を pip で配布しています.
次でインストールしてもらえれば Python から cumin コードを読む事ができるようになります.

```bash
pip install cumin-py
```

### 使い方

```python
# Python
import cumin
cumin.loads("1 + 2")  # 文字列から cumin コードを読む
cumin.load("data.cumin")  # ファイルから cumin コードを読む
```

## 3. try-cumin-online

[Try Cumin Online](https://cympfh.cc/try-cumin-online/) ではブラウザ上で直接 cumin を実行することが出来ます.  これは実態としては wasm でありブラウザで動作が完結しています.  ただしそのためにいくつか使えない機能があります.

- 環境変数が参照できない
- `use` で他ファイルをロードできない

## 4. cuminc の wasm 版

[wasm ブランチ](https://github.com/cympfh/cumin/tree/wasm) では try-cumin-online で使っている wasm をビルドすることが出来ます.
