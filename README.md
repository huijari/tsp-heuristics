# tsp-heuristics

## Usage
The program expects the solver name as an unique argument, and will read the data from the standard input.
Example:
```sh
tsp-heuristics nn < Data/att48.tsp
```

## Build
```sh
swift build -c release
```
*It generates an executable at `.build/release/tsp-heuristic`*

## Solvers
### nn - Nearest Neighbour (constructive)
The nearest neighbour is a greedy heuristic that chooses the nearest node to add to the solution, starts at the first node of the input.
