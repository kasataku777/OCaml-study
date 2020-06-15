#use "ekimei_t.ml"
#use "eki_t.ml"
(* 目的:ekimei_tのリストからeki_tのリストを作る関数 *)
(* make_eki_list : ekimei_t list -> eki_t list *)
let  make_eki_list lst = 
List.map (fun ekimei -> match ekimei with 
{kanji=k;kana=ka;romaji=r;shozoku=s} ->
{namae=k;saitan_kyori=infinity;temae_list=[]} )lst

(* test *)
let test1 = make_eki_list [{kanji = "茗荷谷"; kana = "みょうがだに";romaji="myougadani";shozoku="丸の内線"}] 
= [{namae="茗荷谷";saitan_kyori=infinity;temae_list=[]}]
let test2 = make_eki_list [] = []
let test3 = make_eki_list [{kanji = "茗荷谷"; kana = "みょうがだに";romaji="myougadani";shozoku="丸の内線"};
{kanji = "蒲田"; kana = "かまた";romaji="kamata";shozoku="京浜東北線"}] = [{namae="茗荷谷";saitan_kyori=infinity;temae_list=[]};
{namae="蒲田";saitan_kyori=infinity;temae_list=[]}]
let test4 = make_eki_list [{kanji="末広町"; kana="すえひろちょう"; romaji="suehirocho"; shozoku="銀座線"}] 
= [{namae="末広町";saitan_kyori=infinity;temae_list=[]}]
