import Glibc

class Node {
	let x: Int
	let y: Int

	init(x: Int, y: Int) {
		self.x = x
		self.y = y
	}
}

enum WeightType: String {
	case pseudoEuclidean = "ATT"
	case euclidean = "EUC_2D"

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

	static func readFromConsole() -> Instance {
		func value(from: String) -> String {
			return from.split(separator: ":")[1].trimmingCharacters(in: .whitespaces)
		}

		var meta = true
		var instance = Instance()
		var line = readLine() ?? "EOF"

		while line != "EOF" {
			if meta {
					if line.starts(with: "NODE_COORD_SECTION") { meta = false }
					if line.starts(with: "NAME") {
						instance.name = value(from: line)
					}
					if line.starts(with: "DIMENSION") {
						instance.dimension = Int(value(from: line))!
					}
					if line.starts(with: "EDGE_WEIGHT_TYPE") {
						let type = value(from: line)
						instance.edgeWeightType = WeightType(rawValue: type)!
					}
			} else {
				let components = line.split(separator: " ")
				let x = Int(components[1])!
				let y = Int(components[2])!
				instance.nodes.append(Node(x: x, y: y))
			}

			line = readLine() ?? "EOF"
		}

		return instance
	}
}
