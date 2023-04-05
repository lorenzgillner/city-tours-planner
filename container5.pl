/*
 * Ausgang:                                   Ziel:                   +---+
 *                                                                    | b |
 *        +---+         +---+                 +---+                   +---+
 *        | d |         | b |                 | d |                   | c |
 * +---+  +---+  +---+  +---+                 +---+       +---+       +---+
 * | f |  | c |  | e |  | a |          ===>   | f |       | e |       | a |
 * ---------------------------  -----         ----------------------  -----
 *  l1     l2     l3     lkw     zug           l1    l2    l3   lkw    zug
 */   

 
?-consult(vorwaertsverkettung).

% -- notwendige Hilfsangaben: ---------------------------------
begriffe([platz]).

zeige_zustand(Zeit, Zust) :- write(Zeit), write(' : '),
                             write(Zust),nl.
teste(_,_).

% -- Regeln ---------------------------------------------------

von_l1_nach_zug:
	[platz(l1,[A|RestA])]
=>
	[ersetze(platz(l1,[A|RestA]), platz(l1, RestA)),
	ersetze(platz(zug,B),platz(zug,[A|B]))].

% von_l1_nach_lkw:
% 	[platz(l1,[A|RestA])]
% =>
% 	[ersetze(platz(l1,[A|RestA]), platz(l1, RestA)),
% 	ersetze(platz(lkw,B),platz(lkw,[A|B]))].

von_l1_nach_l3:
	[platz(l1,[A|RestA])]
=>
	[ersetze(platz(l1,[A|RestA]), platz(l1, RestA)),
	ersetze(platz(l3,B),platz(l3,[A|B]))].
 
von_l1_nach_l2:
	[platz(l1,[A|RestA])]
=>
	[ersetze(platz(l1,[A|RestA]), platz(l1, RestA)),
	ersetze(platz(l2,B),platz(l2,[A|B]))].

von_l2_nach_zug:
	[platz(l2,[A|RestA])]
=>
	[ersetze(platz(l2,[A|RestA]), platz(l2, RestA)),
	ersetze(platz(zug,B),platz(zug,[A|B]))].

% von_l2_nach_lkw:
% 	[platz(l2,[A|RestA])]
% =>
% 	[ersetze(platz(l2,[A|RestA]), platz(l2, RestA)),
% 	ersetze(platz(lkw,B),platz(lkw,[A|B]))].

von_l2_nach_l3:
	[platz(l2,[A|RestA])]
=>
	[ersetze(platz(l2,[A|RestA]), platz(l2, RestA)),
	ersetze(platz(l3,B),platz(l3,[A|B]))].

von_l2_nach_l1:
	[platz(l2,[A|RestA])]
=>
	[ersetze(platz(l2,[A|RestA]), platz(l2, RestA)),
	ersetze(platz(l1,B),platz(l1,[A|B]))].

von_l3_nach_zug:
	[platz(l3,[A|RestA])]
=>
	[ersetze(platz(l3,[A|RestA]), platz(l3, RestA)),
	ersetze(platz(zug,B),platz(zug,[A|B]))].

% von_l3_nach_lkw:
% 	[platz(l3,[A|RestA])]
% =>
% 	[ersetze(platz(l3,[A|RestA]), platz(l3, RestA)),
% 	ersetze(platz(lkw,B),platz(lkw,[A|B]))].

von_l3_nach_l2:
	[platz(l3,[A|RestA])]
=>
	[ersetze(platz(l3,[A|RestA]), platz(l3, RestA)),
	ersetze(platz(l2,B),platz(l2,[A|B]))].

von_l3_nach_l1:
	[platz(l3,[A|RestA])]
=>
	[ersetze(platz(l3,[A|RestA]), platz(l3, RestA)),
	ersetze(platz(l1,B),platz(l1,[A|B]))].

von_lkw_nach_zug:
	[platz(lkw,[A|RestA])]
=>
	[ersetze(platz(lkw,[A|RestA]), platz(lkw, RestA)),
	ersetze(platz(zug,B),platz(zug,[A|B]))].

von_lkw_nach_l3:
	[platz(lkw,[A|RestA])]
=>
	[ersetze(platz(lkw,[A|RestA]), platz(lkw, RestA)),
	ersetze(platz(l3,B),platz(l3,[A|B]))].

von_lkw_nach_l2:
	[platz(lkw,[A|RestA])]
=>
	[ersetze(platz(lkw,[A|RestA]), platz(lkw, RestA)),
	ersetze(platz(l2,B),platz(l2,[A|B]))].

von_lkw_nach_l1:
	[platz(lkw,[A|RestA])]
=>
	[ersetze(platz(lkw,[A|RestA]), platz(lkw, RestA)),
	ersetze(platz(l1,B),platz(l1,[A|B]))].

% von_zug_nach_lkw:
% 	[platz(zug,[A|RestA])]
% =>
% 	[ersetze(platz(zug,[A|RestA]), platz(zug, RestA)),
% 	ersetze(platz(lkw,B),platz(lkw,[A|B]))].

% von_zug_nach_l3:
% 	[platz(zug,[A|RestA])]
% =>
% 	[ersetze(platz(zug,[A|RestA]), platz(zug, RestA)),
% 	ersetze(platz(l3,B),platz(l3,[A|B]))].

% von_zug_nach_l2:
% 	[platz(zug,[A|RestA])]
% =>
% 	[ersetze(platz(zug,[A|RestA]), platz(zug, RestA)),
% 	ersetze(platz(l2,B),platz(l2,[A|B]))].

% von_zug_nach_l1:
% 	[platz(zug,[A|RestA])]
% =>
% 	[ersetze(platz(zug,[A|RestA]), platz(zug, RestA)),
% 	ersetze(platz(l1,B),platz(l1,[A|B]))].

% -- Loesung --------------------------------------------------

startzustand([ 
  platz(l1,[f]) , 
  platz(l2,[d,c]), 
  platz(l3,[e]), 
  platz(lkw,[b,a]), 
  platz(zug,[]) ]).

ziel([ 
  platz(l1,[d,f]), 
  platz(l2,[]), 
  platz(l3,[e]), 
  platz(lkw,[]), 
  platz(zug,[b,c,a]) ]).
            
loesung:-       
   retractall(platz(_,_)),
   ziel(Ziel), startzustand(Z0),
   loese(Ziel,Z0,6).

/*
 * Ausgabe:
 * von_l2_nach_zug
 * von_lkw_nach_l3
 * von_zug_nach_l1
 * von_lkw_nach_zug
 * von_l2_nach_zug
 * von_l3_nach_zug
 *
 * ... stimmt so auch, wenn man Zug und LKW
 * beliebig oft be- und entladen darf.
 *
 * ... darf der LKW nur entladen und der Zug nur beladen
 * werden, bleiben wir trotzdem bei 6 Schritten
 * (eigentlich 5, wenn man Regeln zu l2 neu sortiert):
 * von_l2_nach_l3
 * von_l3_nach_l1
 * von_lkw_nach_l3
 * von_lkw_nach_zug
 * von_l2_nach_zug
 * von_l3_nach_zug
 *
 * In dem Fall muss man natürlich weniger Regeln verfassen :^)
 */

   
%-- end of prolog ---------------------------------------------
