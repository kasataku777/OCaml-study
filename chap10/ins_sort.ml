#use "insert.ml"
(* 目的 : 整数のリストを受け取ったらそれを昇順に整列したリストを返す *)
(* ins_sort : int list -> int list *)
let rec ins_sort lst = match lst with
[]->[]
| first ::rest -> insert (ins_sort rest) first


(* test *)


let test1 = ins_sort [] = []
let test2 = ins_sort [1] = [1]
let test3 = ins_sort [2;4;1] = [1;2;4]
let test4 = ins_sort [5;-3;9;1] = [-3;1;5;9]
