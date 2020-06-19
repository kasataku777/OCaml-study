(* 目的：駅名と駅名と距離の組のリストを受け取ったらその駅までの距離を返す *)
(* assoc: string -> string*float ->float *)
let rec assoc ekimei lst =match lst with
[]->infinity
|(ekimei0,kyori0)::rest->
if ekimei0=ekimei then kyori0 else assoc ekimei rest


(* test *)

let test1=assoc "後楽園" [("新大塚",1.2);("後楽園",1.8)]=1.8
let test2=assoc "池袋" [("新大塚",1.2);("後楽園",1.8)]=infinity
let test3=assoc "後楽園" []=infinity

