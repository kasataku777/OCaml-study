(* 目的：2以上n以下の自然数のリストを受け取ったら2以上n以下の素数のリストを返す *)
(* sieve : int list -> int list *)
let rec sieve lst = 
let take_mod  n lst= List.filter (fun item ->item mod n <> 0 ) lst in
match lst with
[]->[]
|first :: rest-> first :: sieve (take_mod first rest)

(* test *)
let test1=sieve [2;3;4;5;7;6;8]=[2;3;5;7]
let test2=sieve []=[]

(* 目的:2から受け取った自然数nまでの自然数のリストを返す *)
(* two_to_n : int -> int list *)
let two_to_n n = 
let rec loop i = 
if i<= n then i :: loop (i+1) else [] in
loop 2

(* 目的:２から受け取った自然数n までの素数リスト返す *)
(* prime:int -> int list *)
let prime n = sieve (two_to_n n)

(* test *)
let test3 = prime 10 = [2;3;5;7]