---
title: 意味論

---

## 評価システム

- 環境 $\Gamma = (\Gamma_v, \Gamma_f, \Gamma_s, \Gamma_e, \Gamma_u)$
    - $\Gamma_v$: （宣言済みの）変数の集合
    - $\Gamma_f$: （宣言済みの）関数の集合
    - $\Gamma_s$: （宣言済みの）構造体の集合
    - $\Gamma_e$: （宣言済みの）列挙体の集合
    - $\Gamma_u$: （宣言済みの）合併型の集合
- 出力 $O$
    - JSON または出力がないことを表す $\bot$

### 初期環境

- 環境: $\Gamma_0 = (\{\}, \{\}, \ldots)$

### 評価器

評価器は環境 $\Gamma$ を状態として持ち, cumin コード $C$ を入力したとき, $O$ を出力し, 評価後の環境が $\Gamma'$ であるような関数
$$(O, \Gamma') = \mathrm{Eval}(C; \Gamma)$$
の構成をこれから述べていく.

### 評価外観

cumin コード $C$ は $0$ 個以上の文とちょうど $1$ 個の式が並んだ
$$C = (s_1, \ldots, s_n, e)$$
という形をしている.

このとき, 順に各々を評価して,

- $(O_1, \Gamma_1) = \mathrm{Eval}(s_1; \Gamma_0)$
- $(O_2, \Gamma_2) = \mathrm{Eval}(s_2; \Gamma_1)$
- $\vdots$
- $(O_n, \Gamma_n) = \mathrm{Eval}(s_n; \Gamma_{n-1})$
- $(O, \Gamma') = \mathrm{Eval}(e; \Gamma_n)$

として
$$(O,\Gamma') = \mathrm{Eval}(c; \Gamma_0)$$
であるとする.

そこで一つの文または式を評価する方法をこれから述べていく.

### 変数宣言

文 `s` が次の形をしているとする.

```rust
let v : t = e ;
```

型アノテーション `t` が無いときは `Any` として扱う.

- $(O, \Gamma') = \mathrm{Eval}(e; \Gamma)$
- $(O, \Gamma') = \mathrm{Eval}(e; \Gamma)$

