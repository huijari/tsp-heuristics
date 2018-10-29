class Grasp: Solver {
	let solver: Solver
	let iterations: Int

	init(solver: Solver, iterations: Int) {
		self.solver = solver
		self.iterations = iterations
	}

	func solve(instance: Instance) -> Solution {
		var best = Solution(route: [], cost: Double.infinity)
		for _ in 0..<iterations {
			let solution = solver.solve(instance: instance)
			if solution.cost < best.cost {
				best = solution
			}
		}
		return best
	}
}
