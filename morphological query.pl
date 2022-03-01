% 171805064 UMUT CAN AKDAĞ
:-op(1000, xfy, ==>).
%% LEXICON
adj ==> [mister].
n ==> [yilmaz].
d ==> [the].
n ==> [software].
n ==> [engineering].
v ==> [explains].
%% PHRASE STRUCTURE RULES
s ==> adjP , vp.
vp ==> vp ,dp.
dp ==> dp , np.
dp ==> dp , np.
adjP ==> adjP,np.
adjP ==> adj.
np ==> n.
vp ==> v.
dp ==> d.



%% SHIFT-REDUCE PARSER
% Base
sr_parse([s], []) :- writeln("Your sentence syntaxly correct!").
% Shift
sr_parse(Stack, [Word|Words]):-
 (Cat ==> [Word]),
 sr_parse([Cat|Stack], Words).

% Reduce
sr_parse([Y,X|Rest], String):-
 (Z ==> X, Y),
 sr_parse([Z|Rest], String).

sr_parse([X|Rest], String):-
 (Y ==> X),
 sr_parse([Y|Rest], String).
