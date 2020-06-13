#use "../chap8/person_t.ml"

(* 目的：人のリストlstのうち各血液型の人数を集計する *)
(* ketsueki_shukei : person_t list -> int * int * int * int *)
let rec ketsueki_shukei lst = match lst with
[]->(0,0,0,0)
|{name=n;height=h;weight=w;tsuki=t;hi=hi;ketsueki=k} ::rest ->
let shukei_rest = ketsueki_shukei rest in
match shukei_rest with
(a,b,c,d) -> if k="A" then (a+1,b,c,d)
else if k="B" then (a,b+1,c,d)
else if k="O" then (a,b,c+1,d)
else   (a,b,c,d+1)



(* test *)
let test1 = ketsueki_shukei []=(0,0,0,0)
let test2 = ketsueki_shukei [person1]=(1,0,0,0)
let test3 = ketsueki_shukei [person1;person2]=(1,0,1,0)
let test4 = ketsueki_shukei [person1;person2;person3]=(1,1,1,0)
