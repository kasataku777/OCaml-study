(* 目的：受け取った二つの関数を合成した関数を返す *)
(* compose : ('b -> 'c )-> ('a -> 'b)->'c *)
let compose  f g = 
let h x = f (g x) in
h

(* 目的:3を加える *)
(* int ->int *)
let add3 x = x +3

(* 目的:2をかける *)
(* times2 : int -> int *)
let times2 x = x * 2



(* test *)
let test1=( compose times2 add3 ) 4=14