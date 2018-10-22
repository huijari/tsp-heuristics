class Solution : Equatable {
	let route: [Node]
	let cost: Double

	init(route: [Node], cost: Double) {
		self.route = route
		self.cost = cost
	}

	init(route: [Node], weightType: WeightType) {
		self.route = route
		
		var cost = 0.0
		for i in 1..<route.count {
			cost += weightType.distance(route[i - 1], route[i])	
		}
		cost += weightType.distance(route[route.count - 1], route[0])
		self.cost = cost
	}

	static func == (left: Solution, right: Solution) -> Bool {
		for index in 0..<left.route.count {
			if left.route[index] != right.route[index] {
				return false
			}
		}
		return true
	}
}
