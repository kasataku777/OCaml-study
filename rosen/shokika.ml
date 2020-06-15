#use "eki_t.ml"



(* 目的:eki_tのlstと起点を受け取ったら基点のみ変化させるeki_tのリストを返す *)
(* shokika : eki_t list -> string -> eli_t list *)
let  shokika lst kiten = 
List.map (fun eki -> match eki with
{namae=k;saitan_kyori=s;temae_list=t} ->
if k=kiten then {namae=k;saitan_kyori=0.;temae_list=[k]} else eki) lst



(* test *)

let ekit_list= [{namae="茗荷谷";saitan_kyori=infinity;temae_list=[]};
{namae="蒲田";saitan_kyori=infinity;temae_list=[]};
{namae="末広町";saitan_kyori=infinity;temae_list=[]}]
let test1 = shokika [] "茗荷谷"= []
let test2 = shokika ekit_list "茗荷谷" = [{namae="茗荷谷";saitan_kyori=0.;temae_list=["茗荷谷"]};
{namae="蒲田";saitan_kyori=infinity;temae_list=[]};
{namae="末広町";saitan_kyori=infinity;temae_list=[]}]


