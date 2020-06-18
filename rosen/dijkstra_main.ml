#use "get_ekikan_kyori.ml"
#use "saitan_wo_bunri.ml"

(* 直前に確定した駅pと未確定の駅のリストvを受け取ったら必要な更新処理を行った後の未確定の駅のリストを返す *)
(* koushin: eki_t -> eki_t list ->ekikan_t list -> eki_t list *)
let koushin p v ekikan_list=
(* 目的：直前に確定した駅p(eki_t)と未確定の駅qを受け取ったらpとqが直接つながっているかどうかを調べて，
繋がっていたらqの最短距離と手前リストを必要に応じて更新し，返す関数 *)
(* koushin1 : eki_t ->eki_t-> eki_t *)
match p with
{namae=np;saitan_kyori=sp;temae_list=tp}->
List.map (fun  q -> 
match q with {namae=nq;saitan_kyori=sq;temae_list=tq}->
let kyori = get_ekikan_kyori np nq ekikan_list in
if kyori = infinity then q
else if kyori +. sp >= sq then q
else {namae=nq;saitan_kyori=kyori+.sp;temae_list=nq::tp} ) v

(* 目的:eki_t listの駅のリスト（未確定）とekikan_t list型の駅間のリストを受け取ったら
ダイクストラのアルゴリズムで各駅について最短距離と最短経路が正しく入ったリストをかえす *)
(* dijkstra_main : eki_t list -> ekikan_t list -> eki_t list *)
let rec dijkstra_main eki_lst ekikan_lst = match eki_lst with
[]->[]
|first ::rest ->
let (saitan,nokori)=saitan_wo_bunri(first::rest) in
let eki_list2=koushin saitan nokori ekikan_lst  in
saitan::dijkstra_main eki_list2 ekikan_lst


(* 駅の例 *) 
let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []} 
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]} 
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]} 
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []} 
 
(* 駅リストの例 *) 
let lst = [eki1; eki2; eki3; eki4] 
 
(* テスト *) 
let test1 = dijkstra_main [] global_ekikan_list = [] 
let test2 = dijkstra_main lst global_ekikan_list = 
  [{namae = "茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]}; 
   {namae = "新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]}; 
   {namae = "後楽園"; saitan_kyori = 1.8; temae_list = ["後楽園"; "茗荷谷"]}; 
   {namae = "池袋"; saitan_kyori = 3.; temae_list = ["池袋"; "新大塚"; "茗荷谷"]}] 