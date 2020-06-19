#use "tree_t.ml"


let multi3 x = x*3
(* 目的: int -> int型のfとtree_tの木を受け取ったら節や葉に入っている値全てにfを適用した木を返す*)
(* tree_map : (int -> int) -> tree_t -> tree_t*)
let rec tree_map f tree = match tree with
Empty ->Empty
|Leaf(n)->Leaf(f n)
|Node(t1,n,t2)->Node(tree_map f t1 , f n , tree_map f t2)





(* test *)
let test1 = tree_map multi3 tree1 = Empty
let test2 = tree_map multi3 tree2 = Leaf(9)
let test3 = tree_map multi3 tree3= Node (Empty,12,Leaf(9))
