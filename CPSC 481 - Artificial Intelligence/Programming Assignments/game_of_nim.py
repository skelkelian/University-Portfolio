# Serop Kelkelian, Anthony Mardiros, Greg Zhang
from games import *


class GameOfNim(Game):
    def __init__(self, board):
        moves = []
        for i, pile in enumerate(board):
            for j in range(1, pile + 1):
                moves.append((i, j))
        self.initial = GameState(to_move='MAX', utility=0, board=board, moves=moves)

    def actions(self, state):
        moves = []
        for i, pile in enumerate(state.board):
            for j in range(1, pile + 1):
                moves.append((i, j))
        return moves

    def result(self, state, move):
        player = state.to_move
        board = state.board.copy()
        pile, count = move
        board[pile] -= count
        next_player = self.player_move(player)
        next_moves = self.actions(GameState(to_move=next_player, utility=0, board=board, moves=[]))
        next_utility = self.compute_utility(board, state.to_move)
        return GameState(to_move=next_player, utility=next_utility, board=board, moves=next_moves)

    def player_move(self, player):
        if player == 'MAX':
            return 'MIN'
        else:
            return 'MAX'

    def terminal_test(self, state):
        return len(state.moves) == 0 or state.utility != 0

    def utility(self, state, player):
        return state.utility if player == 'MAX' else -state.utility

    def compute_utility(self, board, player):
        if all(x == 0 for x in board):
            if player == 'MAX':
                return 1
            else:
                return -1
        else:
            return 0


if __name__ == "__main__":
    nim = GameOfNim(board=[0, 5, 3, 1])  # Creating the game instance
    # nim = GameOfNim(board=[7, 5, 3, 1]) # a much larger tree to search
    print(nim.initial.board)  # must be [0, 5, 3, 1]
    print(nim.initial.moves)  # must be [(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (2, 1), (2, 2), (2, 3), (3, 1)]
    print(nim.result(nim.initial, (1, 3)))
    utility = nim.play_game(alpha_beta_player, query_player)  # computer moves first

    if utility < 0:
        print("MIN won the game")
    else:
        print("MAX won the game")
