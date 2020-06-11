(* 目的：受け取ったリストの偶数の要素のみを含むリストを返す *)
(* even : int list -> int list *)
let rec even lst = match lst with
[]->[]
| first :: rest -> if first mod 2 = 0 then first :: even rest else even rest
(* test *)
let test1 = even [] = []
let test2 = even [2] = [2]
let test3 = even [1;3] = []
let test4 = even [1;2;3;4;5;6;7;8;9;10] = [2;4;6;8;10]
