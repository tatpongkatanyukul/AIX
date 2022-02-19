# AIX

## AI Course Winter/Spring 2022 (Dec 2021-Mar 2022, AY-2564/S-2)
  * Book [US ed](http://aima.cs.berkeley.edu/) / [Int ed](http://aima.cs.berkeley.edu/global-index.html)
  * R&N [Code](https://github.com/aimacode)

## Connection to other courses I am in charge
  * **AI (4th year)**: broad coverage, inc. ML. I will focus on basic (curve fitting) and reinforcement learning here
  * **ANN (3rd year)**: ANN, inc. ML. I will focus on supervised learning here.
  * **intro to ML (1st year)**: definitely ML. I will focus on basic (curve fitting), decision tree, radial basis function, svm, and unsupervised learning. I may throw in other things as well (e.g., problem solving, programming on various domains, quantum computing)
    * programming on various domains, e.g., basic computer graphics, play with sound, basic cryptography, other cs and non-cs problems.

Key: identify the essense
* search
  * beam search, simulated annealing, genetic algorithm
* knowledge representation and inference
  * propositional logic 
* handle uncertainty
  * probability
* planning
* machine learning
* natural language processing
* AI for Games
  * [A* search](https://gabrielgambetta.com/generic-search.html)

# Special note

  * "we want machines that strive to achieve human objectives but know that they don't know for certain exactly what those objective are."
    * Ch. 16, 18, 22, and 27. 
# 2021 Dec - 2022 Mar

## Week 1: Overview AI
### SOAR
* What does not SOAR have in term of human mind?
... e.g., self, guilt, jealousy, shame, grief, greed, anger, depress, boredom, restless, anxiety, fear, worry, negativity
... what about positive aspects? ... joy, enthusiasm, imagination, creativity, kindness, confident, humor

### Linguistic
* language processing and cognitive function
E.g., rat/child/man experiment

* Aphasia: Broca area (produce speech) and Wernicke area (process words)

### Hands-on

### Intractability
a problem is called **intractable** if the time required to solve instances of the problem grows exponentially with the size of the instances.

### Probability


### Conditional Probability


### Exercise

Math
Probability
Game theory

## Prolog

### Installation (on Mac)

1. ```brew install gnu-prolog```
If there is no ```brew``` installed, install [Homebrew](https://brew.sh).

2. Start Prolog: ```gprolog```
3. Exit Prolog: ```halt.```
4. Write a KB file (put the file in the same location, e.g., ```./2022/AI/Prolog/db.pl``` and the ```./2022/AI/Prolog``` is where ```gprolog``` is called
5. Prolog is a logic programming, not imperative!
6. [Prolog syntax](https://www.cis.upenn.edu/~matuszek/Concise%20Guides/Concise%20Prolog.html):
  * every statement ends with period ```.```
    * E.g., ```wizard(harrypotter).``` (for information) and ```wizard(X).``` (for query who is the wizard). 
  * load database: ```[db].``` (to load ```db.pl```)
    * reload database everytime the database got changed. (by ```[<db name>].```) 
  * constants: starting with small cap, e.g., ```linghuchong```, ```yuebuqun```
  * variables: starting with cap, e.g., ```X```, ```Wuxia```
  * underscore ```_``` means anything (if exists) and we don't care the value of it.
  * predicate: name following by the parentheses and its (optional) argument(s) inside the parentheses.
  * ```:-```: "if"
    * E.g., ```mortal(X) :- man(X).``` reads "X is mortal if X is a man." 
  * ```is```
  * ```,```: logical and
  * ```|```: logical or
  * ```not```: logical not
  * comments: 
7. Equivalent program python vs. prolog
  * Standard input/output
  * Assignment
  * Condition
  * Iteration
8. Run prolog in script mode


