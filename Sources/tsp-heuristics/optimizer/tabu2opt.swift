class Tabu2opt: Optimizer {
	let iterations: Int

	init(iterations: Int) {
		self.iterations = iterations
	}

	func optimize(instance: Instance, solution: Solution) -> Solution {
		var actual = solution
		var overallBest = solution
		var visited: Set<Solution> = Set()

		for _ in 0..<self.iterations {
			actual = TwoOpt.search(
				actual,
				visited: visited,
				weightType: instance.edgeWeightType
			)
			if actual.cost == Double.infinity {
				break
			}

			visited.insert(actual)
			if actual.cost < overallBest.cost {
				overallBest = actual
			}
		}

		return overallBest
	}
}

