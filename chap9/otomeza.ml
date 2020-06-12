#use "../chap8/person_t.ml"
#use  "../chap5/seiza.ml"


(* 目的：person_tのリストからおとめ座の人の名前のみから成るリストを返す *)
(* otomeza : person_t list -> string list *)
let rec otomeza lst = match lst with 
[]->[]
|{  name=n;
  height=h;
  weight=w;
  tsuki=t;
  hi=hi;
  ketsueki=k;
} :: rest -> if seiza t hi = "乙女座" then n :: otomeza rest
else otomeza rest
(* test *)
let test1 = otomeza [] =[]
let test2 = otomeza [person1] =[]
let test3 = otomeza [person2;person3] =["笠井"]
let test4 = otomeza [person1;person2;person3] =["笠井"]
