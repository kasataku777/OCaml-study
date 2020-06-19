#use "tree_t.ml"

(* 目的:dataが2分探索木に含まれているか調べる *)
(* search : tree_t -> int ->bool *)
let rec search tree data = match tree with
Empty -> false
|Leaf(n)->data=n
|Node(t1,n,t2)->
if data=n then true
else if data< n then search t1 data
else search t2 data


(* 2分探索木 *)
let tree1 = Empty
let tree2 = Leaf(3)
let tree3 = Node(Leaf(1),2,Leaf(3))
let tree4 = Node(Empty,7,Leaf(9))
let tree5 = Node(tree3,6,tree4)


(* test *)
let test1=search tree1 3 = false
let test2=search tree2 3 = true
let test3=search tree2 4 = false
let test4=search tree3 6 = false
let test5=search tree3 1 = true