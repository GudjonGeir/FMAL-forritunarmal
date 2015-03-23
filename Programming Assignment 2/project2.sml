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

(* 4B *)

(* 4C *)

(* 4D *)

(* 4E *)