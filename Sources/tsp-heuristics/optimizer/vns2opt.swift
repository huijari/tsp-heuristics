class Vns2opt: Optimizer {
	func optimize(instance: Instance, solution: Solution) -> Solution {
		var actual = solution
		var next = actual

		repeat {
			actual = next
			next = TwoOpt.search(actual, weightType: instance.edgeWeightType)
		}
			while next.cost < actual.cost

		return actual
	}
}
