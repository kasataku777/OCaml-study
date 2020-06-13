#use "../chap8/person_t.ml"
#use "ketsueki_shukei.ml"

(* 目的：人のリストlst から最も多い血液型を返す *)
(* saita_ketsueki: person_t list -> string *)
let rec saita_ketsueki lst = let (a,b,c,d)=ketsueki_shukei lst in
let saidai = max (max a b) (max c d) in
if saidai = a then "A"
else if saidai = b then "B"
else if saidai = c then "O"
else "AB"

(* test *)
let test2 = saita_ketsueki [person1]="A"
let test3 = saita_ketsueki [person2]="O"
let test4 = saita_ketsueki [person1;person2;person3]="A"
