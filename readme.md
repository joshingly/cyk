The CYK Algorithm
==

[CYK Algorithm](http://en.wikipedia.org/wiki/Cyk_algorithm "Wikipedia")

Usage
--

Grammar File: sample-input1.txt (Must be in Chomsky normal form)

    S -> A B
    A -> A B | a | b
    B -> B C | b
    C -> c

Example: See program.rb

Tested on...
--

Ruby 1.9.2
