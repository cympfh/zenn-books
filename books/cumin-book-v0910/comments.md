---
title: コメント

---

コードは cumin が読むためのものですが, 人間が読むものでもあります.
理解の助けになるならば, あなたが普段使う自然言語でコメントを添えることは歓迎されることです.

cumin では `//` から行末まではコメントであるとして無視されます.
ただし文字列の中は例外です.

```rust
// これがコメント
let z = 1;  // これもコメント
let f() = {
    // これもコメント
    1 + 2
};
let s = "// これは文字列";
```