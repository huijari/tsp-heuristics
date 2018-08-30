import Glibc

class Node {
	let x: Int
	let y: Int

	init(x: Int, y: Int) {
		self.x = x
		self.y = y
	}
}

enum WeightType {
	case pseudoEuclidean
	case euclidean

	func distance(_ a: Node, _ b: Node) -> Float {
		let dxSquared = pow(Float(a.x - b.x), 2)
		let dySquared = pow(Float(a.y - b.y), 2)

		switch self {
			case .pseudoEuclidean:
				return sqrt((dxSquared + dySquared) / 10.0).rounded(.up)
			case .euclidean:
				return sqrt(dxSquared + dySquared)
		}
	}
}

struct Instance {
	var name = ""
	var dimension = 0
	var edgeWeightType = WeightType.euclidean
	var nodes: [Node] = []
}
