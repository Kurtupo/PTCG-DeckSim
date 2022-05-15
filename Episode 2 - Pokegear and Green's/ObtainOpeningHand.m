function [outputHand, outputPrizeCards, outputDeck] = ObtainOpeningHand(inputStartingDeck)
% Concept: Obtains an opening hand given a Pokemon Trading Card Game deck
% Opponent-mulligan interactions are neglected for now, although the number
% of "self" mulligans are still recorded

Deck = inputStartingDeck;
Hand = [];
PrizeCards = [];
HeroMulligan = 0; % How many times "you" have mulliganed.


% Steps for setting up to play the Pokemon Trading Card Game:
%   1) Shuffle the deck.
%   2) Draw 7 cards.
%   3) If no Basics in hand, put hand into deck,
%      increase the Mulligan Count, and restart at step 1.
%   4) Select Active out of all Basics in Hand. (Not yet implemented)
%   5) Draw cards from deck for each time opponent mulliganed. (Not yet implemented)
%   6) Select Benched out of all Basics in Hand. (Not yet implemented)

% Step 1: Shuffle the Deck
Deck = RowShuffleEntireMatrix(Deck);

% Step 2: Draw 7 cards
[Deck, Hand] = Draw(7, Deck, Hand);

% Step 3: Check for mulligan conditions and resolve them.
MulliganLoop = 1;
while MulliganLoop
    AmountOfBasicsInHand = length( find(Hand=="Dunsparce" | Hand=="Pikachu" | Hand=="Feebas" | Hand=="Porygon" | Hand=="Celebi Prism Star") ); % Basics are hard-coded for now
    if AmountOfBasicsInHand > 0
        MulliganLoop = 0;
    else
        HeroMulligan = HeroMulligan + 1;
        Deck = inputStartingDeck;
        Hand = [];
        Deck = RowShuffleEntireMatrix(Deck);
        [Deck, Hand] = Draw(7, Deck, Hand);
    end
end


% Set the Prize Cards
[Deck, PrizeCards] = Draw(6, Deck, PrizeCards);

% For debugging purposes...
% % fprintf("Here's how many Basics are in your opening hand: \n")
% % disp(AmountOfBasicsInHand)
% % fprintf("Here's what's in your opening hand: \n")
% % disp(Hand)
% % 
% % fprintf("Here's what's in your prize cards: \n")
% % disp(PrizeCards)
% %
% % fprintf("You had to mulligan %s times, btw. \n \n", string(HeroMulligan))

% Determine the output variables
% outputMulliganCount = HeroMulligan; % Unused in this version
% outputAmountOfBasicsInHand = AmountOfBasicsInHand; % Unused in this version
outputHand = Hand;
outputPrizeCards = PrizeCards;
outputDeck = Deck;

end

