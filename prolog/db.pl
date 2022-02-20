fuel_eff(KM, L, KPL) :- KPL is KM/L.

greet :- write('Your name? '), read(Name), write('Hello, '), write(Name).

energy(Power, Hour, WattHour, Joules) :- WattHour is Power * Hour, Joules is 3600 * WattHour.

magnitude(X, Y, Z, MAG) :- MAG is sqrt(X*X + Y*Y + Z*Z).

covidscreen(Temp) :- Temp < 37.5, write('Yes'); write('No'). 

zvec(X, Y, Z) :- X is 0, Y is 0, Z is 0.
uvec(X, Y, Z, UX, UY, UZ) :- (magnitude(X, Y, Z, M), M > 0, UX is X/M, UY is Y/M, UZ is Z/M); zvec(UX, UY, UZ).

balance(Cap, Int, Year) :- Year > 0, B is Cap * (1 + Int), NY is Year - 1, write('\nYear: '), write(NY), write('\nBalance: '), write(B), balance(B, Int, NY).

sum(S, Xs) :- [X|Tail] = Xs, Acc is S + X, write('\nXs: '), write(Xs), write('\nAcc: '), write(Acc), sum(Acc, Tail); write('\nSum = '), write(S).

fib(0, 1) :- !.
fib(1, 1) :- !.
fib(N, F) :-
 N > 1,
 N1 is N-1,
 N2 is N-2,
 fib(N1, F1),
 fib(N2, F2),
 F is F1+F2.

/* sum(Xs, A, S) :- [X|Tail] = Xs, S is 10 + X. , sum(Tail, B, S). */

/* sum(Xs, S) :- [X|Tail] is Xs, sum(Tail, A), S is X + A, write('Sum='), write(A). */