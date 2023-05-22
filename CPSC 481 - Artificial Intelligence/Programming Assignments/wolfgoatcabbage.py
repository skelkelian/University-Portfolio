from search import *

class WolfGoatCabbage(Problem):

    def __init__(self, initial=frozenset({'F','G','W','C'}), goal=frozenset({})):
        """ Define goal state and initialize a problem """
        super().__init__(initial, goal)

    def goal_test(self, state):
        """ Given a state, return True if state is a goal state or False, otherwise """
        return state == self.goal

    def actions(self, state):
        """ Return the actions that can be executed in the given state.
        The result would be a list, since there are only four possible actions
        in any given state of the environment """

        possible_actions = [{'F'}, {'G','F'}, {'W','F'}, {'C','F'}]

        if (len(state) == 4 or len(state) == 0):
            #Remove actions {'F'}, {'W','F'}, {'C','F'}
            possible_actions = [{'G','F'}] 
        if len(state) == 2:
            if 'W' in state and 'C' in state :
                #Remove actions {'W','F'}, {'C','F'}
                possible_actions = [{'F'},{'G','F'}]
        if len(state) == 1:
            if 'C' in state:
                #Remove actions {'F'}, {'C','F'}
                possible_actions = [{'G','F'}, {'W','F'}]
            if 'W' in state:
                #Remove actions {'F'}, {'W','F'}
                possible_actions = [{'G','F'}, {'C','F'}]
            if 'G' in state:
                #Remove actions {'G','F'}
                possible_actions = [{'F'}, {'W','F'}, {'C','F'}]

        return possible_actions

    def result(self, state, action):
        """ Given state and action, return a new state that is the result of the action.
        Action is assumed to be a valid action in the state """

        """If the action is present in the left side set, then we move it to the right side 
        i.e remove it from Left side, and if the action present in the right side set, 
        then we will move it to the left side i.e add it to left side set."""
        new_state = list(state)
        if(action.issubset(state)):  
            new_state = list(set(state) - set(action))
        else:
            new_state = list(set(state).union(set(action)))

        return frozenset(new_state)
   
if __name__ == '__main__':
    wgc = WolfGoatCabbage()
    solution = depth_first_graph_search(wgc).solution()
    print(solution)
    solution = breadth_first_graph_search(wgc).solution()
    print(solution)