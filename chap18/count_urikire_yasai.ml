#use "price.ml"

(* 目的:八百屋リストに入っていない野菜の数を返す *)
(* count_urikire_yasai : string list -> (string*int )list->int *)
let rec count_urikire_yasai yasai_list yaoya_list = match yasai_list with
[]->0
|first::rest->
match price first yaoya_list with
None -> 1+ count_urikire_yasai rest yaoya_list
|Some(p)->count_urikire_yasai rest yaoya_list

(* test *)
let test1= count_urikire_yasai ["たまねぎ";"にんじん"] yaoya_list =0
let test2= count_urikire_yasai ["たまねぎ";"にんじん";"じゃがいも"] yaoya_list =1
let test3= count_urikire_yasai ["しいたけ";"にんじん";"なす"] yaoya_list =2
