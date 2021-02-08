
/// Returns a list of your receivers. Receivers are returned sorted by creation date, with the most recently created receivers appearing first.
public struct GetBitcoinReceivers: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let starting_after: String
		let active: Bool
		let filled: Bool
		let limit: Int
		let ending_before: String
		let uncaptured_funds: Bool
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/bitcoin/receivers?active=\(inputs.active.urlEncoded))&filled=\(inputs.filled.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&uncaptured_funds=\(inputs.uncaptured_funds.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public class Output: Codable {
		public var data: [BitcoinReceiver]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [BitcoinReceiver], has_more: Bool, object: ObjectValues, url: String) {
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

/// Retrieves the Bitcoin receiver with the given ID.
public struct GetBitcoinReceiversId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = BitcoinReceiver
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/bitcoin/receivers/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// List bitcoin transacitons for a given receiver.
public struct GetBitcoinReceiversReceiverTransactions: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = BitcoinTransactionList
	public typealias paramType = Params
	public struct Params {
		let customer: String
		let starting_after: String
		let receiver: String
		let limit: Int
		let ending_before: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/bitcoin/receivers/\(inputs.receiver)/transactions?customer=\(inputs.customer.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public class BitcoinTransactionList: Codable {
		/// Details about each object.
		public var data: [BitcoinTransaction]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [BitcoinTransaction], has_more: Bool, object: ObjectValues, url: String) {
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

/// List bitcoin transacitons for a given receiver.
public struct GetBitcoinTransactions: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = BitcoinTransactionList
	public typealias paramType = Params
	public struct Params {
		let customer: String
		let starting_after: String
		let receiver: String
		let limit: Int
		let ending_before: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/bitcoin/transactions?ending_before=\(inputs.ending_before.urlEncoded))&customer=\(inputs.customer.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&receiver=\(inputs.receiver.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public class BitcoinTransactionList: Codable {
		/// Details about each object.
		public var data: [BitcoinTransaction]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [BitcoinTransaction], has_more: Bool, object: ObjectValues, url: String) {
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