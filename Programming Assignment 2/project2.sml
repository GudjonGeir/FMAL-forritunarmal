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
fun greaterThan lis = fn x => if null(lis) then []
								else
								let
									val head = hd(lis)
									val tail = tl(lis)
								in
									if head > x then head::greaterThan tail x
									else greaterThan tail x
								end;

(* 3C *)
fun reduction f lis = 	if null(tl(lis)) then  hd(lis)
						else reduction f (f(hd(lis),hd(tl(lis)))::tl(tl(lis)));

(* 3D *)
fun partition f = fn lis => 	if null(lis) then ([],[])
								else if null(tl(lis)) then 
									if f(hd(lis)) then (lis,[])
									else ([],lis)
								else
								let
									val head = hd(lis)
									val tail = tl(lis)
									val (M,N) = partition f tail
								in
									if f(head) then (head::M,N)
									else (M,head::N)
								end;


(* 4A *)
fun insert(x, lis):real list = 	if null(lis) then [x]
								else if x < hd(lis) then x::lis
								else if null(tl(lis)) then hd(lis)::[x]
								else hd(lis)::insert(x, tl(lis));

(* 4B *)
fun insertHelper(lis, sorted) = if null(lis) then sorted
								else insertHelper(tl(lis),insert(hd(lis), sorted));


fun insertsort lis = 	if null(lis) then []
						else insertHelper(lis, []);
						

(* 4C *)
fun removeLast(lis) = 	if null(tl(lis)) then []
						else hd(lis)::removeLast(tl(lis));

fun middle (lis) = 	if null(tl(lis)) then hd(lis)
					else if null(tl(tl(lis))) then hd(tl(lis))
					else middle (removeLast(tl(lis)));

(* 4D *)
fun cartHelper(x, lis) = 	if null(lis) then nil
							else (x, hd(lis))::cartHelper(x, tl(lis));

fun cartesian lis1 = fn lis2 => if null(lis1) then nil
								else 
								let
									val head = hd(lis1)
									val tail = tl(lis1)
								in
									cartHelper(head, lis2)@cartesian tail lis2
								end;

(* 4E *)
fun mymap f = fn lis => if null(lis) then []
						else 
						let
							val head = hd(lis)
							val tail = tl(lis)
						in
							f(hd(lis))::mymap f tail
						end;

(* Test cases *)

zip [1,2,3] ["a","b","c"];
zip [1,2] ["a"];
greaterThan [1,5,3,2,4] 3;
reduction op+ [1,3,5,7,9];
reduction op* [1,3,5,7,9];
partition Char.isLower [#"P",#"a",#"3",#"%",#"b"];
insert (3.3, [1.1, 2.2, 4.4, 5.5]);
insertsort [2.2, 4.4, 5.5, 3.3, 1.1];
middle [1,2,3,4,5];
middle [true, false];
cartesian ["a","b","c"] [1,2];
(mymap (fn x => x*x)) [1,2,3,4]

