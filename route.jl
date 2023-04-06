using Julog

label(0, start) <<= true
label(1, lindengarten) <<= true
label(2, wasserkunst) <<= true
label(3, rathaus) <<= true
label(4, kirche) <<= true
label(5, soko) <<= true
label(6, brunnen) <<= true
label(7, schweini) <<= true
label(8, wassertor) <<= true
label(9, baumhaus) <<= true
label(10, ziel) <<= true

# start, ziel, minuten
cost(0, 1, 7) <<= true
cost(0, 2, 2) <<= true
cost(0, 3, 2) <<= true
cost(0, 4, 3) <<= true
cost(0, 5, 4) <<= true
cost(0, 6, 2) <<= true
cost(0, 7, 5) <<= true
cost(0, 8, 7) <<= true
cost(0, 9, 13) <<= true

cost(1, 10, 7) <<= true
cost(1, 2, 6) <<= true
cost(1, 3, 7) <<= true
cost(1, 4, 9) <<= true
cost(1, 5, 10) <<= true
cost(1, 6, 6) <<= true
cost(1, 7, 6) <<= true
cost(1, 8, 11) <<= true
cost(1, 9, 15) <<= true

cost(2, 10, 2) <<= true
cost(2, 1, 6) <<= true
cost(2, 3, 1) <<= true
cost(2, 4, 3) <<= true
cost(2, 5, 6) <<= true
cost(2, 6, 4) <<= true
cost(2, 7, 6) <<= true
cost(2, 8, 9) <<= true
cost(2, 9, 16) <<= true

cost(3, 10, 2) <<= true
cost(3, 2, 1) <<= true
cost(3, 1, 7) <<= true
cost(3, 4, 3) <<= true
cost(3, 5, 6) <<= true
cost(3, 6, 4) <<= true
cost(3, 7, 6) <<= true
cost(3, 8, 9) <<= true
cost(3, 9, 16) <<= true

cost(4, 10, 3) <<= true
cost(4, 1, 9) <<= true
cost(4, 2, 3) <<= true
cost(4, 3, 3) <<= true
cost(4, 7, 8) <<= true
cost(4, 5, 4) <<= true
cost(4, 6, 4) <<= true
cost(4, 8, 9) <<= true
cost(4, 9, 16) <<= true

cost(5, 10, 4) <<= true
cost(5, 1, 10) <<= true
cost(5, 4, 4) <<= true
cost(5, 3, 6) <<= true
cost(5, 7, 8) <<= true
cost(5, 2, 6) <<= true
cost(5, 6, 4) <<= true
cost(5, 8, 6) <<= true
cost(5, 9, 14) <<= true

cost(6, 10, 2) <<= true
cost(6, 5, 4) <<= true
cost(6, 4, 4) <<= true
cost(6, 3, 4) <<= true
cost(6, 2, 4) <<= true
cost(6, 1, 6) <<= true
cost(6, 7, 4) <<= true
cost(6, 8, 5) <<= true
cost(6, 9, 12) <<= true

cost(7, 10, 5) <<= true
cost(7, 6, 4) <<= true
cost(7, 5, 8) <<= true
cost(7, 4, 8) <<= true
cost(7, 3, 6) <<= true
cost(7, 2, 6) <<= true
cost(7, 1, 6) <<= true
cost(7, 8, 6) <<= true
cost(7, 9, 11) <<= true

cost(8, 10, 7) <<= true
cost(8, 7, 6) <<= true
cost(8, 6, 5) <<= true
cost(8, 5, 6) <<= true
cost(8, 4, 9) <<= true
cost(8, 3, 9) <<= true
cost(8, 2, 9) <<= true
cost(8, 1, 11) <<= true
cost(8, 9, 8) <<= true

cost(9, 10, 13) <<= true
cost(9, 8, 8) <<= true
cost(9, 7, 11) <<= true
cost(9, 6, 12) <<= true
cost(9, 5, 14) <<= true
cost(9, 4, 16) <<= true
cost(9, 3, 16) <<= true
cost(9, 2, 16) <<= true
cost(9, 1, 15) <<= true