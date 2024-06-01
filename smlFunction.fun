(*Author: Khang Tran*)

(*Triangle*)
(*function should return true if the three 
integers can make a triangle and false otherwise.*)
fun triangle(a, b, c) = if a + b >= c then true else false;
triangle(1,2,5);

(*TriangleR*)
(*function should return true if the three real
numbers can make a triangle and false otherwise.*)
fun triangleR(a:real, b, c) = if a + b >= c then true else false;
triangleR(1.0,2.0,4.0);

(*addPairs*)
(*Add the corresponding pair elements.
Example: addPairs ((1,2),(3,4)) → (4,6)*)
fun addPairs([], y) = y
  |addPairs(x, []) = x
  |addPairs(x::xs, y::ys) = (x+y) :: addPairs(xs,ys);

(*cycle*)
(*Given an integer n and a list l, cycle n
elements from the list to the end of the list.
Example: cycle(4,[1,2,3,4,5,6,7]) →
[5,6,7,1,2,3,4]*)
fun cycle(0, x) = x
  | cycle(n, x::xs) = cycle(n-1, xs @ [x])
  | cycle(_, []) = [];

(*last*)
(*function takes a list and returns the last element.*)
fun last(x::[]) = x
  | last(x::xs) = last(xs);

(*Pairs*)
(*Takes two lists and creates a list of pairs
where the corresponding elements are paired up.
Ignore extra elements in either list.*)
fun pairs([], _) = []
  | pairs(_, []) = []
  | pairs(x::xs, y::ys) = (x, y) :: pairs(xs, ys);

(*DivideList*)
(*Given a list l and a real number r, divide
every element in l by r.*)
fun divideList([], _) = []
  |divideList(x::xs, y) = (x / y) :: divideList(xs,y);

(*Mirror*)
(*Mirror the list.
Example: mirror [1,2,3,4] → [1,2,3,4,4,3,2,1*)
(*use helper function to reverse the list then 
add the original and the reversed together*)
fun reverse([]) = []
  |reverse(x::xs) = reverse(xs) @ [x];
fun mirror (x::xs) = (x::xs) @ reverse(x::xs)
  |mirror([]) = [];

(*removeZeros*)
(*Remove all the zeros from the list.*)
fun removeZeros([]) = []
  |removeZeros(x::xs) = if x = 0 then removeZeros(xs) else x :: removeZeros(xs);

(*gtList*)
(*Take a list l and an integer n and return a
list that contains all the elements in l that
are greater than n. Keep the same relative
order of items.*)
fun gtList([], _) = []
  |gtList(x::xs, y) = if  x <= y then gtList(xs,y) else x :: gtList(xs,y);

(*prefix*)
(*Return true if the first list is a prefix of
the second list and false otherwise.*)
fun isPrefix ([], _) = true
  | isPrefix (_, []) = false
  | isPrefix (x::xs, y::ys) = if x = y then isPrefix (xs, ys) else false;

(*get*)
(*This function takes a list and an integer i and
returns the ith element in the list. Start the
indexing at 0*)
fun get(x::xs, 0) = x 
  |get([], _) = 0
  |get(x::xs, i) = get(xs, i - 1);

(*condense*)
(*function takes a boolean list and makes it
smaller by and-ing pairs of booleans. If the
length is odd, the extra boolean should be
included in the list by itself.*)
fun condense ([]) = []
  | condense [x] = [x]
  | condense (x::y::xs) = (x andalso y) :: condense(xs);

(*insert*)
(*Insert an item into a sorted list so that the
new list is still sorted.*)
(*Example: insert (4,[1,2,3,5,6]) → [1,2,3,4,5,6]*)
fun insert(i, []) = [i]
  |insert(i, x::xs) = if i > x then x :: insert(i,xs) else i::x::xs;

(*merge*)
(*Merge two sorted lists into a new sorted list.
Example:
merge([1,3,5,7,9],[2,4,6]) → [1,2,3,4,5,6,7,9]*)
fun merge([], x) = [] @ x
  |merge(x,[]) = [] @ x
  |merge(x::xs, y::ys) = if x < y then x::y::merge(xs,ys) else  y::x::merge(xs,ys);

(*reverse*)
(*Reverse the list.*)
fun reverse([]) = []
  |reverse(x::xs) = reverse(xs) @ [x];

(*zip*)
(*Combine the pair of lists into a single list.
Drop extra elements in either list.
Example:
zip([1,3,5,7],[0,9,7]) → [1,0,3,9,5,7]*)
fun zip(x::xs,y::ys) = x::y::zip(xs,ys)
  |zip([], _) = []
  |zip(_,[]) = [];

(*apply*)
(*Apply a function to a list of elements.
Examples:
apply([(1,2),(3,4),(5,6)],(op +)) → [3,7,11]
apply((explode “hello”),ord) →
[104,101,108,108,111]*)
fun apply([],_) = []
  | apply(x::xs,f) = f(x)::apply(xs,f);

(*collapse*)
(*Take a list, a starting value, and a function
and collapse the list down using the function.
Examples:
collapse([1,2,3,4,5],0,(op +)) → 15
collapse([1.1,2.2,3.3],10.0,(op -)) → ~7.8*)
fun collapse(x::xs, i, f) = f(x,i) + collapse(xs,i,f)
  |collapse([], i, _) = i;

