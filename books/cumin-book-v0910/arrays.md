---
title: 配列

---

## 配列とは何か

配列またはリストなどと呼ばれるデータです.  配列は0個以上の可変個のデータを並べて保持することが出来ます.  配列に対して保持するデータを要素と呼びます.

## リテラル

配列は `[]` で括ってデータをカンマ区切りに並べて記述します.

```rust
[1, 2, 3]
```

## 配列の型

いくつかのスクリプト言語では要素には自由にどんなデータでも並べる事ができますが, cumin では一つの配列が保持する全ての要素データは同じ型であることが要請されます.

要素の型が `T` である配列の型を `Array<T>` と書きます.

例えば整数と文字列を保持する配列というのはそのままでは書けません.

```rust
// ERROR!!
[1, "two", 3]
```

もし本当にこのようなデータを表現したい場合は cumin では合併型で実現します.  合併型については [データの型](types#合併型) で既に触れました.  これを使うと次のコードが実現できます.

```rust
type Element = Int | String; // 要素として認める型
[
    Element(1),
    Element("two"),
    Element(3),
]
```

これは `Int` 及び `String` 型を `Element` 型に **アップキャスト** させ, `Element` の配列として扱っている為, 許されています.

## 演算

| 記号 | 意味 | 例                                 |
|------|------|------------------------------------|
| `++` | 結合 | `[1] ++ [] ++ [2, 3]` `// [1,2,3]` |