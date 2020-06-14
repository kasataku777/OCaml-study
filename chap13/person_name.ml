#use "../chap8/person_t.ml"

let lst = [person1;person2;person3]

(* 目的：person_t型のデータから名前を返す *)
(* take_name : person_t -> string*)
let take_name person = match person with
{ name=n;height=h;weight=w;tsuki= t;hi=hi;ketsueki=k}-> n


(* 目的:lstに含まれる人の名前のリストを返す *)
(* person_name : person_t list -> string list *)
let person_name lst = List.map take_name lst

let test1 = person_name []=[]
let test2 = person_name lst = ["浅井";"笠井";"鈴木"]