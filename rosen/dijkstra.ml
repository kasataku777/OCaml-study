#use "seiretsu.ml"
#use "romaji_to_kanji.ml"
#use "make_initial_eki_list.ml"
#use "get_ekikan_kyori.ml"
#use "saitan_wo_bunri.ml"


(* 直前に確定した駅pと未確定の駅のリストvを受け取ったら必要な更新処理を行った後の未確定の駅のリストを返す *)
(* koushin: eki_t -> eki_t list ->ekikan_tree_t  -> eki_t list *)
let koushin p v ekikan_tree=
(* 目的：直前に確定した駅p(eki_t)と未確定の駅qを受け取ったらpとqが直接つながっているかどうかを調べて，
繋がっていたらqの最短距離と手前リストを必要に応じて更新し，返す関数 *)
(* koushin1 : eki_t ->eki_t-> eki_t *)
match p with
{namae=np;saitan_kyori=sp;temae_list=tp}->
List.map (fun  q -> 
match q with {namae=nq;saitan_kyori=sq;temae_list=tq}->
let kyori = get_ekikan_kyori np nq ekikan_tree in
if kyori = infinity then q
else if kyori +. sp >= sq then q
else {namae=nq;saitan_kyori=kyori+.sp;temae_list=nq::tp} ) v

(* 目的:eki_t listの駅のリスト（未確定）とekikan_t list型の駅間のリストを受け取ったら
ダイクストラのアルゴリズムで各駅について最短距離と最短経路が正しく入ったリストをかえす *)
(* dijkstra_main : eki_t list -> ekikan_tree_t -> eki_t list *)
let rec dijkstra_main eki_lst ekikan_tree = match eki_lst with
[]->[]
|first ::rest ->
let (saitan,nokori)=saitan_wo_bunri(first::rest) in
let eki_list2=koushin saitan nokori ekikan_tree  in
saitan::dijkstra_main eki_list2 ekikan_tree


(* 目的:受け取ったeki_listからshuten のレコード探す *)
(* find -> string -> eki_t list -> eki_t *)
let rec find shuten eki_list = match eki_list with
[]->{namae="";saitan_kyori=infinity;temae_list=[]}
|({namae=n;saitan_kyori=s;temae_list=t}as first ):: rest ->
if n= shuten then first else find shuten rest
(* 目的:始点の駅名と終点の駅名を受け取ったら終点の駅のレコードを返す *)
(* dijkstra:string ->string ->eki_t *)
let dijkstra romaji_siten romaji_syuten =
let seiretsu_lst = seiretsu global_ekimei_list in
let kiten=romaji_to_kanji romaji_siten seiretsu_lst in
let syuten=romaji_to_kanji romaji_syuten seiretsu_lst in
let eki_t_lst = make_initial_eki_list seiretsu_lst kiten in
let global_ekikan_tree = inserts_ekikan Empty global_ekikan_list in
let dijk_list = dijkstra_main eki_t_lst global_ekikan_tree in
find syuten dijk_list

(* テスト *) 
let test1 = dijkstra "shibuya" "gokokuji" = 
  {namae = "護国寺"; saitan_kyori = 9.8; 
   temae_list = 
     ["護国寺"; "江戸川橋"; "飯田橋"; "市ヶ谷"; "麹町"; "永田町"; 
      "青山一丁目"; "表参道"; "渋谷"]} 
let test2 = dijkstra "myogadani" "meguro" = 
  {namae = "目黒"; saitan_kyori = 12.7000000000000028; 
   temae_list = 
     ["目黒"; "白金台"; "白金高輪"; "麻布十番"; "六本木一丁目"; "溜池山王"; 
      "永田町"; "麹町"; "市ヶ谷"; "飯田橋"; "後楽園"; "茗荷谷"]} 