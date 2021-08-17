
/// Returns a list of top-ups.
public struct GetTopups: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = TopupList
	public typealias paramType = Params
	
	public struct Params {
		let ending_before: String?
		let limit: Int?
		let starting_after: String?
		let status: String?

		/// Initialize the request parameters
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		/// - Parameter status: Only return top-ups that have the given status. One of `canceled`, `failed`, `pending` or `succeeded`.
		public init(ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil, status: String? = nil) {
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
			self.status = status
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		if let a = inputs.status?.urlEncoded { params.append("status=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/topups?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class TopupList: Codable {
		public var data: [Topup]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Topup], has_more: Bool, object: ObjectValues, url: String) {
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

/// Top up the balance of an account
public struct PostTopups: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Topup
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/topups"
	}

	public final class FormInput: Codable {
		/// A positive integer representing how much to transfer.
		public var amount: Int
		/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
		public var currency: String
		/// An arbitrary string attached to the object. Often useful for displaying to users.
		public var description: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// The ID of a source to transfer funds from. For most users, this should be left unspecified which will use the bank account that was set up in the dashboard for the specified currency. In test mode, this can be a test bank token (see [Testing Top-ups](https://stripe.com/docs/connect/testing#testing-top-ups)).
		public var source: String?
		/// Extra information about a top-up for the source's bank statement. Limited to 15 ASCII characters.
		public var statement_descriptor: String?
		/// A string that identifies this top-up as part of a group.
		public var transfer_group: String?

		public init(amount: Int, currency: String, description: String? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil, source: String? = nil, statement_descriptor: String? = nil, transfer_group: String? = nil) {
			self.amount = amount
			self.currency = currency
			self.description = description
			self.expand = expand
			self.metadata = metadata
			self.source = source
			self.statement_descriptor = statement_descriptor
			self.transfer_group = transfer_group
		}
	}

}

/// Retrieves the details of a top-up that has previously been created. Supply the unique top-up ID that was returned from your previous request, and Stripe will return the corresponding top-up information.
public struct GetTopupsTopup: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Topup
	public typealias paramType = Params
	
	public struct Params {
		let topup: String

		/// Initialize the request parameters
		/// - Parameter topup: 
		public init(topup: String) {
			self.topup = topup
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/topups/\(inputs.topup)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the metadata of a top-up. Other top-up details are not editable by design.
public struct PostTopupsTopup: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Topup
	public typealias paramType = Params
	
	public struct Params {
		let topup: String

		/// Initialize the request parameters
		/// - Parameter topup: 
		public init(topup: String) {
			self.topup = topup
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/topups/\(inputs.topup)"
	}

	public final class FormInput: Codable {
		/// An arbitrary string attached to the object. Often useful for displaying to users.
		public var description: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?

		public init(description: String? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil) {
			self.description = description
			self.expand = expand
			self.metadata = metadata
		}
	}

}

/// Cancels a top-up. Only pending top-ups can be canceled.
public struct PostTopupsTopupCancel: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Topup
	public typealias paramType = Params
	
	public struct Params {
		let topup: String

		/// Initialize the request parameters
		/// - Parameter topup: 
		public init(topup: String) {
			self.topup = topup
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/topups/\(inputs.topup)/cancel"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(expand: [String]? = nil) {
			self.expand = expand
		}
	}

}
