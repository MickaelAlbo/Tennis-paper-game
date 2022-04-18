#!/bin/bash
# Michael Albo 328597521

# -eq : Equal ==
# -ne : Not equal !=
# -lt : Less than <
# -le : Less than or equal <=
# -gt : Greater than >
# -ge : Greater than or equal >=

player1_points=50
player2_points=50
game_on=true
i=3

moves=(
"O|       |       #       |       | "
" |   O   |       #       |       | "
" |       |   O   #       |       | "
" |       |       O       |       | "
" |       |       #   O   |       | "
" |       |       #       |   O   | "
" |       |       #       |       |O"
)

initialized_game() {
    echo " Player 1: 50         Player 2: 50 "
    echo " --------------------------------- "
    echo " |       |       #       |       | "
    echo " |       |       #       |       | "
    echo " |       |       O       |       | "
    echo " |       |       #       |       | "
    echo " |       |       #       |       | "
    echo " --------------------------------- "
}

print_board() {
    echo " Player 1: ${player1_points}         Player 2: ${player2_points} "
    echo " --------------------------------- "
    echo " |       |       #       |       | "
    echo " |       |       #       |       | "
    echo "${moves[i]}"
    echo " |       |       #       |       | "
    echo " |       |       #       |       | "
    echo " --------------------------------- "
    echo -e "       Player 1 played: ${points1}\n       Player 2 played: ${points2}\n\n"
}

player1_pick() {
    echo "PLAYER 1 PICK A NUMBER: "
    read -s points1
    if [[ ! $points1 =~ ^[0-9]+$ ]] || [[ "$points1" -gt "$player1_points" ]]
    then
        echo "NOT A VALID MOVE !"
        player1_pick
    fi
}

player2_pick() {
    echo "PLAYER 2 PICK A NUMBER: "
    read -s points2
    if [[ ! $points2 =~ ^[0-9]+$ ]] || [[ "$points2" -gt "$player2_points" ]]
    then
        echo "NOT A VALID MOVE !"
        player2_pick
    fi
}

update_board() {
    # Player 1 wins
    if [[ "$points1" -gt "$points2" ]] && [[ "$i" -ge 3 ]]
    then
        ((i=i+1))
    fi
    if [[ "$points1" -gt "$points2" ]] && [[ "$i" -lt 3 ]]
    then
        ((i=4))
    fi
    # Player 2 wins
    if [[ "$points1" -lt "$points2" ]] && [[ "$i" -le 3 ]]
    then
        ((i=i-1))
    fi
    if [[ "$points1" -lt "$points2" ]] && [[ "$i" -gt 3 ]]
    then
        ((i=2))
    fi
    # Update points
    ((player1_points=player1_points-points1))
    ((player2_points=player2_points-points2))
}

check_win() {
    # Case 1
    if [[ "$i" -eq 7 ]]
    then
        echo "PLAYER 1 WINS !"
        game_on=false
    fi
    if [[ "$i" -eq -1 ]]
    then
        echo "PLAYER 2 WINS !"
        game_on=false
    fi
    # Case 2
    if [[ "$player1_points" -eq 0 ]] && [[ "$player2_points" -gt 0 ]]
    then
        echo "PLAYER 2 WINS !"
        game_on=false
    fi
    if [[ "$player2_points" -eq 0 ]] && [[ "$player1_points" -gt 0 ]]
    then
        echo "PLAYER 1 WINS !"
        game_on=false
    fi
    # Case 3
    if [[ "$player1_points" -eq 0 ]] && [[ "$player2_points" -eq 0 ]]
    then
        if [[ "$i" -eq 3 ]]
        then
            echo "IT'S A DRAW !"
            game_on=false
        fi
        if [[ "$i" -gt 3 ]]
        then
            echo "PLAYER 1 WINS !"
            game_on=false
        fi
        if [[ "$i" -lt 3 ]]
        then
            echo "PLAYER 2 WINS !"
            game_on=false
        fi
    fi

}

initialized_game
while $game_on
do
    player1_pick
    player2_pick
    update_board
    print_board
    check_win
done