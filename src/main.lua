require("require.display_functions")
require("require.utils")

Players = {"player1", "player2"}

--Initialize Board
Board_size = 7;
Board = {}
for i=1, Board_size
do
    Board[i] = {}
    for j=1, Board_size
    do
        Board[i][j] = 0
    end
end

local move = io.read()

while move
do
    local i,j = StrSplit(move, ",")
    if IsNumericString(i) and IsNumericString(j)
    then
        i,j = tonumber(i), tonumber(j)
    else
        i,j = -1,-1
    end
    
    while not IsInRange(i, 1, Board_size) or not IsInRange(j, 1, Board_size)
    do
        print("invalid indexing. Try again")
        move = io.read()
        i,j = StrSplit(move, ",")
        if IsNumericString(i) and IsNumericString(j)
        then
            i,j = tonumber(i), tonumber(j)
        else
            i,j = -1,-1
        end
    end 
    Board[i][j] = "X"
    DisplayBoard(Board)

    move = io.read()
end