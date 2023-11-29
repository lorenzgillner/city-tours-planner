# Simple route planning

Create 9 routes from start to destination passing all 9 distinct stops
exactly once with a maximum time delta of 10, where `Costs` represent
the time taken for each route.

```prolog
make_routes(9, Routes, Costs, 10), maplist(portray_clause, Routes).

% expected output
% [1, 2, 3, 4, 7, 6, 5, 8, 9].
% [2, 1, 4, 3, 5, 7, 6, 9, 8].
% [3, 4, 1, 2, 6, 8, 9, 7, 5].
% [4, 3, 2, 1, 8, 9, 7, 5, 6].
% [5, 7, 6, 8, 9, 4, 1, 2, 3].
% [6, 5, 9, 7, 1, 2, 8, 3, 4].
% [7, 6, 8, 9, 4, 5, 3, 1, 2].
% [8, 9, 7, 5, 2, 3, 4, 6, 1].
% [9, 8, 5, 6, 3, 1, 2, 4, 7].
% ...
% Costs = [150, 155, 150, 147, 153, 157, 153, 151, 154] .
```
