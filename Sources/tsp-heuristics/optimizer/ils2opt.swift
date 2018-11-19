#if os(Linux)
import Glibc
#else
import Darwin	
#endif

class Ils2opt: Optimizer {
	let iterations: Int

	init(iterations: Int) {
		self.iterations = iterations
		srand(UInt32(time(nil)))
	}

	func optimize(instance: Instance, solution: Solution) -> Solution {
		var actual = solution
		var best = actual

		for _ in 0..<self.iterations {
			actual = TwoOpt.search(actual, weightType: instance.edgeWeightType)
			if actual.cost < best.cost {
				best = actual
			}

			let i = Int(rand()) % (actual.route.count - 1)
			let j = Int(rand()) % (actual.route.count - i - 1) + i
			actual = Solution(
				route: TwoOpt.swap(route: actual.route, from: i, to: j),
				weightType: instance.edgeWeightType
			)
		}

		return best
	}
}
