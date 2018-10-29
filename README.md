# tsp-heuristics

## Usage
The program expects the solver name and an optional optimizer as arguments, and will read the data from the standard input.
Example:
```sh
tsp-heuristics nn 2opt < Data/att48.tsp
```

## Build
```sh
swift build -c release
```
*It generates an executable at `.build/release/tsp-heuristic`*

## Solvers
### nn - Nearest Neighbour
The nearest neighbour is a greedy heuristic that chooses the nearest node to add to the solution, starts at the first node of the input.

### rand - Random
Simply chooses a random route.

### rand-grasp - Grasp (Random)
Iterate consecutive constructions from the Random solver, performing a local search for each of the solutions. After some number of iterations it chooses the best route visited.

## Optimizers
### vns - Variable Neighborhood Search (with 2-opt function)
The main idea behind it is to take a route that crosses over itself and reorder it so that it does not. It will compare every possible valid combination of the swapping mechanism.

### tabu - Tabu Search (with 2-opt function)
Tabu search enhances the performance of local search by relaxing its basic rule. First, at each step worsening moves can be accepted if no improving move is available (like when the search is stuck at a strict local minimum). In addition, prohibitions (henceforth the term tabu) are introduced to discourage the search from coming back to previously-visited solutions.
