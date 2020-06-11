(* 目的：鶴と亀の数の合計xと足の数の合計yが与えられたら鶴の数を計算する *)
(* tsurukame : int int ->int *)
let tsurukame x y = (4*x-y )/2

(* test *)
let test1 = tsurukame 3 8 = 2
let test2 = tsurukame 5 16 = 2
let test3 = tsurukame 10 30 = 5
