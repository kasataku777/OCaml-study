(* 目的 ; m,nの最大公約数を求める *)
(* gcd : int -> int -> int *)
let rec gcd m n =
if n= 0 then m
else gcd n (m mod n)


(* test *)
let test1= gcd 1 1 = 1
let test2=gcd 2 1 = 1
let test3=gcd 6 2 = 2
let test4=gcd 10 6 = 2
