#use "global_ekikan_list.ml"

(* 目的: 漢字の駅名２つと駅間リストを受け取り駅間リストの中からその2駅間の距離を返す *)
(* get_ekikan_kyori: string -> string -> ekikan_t list -> float*)

let rec get_ekikan_kyori ekimei1 ekimei2 lst = match lst with
[]->infinity
|{kiten=ki;shuten=shu;keiyu=kei;kyori=kyo;jikan=ji}::rest->
if ki = ekimei1 && shu = ekimei2 then kyo
else if ki = ekimei2 && shu = ekimei1 then kyo
else get_ekikan_kyori ekimei1 ekimei2 rest




(* test *)
let test1 = get_ekikan_kyori "茗荷谷" "新大塚" global_ekikan_list =1.2
let test2 = get_ekikan_kyori "新御茶ノ水" "大手町" global_ekikan_list =1.3
let test3 = get_ekikan_kyori "上野" "上野広小路" global_ekikan_list =0.5
let test4 = get_ekikan_kyori "上野" "茗荷谷" global_ekikan_list =infinity
let test5 = get_ekikan_kyori "新大塚" "茗荷谷" global_ekikan_list =1.2
let test6 = get_ekikan_kyori "新大塚" "茗荷谷"  []=infinity


