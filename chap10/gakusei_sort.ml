#use "../chap8/gakusei_t.ml"


(* 目的：昇順にならんでいるリストlstとせいすうnを受け取ったら，lstを前から順にみて，昇順となる位置にnを挿入したリストを返す *)
(* insert : gakusei_t list -> gakusei_t -> galusei_t list *)
let rec gakusei_insert lst  gakusei0 =match lst with
[] -> gakusei0::[]
|({namae=n;tensuu=t;seiseki=s}as gakusei) ::rest -> 
match gakusei0 with {namae=n0;tensuu=t0;seiseki=s0}->
if t < t0 then gakusei  :: gakusei_insert rest gakusei0 
else gakusei0::lst

(* 目的：gakusei_tのリストを受け取ってそれをtensuuの順に整列したリストを返す *)
(* gakusei_ins_sort : list gakusei_t -> list gakusei_t *)

let rec gakusei_ins_sort lst = match lst with 
[]->[]
|first :: rest -> gakusei_insert (gakusei_ins_sort rest)  first


(* test *)
let lst1 =[]
let lst2 = [{namae="asai";tensuu=70;seiseki="B"}]
let lst3 = [{namae="asai";tensuu=70;seiseki="B"};{namae="kaneko";tensuu=85;seiseki="A"}]
let lst4 = [{namae="yoshida";tensuu=80;seiseki="A"};{namae="asai";tensuu=70;seiseki="B"};{namae="kaneko";tensuu=85;seiseki="A"}]

let test1 = gakusei_ins_sort lst1 = []
let test2 = gakusei_ins_sort lst2 = [{namae="asai";tensuu=70;seiseki="B"}]
let test3 = gakusei_ins_sort lst3 = [{namae="asai";tensuu=70;seiseki="B"};{namae="kaneko";tensuu=85;seiseki="A"}]
let test4 = gakusei_ins_sort lst4 = [{namae="asai";tensuu=70;seiseki="B"};{namae="yoshida";tensuu=80;seiseki="A"};{namae="kaneko";tensuu=85;seiseki="A"}]
