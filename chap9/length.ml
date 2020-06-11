(* 目的：受け取ったリスト　lstの長さを求める *)
let rec length lst = match lst with
[]->0
| first :: rest -> 1 + length 
(* test *)
let test1 = length [] =0
let test2 = length [2] =1
let test3 = length [1;3] =2
let test4 = length [1;2;3;4;5;6;7;8;9;10] =10
