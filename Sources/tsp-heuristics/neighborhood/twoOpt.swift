class TwoOpt {
	static func search(_ actual: Solution, weightType: WeightType) -> Solution {
		var best = actual

		for i in 1..<actual.route.count {
			for j in (i + 1)..<actual.route.count {
				let mutation = Solution(
					route: swap(route: actual.route, from: i, to: j),
					weightType: weightType
				)
				if mutation.cost < best.cost {
					best = mutation
				}
			}
		}

		return best
	}

	static func swap(route: [Node], from: Int, to: Int) -> [Node] {
		return Array(
			route.prefix(from) +
			route.dropFirst(from).prefix(to - from + 1).reversed() +
			route.suffix(from: to + 1)
		)
	}
}