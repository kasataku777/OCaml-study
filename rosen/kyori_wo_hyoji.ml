#use "romaji_to_kanji.ml"
#use "get_ekikan_kyori.ml"

(* 目的：ローマ字の駅名を二つ取ってきたら距離を調べて文字を返す *)
(* kyori_wo_hyoji.ml : string -> string -> string *)
let kyori_wo_hyoji roma1 roma2 = 
let kanji1 = romaji_to_kanji roma1 global_ekimei_list in
if kanji1 = "" then roma1 ^ "という駅は存在しません"
else let kanji2=romaji_to_kanji roma2 global_ekimei_list in
if kanji2 = "" then roma2 ^ "という駅は存在しません"
else let kyori=get_ekikan_kyori kanji1 kanji2 global_ekikan_list in
if kyori = infinity then kanji1 ^ "駅と" ^ kanji2 ^ "駅はつながっていません"
else kanji1 ^ "駅から" ^ kanji2 ^ "駅までは" ^ string_of_float(kyori) ^ "kmです"





(* test *)
let test1= kyori_wo_hyoji "myogadani" "shinotsuka" = "茗荷谷駅から新大塚駅までは1.2kmです"
let test2= kyori_wo_hyoji "shinotsuka" "myogadani"  = "新大塚駅から茗荷谷駅までは1.2kmです"
let test3= kyori_wo_hyoji "ochiai" "shinotsuka" = "落合駅と新大塚駅はつながっていません"
let test4= kyori_wo_hyoji "uenohirokoji" "ueno" = "上野広小路駅から上野駅までは0.5kmです"
let test5= kyori_wo_hyoji "oc" "shinotsuka" = "ocという駅は存在しません"

