(* 3A *)
fun	zip x = fn y =>	
					if null(x) then nil
					else if null(y) then nil
					else
					let
						val a = tl(x)
						val b = tl(y)
					in
						if null(a) then [(hd(x),hd(y))]
						else if null(b) then [(hd(x),hd(y))]
						else (hd(x),hd(y))::(zip a b)
					end;


(* 3B *)

(* 3C *)
fun reduction f lis = 	if null(tl(lis)) then  hd(lis)
						else reduction f (f(hd(lis),hd(tl(lis)))::tl(tl(lis)));

(* 3D *)

(* 4A *)
fun insert(x, lis):real list = 	if null(lis) then [x]
								else if x < hd(lis) then x::lis
								else if null(tl(lis)) then hd(lis)::[x]
								else hd(lis)::insert(x, tl(lis));

(* 4B *)

(* 4C *)
fun removeLast(lis) = 	if null(tl(lis)) then []
						else hd(lis)::removeLast(tl(lis));

fun middle (lis) = 	if null(tl(lis)) then hd(lis)
					else if null(tl(tl(lis))) then hd(tl(lis))
					else middle (removeLast(tl(lis)));

(* 4D *)

(* 4E *)

