let yaoya_list{("トマト",300);("玉ねぎ",200);("にんじん",150);("ほうれん草",200)}

(* 目的 :itenの値段を調べる*)
(* price:string->(string*int )list ->int option *)
let rec price item yaoya_list = match yaoya_list with
[]->None
|(yasai,nedan)::rest->
if item=yasai then Some(nedan)
else price iten rest