(* 目的：昇順にならんでいるリストlstとせいすうnを受け取ったら，lstを前から順にみて，昇順となる位置にnを挿入したリストを返す *)
(* insert : int list -> n -> int list *)
let rec insert lst n =match lst with
[] -> n::[]
|first::rest -> if n <= first then n  :: first ::rest 
else first :: insert rest n


(* test *)
let test1 = insert [] 1 = [1]
let test2 = insert [2;3;9] 1 = [1;2;3;9]
let test3 = insert [1;3;33] 5 = [1;3;5;33]
let test4 = insert [4;8] 30 = [4;8;30]
