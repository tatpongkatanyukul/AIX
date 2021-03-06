# Prolog
  * [SWI Prolog]
  * [PySWIP](https://github.com/yuce/pyswip) Prolog Interface for Python
  * [Prolog in Python](https://www.openbookproject.net/py4fun/prolog/prolog1.html) (Risky? performance-wise and completeness-wise)

# Reference
  * [Reference](https://www.swi-prolog.org/pldoc/doc_for?object=manual)
    * Notation name/number indicates predicate names and their number of arguments. E.g., module/2 refers to predicate module and it takes 2 arguments; rev/3 refers to rev with 3 arguments.
    * [Built-in predicates](https://www.swi-prolog.org/pldoc/man?section=builtin)

# Learning Prolog
  * [Learn Prolog Yourself](https://cs.union.edu/~striegnk/courses/esslli04prolog/)
    * Day 1 (checked Feb 21st, 2022)
    * [Day 2](https://cs.union.edu/~striegnk/courses/esslli04prolog/practical.day2.php)
      * start docker daemon and run ```docker load < python39npswipl.tar``` 
      * start container: ```docker run -v /Users/student01/Desktop/2022/sandbox:/home/sandbox -it python39npswipl_image bash```
      * start prolog ```swipl```
    * Day 3
    * Day 4
    * Day 5 

## Installation (on Mac)

1. GNU Prolog ```brew install gnu-prolog```. If there is no ```brew``` installed, install [Homebrew](https://brew.sh). [SWI Prolog](https://www.swi-prolog.org/build/PPA.html): ```apt-get install software-properties-common```, ```apt-add-repository ppa:swi-prolog/stable```, ```apt-get update```, ```apt-get install swi-prolog```.
2. Start GNU Prolog: ```gprolog```; [SWI Prolog](https://www.swi-prolog.org/pldoc/man?section=cmdline): ```swipl```
3. Exit Prolog: ```halt.```
4. Write a KB file (put the file in the same location, e.g., ```./2022/AI/Prolog/db.pl``` and the ```./2022/AI/Prolog``` is where ```gprolog``` is called
5. Prolog is a logic programming, not imperative!
  * predicates (knowledge base and information) are defined in the file or if want to enter from the console use ```consult(user).``` and end it with the end-of-file (e.g., Control-D).
  * Caution! Order matters.
    * E.g., ```X is Y + 1, Y = 3.``` vs. ```Y = 3, X is Y + 1.```
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
  * See [examples of prolog programs](https://github.com/tatpongkatanyukul/AIX/raw/main/prolog/db.pl)
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
  * [SWI Prolog](https://www.swi-prolog.org/pldoc/man?section=plscript)
  * GNU Prolog
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


## Autolab

1. Login autolab and start docker container
```
 docker run -v /home/tatpong/sandbox:/home/sandbox -it python39npswipl_image bash
``` 

2. Write and test python code to evoke a command line, e.g., ```./pl5```.
  * An easier approach is to rewrite prolog script to reflect what we want to check.
  * A harder approach is to use a sorta general code, like [```pl5```](https://github.com/tatpongkatanyukul/AIX/blob/main/prolog/pl5), and have python code to supply the proper commands to the prolog program.
  * My verdict, from a experience, is to take an easier approach write a customized pair of python and prolog 
    * or even **just a prolog script having all test cases in the script** and python is just to test the output against the reference output. (I don't even have to change python code, do it just like what I have done for C++).
