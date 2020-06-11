(* 優遇時給 *)
let yugu_jikyu = 980
(* 時給*)
let jikyu= 950

(* 基本給*)
let kihonkyu = 100


(* 目的：はたらいた時間ｘに応じたアルバイト代を計算する*)
(* kyuyo : int -> int *)
let kyuyo x = 
if x < 30 then kihonkyu + x*jikyu
else kihonkyu + x*yugu_jikyu

(* テスト*)
let test1 = kyuyo 25 = 23850
let test2 = kyuyo 28 = 26700
let test3 = kyuyo 31 = 30480
