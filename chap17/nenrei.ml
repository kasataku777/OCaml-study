#use "to_seireki.ml"

(* 目的：誕生年と現在の年を受け取ったら年齢を返す *)
(* nenrei:nengou_t->nengou_t->int *)
let nenrei nengou1 nengou2 =
to_seireki nengou2 -to_seireki nengou1


(* test *)
let test1= nenrei(Showa(42)) (Heisei(18)) = 39
let test2= nenrei(Heisei(11)) (Heisei(18)) = 7


