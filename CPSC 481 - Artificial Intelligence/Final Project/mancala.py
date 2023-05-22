from games import *
from enum import Enum


class P2Pocket(Enum):
    '''Enum class corresponding to Player 2's pockets and their indices.'''
    A = 1
    B = 2
    C = 3
    D = 4
    E = 5
    F = 6


class P1Pocket(Enum):
    '''Enum class corresponding to Player 1's pockets and their indices.'''
    G = 1
    H = 2
    I = 3
    J = 4
    K = 5
    L = 6


class Mancala(Game):
    '''Play the game of Mancala between two players, Player 1 & Player 2.
       Each player has a specific side of a board that belongs to them.
       Player 1 has pockets G-L and Player 2 has pockets A-F.
       On a player's turn, they select one of their pockets that contains "seeds".
       The seeds are removed from the pocket and distributed into the other pockets.
       The player places 1 seed in each pocket moving towards their "store",
       until they run out. If their last seed lands in their store, they get a free turn.
       If their last seed lands in one of their empty pockets, and there are
       seeds in the other player's pocket that's directly across, all seeds in those
       two projects are moved to the moving player's store. The game ends when there
       are no seeds in one player's side. Any remaining seeds in the other player's
       side of the board are moved to their store. The player with the most seeds wins.'''

    p_key = {'A': 1, 'B': 2, 'C': 3, 'D': 4, 'E': 5, 'F': 6, 'G': 1, 'H': 2, 'I': 3, 'J': 4, 'K': 5, 'L': 6}
    pairs = [[1, 6], [2, 5], [3, 4]]

    def __init__(self):
        '''Create the initial state.'''
        # board = {'1': [0, 1, 1, 1, 1, 1, 1],
        #          '2': [0, 1, 1, 1, 1, 1, 1]}
        board = {'1': [0, 4, 4, 4, 4, 4, 4],
                 '2': [0, 4, 4, 4, 4, 4, 4]}
        moves = []
        for m in P1Pocket:
            moves.append(m.name)

        self.initial = GameState(to_move='1', utility=0, board=board, moves=moves)

    def board(self, state):
        '''Return the ASCII board based on a given state.'''
        p1 = state.board['1']
        p2 = state.board['2']

        board = (f'+-------+-------+-------+<<<<<-Player 2-+-------+-------+-------+'
                 f'\n2       |A      |B      |C      |D      |E      |F      |       1'
                 f'\n        |   {p2[1]}   |   {p2[2]}   |   {p2[3]}   |   {p2[4]}   |   {p2[5]}   |   {p2[6]}   |'
                 f'\nS       |       |       |       |       |       |       |       S'
                 f'\nT  {" %s" % (p2[0]) if len(str(p2[0])) < 2 else p2[0]}   +-------+-------+-------+-------+-------+-------+   {"%s " % (p1[0]) if len(str(p1[0])) < 2 else p1[0]}  T'
                 f'\nO       |L      |K      |J      |I      |H      |G      |       O'
                 f'\nR       |   {p1[6]}   |   {p1[5]}   |   {p1[4]}   |   {p1[3]}   |   {p1[2]}   |   {p1[1]}   |       R'
                 f'\nE       |       |       |       |       |       |       |       E'
                 f'\n+-------+-------+-------+-Player 1->>>>>+-------+-------+-------+\n')

        return board

    def display(self, state):
        '''Print the board to the console.'''
        print(f'\n{self.board(state)}')

    def actions(self, state):
        """Legal moves are at least one to the number of objects in a single row."""
        pockets = state.board[state.to_move]
        # pockets = board[player]
        moves = []

        for i in range(1, len(pockets)):
            if pockets[i] != 0:
                if state.to_move == '1':
                    moves.append(P1Pocket(i).name)
                else:
                    moves.append(P2Pocket(i).name)

        return moves

    def action(self, board, player):
        """Legal moves are at least one to the number of objects in a single row."""
        pockets = board[player]
        moves = []

        for i in range(1, len(pockets)):
            if pockets[i] != 0:
                if player == '1':
                    moves.append(P1Pocket(i).name)
                else:
                    moves.append(P2Pocket(i).name)

        return moves

    def result(self, state, move):
        """Return the state that results from making a move from a state."""
        if move not in state.moves:
            return state

        board = state.board.copy()
        pocket = self.p_key[move]
        player = state.to_move
        opponent = '1' if player == '2' else '2'
        p = board[player]
        o = board[opponent]

        seeds = p[pocket]
        p[pocket] = 0
        last = tuple()

        while seeds > 0:
            '''Put a seed in each pocket on the player's board until it gets to the player's store.'''
            start = pocket - 1 if last == tuple() else len(p) - 1
            for i in range(start, -1, -1):
                if seeds == 0:
                    break
                p[i] += 1
                seeds -= 1
                last = (player, i)
            '''Put a seed in each pocket on the opponent's board until it gets to the opponent's store.'''
            for j in range(len(o) - 1, -1, -1):
                if seeds == 0:
                    break
                o[j] += 1
                seeds -= 1
                last = (opponent, j)

        if len(last) != 0:
            side = last[0]
            index = last[1]

            '''If the last seed lands in an empty pit belonging to the player,
                and the pit opposite to it has seeds, all seeds move to the player's store.'''
            if side == player and p[index] == 1 and index != 0:
                for pair in self.pairs:
                    if index in pair:
                        pit = pair.index(index)
                        opposite = pair[0] if pit == 1 else pair[1]
                if o[opposite] > 0:
                    p[0] += p[index] + o[opposite]
                    p[index] = 0
                    o[opposite] = 0

        return GameState(to_move=self.to_move2(state=state, last=last),
                         utility=self.compute_utility(board=board),
                         board=board,
                         moves=self.action(board=board, player=self.to_move2(state=state, last=last)))

    def utility(self, state, player):
        """Return the value to player; 1 for win, -1 for loss, 0 otherwise."""
        return state.utility if player == '1' else -state.utility

    def terminal_test(self, state):
        """A state is terminal if it is won and there are no more objects."""
        return state.utility != 0

    def to_move(self, state):
        """Return the player whose move it is in this state."""
        return state.to_move

    def to_move2(self, state, last):
        """Return the player whose move it is in this state."""
        if len(last) != 0 and last[1] == 0:
            return state.to_move
        else:
            return '1' if state.to_move == '2' else '2'

    def compute_utility(self, board):
        """If '1' wins, return 1; if '2' wins, return -1; else return 0."""
        if sum(board['1'][1:]) == 0:
            board['2'][0] += sum(board['2'][1:])
            for i in range(1, len(board['2'])):
                board['2'][i] = 0
            score = max(board['1'][0], board['2'][0])
            return 1 if score == board['1'][0] else -1
        elif sum(board['2'][1:]) == 0:
            board['1'][0] += sum(board['1'][1:])
            for i in range(1, len(board['1'])):
                board['1'][i] = 0
            score = max(board['1'][0], board['2'][0])
            return 1 if score == board['1'][0] else -1
        return 0


if __name__ == '__main__':
    m = Mancala()
    # m.play_game(player1=query_player, player2=query_player)
    utility = m.play_game(random_player, alpha_beta_player)
    if utility > 0:
        print("Player 1 wins.")
    else:
        print("Player 2 wins.")
