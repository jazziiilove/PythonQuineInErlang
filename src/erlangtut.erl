 % 																														% 
 % Programmer: Baran Topal                   																			% 
 % Project name: ErlangTut       																						% 
 % Folder name: src        																								%  
 % File name: erlangtut.erl                     																		%
 %                                           																			%       
 % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %   
 % 	                                                                                         							% 
 %  LICENSE: This source file is subject to have the protection of GNU General Public License.             			% 
 % 	You can distribute the code freely but storing this license information. 											% 
 % 	Contact Baran Topal if you have any questions. barantopal@barantopal.com 										    % 
 % 	                                                                                         							% 
 % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
 % 
% @author baran

-module(erlangtut).

-import(string, [len/1, concat/2, chr/2, substr/3, str/2, to_lower/1]).

%-export([hello_world/0]).
%-export([hello_world/0, add/2, add/3]).

%hello_world() -> io:fwrite("halloo").

%add(A,B)->hello_world(),
%	  A + B.

%add(A,X,C)->
%		  A + X + C.

%-export([main/0]).
%main() -> var_stuff().

%var_stuff() ->
%	Num = 1,
%	Num.


-export([main/0]).
main() ->
	T = [1,2,3,4], 
	atom_stuff(),
	do_math(5,4),
	compare(4,3),
	compare(),
	what_grade(3),
	say_hello(german),
	for_loop_stuff(3,6),
	while_loop_stuff(T),
	string_stuff(),
	tuple_stuff(),
	list_stuff(),
	quine_stuff().	

atom_stuff() ->
	an_atom.

do_math(A,B) ->	
	A + B,
	A - B,
	A / B,
	A rem B,
	math:pow(10,2),
	random:uniform(10).

compare(A,B) ->
	A =:= B.

compare() ->
	Foo = 18,
	(Foo >= 15) or (Foo < 21),
	io:fwrite((Foo >= 15) or (Foo <21)).

what_grade(X) ->
	if(X < 5) -> preschool()
	; X == 5 -> kindergarden()
	; X > 5 -> gradeschool()
	end.

preschool() ->
	'Go to preschool!'.
kindergarden() ->
	'Go to kindergarden!'.
gradeschool() ->
	'Go to gradeschool!'.

say_hello(X) ->	
	case X of
		french-> 'Bonjour';
		german -> 'Hallo';
		english -> 'Hi'
	end.

	

while_loop_stuff(X) -> while_loop_stuff(X, 0).

while_loop_stuff([],Temp) -> Temp;

while_loop_stuff([_|T], Temp) ->
	io:fwrite("~w~n", [Temp]),
	while_loop_stuff(T, Temp+1).

string_stuff()->
	Str1 = "A random string",
	Str2 = "Another string",
	
	Str3 = "baran fasd",
	Str4 = "kent sdf",
	
	io:fwrite("These are the strings: ~p ~p\n", [Str1, Str2]),

	Str5 = io_lib:format("Yet another: ~s ~s ", [Str3, Str4]),
	io:fwrite(Str5),
	len(Str4),
	
	Str6 = concat("\nmoveon",Str1),	
	io:fwrite(concat(Str6, Str2)),

	CharInd = chr(Str1, $n),
	io:fwrite("done ~w~n",[CharInd]),

	Str7 = substr(Str1, 2,5),
	Str7,

	Index = str(Str6, Str1),
	Index,
	
	to_lower(Str1).
	
tuple_stuff() ->
	Tuple = {42, 3, 4.23},
	{X,Y,Z} = Tuple, 
	X,

	{D,_,R} = Tuple,
	R,
	
	AnotherTuple = {foo, 1.3},
	{foo, Baz} = AnotherTuple,
	Baz.

list_stuff() ->
	List1 = [1,2,3],
	List2 = [4,5,6],
	List1,

	List3 = List1 ++ List2,
	List3,
	
	List4 = List3 -- List2,
	List4,
	
	X = hd(List4),
	X,

	Y = tl(List2),
	Y,

	List5 = [2|List2],
	List5,
	%sinan becomes ASCII
	Str1 = ["baran"|"sinan"],
	Str1,

	[Head|Tail] = List5,
	List5.


for_loop_stuff(0,_) ->
	[];
	for_loop_stuff(N,Term) when N > 0 ->
	% io:fwrite("Selam~n"),
	io:fwrite("~w~n", [N]),
	[Term|for_loop_stuff(N-1, Term)].

for_tuple(0,_,Tuple) ->	
	[];
	for_tuple(N,Term, T) when N > 0 ->
	    E = element(N,Term),
        io:fwrite("hahaha~p~n", [E]),	
		[Term|for_loop_stuff(N-1, Term)].


quine_stuff() ->
	Str1 = 
'
#!/usr/bin/env python3
text = "X-DSPAM-Confidence:    0.8475;"
',
	Str2 = "#!/usr/bin/env python3",
	Str3 = 'text = "X-DSPAM-Confidence:    0.8475;"',
	Str4 = concat(Str2, Str3),
	Str4,
	io:fwrite("\nfinished\n"),
	
	%Tuple = {"#!/usr/bin/env python3", 'text = "X-DSPAM-Confidence:    0.8475;'},
	%{X,Y} = Tuple, 
	%io:fwrite("~s", [X]).


	Tuple = {
			 "#!/usr/bin/env python3", 
			 'text = "X-DSPAM-Confidence:    0.8475;',
			 "pos = text.find(':')",
			 "num = text[pos+1:]",
			 "pos2 = text.find(';')",
			 "nump = num[:pos2]",
			 'res = ""',
			 "for x in nump:",
    			'if((x == " " or x == ";") is False):',
        			"res += x",
			 "print (res)"    		
			},
	%{X,Y} = Tuple, 
	%io:fwrite("~s", [X]),
	io:fwrite("~p\n", [Tuple]),
	io:fwrite("\ndoneagain\n").
	% tup2list(Tuple).
	
% tup2list(Tuple) -> tup2list(Tuple, 1, tuple_size(Tuple)).

% tup2list(Tuple, Pos, Size) when Pos =< Size ->  
  %   [element(Pos,Tuple) | tup2list(Tuple, Pos+1, Size)],	
% tup2list(_Tuple,_Pos,_Size) -> [].
	
	
	
	
	



	

