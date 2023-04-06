% "Legende"
leg(0, start).
leg(1, lindengarten).
leg(2, wasserkunst).
leg(3, rathaus).
leg(4, kirche).
leg(5, soko).
leg(6, brunnen).
leg(7, schweini).
leg(8, wassertor).
leg(9, baumhaus).
leg(10, ziel).

% start, ziel, minuten
cost(0, 1, 7).
cost(0, 2, 2).
cost(0, 3, 2).
cost(0, 4, 3).
cost(0, 5, 4).
cost(0, 6, 2).
cost(0, 7, 5).
cost(0, 8, 7).
cost(0, 9, 13).

cost(1, 10, 7).
cost(1, 2, 6).
cost(1, 3, 7).
cost(1, 4, 9).
cost(1, 5, 10).
cost(1, 6, 6).
cost(1, 7, 6).
cost(1, 8, 11).
cost(1, 9, 15).

cost(2, 10, 2).
cost(2, 1, 6).
cost(2, 3, 1).
cost(2, 4, 3).
cost(2, 5, 6).
cost(2, 6, 4).
cost(2, 7, 6).
cost(2, 8, 9).
cost(2, 9, 16).

cost(3, 10, 2).
cost(3, 2, 1).
cost(3, 1, 7).
cost(3, 4, 3).
cost(3, 5, 6).
cost(3, 6, 4).
cost(3, 7, 6).
cost(3, 8, 9).
cost(3, 9, 16).

cost(4, 10, 3).
cost(4, 1, 9).
cost(4, 2, 3).
cost(4, 3, 3).
cost(4, 7, 8).
cost(4, 5, 4).
cost(4, 6, 4).
cost(4, 8, 9).
cost(4, 9, 16).

cost(5, 10, 4).
cost(5, 1, 10).
cost(5, 4, 4).
cost(5, 3, 6).
cost(5, 7, 8).
cost(5, 2, 6).
cost(5, 6, 4).
cost(5, 8, 6).
cost(5, 9, 14).

cost(6, 10, 2).
cost(6, 5, 4).
cost(6, 4, 4).
cost(6, 3, 4).
cost(6, 2, 4).
cost(6, 1, 6).
cost(6, 7, 4).
cost(6, 8, 5).
cost(6, 9, 12).

cost(7, 10, 5).
cost(7, 6, 4).
cost(7, 5, 8).
cost(7, 4, 8).
cost(7, 3, 6).
cost(7, 2, 6).
cost(7, 1, 6).
cost(7, 8, 6).
cost(7, 9, 11).

cost(8, 10, 7).
cost(8, 7, 6).
cost(8, 6, 5).
cost(8, 5, 6).
cost(8, 4, 9).
cost(8, 3, 9).
cost(8, 2, 9).
cost(8, 1, 11).
cost(8, 9, 8).

cost(9, 10, 13).
cost(9, 8, 8).
cost(9, 7, 11).
cost(9, 6, 12).
cost(9, 5, 14).
cost(9, 4, 16).
cost(9, 3, 16).
cost(9, 2, 16).
cost(9, 1, 15).

make_row(Cols) :-
    length(Cols, L), L #= 9,
    Cols ins 1..9,
    all_distinct(Cols).

make_matrix(Rows) :-
    length(Rows, L), L #= 9,
    maplist(make_row, Rows),
    transpose(Rows, Cols),
    maplist(all_distinct, Cols).
