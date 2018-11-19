#if os(Linux)
import Glibc
#else
import Darwin	
#endif

class Random: Solver {
	init() {
		srand(UInt32(time(nil)))
	}

	func solve(instance: Instance) -> Solution {
		return Solution(
			route: Random.shuffled(instance.nodes),
			weightType: instance.edgeWeightType
		)
	}

	static func shuffled(_ nodes: [Node]) -> [Node] {
		var result = Array(nodes)
		for i in 0 ..< nodes.count - 1 {
			let j = Int(rand()) % (nodes.count - i) + i
			result.swapAt(i, j)
		}
		return result
	}
}
