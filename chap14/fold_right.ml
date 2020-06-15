(* 目的：initから始めてlstの要素を右からfを施し込む *)
(* fold_right : (a->'b->'b)0>'a list ->'b->'b *)
let rec fold_right f lst init = match lst with
[]-> init
|first :: rest -> f first (fold_right f rest init)