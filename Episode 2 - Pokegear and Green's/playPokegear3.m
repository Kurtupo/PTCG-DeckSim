function [outputHand, outputDeck, outputDiscardPile] = playPokegear3(inputHand,inputDeck, inputDiscardPile)
% Concept: Simulates playing "Pokegear 3.0" by manipulating a Hand, Deck,
% and Discard Pile

% fprintf("Pokegear 3.0 was played! \n")

%% Setup
Hand = inputHand;
Deck = inputDeck;
DiscardPile = inputDiscardPile;
InPlayZone = [];

%% Playing the card
if isempty(find(Hand == "Pokegear 3.0", 1)) % Checking to see if Pokegear 3.0 is in our Hand. Not sure why we would try to play PokeGear 3.0 if it isn't in our hand but we'll account for it anyway...
    fprintf("There's no Pokegear 3.0 in the Hand! \n") % The code will still spout errors but at least we have a message so we know what happened!
end
PokeGearLocationArray = find(Hand == "Pokegear 3.0"); % Gives an array with the indices (location) of the Pokegear 3.0 in the Hand
[Hand, InPlayZone] = Pluck(PokeGearLocationArray(1), Hand, InPlayZone);

%% Card effect of Pokegear 3.0

% If there are less than seven cards in the Deck, we instead look at all the cards in the Deck.
if length(Deck) < 7
    q = length(Deck);
else
    q = 7;
end

if length(find((Deck(1:q)) == "Green's Exploration")) >= 1 % Checking to see if any Green's Exploration are in the top seven cards of the deck. Green's Exploration is the most valuable Supporter, thus is should always be taken if available. (This is not good player advice but it's the mindset we'll assume for now.)
    SupporterLocationArray = ( find( ((Deck(1:q)) == "Green's Exploration"), 1 )); % Gives an array with the indices (location) of any Green's Exploration in the top seven cards in the deck.
    [Deck, Hand] = Pluck(SupporterLocationArray(1), Deck, Hand); % Plucking the first Green's Exploration from the deck into the hand.
    % fprintf("Green's Exploration was added to the hand! ")
elseif length(find((Deck(1:q)) == "N")) >= 1 % N is the next most valuable Supporter after Green's Exploration.
    SupporterLocationArray = ( find( ((Deck(1:q)) == "N"), 1 ));
    [Deck, Hand] = Pluck(SupporterLocationArray(1), Deck, Hand);
    % fprintf("N was added to the hand! ")
elseif length(find((Deck(1:q)) == "Rosa")) >= 1 % Rosa is the next most valuable Supporter after N.
    SupporterLocationArray = ( find( ((Deck(1:q)) == "Rosa"), 1 ));
    [Deck, Hand] = Pluck(SupporterLocationArray(1), Deck, Hand);
    % fprintf("Rosa was added to the hand! ")
elseif length(find((Deck(1:q)) == "Gladion")) >= 1 % Gladion is the next most valuable Supporter after Rosa.
    SupporterLocationArray = ( find( ((Deck(1:q)) == "Gladion"), 1 ));
    [Deck, Hand] = Pluck(SupporterLocationArray(1), Deck, Hand);
    % fprintf("Gladion was added to the hand! ")
elseif length(find((Deck(1:q)) == "Oleana")) >= 1 % Oleana is the next most valuable Supporter after Gladion.
    SupporterLocationArray = ( find( ((Deck(1:q)) == "Oleana"), 1 ));
    [Deck, Hand] = Pluck(SupporterLocationArray(1), Deck, Hand);
    % fprintf("Gladion was added to the hand! ")
elseif length(find((Deck(1:q)) == "Peonia")) >= 1 % Peonia is the next most valuable Supporter after Oleana.
    SupporterLocationArray = ( find( ((Deck(1:q)) == "Peonia"), 1 ));
    [Deck, Hand] = Pluck(SupporterLocationArray(1), Deck, Hand);
    % fprintf("Peonia was added to the hand! ")
else
    % fprintf("No Supporters were found. ") % If we're here, it's because there were no Supporters in the top seven cards of the Deck.
end

%% End of card effect of Pokegear 3.0

[InPlayZone, DiscardPile] = Pluck(1, InPlayZone, DiscardPile); % After playing this card and resolving its effect, put the card in the Discard Pile

Deck = RowShuffleEntireMatrix(Deck);
% fprintf("The deck was shuffled. \n")

outputHand = Hand;
outputDeck = Deck;
outputDiscardPile = DiscardPile;
end