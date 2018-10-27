import Foundation 
#if os(Linux)
	import Glibc
#else
	import Darwin	
#endif

if CommandLine.arguments.count < 2 {
	print("Usage: \(CommandLine.arguments[0]) solver [optimizer]")
	exit(1)
}

let solver: Solver?
switch CommandLine.arguments[1] {
	case "nn": solver = NearestNeighbour()
	default:
		print("Invalid solver")
		exit(1)	
}

let instance = Instance.readFromConsole()
let solution = solver!.solve(instance: instance)
print("cost: \(Int(solution.cost))")

if CommandLine.arguments.count > 2 {
	let optimizer: Optimizer?
	switch CommandLine.arguments[2] {
		case "vns": optimizer = Vns2opt()
		case "tabu": optimizer = Tabu2opt(iterations: 100)
		default:
			print("Invalid optimizer")
			exit(1)	
	}
	let optimizedSolution = optimizer!.optimize(instance: instance, solution: solution)
	print("optimized cost: \(Int(optimizedSolution.cost))")
}

