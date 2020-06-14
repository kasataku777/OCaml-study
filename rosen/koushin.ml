#use "koushin1.ml"


(* 直前に確定した駅pと未確定の駅のリストvを受け取ったら必要な更新処理を行った後の未確定の駅のリストを返す *)
(* koushin: eki_t -> eki_t list -> eki_t list *)
let koushin p v =
let f q = koushin1 p q in
List.map f v



(* test *)
let test1 = koushin {namae="茗荷谷";saitan_kyori=0.;temae_list=["茗荷谷"]} [] 
=[]
let test2 = koushin {namae="茗荷谷";saitan_kyori=0.;temae_list=["茗荷谷"]} [{namae="新大塚"; saitan_kyori=infinity;temae_list=[]}] 
=[{namae="新大塚"; saitan_kyori=1.2;temae_list=["新大塚";"茗荷谷"]}]
let test3 = koushin {namae="茗荷谷";saitan_kyori=0.;temae_list=["茗荷谷"]} 
[{namae="新大塚"; saitan_kyori=infinity;temae_list=[]};{namae="西船橋";saitan_kyori=infinity;temae_list=[]}] 
=[{namae="新大塚"; saitan_kyori=1.2;temae_list=["新大塚";"茗荷谷"]};{namae="西船橋";saitan_kyori=infinity;temae_list=[]}]