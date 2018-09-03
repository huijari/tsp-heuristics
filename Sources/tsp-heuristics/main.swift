import Foundation 
#if os(Linux)
	import Glibc
#else
	import Darwin	
#endif

if CommandLine.arguments.count < 2 {
	print("Usage: \(CommandLine.arguments[0]) solver")
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
print(Int(solver!.solve(instance: instance)))
