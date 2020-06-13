(* 目的 :駅のデータekimeiを受け取ったら，路線名と駅名（かな）を返す関数 *)
(* hyoji : ekimei_t-> string *)
let hyoji ekimei = match ekimei with
{kanji=k;kana=ka;romaji=r;shozoku=s}->
s ^ "," ^ k ^ "（" ^ ka ^ "）"


(* テスト *)
let test1 = hyoji {kanji = "茗荷谷"; kana = "みょうがだに";romaji="myougadani";shozoku="丸の内線"}
= "丸の内線,茗荷谷（みょうがだに）"
let test2 = hyoji {kanji = "蒲田"; kana = "かまた";romaji="kamata";shozoku="京浜東北線"}
="京浜東北線,蒲田（かまた）"
let test3 = hyoji {kanji = "大森"; kana = "おおもり";romaji="omori";shozoku="京浜東北線"}
="京浜東北線,大森（おおもり）"