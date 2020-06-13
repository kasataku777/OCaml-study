#use "../chap8/gakusei_t"
(* 目的：gakusei_tのリストから最高得点のレコードを返す *)
(* gakusei_max : gakusei_t list -> gakusei_t *)
let rec gakusei_max lst = match lst with
[]->{namae="";tensuu=min_int;seiseki=""}
|{namae=n;tensuu=t;seiseki=s} as gaku :: rest ->
let rest_max = gakusei_max rest in
match rest_max with {namae =n_max;tensuu=t_max;seiseki=s_max}->
if t_max <t  then  gaku
else rest_max



(* test *)
let lst1 =[{namae="kaneko";tensuu=85;seiseki="A"}]
let lst2 = [{namae="asai";tensuu=70;seiseki="B"}]
let lst3 = [{namae="asai";tensuu=70;seiseki="B"};{namae="kaneko";tensuu=85;seiseki="A"}]
let lst4 = [{namae="yoshida";tensuu=90;seiseki="A"};{namae="asai";tensuu=70;seiseki="B"};{namae="kaneko";tensuu=85;seiseki="A"}]

let test1 = gakusei_max lst1 = {namae="kaneko";tensuu=85;seiseki="A"}
let test2 = gakusei_max lst2 = {namae="asai";tensuu=70;seiseki="B"}
let test3 = gakusei_max lst3 = {namae="kaneko";tensuu=85;seiseki="A"}
let test4 = gakusei_max lst4 = {namae="yoshida";tensuu=90;seiseki="A"}
