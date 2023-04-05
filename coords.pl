% coord(start, 53.89235, 11.46493).
% coord(ziel, 53.89235, 11.46493).

% coord(lindengarten, 53.89316, 11.47213).
% coord(wasserkunst, 53.89126, 11.46658).
% coord(rathaus, 53.89156, 11.46635).
% coord(kirche, 53.89119, 11.46371).
% coord(soko, 53.89232, 11.46102).
% coord(brunnen, 53.89334, 11.46486).
% coord(schweini, 53.89509, 11.46639).
% coord(wassertor, 53.89637, 11.46151).
% coord(baumhaus, 53.89872, 11.45830).

% start, ziel, minuten
route(start, lindengarten, 7).
route(start, wasserkunst, 2).
route(start, rathaus, 2).
route(start, kirche, 3).
route(start, soko, 4).
route(start, brunnen, 2).
route(start, schweini, 5).
route(start, wassertor, 7).
route(start, baumhaus, 13).

route(lindengarten, ziel, 7).
route(lindengarten, wasserkunst, 6).
route(lindengarten, rathaus, 7).
route(lindengarten, kirche, 9).
route(lindengarten, soko, 10).
route(lindengarten, brunnen, 6).
route(lindengarten, schweini, 6).
route(lindengarten, wassertor, 11).
route(lindengarten, baumhaus, 15).

route(wasserkunst, ziel, 2).
route(wasserkunst, lindengarten, 6).
route(wasserkunst, rathaus, 1).
route(wasserkunst, kirche, 3).
route(wasserkunst, soko, 6).
route(wasserkunst, brunnen, 4).
route(wasserkunst, schweini, 6).
route(wasserkunst, wassertor, 9).
route(wasserkunst, baumhaus, 16).

route(rathaus, ziel, 2).
route(rathaus, wasserkunst, 1).
route(rathaus, lindengarten, 7).
route(rathaus, kirche, 3).
route(rathaus, soko, 6).
route(rathaus, brunnen, 4).
route(rathaus, schweini, 6).
route(rathaus, wassertor, 9).
route(rathaus, baumhaus, 16).

route(kirche, ziel, 3).
route(kirche, lindengarten, 9).
route(kirche, wasserkunst, 3).
route(kirche, rathaus, 3).
route(kirche, schweini, 8).
route(kirche, soko, 4).
route(kirche, brunnen, 4).
route(kirche, wassertor, 9).
route(kirche, baumhaus, 16).

route(soko, ziel, 4).
route(soko, lindengarten, 10).
route(soko, kirche, 4).
route(soko, rathaus, 6).
route(soko, schweini, 8).
route(soko, wasserkunst, 6).
route(soko, brunnen, 4).
route(soko, wassertor, 6).
route(soko, baumhaus, 14).

route(brunnen, ziel, 2).
route(brunnen, soko, 4).
route(brunnen, kirche, 4).
route(brunnen, rathaus, 4).
route(brunnen, wasserkunst, 4).
route(brunnen, lindengarten, 6).
route(brunnen, schweini, 4).
route(brunnen, wassertor, 5).
route(brunnen, baumhaus, 12).

route(schweini, ziel, 5).
route(schweini, brunnen, 4).
route(schweini, soko, 8).
route(schweini, kirche, 8).
route(schweini, rathaus, 6).
route(schweini, wasserkunst, 6).
route(schweini, lindengarten, 6).
route(schweini, wassertor, 6).
route(schweini, baumhaus, 11).

route(wassertor, ziel, 7).
route(wassertor, schweini, 6).
route(wassertor, brunnen, 5).
route(wassertor, soko, 6).
route(wassertor, kirche, 9).
route(wassertor, rathaus, 9).
route(wassertor, wasserkunst, 9).
route(wassertor, lindengarten, 11).
route(wassertor, baumhaus, 8).

route(baumhaus, ziel, 13).
route(baumhaus, wassertor, 8).
route(baumhaus, schweini, 11).
route(baumhaus, brunnen, 12).
route(baumhaus, soko, 14).
route(baumhaus, kirche, 16).
route(baumhaus, rathaus, 16).
route(baumhaus, wasserkunst, 16).
route(baumhaus, lindengarten, 15).