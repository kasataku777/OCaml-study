(*目的：　亀の数ｘから足の本数を計算する  *)
(* kame_no_ashi : int -> int *)
let kame_no_ashi x = 4 *x;;

(*目的：　鶴の数ｘから足の本数を計算する  *)
(* tsuru_no_asahi : int -> int *)
let tsuru_no_ashi x = 2*x


(* 目的：鶴の数xと亀の数yから足の数の合計を計算する *)
(* tsurukame_no_ashi : int->int->int *)
let tsurukame_no_ashi x y = tsuru_no_ashi x + kame_no_ashi y

(* テスト *)
let test1 = tsurukame_no_ashi 2 3 = 16
let test2 = tsurukame_no_ashi 4 3 = 20
let test3 = tsurukame_no_ashi 0 30 = 120

