function [outputMatrix] = RowShuffleEntireMatrix(inputMatrix)
%Concept: Row shuffles the entire inputted matrix
%
%   Only the rows will be shuffled
%   For the example matrix:
%   x1 x2 x3
%   y1 y2 y3
%   z1 z2 z3
%
%   Only the x's will be shuffled between each other
%   and the same goes for the other rows
%
%   So we'd get something like this matrix as the output:
%   x3 x2 x1
%   y2 y1 y3
%   z3 z1 z2

[m,n] = size(inputMatrix);
outputMatrix = inputMatrix;

for c = 1:m % c is the current iteration, c's max value will be the height of the input matrix
    idx = randperm(n); % Creates the order in which the row will be shuffled
    outputMatrix(c,idx) = inputMatrix(c,:); % Shuffles that row and puts the shuffled row in the c-th column of the new matrix
end


end

