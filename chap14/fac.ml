(* 目的:ｎから1までのリスト *)
let rec enumerate n = 
if n= 0 then [] else n ::enumerate (n-1)

(* 目的 :階乗*)
let fac n =
List.fold_right ( * )  (enumerate n) 1

(* test *)
let test1= fac 0 =1
let test2= fac 1 =1
let test3= fac 2 =2
let test4= fac 3 =6
let test5= fac 4 =24
