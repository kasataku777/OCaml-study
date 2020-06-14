
(* 目的：関数fとリストlstを受け取り,fを施したリストを返す *)
(* map : ('a -> 'b) -> 'a list -> 'b list *)
let rec map f lst = match lst with
[]->[]
|first :: rest -> f first :: map f rest

(* 目的：実数のリストlstを受け取り各要素の平方根のリストを返す *)
(* map_sqrt : float list -> float list *)
let map_sqrt lst = map sqrt lst