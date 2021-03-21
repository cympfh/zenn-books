---
title: "ABC 196/D - Hanjo"
emoji: "🙌"
type: "tech" # tech: 技術記事 / idea: アイデア
topics:
- atcoder
published: false
---

## 問題概要

- [引用元://atcoder.jp/contests/abc196/tasks/abc196_d](https://atcoder.jp/contests/abc196/tasks/abc196_d)

$H$x$W$ のマスからなる盤面に $A$ 枚の 1x2 のピースを重ならないように置く.  $2A \leq HW$ は保証されている.  ピースの置き方はいくつあるか.

## 解法

公式解説を見てしまうと, DFS で全ての置き方を試すとだけある.  計算量を見積もることは出来るので分かっていれば問題ないが, 予め計算量の上限を与えるような解き方を与える.

各マスには次の3つの状態がある.

1. ピースが置かれていない
1. ピースが横向きに置かれている
1. ピースが縦向きに置かれている

これを考えると $3^{HW}$ 通り.  $HW \leq 16$ だと言われているので, $3^{HW} \leq 43,046,721$ であるが, この中でさらにバリデーションなんかしてると（ギリギリであるが）TLE する.

もう少し丁寧に, 次のように細分化する

1. $HW$ マスの内, $A$ マスを選んで,
2. そこから横（右）方向または縦（下）方向にピースを置く

というのを考えるとこの全通りは
$$\binom{HW}{A} \times 2^A \leq 3,294,720$$
という上限が与えられる.  これならバリデーションに $O(HW)$ 掛けても大丈夫そう.

$2^A$ 通りの全探索はビットセットの考え方から比較的容易に実装できる:

```python
for iset in 1 << A:
  for i in range(A):
    # do it
```

一方 $\binom{m}{n}$ 通りの全探索も単純ではないが地道に実装すれば難しくはない.  私は [こんな風に](https://github.com/cympfh/procon-rs/blob/master/src/num/iter/combination.rs) 自前のライブラリとして実装していて, コンテストではこれをコピペしている.

```python
ans = 0
for p in binom(m * n, a):  # binom{mn}{a}
  for q in power(2, a):    # 2 ** a
    # 実際に置いてみて重なることのないことをチェック
    if validate(p, q):
      ans += 1
print(ans)
```
