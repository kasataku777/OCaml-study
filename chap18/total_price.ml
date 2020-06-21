exception Urikire

(* 目的 :itenの値段を調べる*)
(* price:string->(string*int )list ->int *)
let rec price item yaoya_list = match yaoya_list with
[]->raise Urikire
|(yasai,nedan)::rest->
if item=yasai then nedan
else price iten rest


(* 目的:yasai_listを買ったときの値段の合計 *)
(* total_price : string list->(string* int );ist->int *)
let total_price yasai_list yaoya_list=
let rec hojyo yasai_list = match yasai_list with
[]->0
|first::rest->
price first yaoya_list+hojyo rest
in try
hojyo yasai_list
with Urikire->0