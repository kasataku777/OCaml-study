(* 目的：受け取ったlstから正の要素のみを取り出す *)
(* filter_positive : int list -> int list *)
let rec filter_positive lst = match lst with
[]-> []
|first :: rest->
if first > 0 then first :: filter_positive rest
else filter_positive rest