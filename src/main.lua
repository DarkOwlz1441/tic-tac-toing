require("require.display_functions")

Players = {"player1", "player2"}

--Initialize Board
Board_size = 5;
Board = {}
for i=1, Board_size
do
    Board[i] = {}
end

DisplayBoardDashedColumn(Board, 3)