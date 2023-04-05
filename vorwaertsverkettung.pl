/** 
 *   Ein einfacher Regel-Interpreter mit Vorwärtsverkettung   
 *   Entwickelt nach einer Idee aus: 
 *   Baehringer/Chiopris/Futo: "Wissensbas. Systeme mit Prolog"
 *   
 * wo:        vorwaertsVerkettung.pl   
 * wann:      02/05(01/01)     
 * wer:       Uwe Lämmel, Jürgen Cleve nach  Baehringer/Chiopris/Futo
 * Beispiele: kaefig.pl, bruecke.pl, container.pl 
 * 
 * Bereitgestellt wird ein Praedikat loese/3. 
 * Die Verarbeitung basiert auf Fakten, die in Prolog-Notation.
 * Diese werden als Liste im zweiten Parameter von loese/3 angegeben.
 * Das Ziel wird als erster Paramter von loese/3 notiert.          
 * Der dritte Paramter beschränkt den Suchbaum auf eine bestimmte Tiefe.
 * 
 * Die Regeln sind in einer der beiden folgenden Notationen zu formulieren:
 *    Regelname : Bedingungen => Aktionen.
 * oder
 *    Regelname if Bedingungen then Aktionen.
 *    
 * Die Zustände werden mittels Prädiakte beschrieben. 
 * Die Namen der verwendeteten Prädikate sind in einer Begriffsliste festzulegen:
 *    begriff([links,rechts,zeit]).
 * Diese Prädikate werden zur Formulierung der Bedingungen und Aktionen benutzt:
 * 
 *   von_1_nach_2: 
 *        [platz(1,[A|RestA])]
 *          => [ersetze(platz(1,[A|RestA]), platz(1, RestA)), 
 *              ersetze(platz(2,B)),(platz(2,[A|B])) ].
 *
 *   zurueck(X,Z) 
 *      if
 *        [rechts(lampe),rechts(X),zeit(T),T<60]
 *       then         =>
 *         [zeit(X,M), Z is T+M, Z<60,
 *          ersetze(zeit(T),zeit(Z)),
 *          ersetze(rechts(X),links(X)),
 *          ersetze(rechts(lampe),links(lampe))].    
 *          
 * Für die Formulierung der Regeln stehen folgende Prädikate zur Verfügung:
 *   loesche(X)     -- löscht den Fakt X aus der Faktenbasis.
 *   setze(X)       -- fügt den Fakt X der Faktenbasis hinzu.
 *   ersetze(X,Y)   -- Kurzform für loesche(X),setze(Y).
 *   
 * Desweiteren können Bedingungen für gültige Zustände formuliert werden:
 *    teste(ZstListe,Zst) - Test, ob Zustand möglich/sinnvoll ist   
 * Dies kann unter Nutzung beliebigen PROLOG-Textes geschehen.
 * Mittels zeige_zustand/2 kann die Bearbeitung verfolgt werden. 
 * Eine Minimalversion ist diese PROLOG-Regel:
 *   zeige_zustand(Nr,Zustand) :- write(Nr-Zustand).
 *   
 * Das Beispiel "container0.pl" gibt weitere Hinweise zum Einsatz dieser 
 * Vorwärtsverkettung. 
 *                         
 */


/**
 * ---- Operatordefinition fuer Regel-Schreibweise : 
 *  R : LHS => RHS 
 *  oder
 *  R wenn LHS dann RHS.
 */
?-op(950,xfx,=>).
?-op(950,xfx,dann).
?-op(950,fx,=>).
?-op(900,xfx,:).
?-op(900,xfx,wenn).

?- write(' ------------------------------------------------'),nl,
   tab(5), write('Eine einfache Vorwaertsverkettung :'),nl,
   tab(8), write('?- loese(Ziel,           /* Zielfakten     */'),nl,
   tab(17),write('Startzustand,   /* Ausgangsfakten */'),nl,
   tab(17),write('Tiefe).         /* des Suchbaumes */'),nl,
   write(' ------------------------------------------------'),nl.
 
loese(Ziel,Zustand,Limit) :- 
	ausfuehren_regel_system(Zustand,Ziel,[],Proof,1,Limit),
	nl, write(' Fuehre folgende Regeln aus:'),nl, print_out(Proof).
solve(Goal,S0,Limit) :- loese(Goal,S0,Limit).
			
regeln_aufnehmen([]).
regeln_aufnehmen([E|WM]) :- setze(E), regeln_aufnehmen(WM).
	       
ausfuehren_regel_system(Zustand,Ziel,Pfad,Loesung,_Zeit,_Limit) :-
	ziel_erreicht(Ziel,Zustand),!,Loesung=Pfad.
ausfuehren_regel_system(_Zustand,_Ziel,_Path,_Loesung,Zeit,Limit) :-
	Zeit>Limit,!,fail.
ausfuehren_regel_system(Zustand,Ziel,Pfad,Loesung,Zeit,Limit) :-
	existiertRegel(Name,Bedingungen,RHS),
	bedingungen_erfuellt(Bedingungen,Zustand), 
	teste([Name|Pfad],Zustand),/* moegliches Ueberpruefen von unsinnigen Aktionen */
	ausfuehren_rhs(RHS,Zustand,Zustand1),
	Z1 is Zeit+1,zeige_zustand(Zeit,Zustand1),
	ausfuehren_regel_system(Zustand1,Ziel,[Name|Pfad],Loesung,Z1,Limit).

existiertRegel(Name,Bedingungen,RHS) :- Name : Bedingungen => RHS.
existiertRegel(Name,Bedingungen,RHS) :- Name wenn Bedingungen dann RHS.

0 wenn fail dann true.
0: fail => true.

ziel_erreicht([],_).
ziel_erreicht([G|GS],Zustand) :- member(G,Zustand),!,ziel_erreicht(GS,Zustand).
 
% Bedingungen koenne sein:
%            - einfacher Fakt im aktuellen Zustand
% nicht(.)   - einfacher Fakt NICHT im aktuellen Zustand
%   ;        - Oder
%            - Prolog-Anfrage
bedingungen_erfuellt([],_).
bedingungen_erfuellt([(Cond1;Cond2)|LHS],Zustand):- !,
	(pruefe(Cond1,Zustand);pruefe(Cond2,Zustand)),
	bedingungen_erfuellt(LHS,Zustand).
bedingungen_erfuellt([Cond|LHS],Zustand):-
	pruefe(Cond,Zustand),
	bedingungen_erfuellt(LHS,Zustand).

pruefe(Cond,Zustand) :- ist_begriff(Cond),!,member(Cond,Zustand).
pruefe(nicht(Cond),Zustand) :- ist_begriff(Cond),!,not(member(Cond,Zustand)),!.
pruefe(Cond,_) :- call(Cond).


ausfuehren_rhs([],Zustand,Zustand).
ausfuehren_rhs([Elem|RHS],Zustand,Zustand1) :-
	ausfuehren_rhs_elem(Elem,Zustand,Zustand2),
	ausfuehren_rhs(RHS,Zustand2,Zustand1).

% erlaubt sind 
% loesche .... Fakt aus dem aktuellen Zustand loeschen
% setze   .... Fakt in den aktuellen Zustand aufnehmen
% ersetze .... wie loesche und setze hintereinander
% call    .... beliebiges Prolog-Kommando

ausfuehren_rhs_elem(loesche(E),A,A1) :- remove(E,A,A1),!.
ausfuehren_rhs_elem(setze(E),A,[E|A]) :- !.
ausfuehren_rhs_elem(ersetze(E,Eneu),A,[Eneu|A1]) :- remove(E,A,A1),!.
ausfuehren_rhs_elem(del(E),A,A1) :- remove(E,A,A1),!.
ausfuehren_rhs_elem(add(E),A,[E|A]) :- !.

ausfuehren_rhs_elem(E,A,A) :- ist_begriff(E),!,member(E,A).
ausfuehren_rhs_elem(E,A,A) :- not(ist_begriff(E)),!,call(E).

%-- Test auf Zustandsbeschreibung --------------------------------
ist_begriff(C) :- functor(C,N,_), 
                  begriffe(BegriffListe),
                  !,member(N,[del,add,loesche,setze,ersetze|BegriffListe]).

%-- Hilfspraedikate ----------------------------------------------
print_out([]).
print_out([R|Rest]) :- print_out(Rest),write(R),nl.
 
einmal(X) :-call(X),!.   %-- entspricht once/1

nicht(G) :- G,!,fail.    %-- entspricht not/1
nicht(_). 

remove(X,[X|T],T).
remove(X,[Y|T],[Y|T1]) :- remove(X,T,T1).

%-- end of prolog ------------------------------------------------
