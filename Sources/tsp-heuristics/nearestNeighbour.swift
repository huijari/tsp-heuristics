class NearestNeighbour: Solver {
	func solve(instance: Instance) -> Double {
		func distance(_ from: Node, _ to: Node) -> Double {
			return instance.edgeWeightType.distance(from, to)
		}

		var cost = 0.0
		var visited = Array(repeating: false, count: instance.nodes.count)

		var actual = 0
		while visited.contains(false) {
			var minimum: Int?
			var minimumStep: Double?

			for (i, node) in instance.nodes.enumerated() {
				if visited[i] {
					continue
				}

				let step = distance(instance.nodes[actual], node)
				if minimumStep == nil || step < minimumStep! {
					minimum = i
					minimumStep = step
				}
			}

			cost += minimumStep!
			visited[minimum!] = true
			actual = minimum!
		}

		return cost + distance(instance.nodes[actual], instance.nodes[0])
	}
}
