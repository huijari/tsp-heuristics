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

## Optimizers
### 2opt - Variable Neighborhood Search (with 2-opt function)
The main idea behind it is to take a route that crosses over itself and reorder it so that it does not. It will compare every possible valid combination of the swapping mechanism.
