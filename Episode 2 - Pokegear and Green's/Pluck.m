function [outputDeck, outputHand] = Pluck(inputCardLocationIndex,inputDeck, inputHand)
% Concept: Puts a specific card from the Deck into the Hand. This specific
% card is denoted by its index (location) in the Deck.
% Read as: Putting the nth card of Deck into the Hand


newDeckFirstHalf = inputDeck(1:inputCardLocationIndex-1); % The first half is everything preceding the to-be-plucked element. If the to-be-plucked element is the first element in the Hand, this will return an empty double row vector. 
newDeckSecondHalf = inputDeck(inputCardLocationIndex+1:length(inputDeck)); % Remove the "plucked" elements from the "deck" matrix d
newHand = [inputHand, inputDeck(inputCardLocationIndex)]; % Add the "plucked" elements to the Hand

newDeck = [newDeckFirstHalf newDeckSecondHalf]; % Combine the two halves

outputDeck = newDeck;
outputHand = newHand;
end