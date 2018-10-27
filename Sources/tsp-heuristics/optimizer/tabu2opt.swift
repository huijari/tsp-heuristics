class Tabu2opt: Optimizer {
	let size: Int
	let iterations: Int

	init(size: Int, iterations: Int) {
		self.size = size
		self.iterations = iterations
	}

	func optimize(instance: Instance, solution: Solution) -> Solution {
		var actual = solution
		var overallBest = solution
		var visited: [Solution] = Array()

		for _ in 0..<self.iterations {
			var best = Solution(route: [], cost: Double.infinity)

			for i in 1..<solution.route.count {
				for j in (i + 1)..<solution.route.count {
					let mutation = Solution(
						route: swap(route: actual.route, from: i, to: j),
						weightType: instance.edgeWeightType
					)
					if mutation.cost < best.cost && !visited.contains(mutation) {
						best = mutation
					}
				}
			}

			if best.cost == Double.infinity {
				break
			}

			actual = best
			visited.append(best)

			if best.cost < overallBest.cost {
				overallBest = best
			}
			if visited.count > self.size {
				visited.removeFirst()
			}
		}

		return overallBest
	}

	func swap(route: [Node], from: Int, to: Int) -> [Node] {
		return Array(
			route.prefix(from) +
			route.dropFirst(from).prefix(to - from + 1).reversed() +
			route.suffix(from: to + 1)
		)
	}
}

