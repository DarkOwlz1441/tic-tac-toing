require("require.board_check_functions")
require("require.display_functions")
require("require.utils")

Players = {"player1", "player2"}
Moves = {"X", "F"}

--Initialize Board
Board_size = 3;
Board = {}
for i=1, Board_size
do
    Board[i] = {}
    -- for j=1, Board_size
    -- do
    --     Board[i][j] = 0
    -- end
end

local function main()
    io.write(Players[1].." move: ")
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
            io.write("invalid indexing. Try again: ")
            move = io.read()
            
            if not move
            then
                return
            end
            
            i,j = StrSplit(move, ",")
            if IsNumericString(i) and IsNumericString(j)
            then
                i,j = tonumber(i), tonumber(j)
            else
                i,j = -1,-1
            end
        end 

        Board[i][j] = "X"
        local winner, code = CheckWinner(Board, i, j)
        io.write("\027[H\027[2J") -- clears the output
        
        if winner
        then
            HandleDisplayCode(code)
            print(winner.." WON!")
            return
        end
        
        DisplayBoard(Board)

        
        move = io.read()
    end
end

main()