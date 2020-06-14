type person_t ={
  name:string;
  height:float;
  weight:float;
  tsuki:int;
  hi:int;
  ketsueki:string;
}

(* 目的:person_tのリストを受け取ったら，血液型ketsuek0iの人の数を返す *)
(* count_ketsueki_A : person_t list ->string-> int *)
let rec count_ketsueki lst ketsueki0 = match lst with 
[]-> 0
| {name=n;height=h;weight=w;tsuki=t;ketsueki=k} :: rest 
-> if k=ketsueki0 then count_ketsueki rest  ketsueki0+ 1 
else count_ketsueki rest ketsueki0 



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
let test1 = count_ketsueki  [] "A"= 0
let test2 = count_ketsueki  [person1] "A" = 1
let test3 = count_ketsueki  [person2;person3] "B" = 1
let test4 = count_ketsueki [person1;person2;person3]  "O" = 1
