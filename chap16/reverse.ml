(* 目的:与えられたリストを逆順にして返す *)
(* reverse: 'a list -> 'a list *)
let reverse lst = 
(* 目的:lstの逆順のリスト @resultを返す *)
(* ここでresultはこれまでの要素を逆順にしたリスト *)
let rec rev lst result = match lst with
[]->result
|first::rest ->rev rest (first::result)
in rev lst []