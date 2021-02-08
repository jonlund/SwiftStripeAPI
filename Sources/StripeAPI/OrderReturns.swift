
/// Returns a list of your order returns. The returns are returned sorted by creation date, with the most recently created return appearing first.
public struct GetOrderReturns: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let ending_before: String
		let starting_after: String
		let limit: Int
		let order: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/order_returns?ending_before=\(inputs.ending_before.urlEncoded))&order=\(inputs.order.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public class Output: Codable {
		public var data: [OrderReturn]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [OrderReturn], has_more: Bool, object: ObjectValues, url: String) {
			self.data = data
			self.has_more = has_more
			self.object = object
			self.url = url
		}

		public enum ObjectValues: String, Codable {
			case list = "list"
		}
	}

}

/// Retrieves the details of an existing order return. Supply the unique order ID from either an order return creation request or the order return list, and Stripe will return the corresponding order information.
public struct GetOrderReturnsId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = OrderReturn
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/order_returns/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .GET }

}
