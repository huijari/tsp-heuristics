class Vns2opt: Optimizer {
	func optimize(instance: Instance, solution: Solution) -> Solution {

		var actual = solution

		var changes = true
		while changes {
			var best = actual
			changes = false

			for i in 1..<solution.route.count {
				for j in (i + 1)..<solution.route.count {
					let mutation = Solution(
						route: swap(route: actual.route, from: i, to: j),
						weightType: instance.edgeWeightType
					)
					if mutation.cost < best.cost {
						best = mutation
						changes = true
					}
				}
			}

			actual = best
		}

		return actual
	}

	func swap(route: [Node], from: Int, to: Int) -> [Node] {
		return Array(
			route.prefix(from) +
			route.dropFirst(from).prefix(to - from + 1).reversed() +
			route.suffix(from: to + 1)
		)
	}
}
