#if VAPOR
import Vapor
#else
import Foundation
///public typealias Content = Codable
public enum HTTPMethod: String {
	case GET,POST,PUT,DELETE
}
#endif

adasfa
public struct StringNumber: Codable {
	public var rawValue: String
	
	public var floatValue: Float? {
		set {
			if let nv = newValue { rawValue = "\(nv)" }
			else { rawValue = "" }
		}
		get {
			return Float(rawValue)
		}
	}
	
	public var intValue: Int? {
		set {
			if let nv = newValue { rawValue = "\(nv)" }
			else { rawValue = "" }
		}
		get {
			return Int(rawValue)
		}
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		rawValue = try container.decode(String.self)
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(rawValue)
	}
}


/// protocol for Square Endpoint definitions
public protocol StripeAPIEndpoint {
	associatedtype inputType: Codable
	associatedtype outputType: Codable
	associatedtype paramType
	static func endpoint(for inputs: paramType) throws -> String
	static var method: HTTPMethod { get }	// default is post, override if needed
}

extension StripeAPIEndpoint {
	public static var method: HTTPMethod { return .POST }		// default method
}

