(*目的：　亀の数ｘから足の本数を計算する  *)
(* kame_no_ashi : int -> int *)
let kame_no_ashi x = 4 *x;;

(* テスト*)
let test1 = kame_no_ashi 10 = 40
let test2 = kame_no_ashi 200 = 800
let test3 = kame_no_ashi 400 = 1600
