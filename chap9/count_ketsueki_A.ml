type person_t ={
  name:string;
  height:float;
  weight:float;
  tsuki:int;
  hi:int;
  ketsueki:string;
}

(* 目的:person_tのリストを受け取ったら，血液型A型の人の数を返す *)
(* count_ketsueki_A : person_t list -> int *)
let rec count_ketsueki_A lst = match lst with 
[]-> 0
| {name=n;height=h;weight=w;tsuki=t;ketsueki=k} :: rest 
-> if k="A" then count_ketsueki_A rest + 1 
else count_ketsueki_A rest 



let person1 = {
  name="浅井";
  height=1.72;
  weight=65.0;
  tsuki= 8;
  hi=22;
  ketsueki="A";
}
let person2 = {
  name="笠井";
  height=1.78;
  weight=67.0;
  tsuki= 8;
  hi=31;
  ketsueki="O";
}
let person3 = {
  name="鈴木";
  height=1.72;
  weight=60.0;
  tsuki= 5;
  hi=2;
  ketsueki="B";
}

(* test *)
let test1 = count_ketsueki_A [] = 0
let test2 = count_ketsueki_A [person1] = 1
let test3 = count_ketsueki_A [person2;person3] = 0
let test4 = count_ketsueki_A [person1;person2;person3] = 1
