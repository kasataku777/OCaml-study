(* #use "ekimei_t.ml" *)
#use "global_ekimei_list.ml"
exception No_such_station of string
(* 目的：ローマ字の駅名と駅名リストを受け取ったらその駅の漢字表記を返す *)
(* romaji_to_kanji: string -> ekimei_t list -> string *)
let rec romaji_to_kanji ekimei lst =match lst with
[] ->raise (No_such_station(ekimei))
|{kanji=k;kana=ka;romaji=r;shozoku=s} :: rest ->
if ekimei = r then k
else romaji_to_kanji ekimei rest


(* test *)
let test1 = romaji_to_kanji "myogadani" global_ekimei_list ="茗荷谷"
let test2 = romaji_to_kanji "ochiai" global_ekimei_list ="落合"
let test3 = romaji_to_kanji "waseda" global_ekimei_list ="早稲田"
let test4 = romaji_to_kanji "wase" global_ekimei_list =""
let test5 = romaji_to_kanji "" global_ekimei_list =""
let test6 = romaji_to_kanji "" [] =""



