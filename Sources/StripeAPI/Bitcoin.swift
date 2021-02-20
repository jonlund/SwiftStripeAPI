
/// Returns a list of your receivers. Receivers are returned sorted by creation date, with the most recently created receivers appearing first.
public struct GetBitcoinReceivers: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let active: Bool
		let ending_before: String
		let filled: Bool
		let limit: Int
		let starting_after: String
		let uncaptured_funds: Bool

		public init(active: Bool, ending_before: String, filled: Bool, limit: Int, starting_after: String, uncaptured_funds: Bool) {
			self.active = active
			self.ending_before = ending_before
			self.filled = filled
			self.limit = limit
			self.starting_after = starting_after
			self.uncaptured_funds = uncaptured_funds
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/bitcoin/receivers?active=\(inputs.active.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&filled=\(inputs.filled.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&uncaptured_funds=\(inputs.uncaptured_funds.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
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

		public init(id: String) {
			self.id = id
		}
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
		let ending_before: String
		let limit: Int
		let receiver: String
		let starting_after: String

		public init(customer: String, ending_before: String, limit: Int, receiver: String, starting_after: String) {
			self.customer = customer
			self.ending_before = ending_before
			self.limit = limit
			self.receiver = receiver
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/bitcoin/receivers/\(inputs.receiver)/transactions?customer=\(inputs.customer.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class BitcoinTransactionList: Codable {
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
		let ending_before: String
		let limit: Int
		let receiver: String
		let starting_after: String

		public init(customer: String, ending_before: String, limit: Int, receiver: String, starting_after: String) {
			self.customer = customer
			self.ending_before = ending_before
			self.limit = limit
			self.receiver = receiver
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/bitcoin/transactions?customer=\(inputs.customer.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&receiver=\(inputs.receiver.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class BitcoinTransactionList: Codable {
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
