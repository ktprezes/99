%Number 1
m_last([X], X) :- !.
m_last([_|T], X) :- m_last(T, X).

%Number 2
m_lastbutone([X,_], X) :- !.
m_lastbutone([_|T], X) :- m_lastbutone(T,X).

%Number 3
m_element_at(H,[H|_],1).
m_element_at(X,[_|T],I) :- 
    J is I-1,
    element_at(X,T,J).

%Number 4
m_length([], 0).
m_length([_|T], X) :- 
    m_length(T, Y),
    X is Y+1.

%Number 5
m_reverse([], []).
m_reverse([H|T],X) :- m_reverse([H|T],[],X).
m_reverse([], Acc, Acc).
m_reverse([H|T], Acc, Res) :- m_reverse(T, [H|Acc], Res).

%Number 6
m_palindrome(L) :- m_reverse(L,L).

%Number 7
m_flatten([], []).
m_flatten([H|T], X) :- is_list(H), m_flatten(H,Y), m_flatten(T,Z), append(Y,Z,X), !.
m_flatten([H|T], [H|Y]) :- m_flatten(T,Y).

%Number 8
m_compress([], []).
m_compress([X,X|T], Res) :- m_compress([X|T], Res), !.
m_compress([H|T], [H|Y]) :- m_compress(T, Y).

%Number 9
m_pack([], []).
m_pack([H|T], [X|Z]) :- m_acc([H|T], [], X, Y), m_pack(Y,Z).
m_acc([], Acc, Acc, []).
m_acc([H|T], [], Res, Left) :- m_acc(T, [H], Res, Left), !.
m_acc([H|T], [H|Acc], Res, Left) :- m_acc(T, [H,H|Acc], Res, Left),!.
m_acc([H|T], [A|Acc], [A|Acc], [H|T]) :- H \= A.

%Number 10
m_encode(L,X) :- m_pack(L,Y), m_encode_packed(Y,X).
m_encode_packed([], []).
m_encode_packed([[E|Es]|T], [[N,E]|Y]) :- length([E|Es],N), m_encode_packed(T,Y).

%Number 11
m_encode_modified(L,X) :- m_pack(L,Y), m_encode_packed_modified(Y,X).
m_encode_packed_modified([] , []).
m_encode_packed_modified([[E]|T], [E|Y]) :- m_encode_packed_modified(T,Y),!.
m_encode_packed_modified([[E|Es]|T], [[N,E]|Y]) :- length([E|Es],N), m_encode_packed_modified(T,Y).

