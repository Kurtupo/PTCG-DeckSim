%% Introduction
%{
Corresponding video for this Episode here:
[VIDEO LINK NOT YET AVAILABLE]

To summarize, we first prove that the rate of having a specific Supporter
card in the opening hand is independent from the number of Basic Pokemon
cards in the deck.
We then observe the rate of having a specific Supporter card in the opening
hand alongside "Pokegear 3.0" and other Supporter cards

%}

%% Start of Code
clear, clc;
tic

%% Setting Up
AmountOfGamesToTest = 100;
StartingDeck = ["Dunsparce", "Dunsparce", "Dunsparce", "Dunsparce", "Pikachu", "Pikachu", "Pikachu", "Feebas", "Feebas", "Feebas", "Porygon", "Porygon", "Porygon", "Celebi Prism Star", "Pokegear 3.0", "Pokegear 3.0", "Pokegear 3.0", "Pokegear 3.0", "Green's Exploration", "Green's Exploration", "Green's Exploration", "Green's Exploration", "Gladion", "Peonia", "N", "Oleana", "Rosa", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60"];

% % CombinedOutputMatrix = string(zeros(GamesToTest, 61));
GreensInHandCount = 0;
EnablePokegear3 = "enabled"; % When set to "enable", the playPokegear3 loop will run.

%% Main Loop
for c = 1:AmountOfGamesToTest
    DiscardPile = [];
    LostZone = [];
    
    % We no longer keep track of the amount of Basic Pokemon cards in the
    % opening hand and ignore the mulligan count for now
    [Hand, PrizeCards, Deck] = ObtainOpeningHand(StartingDeck);
    
    [Deck, Hand] = Draw(1, Deck, Hand); % Draw a card at the start of the turn.
    
    % Playing Pokegear 3.0
    while (length(find(Hand == "Pokegear 3.0")) >= 1) && (EnablePokegear3 == "enabled") % We assume always playing Pokegear 3.0 whenever possible is the ideal gameplan.
        [Hand, Deck, DiscardPile] = playPokegear3(Hand, Deck, DiscardPile);
    end
    
    % Set the SpecificCardCount, in this case it's Green's Exploration
    SpecificCardCount = length(find(Hand == "Green's Exploration"));
    if (SpecificCardCount >= 1)
        GreensInHandCount = GreensInHandCount + 1;
    end
    
    
    % % Generate the current row of the Output Matrix
    % CombinedOutputMatrix(c,:) = [SpecificCardCount Hand PrizeCards Deck];
end

%% Display Results
fprintf("Out of %s games... \n", string(AmountOfGamesToTest))
fprintf("A total of %s effective first hands had Green's Exploration in them. That's %s percent of all games. \n", string(GreensInHandCount), string(GreensInHandCount*100/AmountOfGamesToTest))

%% End of Code
toc