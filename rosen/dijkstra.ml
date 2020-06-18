#use "seiretsu.ml"
#use "romaji_to_kanji.ml"
#use "make_initial_eki_list.ml"
#use "dijkstra_main.ml"



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
let dijk_list = dijkstra_main eki_t_lst global_ekikan_list in
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