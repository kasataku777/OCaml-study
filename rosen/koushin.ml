#use "get_ekikan_kyori.ml"
#use "eki_t.ml"


(* 直前に確定した駅pと未確定の駅のリストvを受け取ったら必要な更新処理を行った後の未確定の駅のリストを返す *)
(* koushin: eki_t -> eki_t list -> eki_t list *)
let koushin p v =
(* 目的：直前に確定した駅p(eki_t)と未確定の駅qを受け取ったらpとqが直接つながっているかどうかを調べて，
繋がっていたらqの最短距離と手前リストを必要に応じて更新し，返す関数 *)
(* koushin1 : eki_t ->eki_t-> eki_t *)
match p with
{namae=np;saitan_kyori=sp;temae_list=tp}->
List.map (fun  q -> 
match q with {namae=nq;saitan_kyori=sq;temae_list=tq}->
let kyori = get_ekikan_kyori np nq global_ekikan_list in
if kyori = infinity then q
else if kyori +. sp >= sq then q
else {namae=nq;saitan_kyori=kyori+.sp;temae_list=nq::tp} ) v



(* test *)
let test1 = koushin {namae="茗荷谷";saitan_kyori=0.;temae_list=["茗荷谷"]} [] 
=[]
let test2 = koushin {namae="茗荷谷";saitan_kyori=0.;temae_list=["茗荷谷"]} [{namae="新大塚"; saitan_kyori=infinity;temae_list=[]}] 
=[{namae="新大塚"; saitan_kyori=1.2;temae_list=["新大塚";"茗荷谷"]}]
let test3 = koushin {namae="茗荷谷";saitan_kyori=0.;temae_list=["茗荷谷"]} 
[{namae="新大塚"; saitan_kyori=infinity;temae_list=[]};{namae="西船橋";saitan_kyori=infinity;temae_list=[]}] 
=[{namae="新大塚"; saitan_kyori=1.2;temae_list=["新大塚";"茗荷谷"]};{namae="西船橋";saitan_kyori=infinity;temae_list=[]}]