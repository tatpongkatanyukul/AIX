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
  * Iteration
8. Run prolog in script mode


## Write a Prolog program

1. Condition
```prolog
abs(X, Y) :- X < 0, Y is -X.
abs(X, X) :- X >= 0.
```

  * Query: ```abs(15, A)``` reads "what (A) is the absolute value of 15?"
