type nengou_t = Meiji of int
| Taisho of int
| Showa of int
| Heisei of int


(* 目的:年号を受け取ったら対応する西暦年を返す *)
(* to_seireki nengou_t ->int *)
let to_seireki  nengou = match nengou with
Meiji (n)->n+1867
|Taisho (n)->n+1911
|Showa (n)->n+1925
|Heisei (n)->n+1988