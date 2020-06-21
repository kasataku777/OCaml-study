(* #use "global_ekikan_list.ml"

(* 目的: 漢字の駅名２つと駅間リストを受け取り駅間リストの中からその2駅間の距離を返す *)
(* get_ekikan_kyori: string -> string -> ekikan_t list -> float*)

let rec get_ekikan_kyori ekimei1 ekimei2 lst = match lst with
[]->infinity
|{kiten=ki;shuten=shu;keiyu=kei;kyori=kyo;jikan=ji}::rest->
if ki = ekimei1 && shu = ekimei2 then kyo
else if ki = ekimei2 && shu = ekimei1 then kyo
else get_ekikan_kyori ekimei1 ekimei2 rest

 *)
#use "ekikan_t.ml"
#use "global_ekikan_kyori.ml"
#use "assoc.ml"
#use "inserts_ekikan.ml"

(* 目的：2津の駅の間の距離を求める *)
(* get_ekikan_kyori2 :  string -> string ->ekikan_tree_t->float*)
let rec get_ekikan_kyori eki1 eki2 tree = match tree with
Empty -> raise Not_found
|Node (left,k,lst,right)->
if eki1<k then get_ekikan_kyori eki1 eki2 left
else if eki1>k then get_ekikan_kyori eki1 eki2 right
else List.assoc eki2 lst

(* テスト *) 
(* let global_ekikan_tree = inserts_ekikan Empty global_ekikan_list 
let test1 = get_ekikan_kyori "茗荷谷" "新大塚" global_ekikan_tree = 1.2 
let test2 = get_ekikan_kyori "茗荷谷" "池袋" global_ekikan_tree = infinity 
let test3 = get_ekikan_kyori "東京" "大手町" global_ekikan_tree = 0.6  *)

(* test
let test1 = get_ekikan_kyori "茗荷谷" "新大塚" global_ekikan_list =1.2
let test2 = get_ekikan_kyori "新御茶ノ水" "大手町" global_ekikan_list =1.3
let test3 = get_ekikan_kyori "上野" "上野広小路" global_ekikan_list =0.5
let test4 = get_ekikan_kyori "上野" "茗荷谷" global_ekikan_list =infinity
let test5 = get_ekikan_kyori "新大塚" "茗荷谷" global_ekikan_list =1.2
let test6 = get_ekikan_kyori "新大塚" "茗荷谷"  []=infinity *)


