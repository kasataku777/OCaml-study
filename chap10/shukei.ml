(* 学生一人のデータを表す型 *)
type gakusei_t ={
  namae:string;
  tensuu:int;
  seiseki:string;
}

(* 目的：学生リストlstのうち各関数の人数を集計する *)
(* shukei : gakusei_t list -> int * int * int * int  *)
let rec shukei lst = match lst with 
[]->(0,0,0,0)
|{namae = n;tensuu = t;seiseki = s}::rest ->
let shukei_rest = shukei rest in match shukei_rest with (a,b,c,d) -> if s = "A" then (a+1,b,c,d)
else if s ="B" then (a,b+1,c,d)
else if s="C" then (a,b,c+1,d)
else   (a,b,c,d+1)


(* test *)
let test1 = shukei [{namae="asai";tensuu=80;seiseki="A"}]=(1,0,0,0)
let test2 = shukei [{namae="asai";tensuu=80;seiseki="A"};
{namae="kudoh";tensuu=70;seiseki="B"}]=(1,1,0,0)
let test3 = shukei [{namae="asai";tensuu=80;seiseki="A"};{namae="asaie";tensuu=90;seiseki="A"};
{namae="kasai";tensuu=60;seiseki="C"};]=(2,0,1,0)
let test4 = shukei []=(0,0,0,0)

