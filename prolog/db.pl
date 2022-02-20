fuel_eff(KM, L, KPL) :- KPL is KM/L.

greet :- write('Your name? '), read(Name), write('Hello, '), write(Name).

energy(Power, Hour, WattHour, Joules) :- WattHour is Power * Hour, Joules is 3600 * WattHour.

magnitude(X, Y, Z, MAG) :- MAG is sqrt(X*X + Y*Y + Z*Z).

covidscreen(Temp) :- Temp < 37.5, write('Yes'); write('No'). 

zvec(X, Y, Z) :- X is 0, Y is 0, Z is 0.
uvec(X, Y, Z, UX, UY, UZ) :- (magnitude(X, Y, Z, M), M > 0, UX is X/M, UY is Y/M, UZ is Z/M); zvec(UX, UY, UZ).

balance(Cap, Int, Year) :- Year > 0, B is Cap * (1 + Int), NY is Year - 1, write('\nYear: '), write(NY), write('\nBalance: '), write(B), balance(B, Int, NY).
