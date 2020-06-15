(* 学生ひとり分のデータ（名前、点数、成績）を表す型 *) 
type gakusei_t = { 
  namae : string;       (* 名前 *) 
  tensuu : int;         (* 点数 *) 
  seiseki : string;     (* 成績 *) 
} 

(* gakusei_t list 型のデータの例 *) 
let lst1 = [] 
let lst2 = [{namae = "asai"; tensuu = 70; seiseki = "B"}] 
let lst3 = [{namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}] 
let lst4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"}; 
            {namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}] 
 


(* 目的：gakusei_tのリストを受け取ったら，全員の得点の合計を返す *)
(* gakusei_sum : galusei_t list ->int *)

let gakusei_sum lst = 
List.fold_right (fun gakusei rest_result -> match gakusei with
{namae = n;tensuu=t;seiseki=s}->t+rest_result) lst 0



(* テスト *) 
let test1 = gakusei_sum lst1 = 0 
let test2 = gakusei_sum lst2 = 70 
let test3 = gakusei_sum lst3 = 155 
let test4 = gakusei_sum lst4 = 235 