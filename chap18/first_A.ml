#use "../chap8/person_t.ml"


let lst1=[person1;person2;person3]
let lst2=[person3;person2;person1]


(* 目的:lstに含まれる最初のA型の人を返す *)
let rec first_A lst = match lst with
[]->None
|first::rest->match first with
{name=n;height=s;weight=t;tsuki=ts;hi=h;ketsueki=k}->
if k="A" then Some (first) else first_A rest

(* test *)
let test1= first_A []=None
let test2= first_A lst1=Some (person1)
let test3= first_A lst2=Some (person1)
