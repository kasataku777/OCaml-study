#use "eki_t.ml"
#use "eki_t.ml"


(* 目的:eki_tのlstと起点を受け取ったら基点のみ変化させるeki_tのリストを返す *)
(* shokika : eki_t list -> string -> eli_t list *)
let rec shokika lst kiten = match lst with
[]->[]
|({namae=k;saitan_kyori=s;temae_list=t} as first) :: rest->
if k=kiten then {namae=k;saitan_kyori=0.;temae_list=[k]}:: shokika rest kiten
else first :: shokika rest kiten



(* test *)

let ekit_list= [{namae="茗荷谷";saitan_kyori=infinity;temae_list=[]};
{namae="蒲田";saitan_kyori=infinity;temae_list=[]};
{namae="末広町";saitan_kyori=infinity;temae_list=[]}]
let test1 = shokika [] "茗荷谷"= []
let test2 = shokika ekit_list "茗荷谷" = [{namae="茗荷谷";saitan_kyori=0.;temae_list=["茗荷谷"]};
{namae="蒲田";saitan_kyori=infinity;temae_list=[]};
{namae="末広町";saitan_kyori=infinity;temae_list=[]}]


