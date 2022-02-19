# Prolog

## Installation (on Mac)

1. ```brew install gnu-prolog```
If there is no ```brew``` installed, install [Homebrew](https://brew.sh).

2. Start Prolog: ```gprolog```
3. Exit Prolog: ```halt.```
4. Write a KB file (put the file in the same location, e.g., ```./2022/AI/Prolog/db.pl``` and the ```./2022/AI/Prolog``` is where ```gprolog``` is called
5. Prolog is a logic programming, not imperative!
  * predicates (knowledge base and information) are defined in the file or if want to enter from the console use ```consult(user).``` and end it with the end-of-file (e.g., Control-D).
6. [Prolog syntax](https://www.cis.upenn.edu/~matuszek/Concise%20Guides/Concise%20Prolog.html):
  * every statement ends with period ```.```
    * E.g., ```wizard(harrypotter).``` (for information) and ```wizard(X).``` (for query who is the wizard). 
  * load database: ```[db].``` or ```consult('./db.pl').``` (to load ```db.pl```)
    * reload database everytime the database got changed. (by ```[<db name>].```) 
  * constants: starting with small cap, e.g., ```linghuchong```, ```yuebuqun```
  * variables: starting with cap, e.g., ```X```, ```Wuxia```
  * a single underscore ```_``` means anonymous variable we don't care about its value.
  * predicate: name following by the parentheses and its (optional) argument(s) inside the parentheses.
  * ```:-```: "if"
    * E.g., ```mortal(X) :- man(X).``` reads "X is mortal if X is a man." 
    * This ```:-``` operator serves as a pattern matching, i.e.,
      * 1. Query
        * kb: ```mortal(X) :- man(X).```  and ```man(luca)```
        * query: (1) ```mortal(X).``` (answer ```X = luca```) and (2) ```mortal(luca).``` (answer ```true```)
      * 2. Program
        * kb: ```greet :- write('Sawasdee krab').``` (Notice there is no variable on the LHS)
        * query: ```greet.```
      * 3. Combination
        * kb
        ```prolog
        mortal(X) :- man(X).
        man(luca)
        ask_and_reason :-
        write('name'),
        read(Name),
        mortal(Name).
        ```
        * query: ```ask_and_reason.```
      * 4. Write input and output of the program in the pattern
        * kb
        ```prolog
        sqr(X, Y) :-
        Y is X * X.
        ```
        * query: ```sqr(5, Y).```
  * ```is```
  * ```,```: logical and
  * ```|```: logical or
  * ```not```: logical not
  * comments: ```/* ... */```
  * Execution
    * declarative reading
      * E.g., ```mother(X, Y) :- parent(X, Y), female(X).```
      * "X is the mother of Y if X is a parent of Y and X is female."

7. Equivalent program python vs. prolog
  * Standard input/output
    * python: ```print('Hello')```
    * prolog: ```write('Hello').``` 
    * python: ```X = input('Enter: ')```
    * prolog: ```read(X).``` (or ```get(X).``` for one character)
      * finishing the input with ```.``` and press ENTER. 
  * Assignment vs Unification
    * python: assignment
    ```python
    Y = 8
    X = Y
    X = 2
    print(Y)
    ```
    * prolog: unification
    ```prolog
    X = Y, X = 2, write(Y).
    ```
  * Condition
    * python
    ```python
    if x < 0:
       y = -x
    else:
       y = x
    ```
    * prolog
    ```prolog
    abs(X, Y) :- X < 0, Y is -X.
    abs(X, X) :- X >= 0.
    ```
      * Query: ```abs(15, A)``` reads "what (A) is the absolute value of 15?"
  
  * Iteration
    * python
    ```python
    sum = 0
    for x in [1, 2, 3]:
       sum += x
    ```
    * prolog
    ```prolog
    sum(X, Y) :- ...
    
    ```


8. Run prolog in script mode

  * at shell: ```./prolog_test.sh```
  * The content of the shell script
  ```
  #!/usr/local/bin/gprolog --consult-file
  [wumpus].
  pit(X,Y).
  write('pit', X, Y).
  halt.
  ```
  * Seem promising, but not working yet.

## Write a Prolog program
  * See [more examples](https://swish.swi-prolog.org/example/io.pl)

  * Wumpus agent
  ```prolog
  pit(X, Y) :- breeze(Xn, Y), X is Xn - 1, X + Y > 0.
  pit(X, Y) :- breeze(Xn, Y), X is Xn + 1, X + Y > 0.
  pit(X, Y) :- breeze(X, Yn), Y is Yn - 1, X + Y > 0.
  pit(X, Y) :- breeze(X, Yn), Y is Yn + 1, X + Y > 0.
  breeze(1, 0). /* percept info */
  ```
    * This code does not really do the logical or, i.e., B(X, Y) <-> P(X-1, Y) | P(X+1, Y) | P(X, Y-1) | P(X, Y+1).
