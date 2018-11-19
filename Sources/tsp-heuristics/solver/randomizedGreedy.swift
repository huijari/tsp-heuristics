#if os(Linux)
import Glibc
#else
import Darwin	
#endif

class RandomizedGreedy: Solver {
	let alpha: Double

	init(alpha: Double) {
		self.alpha = alpha
		srand(UInt32(time(nil)))
	}

	func solve(instance: Instance) -> Solution {
		var route: [Node] = []
		var cost: Double = 0
		var candidates = Array(instance.nodes)

		route.append(candidates.removeLast())

		while route.count < instance.dimension {
			var costs: [Double] = []
			var min = Double.infinity
			var max = 0.0
			for node in candidates {
				let distance = (instance.edgeWeightType.distance(
					route.last!,
					node
				))
				costs.append(distance)
				if distance < min {
					min = distance
				}
				if distance > max {
					max = distance
				}
			} 

			var choosen: Int
			if costs.count > 1 {
				let threshold = min + alpha * (max - min)
				repeat {
					choosen = Int(rand()) % costs.count
				} while costs[choosen] <= threshold
			} else {
				choosen = 0
			}

			route.append(candidates.remove(at: choosen))
			cost += costs[choosen]
		}

		return Solution(route: route, cost: cost)
	}
}
