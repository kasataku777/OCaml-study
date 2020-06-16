#use "eki_t.ml"
(* 目的 :eki_tのリストを受け取ったら，最短距離最小の駅と最短距離最小の駅以外からなるリストを返す*)
(* saitan_wo_bunri : eki_t list -> eki_t * eki_t list *)

(* let rec saitan_wo_bunri lst =match lst with
[]->({namae="";saitan_kyori=infinity;temae_list=[]},[])
|first::rest->
let (p,v)=saitan_wo_bunri rest in
match (first,p) with
({namae=fn;saitan_kyori=fs;temae_list=ft},
{namae=pn;saitan_kyori=ps;temae_list=pt})->
if pn="" then (first,v)
else if fs<ps then(first,p::v)
else (p,first::v) *)
let rec saitan_wo_bunri eki_list = 
List.fold_right (fun first (p,v)->
match (first,p) with
({namae=fn;saitan_kyori=fs;temae_list=ft},
{namae=sn;saitan_kyori=ss;temae_list=st})->
if sn="" then (first,v)
else if fs<ss then (first,p::v)
else (p,first::v)) eki_list  ({namae="";saitan_kyori=infinity;temae_list=[]},[])


(* test *)
let test1= saitan_wo_bunri [{namae="蒲田"; saitan_kyori=infinity;temae_list=[]};{namae="新大塚"; saitan_kyori=1.2;temae_list=["新大塚";"茗荷谷"]}]
=({namae="新大塚"; saitan_kyori=1.2;temae_list=["新大塚";"茗荷谷"]},[{namae="蒲田"; saitan_kyori=infinity;temae_list=[]}])

