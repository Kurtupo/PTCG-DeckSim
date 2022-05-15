function [newdeck, newhand] = Draw(n,d,h)
% Concept: Takes the first n elements from the matrix d and puts them into
% the matrix h, like drawing cards from a deck and putting them into the
% hand

% n = number of cards that will be drawn
% d = where we'll draw from (eg: deck)
% h = where we'll put our drawn cards (eg: hand)

% Verify the number of elements being "drawn" is greater than the amount of
% elements in the "deck" matrix.
% If we would "draw" more elements than there are elements in the "deck" matrix,
% (eg: Drawing seven cards from deck when there are only five cards in deck)
% then we instead "draw" all elements in the "deck" matrix
if n > length(d) 
    y = length(d);
else
    y = n;

CardsToDraw = d(1:y); % Store which elements are going to be "drawn" from the "deck" matrix d
newdeck = d(y+1:length(d)); % Remove the "drawn" elements from the "deck" matrix d
newhand = [h, CardsToDraw]; % Add the "drawn" elements to the "hand" matrix h.

end