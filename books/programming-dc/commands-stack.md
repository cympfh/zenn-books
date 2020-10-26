---
title: コマンド紹介 - スタックの操作

---

さて, ここからは具体例を使いながら一つずつコマンドを紹介していく.
まずはスタックに関するコマンドから紹介しよう.

## Stack print

一文字コマンド `f` はスタックの状態全てを画面に表示する.
もし今, スタックに 3 個データが積まれているなら, 3 行に渡ってそのデータの中身が表示されるし,
スタックが空なら何も表示されない.

![](https://i.imgur.com/DK4JMH3.jpg)

```bash
> 1 2 3  # 下から順に 1,2,3 が積まれる
> f
3
2
1
```

このように, 一番上に積まれたデータが一行目に, 一番下に積まれたデータが一番最後の行に表示される.

コレ自体はスタックを操作するコマンドではなく, デバッグ用, 確認用のコマンドに過ぎない.
`f` を実行する前後で, スタックの状態は何も変わらないことに注意.

## Stack clear

一文字コマンド `c` は, スタックを空にする.

```bash
> 1 2 3
> f
3
2
1
# スタックには3つデータが積まれた状態
> c
> f
# 何も表示されない. スタックが空であることを表す
```

ここまでの `f` と `c` はデバッグ用途に必要になるから先に説明した.
次にスタックの中を変更するようなコマンドを続けて紹介する.

## Duplicate

一文字コマンド `d` はスタックの一番上のデータを複製する.
一回 pop してきたデータを二回 push する, という言い方も出来るだろう.

![](https://i.imgur.com/PxvUQEh.jpg)

```bash
> 1
> f
1
> df  # duplicate して f する
1
1
# 2つに増えている
```

## Rotation

スタックから値を取り出すのは一番上からと言ったが, 実際にそれだけだと不便だ. 欲しいデータが下の方に埋もれてしまうことはよくある. Rotation はそのような場合にデータを掘り出す, または逆にトップのデータを下に埋める, という操作のことを言う.

:::message alert
例えば上から5番目の値を掘り出すためには結局5回 pop して5回 push するようなことをしている.  つまり, 深さに比例した計算コストを支払っていることになる.  したがって必要なデータがいつもスタックの浅いところにあるようにしておくのが望ましい.
:::

最もわかりやすい Rotation は, スタックのトップ2つのデータを交換する操作だ. この操作のことは Swap とも言う. そしてこれは一文字コマンド `r` で実行される.

```bash
> 1 2 3
> f
3
2
1
> r
> f
2
3
1
# トップにある 3 と 2 が交換された
```

`r` はいわば, スタックの上から二つ目のデータをトップに掘り出す操作だと思うことが出来る. この一般化が `R` だ. 上から何個目のデータを掘り出すかをユーザーが自由に決めることが出来る. `R` は一文字コマンドで, これを実行すると次が行われる.

1. スタックのトップからデータを一つ取り出す
    - 単に「取り出す」と言った場合, データが「取り除かれる」という意味であることに注意
    - そのデータは $1$ 以上の整数である必要があって, それを $n$ とする
2. この時点でスタックの上から $n$ 個目のデータをトップに持ち上げる
    - $n=1$ のとき, スタックのトップのデータをトップに持ち上げるので, 何もしないのと同じになる

さて, この $n$ というデータだが, これは `R` の効果にだけ使われるデータで, いわばパラメータだと思うことが出来る. したがって実際には `3R` だとか `4R` みたいに, セットで記述することになる. `R` のことを単に一文字コマンドだと言ったが, その前にパラメータを受け取る特殊なコマンドだと思ってしまってもいい.

```bash
> 1 2 3
> f
3
2
1

> 3R
> f
1
3
2
# 上から三番目にある 1 がトップに持ち上げられた
# 持ち上げられるデータ以外はそのままの順序を保つ

> 2R  # これは r と同じ意味
> f
3
1
2
```

さて, 逆の動きとして, トップにあるデータをスタックの奥底に埋めるという操作が考えられる. これもまた実は `R` で行う. 先程 $n$ は $1$ 以上の整数であるといったが, 負数の場合には, この埋める動きをする.

1. pop した値を $-n$ であるとする.
    - $-n < 0$
    - dc で負数のことは `_3` などと `_` を使って記述することに注意
2. トップにあるデータを, 上から $n$ 番目の位置に埋める

```bash
> 1 2 3
> f
3
2
1

> _3R
> f
2
1
3
# トップにあった 3 が上から3つ目に下がった
```

スタックの操作は以上だ. 次の章からは（やっと）実際に計算をさせていく.