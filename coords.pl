coord(start, 53.89235, 11.46493).
coord(ziel, 53.89235, 11.46493).

coord(lindengarten, 53.89316, 11.47213).
coord(wasserkunst, 53.89126, 11.46658).
coord(rathaus, 53.89156, 11.46635).
coord(kirche, 53.89119, 11.46371).
coord(soko, 53.89232, 11.46102).
coord(brunnen, 53.89334, 11.46486).
coord(schweini, 53.89509, 11.46639).
coord(wassertor, 53.89637, 11.46151).
coord(baumhaus, 53.89872, 11.45830).

% start, ziel, meter, minuten
route(start, lindengarten, 557, 7).
route(start, wasserkunst, 203, 2).
route(start, rathaus, 134, 2).
route(start, kirche, 216, 3).
route(start, soko, 320, 4).
route(start, brunnen, 134, 2).
route(start, schweini, 446, 5).
route(start, wassertor, 564, 7).
route(start, baumhaus, 1100, 13).

route(lindengarten, ziel, 557, 7).
route(lindengarten, wasserkunst, 509, 6).
route(lindengarten, rathaus, 540, 7).
route(lindengarten, kirche, 770, 9).
route(lindengarten, soko, 810, 10).
route(lindengarten, brunnen, 498, 6).
route(lindengarten, schweini, 503, 6).
route(lindengarten, wassertor, 904, 11).
route(lindengarten, baumhaus, 1300, 15).

route(wasserkunst, ziel, 203, 2).
route(wasserkunst, lindengarten, 509, 6).
route(wasserkunst, rathaus, 105, 1).
route(wasserkunst, kirche, 251, 3).
route(wasserkunst, soko, 507, 6).
route(wasserkunst, brunnen, 322, 4).
route(wasserkunst, schweini, 528, 6).
route(wasserkunst, wassertor, 752, 9).
route(wasserkunst, baumhaus, 1300, 16).

route(rathaus, ziel, 134, 2).
route(rathaus, wasserkunst, 105, 1).
route(rathaus, lindengarten, 540, 7).
route(rathaus, kirche, 257, 3).
route(rathaus, soko, 508, 6).
route(rathaus, brunnen, 323, 4).
route(rathaus, schweini, 528, 6).
route(rathaus, wassertor, 751, 9).
route(rathaus, baumhaus, 1300, 16).

route(kirche, ziel, 216, 3).
route(kirche, lindengarten, 770, 9).
route(kirche, wasserkunst, 251, 3).
route(kirche, rathaus, 257, 3).
route(kirche, schweini, 664, 8).
route(kirche, soko, 347, 4).
route(kirche, brunnen, 348, 4).
route(kirche, wassertor, 733, 9).
route(kirche, baumhaus, 1300, 16).

route(soko, ziel, 320, 4).
route(soko, lindengarten, 810, 10).
route(soko, kirche, 347, 4).
route(soko, rathaus, 508, 6).
route(soko, schweini, 643, 8).
route(soko, wasserkunst, 507, 6).
route(soko, brunnen, 331, 4).
route(soko, wassertor, 515, 6).
route(soko, baumhaus, 1200, 14).

route(brunnen, ziel, 134, 2).
route(brunnen, soko, 331, 4).
route(brunnen, kirche, 348, 4).
route(brunnen, rathaus, 323, 4).
route(brunnen, wasserkunst, 322, 4).
route(brunnen, lindengarten, 498, 6).
route(brunnen, schweini, 316, 4).
route(brunnen, wassertor, 433, 5).
route(brunnen, baumhaus, 997, 12).

route(schweini, ziel, 446, 5).
route(schweini, brunnen, 316, 4).
route(schweini, soko, 643, 8).
route(schweini, kirche, 664, 8).
route(schweini, rathaus, 528, 6).
route(schweini, wasserkunst, 528, 6).
route(schweini, lindengarten, 503, 6).
route(schweini, wassertor, 465, 6).
route(schweini, baumhaus, 900, 11).

route(wassertor, ziel, 564, 7).
route(wassertor, schweini, 465, 6).
route(wassertor, brunnen, 433, 5).
route(wassertor, soko, 515, 6).
route(wassertor, kirche, 733, 9).
route(wassertor, rathaus, 751, 9).
route(wassertor, wasserkunst, 752, 9).
route(wassertor, lindengarten, 904, 11).
route(wassertor, baumhaus, 678, 8).

route(baumhaus, ziel, 1100, 13).
route(baumhaus, wassertor, 678, 8).
route(baumhaus, schweini, 900, 11).
route(baumhaus, brunnen, 997, 12).
route(baumhaus, soko, 1200, 14).
route(baumhaus, kirche, 1300, 16).
route(baumhaus, rathaus, 1300, 16).
route(baumhaus, wasserkunst, 1300, 16).
route(baumhaus, lindengarten, 1300, 15).

tour(Start, A, B, C, D, E, F, G, H, I, Ziel, Zeit).