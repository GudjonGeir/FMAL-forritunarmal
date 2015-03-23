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
fun reduction f lis = 	if null(tl(lis)) then  hd(lis)
								else reduction f (f(hd(lis),hd(tl(lis)))::tl(tl(lis)));

(*
fun reduction f = fn lis => if null(tl(lis)) then lis
							else
							let
								val a = hd(lis)
								val b = hd(tl(lis))
								val result = f a b
								val tail = tl(tl(lis))
							in
								reduction f result::tail 
							end;
							*)

(* 3C *)

(* 3D *)

(* 4A *)

(* 4B *)

(* 4C *)

(* 4D *)

(* 4E *)