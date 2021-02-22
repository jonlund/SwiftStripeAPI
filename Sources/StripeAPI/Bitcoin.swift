
/// Returns a list of your receivers. Receivers are returned sorted by creation date, with the most recently created receivers appearing first.
public struct GetBitcoinReceivers: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let active: Bool?
		let ending_before: String?
		let filled: Bool?
		let limit: Int?
		let starting_after: String?
		let uncaptured_funds: Bool?

		/// Initialize the request parameters
		/// - Parameter active: Filter for active receivers.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter filled: Filter for filled receivers.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		/// - Parameter uncaptured_funds: Filter for receivers with uncaptured funds.
		public init(active: Bool? = nil, ending_before: String? = nil, filled: Bool? = nil, limit: Int? = nil, starting_after: String? = nil, uncaptured_funds: Bool? = nil) {
			self.active = active
			self.ending_before = ending_before
			self.filled = filled
			self.limit = limit
			self.starting_after = starting_after
			self.uncaptured_funds = uncaptured_funds
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.active?.urlEncoded { params.append("active=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.filled?.urlEncoded { params.append("filled=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		if let a = inputs.uncaptured_funds?.urlEncoded { params.append("uncaptured_funds=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/bitcoin/receivers?\(query)"
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

		/// Initialize the request parameters
		/// - Parameter id: 
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
		let receiver: String
		let customer: String?
		let ending_before: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter receiver: 
		/// - Parameter customer: Only return transactions for the customer specified by this customer ID.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(receiver: String, customer: String? = nil, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.receiver = receiver
			self.customer = customer
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.customer?.urlEncoded { params.append("customer=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/bitcoin/receivers/\(inputs.receiver)/transactions?\(query)"
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
		let customer: String?
		let ending_before: String?
		let limit: Int?
		let receiver: String?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter customer: Only return transactions for the customer specified by this customer ID.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter receiver: 
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(customer: String? = nil, ending_before: String? = nil, limit: Int? = nil, receiver: String? = nil, starting_after: String? = nil) {
			self.customer = customer
			self.ending_before = ending_before
			self.limit = limit
			self.receiver = receiver
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.customer?.urlEncoded { params.append("customer=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.receiver?.urlEncoded { params.append("receiver=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/bitcoin/transactions?\(query)"
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
