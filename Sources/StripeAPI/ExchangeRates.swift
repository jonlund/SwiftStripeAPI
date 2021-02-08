
/// Returns a list of objects that contain the rates at which foreign currencies are converted to one another. Only shows the currencies for which Stripe supports.
public struct GetExchangeRates: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let starting_after: String
		let ending_before: String
		let limit: Int
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/exchange_rates?ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public class Output: Codable {
		public var data: [ExchangeRate]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [ExchangeRate], has_more: Bool, object: ObjectValues, url: String) {
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

/// Retrieves the exchange rates from the given currency to every supported currency.
public struct GetExchangeRatesRateId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = ExchangeRate
	public typealias paramType = Params
	public struct Params {
		let rate_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/exchange_rates/\(inputs.rate_id)"
	}
	public static var method: HTTPMethod { return .GET }

}
