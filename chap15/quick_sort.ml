(* 目的:lstの中からnより小さい要素のみを取り出す *)
(* take_less : int -> int list -> int list *)
let take_less n lst = match lst with
[]->[]
|first :: rest -> if first < n
then first :: take_less n rest
else take_less n rest

(* 目的:lstの中からnより大きい要素のみを取り出す *)
(* take_greater : int -> int list -> int list *)
let rec quick_sort lst=
let take n lst p = List.filter (fun item-> p item n) lst
in let take_less n lst = take n lst (<=)
in let take_greater n lst = take n lst (>)
in match lst with
[]->[]
|first :: rest -> quick_sort (take_less first rest)
@ [first]
@quick_sort(take_greater first rest)








(* test *)
let test1=quick_sort []=[]
let test2=quick_sort [1]=[1]
let test3=quick_sort [1;2]=[1;2]
let test4=quick_sort [5;4;9;8;2;3]=[2;3;4;5;8;9]
