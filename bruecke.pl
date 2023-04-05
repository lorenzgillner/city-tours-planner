% Hängebrücken-Lampen-Problem
% lmg
% 
% Es müssen zuerst die beiden schnellsten rüber,
% also M und F (4 min).
% M kehrt zurück (2 min), übergibt die Lampe an
% O oder B, O und B gehen gemeinsam rüber (10 min).
% F kehrt mit der Lampe zu M zurück (4 min),
% dann gehen beide wieder rüber (4 min).
% = 24 min

% Was wir wissen müssen:
% - Position jeder Person ("links oder rechts" von der Brücke)
% - globaler Minutenzähler -> Backtrack, wenn Zeitlimit überschritten
% - Position der Lampe; gehen darf nur, wer die Lampe hat
%   WENN pos(A,r) UND pos(B,r) UND pos(lampe,r) UND zeit < limit DANN ...
% - Startzustand: alle auf einer Seite der Brücke
% - Endzustand: alle auf der anderen Seite der Brücke (Reihenfolge egal)

?-consult(vorwaertsverkettung).

% -------------------------------------------------------------

begriffe([zustand]).
zeige_zustand(Zeit, Zust) :- write(Zeit), write(' : '),
                             write(Zust),nl.
teste(_,_).

% -- Wissen ---------------------------------------------------

zeit(l, 0).  % Lampe
zeit(m, 2).  % Muenchhausen
zeit(f, 4).  % Frensdorf
zeit(o, 8).  % Oorde
zeit(b, 10). % Blanke

gr(A, B, C) :- C is max(A, B).

% -- Regeln ---------------------------------------------------

m_u_f_rueber:
	[zustand(m,l), zustand(f,l), zustand(l,l), zustand(t,T), T < 24]
=>
	[ersetze(zustand(m,l), zustand(m,r)), ersetze(zustand(f,l), zustand(f,r)),
	ersetze(zustand(l,l), zustand(l,r)),
	zeit(m,A), zeit(f,B), gr(A,B,C), TT is T + C,
	ersetze(zustand(t,T), zustand(t,TT))].

m_u_o_rueber:
	[zustand(m,l), zustand(o,l), zustand(l,l), zustand(t,T), T < 24]
=>
	[ersetze(zustand(m,l), zustand(m,r)), ersetze(zustand(o,l), zustand(o,r)),
	ersetze(zustand(l,l), zustand(l,r)),
	zeit(m,A), zeit(o,B), gr(A,B,C), TT is T + C,
	ersetze(zustand(t,T), zustand(t,TT))].

m_u_b_rueber:
	[zustand(m,l), zustand(b,l), zustand(l,l), zustand(t,T), T < 24]
=>
	[ersetze(zustand(m,l), zustand(m,r)), ersetze(zustand(b,l), zustand(b,r)),
	ersetze(zustand(l,l), zustand(l,r)),
	zeit(m,A), zeit(b,B), gr(A,B,C), TT is T + C,
	ersetze(zustand(t,T), zustand(t,TT))].

f_u_o_rueber:
	[zustand(f,l), zustand(o,l), zustand(l,l), zustand(t,T), T < 24]
=>
	[ersetze(zustand(f,l), zustand(f,r)), ersetze(zustand(o,l), zustand(o,r)),
	ersetze(zustand(l,l), zustand(l,r)),
	zeit(f,A), zeit(o,B), gr(A,B,C), TT is T + C,
	ersetze(zustand(t,T), zustand(t,TT))].

f_u_b_rueber:
	[zustand(f,l), zustand(b,l), zustand(l,l), zustand(t,T), T < 24]
=>
	[ersetze(zustand(f,l), zustand(f,r)), ersetze(zustand(b,l), zustand(b,r)),
	ersetze(zustand(l,l), zustand(l,r)),
	zeit(f,A), zeit(b,B), gr(A,B,C), TT is T + C,
	ersetze(zustand(t,T), zustand(t,TT))].

b_u_o_rueber:
	[zustand(b,l), zustand(o,l), zustand(l,l), zustand(t,T), T < 24]
=>
	[ersetze(zustand(b,l), zustand(b,r)), ersetze(zustand(o,l), zustand(o,r)),
	ersetze(zustand(l,l), zustand(l,r)),
	zeit(b,A), zeit(o,B), gr(A,B,C), TT is T + C,
	ersetze(zustand(t,T), zustand(t,TT))].

m_rueber:
	[zustand(m,l), zustand(l,l), zustand(t,T), T < 24]
=>
	[ersetze(zustand(m,l), zustand(m,r)), ersetze(zustand(l,l), zustand(l,r)),
	zeit(m,A), TT is T + A,
	ersetze(zustand(t,T), zustand(t,TT))].

f_rueber:
	[zustand(f,l), zustand(l,l), zustand(t,T), T < 24]
=>
	[ersetze(zustand(f,l), zustand(f,r)), ersetze(zustand(l,l), zustand(l,r)),
	zeit(f,A), TT is T + A,
	ersetze(zustand(t,T), zustand(t,TT))].

o_rueber:
	[zustand(o,l), zustand(l,l), zustand(t,T), T < 24]
=>
	[ersetze(zustand(o,l), zustand(o,r)), ersetze(zustand(l,l), zustand(l,r)),
	zeit(o,A), TT is T + A,
	ersetze(zustand(t,T), zustand(t,TT))].

b_rueber:
	[zustand(b,l), zustand(l,l), zustand(t,T), T < 24]
=>
	[ersetze(zustand(b,l), zustand(b,r)), ersetze(zustand(l,l), zustand(l,r)),
	zeit(b,A), TT is T + A,
	ersetze(zustand(t,T), zustand(t,TT))].

m_u_f_zurueck:
	[zustand(m,r), zustand(f,r), zustand(l,r), zustand(t,T), T < 24]
=>
	[ersetze(zustand(m,r), zustand(m,l)), ersetze(zustand(f,r), zustand(f,l)),
	ersetze(zustand(l,r), zustand(l,l)),
	zeit(m,A), zeit(f,B), gr(A,B,C), TT is T + C,
	ersetze(zustand(t,T), zustand(t,TT))].

m_u_o_zurueck:
	[zustand(m,r), zustand(o,r), zustand(l,r), zustand(t,T), T < 24]
=>
	[ersetze(zustand(m,r), zustand(m,l)), ersetze(zustand(o,r), zustand(o,l)),
	ersetze(zustand(l,r), zustand(l,l)),
	zeit(m,A), zeit(o,B), gr(A,B,C), TT is T + C,
	ersetze(zustand(t,T), zustand(t,TT))].

m_u_b_zurueck:
	[zustand(m,r), zustand(b,r), zustand(l,r), zustand(t,T), T < 24]
=>
	[ersetze(zustand(m,r), zustand(m,l)), ersetze(zustand(b,r), zustand(b,l)),
	ersetze(zustand(l,r), zustand(l,l)),
	zeit(m,A), zeit(b,B), gr(A,B,C), TT is T + C,
	ersetze(zustand(t,T), zustand(t,TT))].

f_u_o_zurueck:
	[zustand(f,r), zustand(o,r), zustand(l,r), zustand(t,T), T < 24]
=>
	[ersetze(zustand(f,r), zustand(f,l)), ersetze(zustand(o,r), zustand(o,l)),
	ersetze(zustand(l,r), zustand(l,l)),
	zeit(f,A), zeit(o,B), gr(A,B,C), TT is T + C,
	ersetze(zustand(t,T), zustand(t,TT))].

f_u_b_zurueck:
	[zustand(f,r), zustand(b,r), zustand(l,r), zustand(t,T), T < 24]
=>
	[ersetze(zustand(f,r), zustand(f,l)), ersetze(zustand(b,r), zustand(b,l)),
	ersetze(zustand(l,r), zustand(l,l)),
	zeit(f,A), zeit(b,B), gr(A,B,C), TT is T + C,
	ersetze(zustand(t,T), zustand(t,TT))].

b_u_o_zurueck:
	[zustand(b,r), zustand(o,r), zustand(l,r), zustand(t,T), T < 24]
=>
	[ersetze(zustand(b,r), zustand(b,l)), ersetze(zustand(o,r), zustand(o,l)),
	ersetze(zustand(l,r), zustand(l,l)),
	zeit(b,A), zeit(o,B), gr(A,B,C), TT is T + C,
	ersetze(zustand(t,T), zustand(t,TT))].

m_zurueck:
	[zustand(m,r), zustand(l,r), zustand(t,T), T < 24]
=>
	[ersetze(zustand(m,r), zustand(m,l)), ersetze(zustand(l,r), zustand(l,l)),
	zeit(m,A), TT is T + A,
	ersetze(zustand(t,T), zustand(t,TT))].

f_zurueck:
	[zustand(f,r), zustand(l,r), zustand(t,T), T < 24]
=>
	[ersetze(zustand(f,r), zustand(f,l)), ersetze(zustand(l,r), zustand(l,l)),
	zeit(f,A), TT is T + A,
	ersetze(zustand(t,T), zustand(t,TT))].

o_zurueck:
	[zustand(o,r), zustand(l,r), zustand(t,T), T < 24]
=>
	[ersetze(zustand(o,r), zustand(o,l)), ersetze(zustand(l,r), zustand(l,l)),
	zeit(o,A), TT is T + A,
	ersetze(zustand(t,T), zustand(t,TT))].

b_zurueck:
	[zustand(b,r), zustand(l,r), zustand(t,T), T < 24]
=>
	[ersetze(zustand(b,r), zustand(b,l)), ersetze(zustand(l,r), zustand(l,l)),
	zeit(b,A), TT is T + A,
	ersetze(zustand(t,T), zustand(t,TT))].

% -- Loesung --------------------------------------------------

startzustand([
zustand(m,l),
zustand(f,l),
zustand(o,l),
zustand(b,l),
zustand(l,l),
zustand(t,0) ]).

ziel([
zustand(m,r),
zustand(f,r),
zustand(o,r),
zustand(b,r),
zustand(l,r),
zustand(t,24) ]).

loesung:-       
   retractall(platz(_,_)),
   ziel(Ziel), startzustand(Z0),
   loese(Ziel,Z0,6).

%-- end of prolog ---------------------------------------------
